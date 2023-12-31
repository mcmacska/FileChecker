rule win_crylocker_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-04-08"
        version = "1"
        description = "Describes win.crylocker."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.crylocker"
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
        $sequence_0 = { 8b502c 8d443f02 50 8d4e0c 53 51 }
            // n = 6, score = 100
            //   8b502c               | mov                 edx, dword ptr [eax + 0x2c]
            //   8d443f02             | lea                 eax, dword ptr [edi + edi + 2]
            //   50                   | push                eax
            //   8d4e0c               | lea                 ecx, dword ptr [esi + 0xc]
            //   53                   | push                ebx
            //   51                   | push                ecx

        $sequence_1 = { 8b442418 69c0354e5a01 40 89442418 c1e808 }
            // n = 5, score = 100
            //   8b442418             | mov                 eax, dword ptr [esp + 0x18]
            //   69c0354e5a01         | imul                eax, eax, 0x15a4e35
            //   40                   | inc                 eax
            //   89442418             | mov                 dword ptr [esp + 0x18], eax
            //   c1e808               | shr                 eax, 8

        $sequence_2 = { 8b44241c 8bf7 3bf8 7602 8bf0 56 }
            // n = 6, score = 100
            //   8b44241c             | mov                 eax, dword ptr [esp + 0x1c]
            //   8bf7                 | mov                 esi, edi
            //   3bf8                 | cmp                 edi, eax
            //   7602                 | jbe                 4
            //   8bf0                 | mov                 esi, eax
            //   56                   | push                esi

        $sequence_3 = { 50 e8???????? 8d4c2418 6a01 }
            // n = 4, score = 100
            //   50                   | push                eax
            //   e8????????           |                     
            //   8d4c2418             | lea                 ecx, dword ptr [esp + 0x18]
            //   6a01                 | push                1

        $sequence_4 = { 3bc3 7408 53 50 ff15???????? 8b44240c 5e }
            // n = 7, score = 100
            //   3bc3                 | cmp                 eax, ebx
            //   7408                 | je                  0xa
            //   53                   | push                ebx
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b44240c             | mov                 eax, dword ptr [esp + 0xc]
            //   5e                   | pop                 esi

        $sequence_5 = { c3 8b1424 8b442404 52 50 8d4c2410 51 }
            // n = 7, score = 100
            //   c3                   | ret                 
            //   8b1424               | mov                 edx, dword ptr [esp]
            //   8b442404             | mov                 eax, dword ptr [esp + 4]
            //   52                   | push                edx
            //   50                   | push                eax
            //   8d4c2410             | lea                 ecx, dword ptr [esp + 0x10]
            //   51                   | push                ecx

        $sequence_6 = { 8bc7 5f 5e 5d 83c408 c3 55 }
            // n = 7, score = 100
            //   8bc7                 | mov                 eax, edi
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   83c408               | add                 esp, 8
            //   c3                   | ret                 
            //   55                   | push                ebp

        $sequence_7 = { 81c52bffffff 55 81c7d5000000 57 81c600010000 8d4c245c 56 }
            // n = 7, score = 100
            //   81c52bffffff         | add                 ebp, 0xffffff2b
            //   55                   | push                ebp
            //   81c7d5000000         | add                 edi, 0xd5
            //   57                   | push                edi
            //   81c600010000         | add                 esi, 0x100
            //   8d4c245c             | lea                 ecx, dword ptr [esp + 0x5c]
            //   56                   | push                esi

        $sequence_8 = { 0f94c1 8d0c8d01000000 51 52 }
            // n = 4, score = 100
            //   0f94c1               | sete                cl
            //   8d0c8d01000000       | lea                 ecx, dword ptr [ecx*4 + 1]
            //   51                   | push                ecx
            //   52                   | push                edx

        $sequence_9 = { a3???????? e8???????? 83c41c 8d4c2428 51 e8???????? }
            // n = 6, score = 100
            //   a3????????           |                     
            //   e8????????           |                     
            //   83c41c               | add                 esp, 0x1c
            //   8d4c2428             | lea                 ecx, dword ptr [esp + 0x28]
            //   51                   | push                ecx
            //   e8????????           |                     

    condition:
        7 of them and filesize < 139264
}