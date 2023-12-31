rule win_avcrypt_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-04-08"
        version = "1"
        description = "Describes win.avcrypt."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.avcrypt"
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
        $sequence_0 = { 75ab e8???????? c3 6a30 b8???????? e8???????? 8bfa }
            // n = 7, score = 100
            //   75ab                 | jne                 0xffffffad
            //   e8????????           |                     
            //   c3                   | ret                 
            //   6a30                 | push                0x30
            //   b8????????           |                     
            //   e8????????           |                     
            //   8bfa                 | mov                 edi, edx

        $sequence_1 = { 50 56 e8???????? 68???????? 8d55a8 }
            // n = 5, score = 100
            //   50                   | push                eax
            //   56                   | push                esi
            //   e8????????           |                     
            //   68????????           |                     
            //   8d55a8               | lea                 edx, dword ptr [ebp - 0x58]

        $sequence_2 = { 8bd8 8d45ec 50 53 ff15???????? 8b35???????? 6a00 }
            // n = 7, score = 100
            //   8bd8                 | mov                 ebx, eax
            //   8d45ec               | lea                 eax, dword ptr [ebp - 0x14]
            //   50                   | push                eax
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   8b35????????         |                     
            //   6a00                 | push                0

        $sequence_3 = { 8bcc 56 e8???????? 897dfc e8???????? 83c460 e8???????? }
            // n = 7, score = 100
            //   8bcc                 | mov                 ecx, esp
            //   56                   | push                esi
            //   e8????????           |                     
            //   897dfc               | mov                 dword ptr [ebp - 4], edi
            //   e8????????           |                     
            //   83c460               | add                 esp, 0x60
            //   e8????????           |                     

        $sequence_4 = { 750a 83c618 8d45ec 3bf0 75d8 68???????? 8d45ec }
            // n = 7, score = 100
            //   750a                 | jne                 0xc
            //   83c618               | add                 esi, 0x18
            //   8d45ec               | lea                 eax, dword ptr [ebp - 0x14]
            //   3bf0                 | cmp                 esi, eax
            //   75d8                 | jne                 0xffffffda
            //   68????????           |                     
            //   8d45ec               | lea                 eax, dword ptr [ebp - 0x14]

        $sequence_5 = { ff11 8d4580 50 ff15???????? 6a09 58 }
            // n = 6, score = 100
            //   ff11                 | call                dword ptr [ecx]
            //   8d4580               | lea                 eax, dword ptr [ebp - 0x80]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   6a09                 | push                9
            //   58                   | pop                 eax

        $sequence_6 = { 6689044d88b64300 41 ebe8 8bce 894de4 }
            // n = 5, score = 100
            //   6689044d88b64300     | mov                 word ptr [ecx*2 + 0x43b688], ax
            //   41                   | inc                 ecx
            //   ebe8                 | jmp                 0xffffffea
            //   8bce                 | mov                 ecx, esi
            //   894de4               | mov                 dword ptr [ebp - 0x1c], ecx

        $sequence_7 = { 895e38 895e3c e8???????? c20800 56 8bf1 }
            // n = 6, score = 100
            //   895e38               | mov                 dword ptr [esi + 0x38], ebx
            //   895e3c               | mov                 dword ptr [esi + 0x3c], ebx
            //   e8????????           |                     
            //   c20800               | ret                 8
            //   56                   | push                esi
            //   8bf1                 | mov                 esi, ecx

        $sequence_8 = { 57 e8???????? 83ec18 c745fc0c000000 8bcc 896584 68???????? }
            // n = 7, score = 100
            //   57                   | push                edi
            //   e8????????           |                     
            //   83ec18               | sub                 esp, 0x18
            //   c745fc0c000000       | mov                 dword ptr [ebp - 4], 0xc
            //   8bcc                 | mov                 ecx, esp
            //   896584               | mov                 dword ptr [ebp - 0x7c], esp
            //   68????????           |                     

        $sequence_9 = { 8d85e0feffff c785e0feffff54494300 50 e8???????? 59 53 57 }
            // n = 7, score = 100
            //   8d85e0feffff         | lea                 eax, dword ptr [ebp - 0x120]
            //   c785e0feffff54494300     | mov    dword ptr [ebp - 0x120], 0x434954
            //   50                   | push                eax
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   53                   | push                ebx
            //   57                   | push                edi

    condition:
        7 of them and filesize < 6160384
}