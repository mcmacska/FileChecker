rule win_badnews_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-04-08"
        version = "1"
        description = "Describes win.badnews."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.badnews"
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
        $sequence_0 = { ff15???????? 50 e8???????? 83c404 68???????? 6804010000 ff15???????? }
            // n = 7, score = 1000
            //   ff15????????         |                     
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   68????????           |                     
            //   6804010000           | push                0x104
            //   ff15????????         |                     

        $sequence_1 = { c705????????33322e64 66c705????????6c6c c605????????00 ff15???????? }
            // n = 4, score = 900
            //   c705????????33322e64     |     
            //   66c705????????6c6c     |     
            //   c605????????00       |                     
            //   ff15????????         |                     

        $sequence_2 = { 8945fc 53 56 57 8d8534ffffff }
            // n = 5, score = 900
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   8d8534ffffff         | lea                 eax, dword ptr [ebp - 0xcc]

        $sequence_3 = { 55 8bec 8b450c 3d01020000 }
            // n = 4, score = 900
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   3d01020000           | cmp                 eax, 0x201

        $sequence_4 = { c78534ffffff47657457 c78538ffffff696e646f c7853cffffff77546578 66c78540ffffff7457 }
            // n = 4, score = 900
            //   c78534ffffff47657457     | mov    dword ptr [ebp - 0xcc], 0x57746547
            //   c78538ffffff696e646f     | mov    dword ptr [ebp - 0xc8], 0x6f646e69
            //   c7853cffffff77546578     | mov    dword ptr [ebp - 0xc4], 0x78655477
            //   66c78540ffffff7457     | mov    word ptr [ebp - 0xc0], 0x5774

        $sequence_5 = { eb02 33c9 c0e004 02c1 3423 c0c003 }
            // n = 6, score = 900
            //   eb02                 | jmp                 4
            //   33c9                 | xor                 ecx, ecx
            //   c0e004               | shl                 al, 4
            //   02c1                 | add                 al, cl
            //   3423                 | xor                 al, 0x23
            //   c0c003               | rol                 al, 3

        $sequence_6 = { 6a00 d1f9 68???????? 03c9 }
            // n = 4, score = 800
            //   6a00                 | push                0
            //   d1f9                 | sar                 ecx, 1
            //   68????????           |                     
            //   03c9                 | add                 ecx, ecx

        $sequence_7 = { 68???????? 6a1a 68???????? 57 }
            // n = 4, score = 800
            //   68????????           |                     
            //   6a1a                 | push                0x1a
            //   68????????           |                     
            //   57                   | push                edi

        $sequence_8 = { ffd3 85c0 7403 83c608 8a06 }
            // n = 5, score = 700
            //   ffd3                 | call                ebx
            //   85c0                 | test                eax, eax
            //   7403                 | je                  5
            //   83c608               | add                 esi, 8
            //   8a06                 | mov                 al, byte ptr [esi]

        $sequence_9 = { 57 6a00 6880000000 6a04 6a00 6a01 6a04 }
            // n = 7, score = 700
            //   57                   | push                edi
            //   6a00                 | push                0
            //   6880000000           | push                0x80
            //   6a04                 | push                4
            //   6a00                 | push                0
            //   6a01                 | push                1
            //   6a04                 | push                4

        $sequence_10 = { ff15???????? 85c0 7405 83c004 eb02 }
            // n = 5, score = 700
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7405                 | je                  7
            //   83c004               | add                 eax, 4
            //   eb02                 | jmp                 4

        $sequence_11 = { 8bf0 56 ff15???????? 50 6a40 }
            // n = 5, score = 700
            //   8bf0                 | mov                 esi, eax
            //   56                   | push                esi
            //   ff15????????         |                     
            //   50                   | push                eax
            //   6a40                 | push                0x40

        $sequence_12 = { 68???????? ff15???????? b8???????? 83c424 8d5002 668b08 83c002 }
            // n = 7, score = 500
            //   68????????           |                     
            //   ff15????????         |                     
            //   b8????????           |                     
            //   83c424               | add                 esp, 0x24
            //   8d5002               | lea                 edx, dword ptr [eax + 2]
            //   668b08               | mov                 cx, word ptr [eax]
            //   83c002               | add                 eax, 2

        $sequence_13 = { 8b8d24e5ffff 8b0485d0a70110 f644010480 0f8432030000 e8???????? 33c9 8b406c }
            // n = 7, score = 100
            //   8b8d24e5ffff         | mov                 ecx, dword ptr [ebp - 0x1adc]
            //   8b0485d0a70110       | mov                 eax, dword ptr [eax*4 + 0x1001a7d0]
            //   f644010480           | test                byte ptr [ecx + eax + 4], 0x80
            //   0f8432030000         | je                  0x338
            //   e8????????           |                     
            //   33c9                 | xor                 ecx, ecx
            //   8b406c               | mov                 eax, dword ptr [eax + 0x6c]

        $sequence_14 = { 50 53 8d85f4ebffff 50 8b8528e5ffff 8b0485d0a70110 }
            // n = 6, score = 100
            //   50                   | push                eax
            //   53                   | push                ebx
            //   8d85f4ebffff         | lea                 eax, dword ptr [ebp - 0x140c]
            //   50                   | push                eax
            //   8b8528e5ffff         | mov                 eax, dword ptr [ebp - 0x1ad8]
            //   8b0485d0a70110       | mov                 eax, dword ptr [eax*4 + 0x1001a7d0]

        $sequence_15 = { c0e107 8b1485d0a70110 8a443224 247f 0ac8 884c3224 }
            // n = 6, score = 100
            //   c0e107               | shl                 cl, 7
            //   8b1485d0a70110       | mov                 edx, dword ptr [eax*4 + 0x1001a7d0]
            //   8a443224             | mov                 al, byte ptr [edx + esi + 0x24]
            //   247f                 | and                 al, 0x7f
            //   0ac8                 | or                  cl, al
            //   884c3224             | mov                 byte ptr [edx + esi + 0x24], cl

        $sequence_16 = { ff15???????? 8986309f0110 83c604 83fe28 72e6 }
            // n = 5, score = 100
            //   ff15????????         |                     
            //   8986309f0110         | mov                 dword ptr [esi + 0x10019f30], eax
            //   83c604               | add                 esi, 4
            //   83fe28               | cmp                 esi, 0x28
            //   72e6                 | jb                  0xffffffe8

        $sequence_17 = { 8d4901 84c0 75f6 a1???????? 8d958cfeffff }
            // n = 5, score = 100
            //   8d4901               | lea                 ecx, dword ptr [ecx + 1]
            //   84c0                 | test                al, al
            //   75f6                 | jne                 0xfffffff8
            //   a1????????           |                     
            //   8d958cfeffff         | lea                 edx, dword ptr [ebp - 0x174]

        $sequence_18 = { 8bf7 2b349dd0a70110 c1fe06 8bc3 c1e005 }
            // n = 5, score = 100
            //   8bf7                 | mov                 esi, edi
            //   2b349dd0a70110       | sub                 esi, dword ptr [ebx*4 + 0x1001a7d0]
            //   c1fe06               | sar                 esi, 6
            //   8bc3                 | mov                 eax, ebx
            //   c1e005               | shl                 eax, 5

        $sequence_19 = { 56 e8???????? 83c40c 8934fd009e0110 eb07 56 }
            // n = 6, score = 100
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8934fd009e0110       | mov                 dword ptr [edi*8 + 0x10019e00], esi
            //   eb07                 | jmp                 9
            //   56                   | push                esi

        $sequence_20 = { 8945e0 8d8080980110 8945e4 803800 8bc8 7435 }
            // n = 6, score = 100
            //   8945e0               | mov                 dword ptr [ebp - 0x20], eax
            //   8d8080980110         | lea                 eax, dword ptr [eax + 0x10019880]
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   803800               | cmp                 byte ptr [eax], 0
            //   8bc8                 | mov                 ecx, eax
            //   7435                 | je                  0x37

    condition:
        7 of them and filesize < 612352
}