rule win_crypt0l0cker_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-04-08"
        version = "1"
        description = "Describes win.crypt0l0cker."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.crypt0l0cker"
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
        $sequence_0 = { 8a442413 02c1 88442413 f6c301 7516 3c20 7612 }
            // n = 7, score = 100
            //   8a442413             | mov                 al, byte ptr [esp + 0x13]
            //   02c1                 | add                 al, cl
            //   88442413             | mov                 byte ptr [esp + 0x13], al
            //   f6c301               | test                bl, 1
            //   7516                 | jne                 0x18
            //   3c20                 | cmp                 al, 0x20
            //   7612                 | jbe                 0x14

        $sequence_1 = { c78698000000088fa800 c7467401000000 8b4dfc 5e 33cd 5b e8???????? }
            // n = 7, score = 100
            //   c78698000000088fa800     | mov    dword ptr [esi + 0x98], 0xa88f08
            //   c7467401000000       | mov                 dword ptr [esi + 0x74], 1
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   5e                   | pop                 esi
            //   33cd                 | xor                 ecx, ebp
            //   5b                   | pop                 ebx
            //   e8????????           |                     

        $sequence_2 = { 8bf7 83e61f c1e606 0334850028a900 33db 395e08 7531 }
            // n = 7, score = 100
            //   8bf7                 | mov                 esi, edi
            //   83e61f               | and                 esi, 0x1f
            //   c1e606               | shl                 esi, 6
            //   0334850028a900       | add                 esi, dword ptr [eax*4 + 0xa92800]
            //   33db                 | xor                 ebx, ebx
            //   395e08               | cmp                 dword ptr [esi + 8], ebx
            //   7531                 | jne                 0x33

        $sequence_3 = { 50 6a00 8d442430 50 8d442438 50 57 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   6a00                 | push                0
            //   8d442430             | lea                 eax, dword ptr [esp + 0x30]
            //   50                   | push                eax
            //   8d442438             | lea                 eax, dword ptr [esp + 0x38]
            //   50                   | push                eax
            //   57                   | push                edi

        $sequence_4 = { 6a00 ff35???????? ff15???????? 45 83fd06 0f8cd9feffff 5f }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   ff35????????         |                     
            //   ff15????????         |                     
            //   45                   | inc                 ebp
            //   83fd06               | cmp                 ebp, 6
            //   0f8cd9feffff         | jl                  0xfffffedf
            //   5f                   | pop                 edi

        $sequence_5 = { 8b2d???????? 83c410 8bd8 85ff 740b 57 6a00 }
            // n = 7, score = 100
            //   8b2d????????         |                     
            //   83c410               | add                 esp, 0x10
            //   8bd8                 | mov                 ebx, eax
            //   85ff                 | test                edi, edi
            //   740b                 | je                  0xd
            //   57                   | push                edi
            //   6a00                 | push                0

        $sequence_6 = { e8???????? 8bcb e8???????? 57 e8???????? 33c0 59 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     
            //   57                   | push                edi
            //   e8????????           |                     
            //   33c0                 | xor                 eax, eax
            //   59                   | pop                 ecx

        $sequence_7 = { 8945ec 0fb7430a 8b5dec 8bf3 0fafd9 0faff2 0fafc1 }
            // n = 7, score = 100
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax
            //   0fb7430a             | movzx               eax, word ptr [ebx + 0xa]
            //   8b5dec               | mov                 ebx, dword ptr [ebp - 0x14]
            //   8bf3                 | mov                 esi, ebx
            //   0fafd9               | imul                ebx, ecx
            //   0faff2               | imul                esi, edx
            //   0fafc1               | imul                eax, ecx

        $sequence_8 = { e8???????? 53 6a03 5a 8d4d10 8945f8 c7451001000100 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   53                   | push                ebx
            //   6a03                 | push                3
            //   5a                   | pop                 edx
            //   8d4d10               | lea                 ecx, dword ptr [ebp + 0x10]
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   c7451001000100       | mov                 dword ptr [ebp + 0x10], 0x10001

        $sequence_9 = { 0fb60485d8c0a800 33c8 334f1c 8bc1 884d0f c1e818 88450c }
            // n = 7, score = 100
            //   0fb60485d8c0a800     | movzx               eax, byte ptr [eax*4 + 0xa8c0d8]
            //   33c8                 | xor                 ecx, eax
            //   334f1c               | xor                 ecx, dword ptr [edi + 0x1c]
            //   8bc1                 | mov                 eax, ecx
            //   884d0f               | mov                 byte ptr [ebp + 0xf], cl
            //   c1e818               | shr                 eax, 0x18
            //   88450c               | mov                 byte ptr [ebp + 0xc], al

    condition:
        7 of them and filesize < 917504
}