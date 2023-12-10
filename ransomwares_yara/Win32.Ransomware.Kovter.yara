rule Win32_Ransomware_Kovter : tc_detection malicious
{
    meta:

        author              = "ReversingLabs"

        source              = "ReversingLabs"
        status              = "RELEASED"
        sharing             = "TLP:WHITE"
        category            = "MALWARE"
        malware             = "KOVTER"
        description         = "Yara rule that detects Kovter ransomware."

        tc_detection_type   = "Ransomware"
        tc_detection_name   = "Kovter"
        tc_detection_factor = 5

    strings:

        $remote_connection_1 = {
            55 8B EC 81 C4 ?? ?? ?? ?? 53 56 57 33 DB 89 9D ?? ?? ?? ?? 89 9D ?? ?? ?? ?? 89 9D 
            ?? ?? ?? ?? 89 9D ?? ?? ?? ?? 89 9D ?? ?? ?? ?? 89 9D ?? ?? ?? ?? 89 9D ?? ?? ?? ?? 
            89 5D ?? 89 5D ?? 8B D9 89 55 ?? 89 45 ?? 8B 75 ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 45 ?? 
            E8 ?? ?? ?? ?? 33 C0 55 68 ?? ?? ?? ?? 64 FF 30 64 89 20 A1 ?? ?? ?? ?? 80 38 ?? 74 
            ?? 8B CE 8B 55 ?? 8B 45 ?? E8 ?? ?? ?? ?? E9 ?? ?? ?? ?? 8B C6 E8 ?? ?? ?? ?? 33 C0 
            89 45 ?? 33 C0 89 45 ?? C7 45 ?? ?? ?? ?? ?? 8B 55 ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 
            48 75 ?? B3 ?? 8D 45 ?? 50 8B 55 ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 50 8B 45 ?? E8 ?? 
            ?? ?? ?? 5A 2B C2 83 C0 ?? 50 8B 55 ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B D0 83 C2 ?? 
            8B 45 ?? 59 E8 ?? ?? ?? ?? 8D 45 ?? 50 8D 85 ?? ?? ?? ?? 8B 55 ?? E8 ?? ?? ?? ?? 8B 
            85 ?? ?? ?? ?? 66 BA ?? ?? E8 ?? ?? ?? ?? 50 8B 45 ?? E8 ?? ?? ?? ?? 5A 2B C2 50 8D 
            85 ?? ?? ?? ?? 8B 55 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 66 BA ?? ?? E8 ?? ?? ?? ?? 
            8B D0 42 8B 45 ?? 59 E8 ?? ?? ?? ?? 8D 45 ?? 50 8D 85 ?? ?? ?? ?? 8B 55 ?? E8 ?? ?? 
            ?? ?? 8B 85 ?? ?? ?? ?? 66 BA ?? ?? E8 ?? ?? ?? ?? 8B C8 49 BA ?? ?? ?? ?? 8B 45 ?? 
            E8 ?? ?? ?? ?? 84 DB 0F 84 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 48 0F 8E ?? ?? ?? ?? 
            6A ?? 6A ?? 6A ?? 6A ?? 8D 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? E8 ?? ?? 
            ?? ?? 50 E8 ?? ?? ?? ?? 8B D8 85 DB 0F 84 ?? ?? ?? ?? 6A ?? 6A ?? 6A ?? 6A ?? 6A ?? 
            68 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 50 53 E8 ?? ?? ?? ?? 8B F8 85 FF 0F 84 ?? ?? 
            ?? ?? 6A ?? 68 ?? ?? ?? ?? 6A ?? 6A ?? 68 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 50 68 
            ?? ?? ?? ?? 57 E8 ?? ?? ?? ?? 89 45 ?? 83 7D ?? ?? 0F 84 ?? ?? ?? ?? 8D 45 ?? 50 8D
        }

        $remote_connection_2 = {
            45 ?? 50 6A ?? 8B 45 ?? 50 E8 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 8B 45 ?? 0D ?? ?? 
            ?? ?? 0D ?? ?? ?? ?? 89 45 ?? 8B 45 ?? 50 8D 45 ?? 50 6A ?? 8B 45 ?? 50 E8 ?? ?? ?? 
            ?? 85 C0 0F 84 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 50 8B 45 ?? E8 ?? ?? ?? ?? 50 6A 
            ?? 68 ?? ?? ?? ?? 8B 45 ?? 50 E8 ?? ?? ?? ?? 85 C0 74 ?? 8D 45 ?? 50 68 ?? ?? ?? ?? 
            8D 85 ?? ?? ?? ?? 50 8B 45 ?? 50 E8 ?? ?? ?? ?? 85 C0 74 ?? 83 7D ?? ?? 74 ?? 8D 45 
            ?? 8B 55 ?? E8 ?? ?? ?? ?? 8D 45 ?? E8 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 4D ?? E8 ?? 
            ?? ?? ?? 8B C6 8B 55 ?? E8 ?? ?? ?? ?? 8B 45 ?? 01 45 ?? 81 7D ?? ?? ?? ?? ?? 77 ?? 
            83 7D ?? ?? 75 ?? 8B 45 ?? 50 E8 ?? ?? ?? ?? 57 E8 ?? ?? ?? ?? 53 E8 ?? ?? ?? ?? E9 
            ?? ?? ?? ?? 6A ?? 6A ?? 6A ?? 6A ?? 8D 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? 
            ?? E8 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 8B D8 85 DB 0F 84 ?? ?? ?? ?? 6A ?? 6A ?? 6A ?? 
            6A ?? 6A ?? 68 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 50 53 E8 ?? ?? ?? ?? 8B F8 85 FF 
            0F 84 ?? ?? ?? ?? 6A ?? 68 ?? ?? ?? ?? 6A ?? 6A ?? 68 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? 
            ?? ?? 50 68 ?? ?? ?? ?? 57 E8 ?? ?? ?? ?? 89 45 ?? 83 7D ?? ?? 0F 84 ?? ?? ?? ?? 8D 
            45 ?? 50 8D 45 ?? 50 6A ?? 8B 45 ?? 50 E8 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 8B 45 
            ?? 0D ?? ?? ?? ?? 0D ?? ?? ?? ?? 89 45 ?? 8B 45 ?? 50 8D 45 ?? 50 6A ?? 8B 45 ?? 50 
            E8 ?? ?? ?? ?? 85 C0 74 ?? 6A ?? 6A ?? 6A ?? 68 ?? ?? ?? ?? 8B 45 ?? 50 E8 ?? ?? ?? 
            ?? 85 C0 74 ?? 8D 45 ?? 50 68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 8B 45 ?? 50 E8 ?? ?? 
            ?? ?? 85 C0 74 ?? 83 7D ?? ?? 74 ?? 8D 45 ?? 8B 55 ?? E8 ?? ?? ?? ?? 8D 45 ?? E8 ?? 
            ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 4D ?? E8 ?? ?? ?? ?? 8B C6 8B 55 ?? E8 ?? ?? ?? ?? 8B 
            45 ?? 01 45 ?? 81 7D ?? ?? ?? ?? ?? 77 ?? 83 7D ?? ?? 75 ?? 8B 45 ?? 50 E8 ?? ?? ?? 
            ?? 57 E8 ?? ?? ?? ?? 53 E8 ?? ?? ?? ?? 83 3E ?? 0F 85 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? 
            ?? ?? 48 0F 8E ?? ?? ?? ?? 6A ?? 6A ?? 6A ?? 6A ?? 8D 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? 
            8B 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 8B D8 85 DB 0F 84 ?? ?? ?? ?? 6A 
            ?? 6A ?? 6A ?? 6A ?? 6A ?? 6A ?? 8B 45 ?? E8 ?? ?? ?? ?? 50 53 E8 ?? ?? ?? ?? 8B F8 
            85 FF 0F 84 ?? ?? ?? ?? 6A ?? 68 ?? ?? ?? ?? 6A ?? 6A ?? 68 ?? ?? ?? ?? 8B 45 ?? E8 
            ?? ?? ?? ?? 50 68 ?? ?? ?? ?? 57 E8 ?? ?? ?? ?? 89 45 ?? 83 7D ?? ?? 0F 84 ?? ?? ?? 
            ?? 8B 45 ?? E8 ?? ?? ?? ?? 50 8B 45 ?? E8 ?? ?? ?? ?? 50 6A ?? 68 ?? ?? ?? ?? 8B 45 
            ?? 50 E8 ?? ?? ?? ?? 85 C0 74 ?? 8D 45 ?? 50 68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 8B
        }

        $remote_connection_3 = { 
            45 ?? 50 E8 ?? ?? ?? ?? 85 C0 74 ?? 83 7D ?? ?? 74 ?? 8D 45 ?? 8B 55 ?? E8 ?? ?? ?? 
            ?? 8D 45 ?? E8 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 4D ?? E8 ?? ?? ?? ?? 8B C6 8B 55 ?? 
            E8 ?? ?? ?? ?? 8B 45 ?? 01 45 ?? 81 7D ?? ?? ?? ?? ?? 77 ?? 83 7D ?? ?? 75 ?? 8B 45 
            ?? 50 E8 ?? ?? ?? ?? 57 E8 ?? ?? ?? ?? 53 E8 ?? ?? ?? ?? E9 ?? ?? ?? ?? 6A ?? 6A ?? 
            6A ?? 6A ?? 8D 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? 50 E8 
            ?? ?? ?? ?? 8B D8 85 DB 0F 84 ?? ?? ?? ?? 6A ?? 6A ?? 6A ?? 6A ?? 6A ?? 6A ?? 8B 45 
            ?? E8 ?? ?? ?? ?? 50 53 E8 ?? ?? ?? ?? 8B F8 85 FF 0F 84 ?? ?? ?? ?? 6A ?? 68 ?? ?? 
            ?? ?? 6A ?? 6A ?? 68 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? 57 E8 ?? 
            ?? ?? ?? 89 45 ?? 83 7D ?? ?? 0F 84 ?? ?? ?? ?? 6A ?? 6A ?? 6A ?? 68 ?? ?? ?? ?? 8B 
            45 ?? 50 E8 ?? ?? ?? ?? 85 C0 74 ?? 8D 45 ?? 50 68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 
            8B 45 ?? 50 E8 ?? ?? ?? ?? 85 C0 74 ?? 83 7D ?? ?? 74 ?? 8D 45 ?? 8B 55 ?? E8 ?? ?? 
            ?? ?? 8D 45 ?? E8 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 4D ?? E8 ?? ?? ?? ?? 8B C6 8B 55 
            ?? E8 ?? ?? ?? ?? 8B 45 ?? 01 45 ?? 81 7D ?? ?? ?? ?? ?? 77 ?? 83 7D ?? ?? 75 ?? 8B 
            45 ?? 50 E8 ?? ?? ?? ?? 57 E8 ?? ?? ?? ?? 53 E8 ?? ?? ?? ?? 33 C0 5A 59 59 64 89 10 
            68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? BA 
            ?? ?? ?? ?? E8 ?? ?? ?? ?? 8D 45 ?? E8 ?? ?? ?? ?? 8D 45 ?? E8 ?? ?? ?? ?? 8D 45 ?? 
            BA ?? ?? ?? ?? E8 ?? ?? ?? ?? C3 
        }

        $find_files = {
            50 E8 ?? ?? ?? ?? 8B D8 83 FB ?? 0F 84 ?? ?? ?? ?? 33 F6 46 81 FE ?? ?? ?? ?? 0F 87 
            ?? ?? ?? ?? 83 FB ?? 0F 84 ?? ?? ?? ?? 8D 45 ?? 8D 57 ?? B9 ?? ?? ?? ?? E8 ?? ?? ?? 
            ?? 8B 45 ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8B 45 ?? BA ?? ?? ?? ?? 
            E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? F6 07 ?? 0F 85 ?? ?? ?? ?? F6 47 ?? ?? 0F 85 ?? ?? 
            ?? ?? FF 75 ?? 68 ?? ?? ?? ?? FF 75 ?? 8D 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? 
            ?? 8B 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? F7 D8 1B C0 F7 D8 84 C0 75 ?? 
            6A ?? FF 75 ?? 68 ?? ?? ?? ?? FF 75 ?? 8D 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? 
            ?? 8B 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? FF 75 ?? 68 ?? ?? ?? ?? FF 75 
            ?? 8D 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? 
            50 E8 ?? ?? ?? ?? 57 53 E8 ?? ?? ?? ?? F7 D8 1B C0 F7 D8 84 C0 0F 85 ?? ?? ?? ?? 83 
            FB ?? 74 ?? 53 E8 ?? ?? ?? ?? 57 8D 85 ?? ?? ?? ?? B9 ?? ?? ?? ?? 8B 55 ?? E8 ?? ?? 
            ?? ?? 8B 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 8B D8 83 FB ?? 0F 84 ?? ?? 
            ?? ?? 33 F6 46 81 FE ?? ?? ?? ?? 0F 87 ?? ?? ?? ?? 83 FB ?? 0F 84 ?? ?? ?? ?? 8D 45 
            ?? 8D 57 ?? B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 45 ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 
            84 ?? ?? ?? ?? 8B 45 ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? F6 07 ?? 0F 
            84 ?? ?? ?? ?? F6 47 ?? ?? 75 ?? FF 75 ?? 68 ?? ?? ?? ?? FF 75 ?? 8D 85 ?? ?? ?? ?? 
            BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? E9 ?? ?? ?? ?? FF 75 
            ?? 68 ?? ?? ?? ?? FF 75 ?? 68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? 
            ?? ?? 8B 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? F7 D8 1B C0 F7 D8 84 C0 75 
            ?? 6A ?? FF 75 ?? 68 ?? ?? ?? ?? FF 75 ?? 68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? BA ?? ?? 
            ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? FF 75 ?? 68 
            ?? ?? ?? ?? FF 75 ?? 68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 
            8B 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 57 53 E8 ?? ?? ?? ?? F7 D8 1B C0 
            F7 D8 84 C0 0F 85 ?? ?? ?? ?? 83 FB ?? 74 ?? 53 E8 ?? ?? ?? ?? 8D 45 ?? BA ?? ?? ?? 
            ?? E8 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? F7 D8 1B DB F7 DB 84 DB 
            75 ?? 6A ?? 8B 45 ?? E8 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 50 E8 
            ?? ?? ?? ?? 33 C0 5A 59 59 64 89 10 68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? BA ?? ?? ?? ?? 
            E8 ?? ?? ?? ?? 8D 45 ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? C3 
        }

        $decrypt_payload_script = {
            FF 75 ?? FF 75 ?? 68 ?? ?? ?? ?? FF 75 ?? 68 ?? ?? ?? ?? 8D 45 ?? E8 ?? ?? ?? ?? FF 
            75 ?? FF 75 ?? 68 ?? ?? ?? ?? FF 75 ?? 68 ?? ?? ?? ?? FF 75 ?? 68 ?? ?? ?? ?? FF 75 
            ?? 68 ?? ?? ?? ?? FF 75 ?? 68 ?? ?? ?? ?? FF 75 ?? 68 ?? ?? ?? ?? FF 75 ?? 68 ?? ?? 
            ?? ?? FF 75 ?? 68 ?? ?? ?? ?? 8D 45 ?? E8 ?? ?? ?? ?? FF 75 ?? 8B C3 BA ?? ?? ?? ?? 
            E8 ?? ?? ?? ?? 8D 55 ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8D 55 ?? B8 ?? ?? ?? ?? E8 ?? 
            ?? ?? ?? 8D 55 ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8D 55 ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? 
            ?? FF 33 FF 75 ?? 68 ?? ?? ?? ?? FF 75 ?? 68 ?? ?? ?? ?? FF 75 ?? 68 ?? ?? ?? ?? FF 
            75 ?? 68 ?? ?? ?? ?? FF 75 ?? 68 ?? ?? ?? ?? FF 75 ?? 68 ?? ?? ?? ?? FF 75 ?? 68 ?? 
            ?? ?? ?? FF 75 ?? 68 ?? ?? ?? ?? FF 75 ?? 68 ?? ?? ?? ?? FF 75 ?? 68 ?? ?? ?? ?? FF 
            75 ?? 68 ?? ?? ?? ?? FF 75 ?? 68 ?? ?? ?? ?? FF 75 ?? 68 ?? ?? ?? ?? FF 75 ?? 68 ?? 
            ?? ?? ?? FF 75 ?? 68 ?? ?? ?? ?? FF 75 ?? 68 ?? ?? ?? ?? FF 75 ?? 68 ?? ?? ?? ?? 8D 
            45 ?? E8 ?? ?? ?? ?? FF 75 ?? 68 ?? ?? ?? ?? FF 75 ?? 68 ?? ?? ?? ?? 8D 45 ?? E8 
        }

    condition:
        uint16(0) == 0x5A4D and $find_files and $decrypt_payload_script and (all of ($remote_connection_*))
}