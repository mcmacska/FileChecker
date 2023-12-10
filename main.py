import os
import time
import getpass
import sys
import unidecode as unidecode
import yara
from timeit import default_timer as timer

CURRENT_DIRECTORY = os.getcwd()

RANSOMWARE_YARA_FOLDER = CURRENT_DIRECTORY + "\\ransomwares_yara"

RANSOMWARE_SAVED_YARA_FOLDER = CURRENT_DIRECTORY + "\\saved_yara"


def yara_file_initializer():
    yara_files = {}
    try:
        for filename in os.listdir(RANSOMWARE_YARA_FOLDER):
            filepath = RANSOMWARE_YARA_FOLDER + "\\" + filename
            print(filename)

            yara_files[filename] = filepath
    except Exception as ex:
        print(ex)
        input("Press enter to exit...")
        sys.exit()
    return yara.compile(filepaths=yara_files)


rule = yara_file_initializer()
rule.save(RANSOMWARE_SAVED_YARA_FOLDER)

files_in_Downloads = []


def rename_(path, filename):
    old = path + "\\" + filename
    line = bytes(filename, 'utf-8').decode('utf-8', 'ignore')
    new = path + "\\" + unidecode.unidecode(line)
    os.rename(old, new)
    return new


def rename_back(path, old_path, new_name):
    new = path + "\\" + new_name
    os.rename(old_path, new)
    return new


def is_file_in_yara(path, filename):
    filename_path = path + "\\" + filename
    if os.path.isdir(filename_path):
        print(f"{filename_path} is a directory")
        return False
    print(f"Watching this file: {filename_path}")
    try:
        return rule.match(filename_path)
    except Exception as e:
        print(e)
        # if it fails the first check, the file is checked with unicode name
        try:
            print(f"# {filename}:")
            filename_path2 = rename_(path, filename)
            result = rule.match(filename_path2)
            rename_back(path, filename_path2, filename)
            return result
        except Exception as ex:
            print(ex)
            return False


def download_checker(folder_path):
    print("New files:")
    for n in os.listdir(folder_path):
        if n not in files_in_Downloads:
            # n.decode('utf-8', 'ignore')
            # unicode_filename = unicode(n, "utf-8")
            if is_file_in_yara(folder_path, n):
                print(f"Oh no, yara detected {folder_path}\\{n} as a ransomware.")
                os.remove(f"{folder_path}\\{n}")
            else:
                print(f"{folder_path}\\{n} is probably safe.")
                files_in_Downloads.append(n)


def folder_checker(folder_path):
    print(folder_path)
    for n in os.listdir(folder_path):
        if is_file_in_yara(folder_path, n):
            print(f"Oh no, yara detected {def_download}\\{n} as a ransomware.")
            # os.remove(f"{def_download}\\{n}")
        else:
            print(f"{def_download}\\{n} is probably safe.")


if __name__ == '__main__':

    USERNAME = getpass.getuser()

    def_download = fr"C:\Users\{USERNAME}\Downloads"

    # Custom folder check mode
    if len(sys.argv) == 2:
        try:
            start = timer()
            folder_checker(sys.argv[1])
            end = timer()
            print(end - start)
        except Exception as x:
            print(x)
            pass
        input("Press enter to exit...")
        sys.exit()

    # Normal mode
    try:
        for d in os.listdir(def_download):
            files_in_Downloads.append(d)
    except:
        pass

    # Startup folders:
    startup_path1 = fr"C:\Users\{USERNAME}\AppData\Roaming\Microsoft\Windows\Start Menu\Programs"
    startup_path2 = fr"C:\Users\{USERNAME}\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

    # rules = yara.load(RANSOMWARE_SAVED_YARA_FOLDER)

    while True:
        start_ = timer()
        folder_checker(startup_path1)
        folder_checker(startup_path2)
        download_checker(def_download)
        end_ = timer()
        print(end_ - start_)
        time.sleep(4)
