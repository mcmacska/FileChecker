rule Win32_Ransomware_Serpent : tc_detection malicious
{
    meta:

        author              = "ReversingLabs"

        source              = "ReversingLabs"
        status              = "RELEASED"
        sharing             = "TLP:WHITE"
        category            = "MALWARE"
        malware             = "SERPENT"
        description         = "Yara rule that detects Serpent ransomware."

        tc_detection_type   = "Ransomware"
        tc_detection_name   = "Serpent"
        tc_detection_factor = 5

    strings:

        $do_dll_stuff_and_create_thread = {
            68 ?? ?? ?? ?? 6A ?? 6A ?? 68 ?? ?? ?? ?? 6A ?? 6A ?? E8 ?? ?? ?? ?? 8B D8 68 ?? ?? 
            ?? ?? E8 ?? ?? ?? ?? 89 D2 C7 05 ?? ?? ?? ?? ?? ?? ?? ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? 
            ?? 89 FF 90 90 6A ?? 53 E8 ?? ?? ?? ?? 83 3D ?? ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 68 ?? 
            ?? ?? ?? E8 ?? ?? ?? ?? E8 ?? ?? ?? ?? A3 ?? ?? ?? ?? 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? 
            E8 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 85 C0 0F 85 ?? ?? ?? ?? BB ?? ?? ?? ?? 4B 75 ?? BA 
            ?? ?? ?? ?? 66 0F 6E D2 89 FF 89 C9 31 D2 66 0F 7E D2 89 15 ?? ?? ?? ?? 81 3D ?? ?? 
            ?? ?? ?? ?? ?? ?? 0F 85 ?? ?? ?? ?? BB ?? ?? ?? ?? 4B 75 ?? BB ?? ?? ?? ?? 89 C9 4B 
            75 ?? 89 C9 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 85 C0 0F 85 ?? ?? ?? ?? BB ?? ?? ?? ?? 4B 
            75 ?? BB ?? ?? ?? ?? E8 ?? ?? ?? ?? A3 ?? ?? ?? ?? E8 ?? ?? ?? ?? 85 C0 79 ?? E8 ?? 
            ?? ?? ?? A3 ?? ?? ?? ?? E8 ?? ?? ?? ?? 85 C0 79 ?? E8 ?? ?? ?? ?? A3 ?? ?? ?? ?? 4B 
            75 ?? 89 FF 90 BB ?? ?? ?? ?? 89 C9 4B 75 ?? 90 90 BB ?? ?? ?? ?? 4B 75 ?? BB ?? ?? 
            ?? ?? 4B 75 ?? BB ?? ?? ?? ?? 4B 75 ?? 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 
            50 E8 ?? ?? ?? ?? 85 C0 0F 85 ?? ?? ?? ?? 90 BB ?? ?? ?? ?? 89 D2 4B 75 ?? 6A ?? 68 
            ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 8B F0 85 F6 0F 84 ?? ?? ?? ?? BA ?? 
            ?? ?? ?? 8B C6 E8 ?? ?? ?? ?? 90 89 C9 BB ?? ?? ?? ?? 89 FF 4B 75 ?? 68 ?? ?? ?? ?? 
            6A ?? 56 E8 ?? ?? ?? ?? BB ?? ?? ?? ?? 89 D2 4B 75 ?? 6A ?? 6A ?? E8 ?? ?? ?? ?? 33 
            C0 A3 ?? ?? ?? ?? 64 8B 35 ?? ?? ?? ?? 89 35 ?? ?? ?? ?? 83 3D ?? ?? ?? ?? ?? 75 ?? 
            90 89 F6 90 BB ?? ?? ?? ?? 89 DB 4B 75 ?? 89 D2 89 C0 BB ?? ?? ?? ?? 89 D2 4B 75 ?? 
            C7 05 ?? ?? ?? ?? ?? ?? ?? ?? BB ?? ?? ?? ?? 89 FF 4B 75 ?? 89 C0 0F 31 90 89 C7 0F 
            31 90 89 C0 29 F8 89 D2 89 DB 77 ?? 90 90 89 C9 89 F6 8B 3D ?? ?? ?? ?? 90 90 89 C9 
            89 F6 90 03 3D ?? ?? ?? ?? 90 90 89 C9 89 F6 FF D7 89 F6 90 90 BB ?? ?? ?? ?? 4B 75 
            ?? 33 C0 5A 59 59 64 89 10 68 ?? ?? ?? ?? C3 
        }

        $find_files = {
            55 8B EC 81 C4 ?? ?? ?? ?? 53 56 33 C0 89 85 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 89 85 ?? 
            ?? ?? ?? 89 85 ?? ?? ?? ?? 89 45 ?? 33 C0 55 68 ?? ?? ?? ?? 64 FF 30 64 89 20 8B 45 
            ?? 8B 58 ?? 83 7B ?? ?? 75 ?? 8D 55 ?? A1 ?? ?? ?? ?? E8 ?? ?? ?? ?? EB ?? 8D 55 ?? 
            A1 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 73 ?? 6A ?? 8D 45 ?? 50 8B 43 ?? 50 E8 ?? ?? ?? ?? 
            81 7D ?? ?? ?? ?? ?? 0F 85 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 8B 45 ?? 
            50 E8 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 8B 43 ?? 89 85 ?? ?? ?? ?? C6 85 ?? ?? ?? 
            ?? ?? 8D 85 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? 
            ?? ?? 8D 95 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? C6 85 ?? 
            ?? ?? ?? ?? 8B 45 ?? 89 85 ?? ?? ?? ?? C6 85 ?? ?? ?? ?? ?? 89 B5 ?? ?? ?? ?? C6 85 
            ?? ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 6A ?? 8D 95 ?? ?? ?? ?? A1 ?? ?? ?? ?? E8 ?? ?? 
            ?? ?? 8B 8D ?? ?? ?? ?? B2 ?? A1 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B D8 EB ?? 8B 43 ?? 89 
            85 ?? ?? ?? ?? C6 85 ?? ?? ?? ?? ?? 8B 45 ?? 89 85 ?? ?? ?? ?? C6 85 ?? ?? ?? ?? ?? 
            89 B5 ?? ?? ?? ?? C6 85 ?? ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 6A ?? 8D 95 ?? ?? ?? ?? 
            A1 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 8D ?? ?? ?? ?? B2 ?? A1 ?? ?? ?? ?? E8 ?? ?? ?? ?? 
            8B D8 33 C0 5A 59 59 64 89 10 68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8D 85 
            ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 8D 45 ?? E8 ?? ?? ?? ?? C3 
        }

        $remote_connection = {
            55 68 ?? ?? ?? ?? 64 FF 30 64 89 20 FF 05 ?? ?? ?? ?? 83 3D ?? ?? ?? ?? ?? 0F 85 ?? 
            ?? ?? ?? 8D 83 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 68 ?? ?? ?? ?? 66 8B 83 
            ?? ?? ?? ?? E8 ?? ?? ?? ?? 25 ?? ?? ?? ?? 8D 55 ?? E8 ?? ?? ?? ?? FF 75 ?? 68 ?? ?? 
            ?? ?? 8D 55 ?? 33 C0 8A 83 ?? ?? ?? ?? E8 ?? ?? ?? ?? FF 75 ?? 8D 45 ?? BA ?? ?? ?? 
            ?? E8 ?? ?? ?? ?? 8B 55 ?? 8B 83 ?? ?? ?? ?? 8B 08 FF 51 ?? 68 ?? ?? ?? ?? 66 8B 83 
            ?? ?? ?? ?? E8 ?? ?? ?? ?? 25 ?? ?? ?? ?? 8D 55 ?? E8 ?? ?? ?? ?? FF 75 ?? 68 ?? ?? 
            ?? ?? 8D 55 ?? 33 C0 8A 83 ?? ?? ?? ?? E8 ?? ?? ?? ?? FF 75 ?? 8D 45 ?? BA ?? ?? ?? 
            ?? E8 ?? ?? ?? ?? 8B 55 ?? 8B 83 ?? ?? ?? ?? 8B 08 FF 51 ?? 8D 45 ?? 8D 93 ?? ?? ?? 
            ?? B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 4D ?? 8D 45 ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 
            55 ?? 8B 83 ?? ?? ?? ?? 8B 08 FF 51 ?? 8D 45 ?? 8D 93 ?? ?? ?? ?? B9 ?? ?? ?? ?? E8 
            ?? ?? ?? ?? 8B 4D ?? 8D 45 ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 55 ?? 8B 83 ?? ?? ?? 
            ?? 8B 08 FF 51 ?? 8D 55 ?? 0F B7 83 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 4D ?? 8D 45 ?? BA 
            ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 55 ?? 8B 83 ?? ?? ?? ?? 8B 08 FF 51 ?? 8D 55 ?? 0F B7 
            83 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 4D ?? 8D 45 ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 55 
            ?? 8B 83 ?? ?? ?? ?? 8B 08 FF 51 ?? 33 C0 55 68 ?? ?? ?? ?? 64 FF 30 64 89 20 6A ?? 
            6A ?? 6A ?? E8 ?? ?? ?? ?? 8B F0 81 FE ?? ?? ?? ?? 76 ?? E8 ?? ?? ?? ?? 66 89 B3 ?? 
            ?? ?? ?? 66 C7 45 ?? ?? ?? 66 C7 45 ?? ?? ?? 6A ?? 8D 45 ?? 50 68 ?? ?? ?? ?? 68 ?? 
            ?? ?? ?? 0F B7 C6 50 E8 ?? ?? ?? ?? 66 81 BB ?? ?? ?? ?? ?? ?? 75 ?? 8D 4D ?? 66 BA 
            ?? ?? 8B C3 E8 ?? ?? ?? ?? 6A ?? 68 ?? ?? ?? ?? 8B 83 ?? ?? ?? ?? 50 0F B7 83 ?? ?? 
            ?? ?? 50 E8 ?? ?? ?? ?? 33 C0 5A 59 59 64 89 10 EB ?? E9 ?? ?? ?? ?? FF 0D ?? ?? ?? 
            ?? 83 3D ?? ?? ?? ?? ?? 75 ?? E8 ?? ?? ?? ?? E8 ?? ?? ?? ?? E8 
        }

        $remote_ftp_connection = {
            BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 55 ?? 8D 4D ?? 8B 45 ?? 8B 18 FF 53 ?? 8B 45 ?? 66 
            8B 80 ?? ?? ?? ?? 66 3D ?? ?? 7E ?? 66 3D ?? ?? 7D ?? 8B 45 ?? 66 83 B8 ?? ?? ?? ?? 
            ?? 74 ?? 8B 5D ?? 8B 55 ?? 8B 83 ?? ?? ?? ?? FF 93 ?? ?? ?? ?? 8B 4D ?? B2 ?? A1 ?? 
            ?? ?? ?? E8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 45 ?? 66 81 B8 ?? ?? ?? ?? ?? ?? 75 ?? B9 
            ?? ?? ?? ?? B2 ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 45 ?? 8B 88 ?? ?? ?? ?? 8D 45 ?? BA ?? 
            ?? ?? ?? E8 ?? ?? ?? ?? 8B 55 ?? 8D 4D ?? 8B 45 ?? 8B 18 FF 53 ?? 8B 45 ?? 66 8B 80 
            ?? ?? ?? ?? 66 3D ?? ?? 7E ?? 66 3D ?? ?? 7D ?? 8B 45 ?? 66 83 B8 ?? ?? ?? ?? ?? 74 
            ?? 8B 5D ?? 8B 55 ?? 8B 83 ?? ?? ?? ?? FF 93 ?? ?? ?? ?? 8B 4D ?? B2 ?? A1 ?? ?? ?? 
            ?? E8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 45 ?? 83 B8 ?? ?? ?? ?? ?? 74 ?? 8B 45 ?? 83 B8 
            ?? ?? ?? ?? ?? 75 ?? 8B 45 ?? 66 83 B8 ?? ?? ?? ?? ?? 74 ?? 8D 55 ?? 8B 5D ?? 8B 83 
            ?? ?? ?? ?? FF 93 ?? ?? ?? ?? 8B 45 ?? 83 B8 ?? ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8B 45 
            ?? 8A 80 ?? ?? ?? ?? 2C ?? 72 ?? 74 ?? FE C8 74 ?? E9 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8B 
            45 ?? FF B0 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8B 45 ?? FF B0 ?? ?? ?? ?? 8D 45 ?? BA ?? ?? 
            ?? ?? E8 ?? ?? ?? ?? 8B 55 ?? 8D 4D ?? 8B 45 ?? 8B 18 FF 53 ?? EB ?? 8B 45 ?? 8B 88 
            ?? ?? ?? ?? 8D 45 ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 55 ?? 8D 4D ?? 8B 45 ?? 8B 18 
            FF 53 ?? EB ?? 8B 45 ?? 8B 88 ?? ?? ?? ?? 8D 45 ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 
            55 ?? 8D 4D ?? 8B 45 ?? 8B 18 FF 53 ?? 8B 45 ?? 83 B8 ?? ?? ?? ?? ?? 74 ?? 8B 45 ?? 
            80 B8 ?? ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8B 45 ?? 8B 88 ?? ?? ?? ?? 8D 45 ?? BA ?? ?? 
            ?? ?? E8 ?? ?? ?? ?? 8B 4D ?? B2 ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 45 ?? 8B 88 ?? ?? ?? 
            ?? 8D 45 ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 55 ?? 8D 4D ?? 8B 45 ?? 8B 18 FF 53 ?? 
            8B 45 ?? 66 8B 80 ?? ?? ?? ?? 66 3D ?? ?? 7E ?? 66 3D ?? ?? 7D ?? 8B 45 ?? 66 83 B8 
            ?? ?? ?? ?? ?? 74 ?? 8B 5D ?? 8B 55 ?? 8B 83 ?? ?? ?? ?? FF 93 ?? ?? ?? ?? 8B 4D ?? 
            B2 ?? A1 ?? ?? ?? ?? E8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 45 ?? 66 81 B8 ?? ?? ?? ?? ?? 
            ?? 75 ?? B9 ?? ?? ?? ?? B2 ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 45 ?? 8B 88 ?? ?? ?? ?? 8D 
            45 ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 55 ?? 8D 4D ?? 8B 45 ?? 8B 18 FF 53 ?? 8B 45 
            ?? 66 8B 80 ?? ?? ?? ?? 66 3D ?? ?? 7E ?? 66 3D ?? ?? 7D ?? 8B 45 ?? 66 83 B8 ?? ?? 
            ?? ?? ?? 74 ?? 8B 5D ?? 8B 55 ?? 8B 83 ?? ?? ?? ?? FF 93 ?? ?? ?? ?? 8B 4D ?? B2 ?? 
            A1 ?? ?? ?? ?? E8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 45 ?? 66 83 B8 ?? ?? ?? ?? ?? 74 ?? 
            8B 5D ?? 8B 55 ?? 8B 83 ?? ?? ?? ?? FF 93 
        }

    condition:
        uint16(0) == 0x5A4D and $do_dll_stuff_and_create_thread and $find_files and $remote_connection and $remote_ftp_connection
}