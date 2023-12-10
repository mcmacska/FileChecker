rule win_atomsilo_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-04-08"
        version = "1"
        description = "Describes win.atomsilo."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.atomsilo"
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
        $sequence_0 = { 4057 4154 4155 4156 4157 4883ec30 4c8bbc2480000000 }
            // n = 7, score = 100
            //   4057                 | mov                 dword ptr [esp + 0x20], 0
            //   4154                 | dec                 eax
            //   4155                 | mov                 eax, dword ptr [ecx]
            //   4156                 | dec                 eax
            //   4157                 | lea                 edx, dword ptr [esp + 0x30]
            //   4883ec30             | call                dword ptr [eax + 0x10]
            //   4c8bbc2480000000     | nop                 

        $sequence_1 = { 4c03d2 4c3bd2 4983d100 49f7642448 4c8d0401 498b4508 4c3bc1 }
            // n = 7, score = 100
            //   4c03d2               | cmp                 ecx, edx
            //   4c3bd2               | dec                 ebp
            //   4983d100             | adc                 edx, edi
            //   49f7642448           | dec                 ecx
            //   4c8d0401             | mul                 dword ptr [esp + 0x38]
            //   498b4508             | dec                 eax
            //   4c3bc1               | add                 eax, ecx

        $sequence_2 = { e8???????? 488d15a12c0700 488d4c2440 e8???????? cc 488d4c2458 e8???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   488d15a12c0700       | dec                 esp
            //   488d4c2440           | lea                 ecx, dword ptr [0x9e72]
            //   e8????????           |                     
            //   cc                   | mov                 edx, 0x10
            //   488d4c2458           | inc                 esp
            //   e8????????           |                     

        $sequence_3 = { 4155 4156 4157 488d6c24d9 4881ec00010000 48c745e7feffffff 48899c2450010000 }
            // n = 7, score = 100
            //   4155                 | dec                 esp
            //   4156                 | mov                 eax, esi
            //   4157                 | dec                 eax
            //   488d6c24d9           | mov                 edx, eax
            //   4881ec00010000       | dec                 eax
            //   48c745e7feffffff     | lea                 ecx, dword ptr [esp + 0x58]
            //   48899c2450010000     | dec                 eax

        $sequence_4 = { 448b4008 4c8bcb 488bd5 498bcf ff5610 4c8d5c2470 498b5b20 }
            // n = 7, score = 100
            //   448b4008             | mov                 ecx, ebx
            //   4c8bcb               | dec                 eax
            //   488bd5               | lea                 edx, dword ptr [0x7719a]
            //   498bcf               | dec                 eax
            //   ff5610               | mov                 ecx, ebx
            //   4c8d5c2470           | dec                 eax
            //   498b5b20             | lea                 edx, dword ptr [0x771a8]

        $sequence_5 = { 488bfa 33c0 f3aa 488bca e8???????? 90 488b9c2450010000 }
            // n = 7, score = 100
            //   488bfa               | dec                 esp
            //   33c0                 | cmp                 eax, ecx
            //   f3aa                 | dec                 eax
            //   488bca               | adc                 edx, edi
            //   e8????????           |                     
            //   90                   | dec                 esp
            //   488b9c2450010000     | add                 ecx, edx

        $sequence_6 = { 488bd0 488d4c2478 e8???????? 90 4c8bc7 488bd0 488d8c2498000000 }
            // n = 7, score = 100
            //   488bd0               | mov                 esi, ecx
            //   488d4c2478           | je                  0x4af
            //   e8????????           |                     
            //   90                   | dec                 eax
            //   4c8bc7               | lea                 edx, dword ptr [0xa083d]
            //   488bd0               | dec                 eax
            //   488d8c2498000000     | mov                 dword ptr [esp + 0x18], esi

        $sequence_7 = { ba01000000 ff10 4c897608 44887e10 488bd6 488bcd e8???????? }
            // n = 7, score = 100
            //   ba01000000           | dec                 ebp
            //   ff10                 | lea                 eax, dword ptr [ecx + eax]
            //   4c897608             | dec                 ebp
            //   44887e10             | cmp                 ecx, ebx
            //   488bd6               | dec                 ecx
            //   488bcd               | adc                 edx, edi
            //   e8????????           |                     

        $sequence_8 = { 4c8bc3 498b5640 e8???????? 49c74638ffffffff 807c246000 740a 488b7588 }
            // n = 7, score = 100
            //   4c8bc3               | dec                 esp
            //   498b5640             | add                 ecx, edx
            //   e8????????           |                     
            //   49c74638ffffffff     | dec                 esp
            //   807c246000           | cmp                 ecx, edx
            //   740a                 | dec                 ecx
            //   488b7588             | adc                 edx, 0

        $sequence_9 = { c1e808 8944243c 0fb644243c 488d0d9b790900 488d04c1 b901000000 }
            // n = 6, score = 100
            //   c1e808               | mov                 eax, esi
            //   8944243c             | dec                 eax
            //   0fb644243c           | mov                 edx, esi
            //   488d0d9b790900       | dec                 eax
            //   488d04c1             | mov                 ecx, edi
            //   b901000000           | dec                 eax

    condition:
        7 of them and filesize < 1785856
}