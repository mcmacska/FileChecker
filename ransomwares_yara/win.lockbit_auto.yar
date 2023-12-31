rule win_lockbit_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-04-08"
        version = "1"
        description = "Describes win.lockbit."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.lockbit"
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
        $sequence_0 = { 668945fa 0fb705???????? 6633c7 668945fc 33c0 668945fe 33d2 }
            // n = 7, score = 100
            //   668945fa             | mov                 word ptr [ebp - 6], ax
            //   0fb705????????       |                     
            //   6633c7               | xor                 ax, di
            //   668945fc             | mov                 word ptr [ebp - 4], ax
            //   33c0                 | xor                 eax, eax
            //   668945fe             | mov                 word ptr [ebp - 2], ax
            //   33d2                 | xor                 edx, edx

        $sequence_1 = { 83c408 85f6 0f8579000000 57 e8???????? 57 e8???????? }
            // n = 7, score = 100
            //   83c408               | add                 esp, 8
            //   85f6                 | test                esi, esi
            //   0f8579000000         | jne                 0x7f
            //   57                   | push                edi
            //   e8????????           |                     
            //   57                   | push                edi
            //   e8????????           |                     

        $sequence_2 = { 8d4c243d 8844243f e8???????? 6a69 8d4c243d 88442440 }
            // n = 6, score = 100
            //   8d4c243d             | lea                 ecx, dword ptr [esp + 0x3d]
            //   8844243f             | mov                 byte ptr [esp + 0x3f], al
            //   e8????????           |                     
            //   6a69                 | push                0x69
            //   8d4c243d             | lea                 ecx, dword ptr [esp + 0x3d]
            //   88442440             | mov                 byte ptr [esp + 0x40], al

        $sequence_3 = { 898ea0000000 89bea4000000 33fa 89bea8000000 33fb 89beac000000 5f }
            // n = 7, score = 100
            //   898ea0000000         | mov                 dword ptr [esi + 0xa0], ecx
            //   89bea4000000         | mov                 dword ptr [esi + 0xa4], edi
            //   33fa                 | xor                 edi, edx
            //   89bea8000000         | mov                 dword ptr [esi + 0xa8], edi
            //   33fb                 | xor                 edi, ebx
            //   89beac000000         | mov                 dword ptr [esi + 0xac], edi
            //   5f                   | pop                 edi

        $sequence_4 = { 32ce 88942465070000 888c24ed070000 b072 88442412 b174 32842410070000 }
            // n = 7, score = 100
            //   32ce                 | xor                 cl, dh
            //   88942465070000       | mov                 byte ptr [esp + 0x765], dl
            //   888c24ed070000       | mov                 byte ptr [esp + 0x7ed], cl
            //   b072                 | mov                 al, 0x72
            //   88442412             | mov                 byte ptr [esp + 0x12], al
            //   b174                 | mov                 cl, 0x74
            //   32842410070000       | xor                 al, byte ptr [esp + 0x710]

        $sequence_5 = { 88ac24df060000 32f1 c684245708000000 32c1 889424dd060000 88a424de060000 }
            // n = 6, score = 100
            //   88ac24df060000       | mov                 byte ptr [esp + 0x6df], ch
            //   32f1                 | xor                 dh, cl
            //   c684245708000000     | mov                 byte ptr [esp + 0x857], 0
            //   32c1                 | xor                 al, cl
            //   889424dd060000       | mov                 byte ptr [esp + 0x6dd], dl
            //   88a424de060000       | mov                 byte ptr [esp + 0x6de], ah

        $sequence_6 = { 88ac2495060000 32f0 c684249706000000 88b42496060000 b03d 8af0 c684249f06000000 }
            // n = 7, score = 100
            //   88ac2495060000       | mov                 byte ptr [esp + 0x695], ch
            //   32f0                 | xor                 dh, al
            //   c684249706000000     | mov                 byte ptr [esp + 0x697], 0
            //   88b42496060000       | mov                 byte ptr [esp + 0x696], dh
            //   b03d                 | mov                 al, 0x3d
            //   8af0                 | mov                 dh, al
            //   c684249f06000000     | mov                 byte ptr [esp + 0x69f], 0

        $sequence_7 = { c7459874002000 c7459c42006100 c745a073006500 c745a420004300 c745a872007900 c745ac70007400 c745b06f006700 }
            // n = 7, score = 100
            //   c7459874002000       | mov                 dword ptr [ebp - 0x68], 0x200074
            //   c7459c42006100       | mov                 dword ptr [ebp - 0x64], 0x610042
            //   c745a073006500       | mov                 dword ptr [ebp - 0x60], 0x650073
            //   c745a420004300       | mov                 dword ptr [ebp - 0x5c], 0x430020
            //   c745a872007900       | mov                 dword ptr [ebp - 0x58], 0x790072
            //   c745ac70007400       | mov                 dword ptr [ebp - 0x54], 0x740070
            //   c745b06f006700       | mov                 dword ptr [ebp - 0x50], 0x67006f

        $sequence_8 = { 83f90e 72f3 8d45e9 c645f700 50 ff15???????? 6a01 }
            // n = 7, score = 100
            //   83f90e               | cmp                 ecx, 0xe
            //   72f3                 | jb                  0xfffffff5
            //   8d45e9               | lea                 eax, dword ptr [ebp - 0x17]
            //   c645f700             | mov                 byte ptr [ebp - 9], 0
            //   50                   | push                eax
            //   ff15????????         |                     
            //   6a01                 | push                1

        $sequence_9 = { 83c408 85c0 7408 0580bfffff 5e 5d c3 }
            // n = 7, score = 100
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax
            //   7408                 | je                  0xa
            //   0580bfffff           | add                 eax, 0xffffbf80
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   c3                   | ret                 

    condition:
        7 of them and filesize < 337568
}