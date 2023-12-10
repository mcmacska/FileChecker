rule win_ransomlock_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-04-08"
        version = "1"
        description = "Describes win.ransomlock."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ransomlock"
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
        $sequence_0 = { 8b5514 8b4508 8b08 52 56 }
            // n = 5, score = 100
            //   8b5514               | mov                 edx, dword ptr [ebp + 0x14]
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   52                   | push                edx
            //   56                   | push                esi

        $sequence_1 = { 7443 8d85d4fdffff 50 57 }
            // n = 4, score = 100
            //   7443                 | je                  0x45
            //   8d85d4fdffff         | lea                 eax, dword ptr [ebp - 0x22c]
            //   50                   | push                eax
            //   57                   | push                edi

        $sequence_2 = { 55 8bec 81ec20020000 53 56 57 ff15???????? }
            // n = 7, score = 100
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81ec20020000         | sub                 esp, 0x220
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   ff15????????         |                     

        $sequence_3 = { 57 68???????? ffd3 8d4c0002 6a00 8d347525664000 }
            // n = 6, score = 100
            //   57                   | push                edi
            //   68????????           |                     
            //   ffd3                 | call                ebx
            //   8d4c0002             | lea                 ecx, dword ptr [eax + eax + 2]
            //   6a00                 | push                0
            //   8d347525664000       | lea                 esi, dword ptr [esi*2 + 0x406625]

        $sequence_4 = { 8b483c 0fb7540114 03c8 0fb74106 03d1 8d0480 8b74c2fc }
            // n = 7, score = 100
            //   8b483c               | mov                 ecx, dword ptr [eax + 0x3c]
            //   0fb7540114           | movzx               edx, word ptr [ecx + eax + 0x14]
            //   03c8                 | add                 ecx, eax
            //   0fb74106             | movzx               eax, word ptr [ecx + 6]
            //   03d1                 | add                 edx, ecx
            //   8d0480               | lea                 eax, dword ptr [eax + eax*4]
            //   8b74c2fc             | mov                 esi, dword ptr [edx + eax*8 - 4]

        $sequence_5 = { 5d c21000 8b7508 8d442418 50 }
            // n = 5, score = 100
            //   5d                   | pop                 ebp
            //   c21000               | ret                 0x10
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   8d442418             | lea                 eax, dword ptr [esp + 0x18]
            //   50                   | push                eax

        $sequence_6 = { c7442440d0304000 89742444 89742448 8944244c c744245810000000 }
            // n = 5, score = 100
            //   c7442440d0304000     | mov                 dword ptr [esp + 0x40], 0x4030d0
            //   89742444             | mov                 dword ptr [esp + 0x44], esi
            //   89742448             | mov                 dword ptr [esp + 0x48], esi
            //   8944244c             | mov                 dword ptr [esp + 0x4c], eax
            //   c744245810000000     | mov                 dword ptr [esp + 0x58], 0x10

        $sequence_7 = { 6a00 51 53 50 56 6800000082 68???????? }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   51                   | push                ecx
            //   53                   | push                ebx
            //   50                   | push                eax
            //   56                   | push                esi
            //   6800000082           | push                0x82000000
            //   68????????           |                     

        $sequence_8 = { 8bec 53 56 8b7508 8d5efc e8???????? ff4e0c }
            // n = 7, score = 100
            //   8bec                 | mov                 ebp, esp
            //   53                   | push                ebx
            //   56                   | push                esi
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   8d5efc               | lea                 ebx, dword ptr [esi - 4]
            //   e8????????           |                     
            //   ff4e0c               | dec                 dword ptr [esi + 0xc]

        $sequence_9 = { 8b5108 83c0fc 50 ffd2 }
            // n = 4, score = 100
            //   8b5108               | mov                 edx, dword ptr [ecx + 8]
            //   83c0fc               | add                 eax, -4
            //   50                   | push                eax
            //   ffd2                 | call                edx

    condition:
        7 of them and filesize < 360448
}