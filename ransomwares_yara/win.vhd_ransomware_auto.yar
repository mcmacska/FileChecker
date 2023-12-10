rule win_vhd_ransomware_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-04-08"
        version = "1"
        description = "Describes win.vhd_ransomware."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.vhd_ransomware"
        malpedia_rule_date = "20220405"
        malpedia_hash = "ecd38294bd47d5589be5cd5490dc8bb4804afc2a"
        malpedia_version = ""
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { 6a40 8d4d9c 51 52 ffd6 8b0d???????? }
            // n = 6, score = 100
            //   6a40                 | push                0x40
            //   8d4d9c               | lea                 ecx, dword ptr [ebp - 0x64]
            //   51                   | push                ecx
            //   52                   | push                edx
            //   ffd6                 | call                esi
            //   8b0d????????         |                     

        $sequence_1 = { 33c0 b9c8000000 8d7e04 f3ab 8916 85d2 7e14 }
            // n = 7, score = 100
            //   33c0                 | xor                 eax, eax
            //   b9c8000000           | mov                 ecx, 0xc8
            //   8d7e04               | lea                 edi, dword ptr [esi + 4]
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   8916                 | mov                 dword ptr [esi], edx
            //   85d2                 | test                edx, edx
            //   7e14                 | jle                 0x16

        $sequence_2 = { 6a00 57 e8???????? 83c40c 8b0e 8b1c8e }
            // n = 6, score = 100
            //   6a00                 | push                0
            //   57                   | push                edi
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8b0e                 | mov                 ecx, dword ptr [esi]
            //   8b1c8e               | mov                 ebx, dword ptr [esi + ecx*4]

        $sequence_3 = { ff4de4 0f8585fdffff 8b45e0 5f 5e 5b }
            // n = 6, score = 100
            //   ff4de4               | dec                 dword ptr [ebp - 0x1c]
            //   0f8585fdffff         | jne                 0xfffffd8b
            //   8b45e0               | mov                 eax, dword ptr [ebp - 0x20]
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx

        $sequence_4 = { 53 57 8d3c85fcce4100 833f00 bb00100000 7520 53 }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   57                   | push                edi
            //   8d3c85fcce4100       | lea                 edi, dword ptr [eax*4 + 0x41cefc]
            //   833f00               | cmp                 dword ptr [edi], 0
            //   bb00100000           | mov                 ebx, 0x1000
            //   7520                 | jne                 0x22
            //   53                   | push                ebx

        $sequence_5 = { 55 8bec 81ec40030000 a1???????? 33c5 8945fc 53 }
            // n = 7, score = 100
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81ec40030000         | sub                 esp, 0x340
            //   a1????????           |                     
            //   33c5                 | xor                 eax, ebp
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   53                   | push                ebx

        $sequence_6 = { 33c0 8d7a04 b9c8000000 f3ab 8b8574f6ffff 33c9 }
            // n = 6, score = 100
            //   33c0                 | xor                 eax, eax
            //   8d7a04               | lea                 edi, dword ptr [edx + 4]
            //   b9c8000000           | mov                 ecx, 0xc8
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   8b8574f6ffff         | mov                 eax, dword ptr [ebp - 0x98c]
            //   33c9                 | xor                 ecx, ecx

        $sequence_7 = { 898dacf9ffff 81fac8000000 7e0b b9c8000000 898dacf9ffff }
            // n = 5, score = 100
            //   898dacf9ffff         | mov                 dword ptr [ebp - 0x654], ecx
            //   81fac8000000         | cmp                 edx, 0xc8
            //   7e0b                 | jle                 0xd
            //   b9c8000000           | mov                 ecx, 0xc8
            //   898dacf9ffff         | mov                 dword ptr [ebp - 0x654], ecx

        $sequence_8 = { f3ab 8b85a0f9ffff c78485d4fcffff01000000 40 8985d0fcffff 53 8d85d0fcffff }
            // n = 7, score = 100
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   8b85a0f9ffff         | mov                 eax, dword ptr [ebp - 0x660]
            //   c78485d4fcffff01000000     | mov    dword ptr [ebp + eax*4 - 0x32c], 1
            //   40                   | inc                 eax
            //   8985d0fcffff         | mov                 dword ptr [ebp - 0x330], eax
            //   53                   | push                ebx
            //   8d85d0fcffff         | lea                 eax, dword ptr [ebp - 0x330]

        $sequence_9 = { 8b85c0fcffff 8910 8b85c4fcffff 8b4d0c 8385c0fcffff04 40 }
            // n = 6, score = 100
            //   8b85c0fcffff         | mov                 eax, dword ptr [ebp - 0x340]
            //   8910                 | mov                 dword ptr [eax], edx
            //   8b85c4fcffff         | mov                 eax, dword ptr [ebp - 0x33c]
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   8385c0fcffff04       | add                 dword ptr [ebp - 0x340], 4
            //   40                   | inc                 eax

    condition:
        7 of them and filesize < 275456
}