; pdata range 0x18274810e .. 0x1827488c7 (exclusive)
; PE unwind range; not necessarily an entire source-level function.
000000018274810E  55                             push     rbp
000000018274810F  41 57                          push     r15
0000000182748111  41 56                          push     r14
0000000182748113  41 55                          push     r13
0000000182748115  41 54                          push     r12
0000000182748117  56                             push     rsi
0000000182748118  57                             push     rdi
0000000182748119  53                             push     rbx
000000018274811A  48 81 ec d8 02 00 00           sub      rsp, 0x2d8
0000000182748121  48 8d ac 24 80 00 00 00        lea      rbp, [rsp + 0x80]
0000000182748129  48 c7 85 50 02 00 00 fe ff ff ff mov      qword ptr [rbp + 0x250], 0xfffffffffffffffe
0000000182748134  44 88 8d 4f 02 00 00           mov      byte ptr [rbp + 0x24f], r9b
000000018274813B  48 89 95 18 02 00 00           mov      qword ptr [rbp + 0x218], rdx
0000000182748142  48 89 8d 20 02 00 00           mov      qword ptr [rbp + 0x220], rcx
0000000182748149  4c 89 85 30 02 00 00           mov      qword ptr [rbp + 0x230], r8
0000000182748150  49 8b 08                       mov      rcx, qword ptr [r8]
0000000182748153  48 85 c9                       test     rcx, rcx
0000000182748156  0f 84 96 00 00 00              je       0x1827481f2
000000018274815C  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
0000000182748160  48 83 c1 08                    add      rcx, 8
0000000182748164  6a 01                          push     1
0000000182748166  5a                             pop      rdx
0000000182748167  ff 90 28 01 00 00              call     qword ptr [rax + 0x128]
000000018274816D  84 c0                          test     al, al
000000018274816F  0f 84 cc 00 00 00              je       0x182748241
0000000182748175  48 8b 85 30 02 00 00           mov      rax, qword ptr [rbp + 0x230]
000000018274817C  48 8b 08                       mov      rcx, qword ptr [rax]
000000018274817F  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
0000000182748183  48 83 c1 08                    add      rcx, 8
0000000182748187  48 8d 95 a0 01 00 00           lea      rdx, [rbp + 0x1a0]
000000018274818E  6a 01                          push     1
0000000182748190  41 58                          pop      r8
0000000182748192  ff 90 f0 00 00 00              call     qword ptr [rax + 0xf0]
0000000182748198  48 8b 85 a8 01 00 00           mov      rax, qword ptr [rbp + 0x1a8]
000000018274819F  48 3b 85 a0 01 00 00           cmp      rax, qword ptr [rbp + 0x1a0]
00000001827481A6  90                             nop      
00000001827481A7  e9 e1 00 00 00                 jmp      0x18274828d
00000001827481AC  48 8b 85 30 02 00 00           mov      rax, qword ptr [rbp + 0x230]
00000001827481B3  48 8b 08                       mov      rcx, qword ptr [rax]
00000001827481B6  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
00000001827481BA  48 83 c1 08                    add      rcx, 8
00000001827481BE  6a 06                          push     6
00000001827481C0  5a                             pop      rdx
00000001827481C1  ff 90 28 01 00 00              call     qword ptr [rax + 0x128]
00000001827481C7  84 c0                          test     al, al
00000001827481C9  0f 84 41 01 00 00              je       0x182748310
00000001827481CF  48 8b 85 30 02 00 00           mov      rax, qword ptr [rbp + 0x230]
00000001827481D6  48 8b 08                       mov      rcx, qword ptr [rax]
00000001827481D9  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
00000001827481DD  48 83 c1 08                    add      rcx, 8
00000001827481E1  6a 06                          push     6
00000001827481E3  5a                             pop      rdx
00000001827481E4  ff 50 10                       call     qword ptr [rax + 0x10]
00000001827481E7  89 85 3c 02 00 00              mov      dword ptr [rbp + 0x23c], eax
00000001827481ED  e9 28 01 00 00                 jmp      0x18274831a
00000001827481F2  48 8d 35 ce ca 2d 02           lea      rsi, [rip + 0x22dcace] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
00000001827481F9  6a 5c                          push     0x5c
00000001827481FB  5a                             pop      rdx
00000001827481FC  48 89 f1                       mov      rcx, rsi
00000001827481FF  e8 1c 4b 8b 01                 call     0x183ffcd20
0000000182748204  4c 8d 40 01                    lea      r8, [rax + 1]
0000000182748208  48 85 c0                       test     rax, rax
000000018274820B  4c 0f 44 c6                    cmove    r8, rsi
000000018274820F  48 8d 05 9c 87 12 02           lea      rax, [rip + 0x212879c] ; on recall c2c sys msg! no content
0000000182748216  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018274821B  48 8d 05 4d 24 21 02           lea      rax, [rip + 0x221244d] ; HandleRecallSysMsg
0000000182748222  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
0000000182748227  48 8d 0d 42 ca cf 01           lea      rcx, [rip + 0x1cfca42]
000000018274822E  6a 04                          push     4
0000000182748230  5a                             pop      rdx
0000000182748231  41 b9 c6 00 00 00              mov      r9d, 0xc6
0000000182748237  e8 ee b2 8b fd                 call     0x18000352a
000000018274823C  e9 a2 00 00 00                 jmp      0x1827482e3
0000000182748241  48 8d 35 7f ca 2d 02           lea      rsi, [rip + 0x22dca7f] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
0000000182748248  6a 5c                          push     0x5c
000000018274824A  5a                             pop      rdx
000000018274824B  48 89 f1                       mov      rcx, rsi
000000018274824E  e8 cd 4a 8b 01                 call     0x183ffcd20
0000000182748253  4c 8d 40 01                    lea      r8, [rax + 1]
0000000182748257  48 85 c0                       test     rax, rax
000000018274825A  4c 0f 44 c6                    cmove    r8, rsi
000000018274825E  48 8d 05 59 4c 18 02           lea      rax, [rip + 0x2184c59] ; on recall c2c sys msg! no msg infos
0000000182748265  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018274826A  48 8d 05 fe 23 21 02           lea      rax, [rip + 0x22123fe] ; HandleRecallSysMsg
0000000182748271  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
0000000182748276  48 8d 0d f3 c9 cf 01           lea      rcx, [rip + 0x1cfc9f3]
000000018274827D  6a 04                          push     4
000000018274827F  5a                             pop      rdx
0000000182748280  41 b9 ca 00 00 00              mov      r9d, 0xca
0000000182748286  e8 9f b2 8b fd                 call     0x18000352a
000000018274828B  eb 56                          jmp      0x1827482e3
000000018274828D  48 8d 35 33 ca 2d 02           lea      rsi, [rip + 0x22dca33] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
0000000182748294  6a 5c                          push     0x5c
0000000182748296  5a                             pop      rdx
0000000182748297  48 89 f1                       mov      rcx, rsi
000000018274829A  e8 81 4a 8b 01                 call     0x183ffcd20
000000018274829F  4c 8d 40 01                    lea      r8, [rax + 1]
00000001827482A3  48 85 c0                       test     rax, rax
00000001827482A6  4c 0f 44 c6                    cmove    r8, rsi
00000001827482AA  48 8d 05 f4 b8 1d 02           lea      rax, [rip + 0x21db8f4] ; on recall c2c sys msg! no any msg info
00000001827482B1  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
00000001827482B6  48 8d 05 b2 23 21 02           lea      rax, [rip + 0x22123b2] ; HandleRecallSysMsg
00000001827482BD  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
00000001827482C2  48 8d 0d a7 c9 cf 01           lea      rcx, [rip + 0x1cfc9a7]
00000001827482C9  6a 04                          push     4
00000001827482CB  5a                             pop      rdx
00000001827482CC  41 b9 cf 00 00 00              mov      r9d, 0xcf
00000001827482D2  e8 53 b2 8b fd                 call     0x18000352a
00000001827482D7  48 8d 8d a0 01 00 00           lea      rcx, [rbp + 0x1a0]
00000001827482DE  e8 5d c5 8c fd                 call     0x180014840
00000001827482E3  48 8b 8d 18 02 00 00           mov      rcx, qword ptr [rbp + 0x218]
00000001827482EA  e8 c3 9a 8b fd                 call     0x180001db2
00000001827482EF  48 8b 8d 30 02 00 00           mov      rcx, qword ptr [rbp + 0x230]
00000001827482F6  e8 b7 9a 8b fd                 call     0x180001db2
00000001827482FB  90                             nop      
00000001827482FC  48 81 c4 d8 02 00 00           add      rsp, 0x2d8
0000000182748303  5b                             pop      rbx
0000000182748304  5f                             pop      rdi
0000000182748305  5e                             pop      rsi
0000000182748306  41 5c                          pop      r12
0000000182748308  41 5d                          pop      r13
000000018274830A  41 5e                          pop      r14
000000018274830C  41 5f                          pop      r15
000000018274830E  5d                             pop      rbp
000000018274830F  c3                             ret      
0000000182748310  c7 85 3c 02 00 00 00 00 00 00  mov      dword ptr [rbp + 0x23c], 0
000000018274831A  48 8b b5 a0 01 00 00           mov      rsi, qword ptr [rbp + 0x1a0]
0000000182748321  48 8b 85 a8 01 00 00           mov      rax, qword ptr [rbp + 0x1a8]
0000000182748328  48 89 85 90 01 00 00           mov      qword ptr [rbp + 0x190], rax
000000018274832F  48 8b 85 20 02 00 00           mov      rax, qword ptr [rbp + 0x220]
0000000182748336  48 8d 48 08                    lea      rcx, [rax + 8]
000000018274833A  48 89 8d 10 02 00 00           mov      qword ptr [rbp + 0x210], rcx
0000000182748341  48 83 c0 09                    add      rax, 9
0000000182748345  48 89 85 98 01 00 00           mov      qword ptr [rbp + 0x198], rax
000000018274834C  48 8d bd e0 01 00 00           lea      rdi, [rbp + 0x1e0]
0000000182748353  48 3b b5 90 01 00 00           cmp      rsi, qword ptr [rbp + 0x190]
000000018274835A  0f 84 77 ff ff ff              je       0x1827482d7
0000000182748360  48 8d 8d a0 00 00 00           lea      rcx, [rbp + 0xa0]
0000000182748367  e8 30 f3 de fe                 call     0x18153769c
000000018274836C  48 8d 8d 78 01 00 00           lea      rcx, [rbp + 0x178]
0000000182748373  e8 08 df 8b fd                 call     0x180006280
0000000182748378  c7 85 e0 01 00 00 8b 13 00 00  mov      dword ptr [rbp + 0x1e0], 0x138b
0000000182748382  48 8b 85 10 02 00 00           mov      rax, qword ptr [rbp + 0x210]
0000000182748389  0f b6 00                       movzx    eax, byte ptr [rax]
000000018274838C  a8 01                          test     al, 1
000000018274838E  75 0b                          jne      0x18274839b
0000000182748390  d1 e8                          shr      eax, 1
0000000182748392  48 8b 8d 98 01 00 00           mov      rcx, qword ptr [rbp + 0x198]
0000000182748399  eb 0f                          jmp      0x1827483aa
000000018274839B  48 8b 8d 20 02 00 00           mov      rcx, qword ptr [rbp + 0x220]
00000001827483A2  48 8b 41 10                    mov      rax, qword ptr [rcx + 0x10]
00000001827483A6  48 8b 49 18                    mov      rcx, qword ptr [rcx + 0x18]
00000001827483AA  48 89 8d 68 01 00 00           mov      qword ptr [rbp + 0x168], rcx
00000001827483B1  48 89 85 70 01 00 00           mov      qword ptr [rbp + 0x170], rax
00000001827483B8  48 8d 8d 68 01 00 00           lea      rcx, [rbp + 0x168]
00000001827483BF  48 8d 15 f4 60 94 fd           lea      rdx, [rip - 0x26b9f0c]
00000001827483C6  49 89 f8                       mov      r8, rdi
00000001827483C9  4c 8d 8d 78 01 00 00           lea      r9, [rbp + 0x178]
00000001827483D0  e8 99 ca aa fd                 call     0x1801f4e6e
00000001827483D5  48 8b 0e                       mov      rcx, qword ptr [rsi]
00000001827483D8  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
00000001827483DC  48 83 c1 08                    add      rcx, 8
00000001827483E0  48 89 fa                       mov      rdx, rdi
00000001827483E3  6a 01                          push     1
00000001827483E5  41 58                          pop      r8
00000001827483E7  ff 50 68                       call     qword ptr [rax + 0x68]
00000001827483EA  48 8b 0e                       mov      rcx, qword ptr [rsi]
00000001827483ED  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
00000001827483F1  48 83 c1 08                    add      rcx, 8
00000001827483F5  48 8d 95 b8 01 00 00           lea      rdx, [rbp + 0x1b8]
00000001827483FC  6a 02                          push     2
00000001827483FE  41 58                          pop      r8
0000000182748400  ff 50 68                       call     qword ptr [rax + 0x68]
0000000182748403  48 8d 8d f8 01 00 00           lea      rcx, [rbp + 0x1f8]
000000018274840A  48 8d 15 23 1a 38 02           lea      rdx, [rip + 0x2381a23]
0000000182748411  e8 08 af 8b fd                 call     0x18000331e
0000000182748416  48 89 b5 40 02 00 00           mov      qword ptr [rbp + 0x240], rsi
000000018274841D  48 8d 8d 78 01 00 00           lea      rcx, [rbp + 0x178]
0000000182748424  48 89 fa                       mov      rdx, rdi
0000000182748427  e8 37 57 8f fd                 call     0x18003db63
000000018274842C  84 c0                          test     al, al
000000018274842E  74 15                          je       0x182748445
0000000182748430  48 8d 8d f8 01 00 00           lea      rcx, [rbp + 0x1f8]
0000000182748437  48 8d 95 b8 01 00 00           lea      rdx, [rbp + 0x1b8]
000000018274843E  e8 9d 63 03 fe                 call     0x18077e7e0
0000000182748443  eb 0f                          jmp      0x182748454
0000000182748445  48 8d 8d f8 01 00 00           lea      rcx, [rbp + 0x1f8]
000000018274844C  48 89 fa                       mov      rdx, rdi
000000018274844F  e8 8c 63 03 fe                 call     0x18077e7e0
0000000182748454  0f b6 85 f8 01 00 00           movzx    eax, byte ptr [rbp + 0x1f8]
000000018274845B  a8 01                          test     al, 1
000000018274845D  74 09                          je       0x182748468
000000018274845F  48 8b 85 00 02 00 00           mov      rax, qword ptr [rbp + 0x200]
0000000182748466  eb 02                          jmp      0x18274846a
0000000182748468  d1 e8                          shr      eax, 1
000000018274846A  48 85 c0                       test     rax, rax
000000018274846D  0f 84 f5 01 00 00              je       0x182748668
0000000182748473  48 8d 8d a0 00 00 00           lea      rcx, [rbp + 0xa0]
000000018274847A  48 8d 95 f8 01 00 00           lea      rdx, [rbp + 0x1f8]
0000000182748481  e8 5a 63 03 fe                 call     0x18077e7e0
0000000182748486  c6 85 b8 00 00 00 01           mov      byte ptr [rbp + 0xb8], 1
000000018274848D  48 8d 8d e8 00 00 00           lea      rcx, [rbp + 0xe8]
0000000182748494  48 8d 95 e0 01 00 00           lea      rdx, [rbp + 0x1e0]
000000018274849B  e8 40 63 03 fe                 call     0x18077e7e0
00000001827484A0  48 8d 8d 00 01 00 00           lea      rcx, [rbp + 0x100]
00000001827484A7  48 8d 95 b8 01 00 00           lea      rdx, [rbp + 0x1b8]
00000001827484AE  e8 2d 63 03 fe                 call     0x18077e7e0
00000001827484B3  48 8d 8d 20 01 00 00           lea      rcx, [rbp + 0x120]
00000001827484BA  48 8d 95 e0 01 00 00           lea      rdx, [rbp + 0x1e0]
00000001827484C1  e8 1a 63 03 fe                 call     0x18077e7e0
00000001827484C6  83 a5 18 01 00 00 00           and      dword ptr [rbp + 0x118], 0
00000001827484CD  48 8b 85 40 02 00 00           mov      rax, qword ptr [rbp + 0x240]
00000001827484D4  48 8b 08                       mov      rcx, qword ptr [rax]
00000001827484D7  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
00000001827484DB  48 83 c1 08                    add      rcx, 8
00000001827484DF  6a 06                          push     6
00000001827484E1  5a                             pop      rdx
00000001827484E2  ff 50 50                       call     qword ptr [rax + 0x50]
00000001827484E5  48 89 85 d0 00 00 00           mov      qword ptr [rbp + 0xd0], rax
00000001827484EC  48 8b 85 40 02 00 00           mov      rax, qword ptr [rbp + 0x240]
00000001827484F3  48 8b 08                       mov      rcx, qword ptr [rax]
00000001827484F6  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
00000001827484FA  48 83 c1 08                    add      rcx, 8
00000001827484FE  6a 05                          push     5
0000000182748500  5a                             pop      rdx
0000000182748501  ff 50 50                       call     qword ptr [rax + 0x50]
0000000182748504  48 89 85 e0 00 00 00           mov      qword ptr [rbp + 0xe0], rax
000000018274850B  48 8b 85 40 02 00 00           mov      rax, qword ptr [rbp + 0x240]
0000000182748512  48 8b 08                       mov      rcx, qword ptr [rax]
0000000182748515  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
0000000182748519  48 83 c1 08                    add      rcx, 8
000000018274851D  6a 04                          push     4
000000018274851F  5a                             pop      rdx
0000000182748520  ff 50 50                       call     qword ptr [rax + 0x50]
0000000182748523  48 89 85 d8 00 00 00           mov      qword ptr [rbp + 0xd8], rax
000000018274852A  48 8b 85 40 02 00 00           mov      rax, qword ptr [rbp + 0x240]
0000000182748531  48 8b 08                       mov      rcx, qword ptr [rax]
0000000182748534  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
0000000182748538  48 83 c1 08                    add      rcx, 8
000000018274853C  6a 14                          push     0x14
000000018274853E  5a                             pop      rdx
000000018274853F  ff 50 50                       call     qword ptr [rax + 0x50]
0000000182748542  48 89 85 c0 00 00 00           mov      qword ptr [rbp + 0xc0], rax
0000000182748549  48 8b 85 40 02 00 00           mov      rax, qword ptr [rbp + 0x240]
0000000182748550  48 8b 08                       mov      rcx, qword ptr [rax]
0000000182748553  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
0000000182748557  48 83 c1 08                    add      rcx, 8
000000018274855B  6a 03                          push     3
000000018274855D  5a                             pop      rdx
000000018274855E  ff 50 30                       call     qword ptr [rax + 0x30]
0000000182748561  89 c0                          mov      eax, eax
0000000182748563  48 89 85 c8 00 00 00           mov      qword ptr [rbp + 0xc8], rax
000000018274856A  48 8b 85 40 02 00 00           mov      rax, qword ptr [rbp + 0x240]
0000000182748571  48 8b 08                       mov      rcx, qword ptr [rax]
0000000182748574  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
0000000182748578  48 83 c1 08                    add      rcx, 8
000000018274857C  6a 0d                          push     0xd
000000018274857E  5a                             pop      rdx
000000018274857F  ff 90 28 01 00 00              call     qword ptr [rax + 0x128]
0000000182748585  84 c0                          test     al, al
0000000182748587  48 8b 85 40 02 00 00           mov      rax, qword ptr [rbp + 0x240]
000000018274858E  74 79                          je       0x182748609
0000000182748590  48 8b 08                       mov      rcx, qword ptr [rax]
0000000182748593  48 8b 01                       mov      rax, qword ptr [rcx]
0000000182748596  48 8d 95 d0 01 00 00           lea      rdx, [rbp + 0x1d0]
000000018274859D  6a 0d                          push     0xd
000000018274859F  41 58                          pop      r8
00000001827485A1  ff 90 18 01 00 00              call     qword ptr [rax + 0x118]
00000001827485A7  48 8b 8d d0 01 00 00           mov      rcx, qword ptr [rbp + 0x1d0]
00000001827485AE  48 85 c9                       test     rcx, rcx
00000001827485B1  74 4a                          je       0x1827485fd
00000001827485B3  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
00000001827485B7  48 83 c1 08                    add      rcx, 8
00000001827485BB  6a 02                          push     2
00000001827485BD  5a                             pop      rdx
00000001827485BE  ff 90 28 01 00 00              call     qword ptr [rax + 0x128]
00000001827485C4  84 c0                          test     al, al
00000001827485C6  74 35                          je       0x1827485fd
00000001827485C8  48 8b 8d d0 01 00 00           mov      rcx, qword ptr [rbp + 0x1d0]
00000001827485CF  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
00000001827485D3  48 83 c1 08                    add      rcx, 8
00000001827485D7  48 8d 55 28                    lea      rdx, [rbp + 0x28]
00000001827485DB  6a 02                          push     2
00000001827485DD  41 58                          pop      r8
00000001827485DF  ff 50 68                       call     qword ptr [rax + 0x68]
00000001827485E2  48 8d 8d 48 01 00 00           lea      rcx, [rbp + 0x148]
00000001827485E9  48 8d 75 28                    lea      rsi, [rbp + 0x28]
00000001827485ED  48 89 f2                       mov      rdx, rsi
00000001827485F0  e8 fd d9 8b fd                 call     0x180005ff2
00000001827485F5  48 89 f1                       mov      rcx, rsi
00000001827485F8  e8 03 4c 03 fe                 call     0x18077d200
00000001827485FD  48 8d 8d d0 01 00 00           lea      rcx, [rbp + 0x1d0]
0000000182748604  e8 a9 97 8b fd                 call     0x180001db2
0000000182748609  80 bd 4f 02 00 00 00           cmp      byte ptr [rbp + 0x24f], 0
0000000182748610  75 07                          jne      0x182748619
0000000182748612  c6 85 60 01 00 00 01           mov      byte ptr [rbp + 0x160], 1
0000000182748619  80 bd 3c 02 00 00 00           cmp      byte ptr [rbp + 0x23c], 0
0000000182748620  74 07                          je       0x182748629
0000000182748622  c6 85 61 01 00 00 01           mov      byte ptr [rbp + 0x161], 1
0000000182748629  8a 85 c0 02 00 00              mov      al, byte ptr [rbp + 0x2c0]
000000018274862F  88 85 62 01 00 00              mov      byte ptr [rbp + 0x162], al
0000000182748635  84 c0                          test     al, al
0000000182748637  0f 84 1c 01 00 00              je       0x182748759
000000018274863D  48 8b 8d 10 02 00 00           mov      rcx, qword ptr [rbp + 0x210]
0000000182748644  48 8b 95 c8 02 00 00           mov      rdx, qword ptr [rbp + 0x2c8]
000000018274864B  4c 8d 85 a0 00 00 00           lea      r8, [rbp + 0xa0]
0000000182748652  e8 33 06 00 00                 call     0x182748c8a
0000000182748657  8a 85 62 01 00 00              mov      al, byte ptr [rbp + 0x162]
000000018274865D  89 85 2c 02 00 00              mov      dword ptr [rbp + 0x22c], eax
0000000182748663  e9 fb 00 00 00                 jmp      0x182748763
0000000182748668  48 8d 35 58 c6 2d 02           lea      rsi, [rip + 0x22dc658] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
000000018274866F  48 89 f1                       mov      rcx, rsi
0000000182748672  6a 5c                          push     0x5c
0000000182748674  5a                             pop      rdx
0000000182748675  e8 a6 46 8b 01                 call     0x183ffcd20
000000018274867A  4c 8d 78 01                    lea      r15, [rax + 1]
000000018274867E  48 85 c0                       test     rax, rax
0000000182748681  4c 0f 44 fe                    cmove    r15, rsi
0000000182748685  48 8d 05 86 82 10 02           lea      rax, [rip + 0x2108286] ; [Msg] on recall c2c sys msg! but peer_uid is empty
000000018274868C  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
0000000182748691  48 8d 05 d7 1f 21 02           lea      rax, [rip + 0x2211fd7] ; HandleRecallSysMsg
0000000182748698  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018274869D  48 8d 0d cc c5 cf 01           lea      rcx, [rip + 0x1cfc5cc]
00000001827486A4  6a 04                          push     4
00000001827486A6  5a                             pop      rdx
00000001827486A7  4d 89 f8                       mov      r8, r15
00000001827486AA  41 b9 e4 00 00 00              mov      r9d, 0xe4
00000001827486B0  e8 75 ae 8b fd                 call     0x18000352a
00000001827486B5  48 8b 85 40 02 00 00           mov      rax, qword ptr [rbp + 0x240]
00000001827486BC  48 8b 08                       mov      rcx, qword ptr [rax]
00000001827486BF  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
00000001827486C3  48 83 c1 08                    add      rcx, 8
00000001827486C7  6a 05                          push     5
00000001827486C9  5a                             pop      rdx
00000001827486CA  ff 50 50                       call     qword ptr [rax + 0x50]
00000001827486CD  48 89 c6                       mov      rsi, rax
00000001827486D0  48 8b 85 40 02 00 00           mov      rax, qword ptr [rbp + 0x240]
00000001827486D7  48 8b 08                       mov      rcx, qword ptr [rax]
00000001827486DA  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
00000001827486DE  48 83 c1 08                    add      rcx, 8
00000001827486E2  6a 14                          push     0x14
00000001827486E4  5a                             pop      rdx
00000001827486E5  ff 50 50                       call     qword ptr [rax + 0x50]
00000001827486E8  49 89 c4                       mov      r12, rax
00000001827486EB  48 8d 4d 58                    lea      rcx, [rbp + 0x58]
00000001827486EF  48 8d 95 b8 01 00 00           lea      rdx, [rbp + 0x1b8]
00000001827486F6  e8 35 4a 03 fe                 call     0x18077d130
00000001827486FB  48 8d 7d 10                    lea      rdi, [rbp + 0x10]
00000001827486FF  48 89 f9                       mov      rcx, rdi
0000000182748702  48 8d 95 e0 01 00 00           lea      rdx, [rbp + 0x1e0]
0000000182748709  e8 22 4a 03 fe                 call     0x18077d130
000000018274870E  8b 85 3c 02 00 00              mov      eax, dword ptr [rbp + 0x23c]
0000000182748714  88 44 24 48                    mov      byte ptr [rsp + 0x48], al
0000000182748718  48 89 74 24 40                 mov      qword ptr [rsp + 0x40], rsi
000000018274871D  4c 89 64 24 38                 mov      qword ptr [rsp + 0x38], r12
0000000182748722  48 8d 45 58                    lea      rax, [rbp + 0x58]
0000000182748726  48 89 44 24 30                 mov      qword ptr [rsp + 0x30], rax
000000018274872B  48 89 7c 24 28                 mov      qword ptr [rsp + 0x28], rdi
0000000182748730  48 8d 05 55 c6 09 02           lea      rax, [rip + 0x209c655]
0000000182748737  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018274873C  6a 04                          push     4
000000018274873E  59                             pop      rcx
000000018274873F  4c 89 fa                       mov      rdx, r15
0000000182748742  41 b8 e7 00 00 00              mov      r8d, 0xe7
0000000182748748  4c 8d 0d 20 1f 21 02           lea      r9, [rip + 0x2211f20] ; HandleRecallSysMsg
000000018274874F  e8 08 04 00 00                 call     0x182748b5c
0000000182748754  e9 1f 01 00 00                 jmp      0x182748878
0000000182748759  c7 85 2c 02 00 00 00 00 00 00  mov      dword ptr [rbp + 0x22c], 0
0000000182748763  44 8a bd 61 01 00 00           mov      r15b, byte ptr [rbp + 0x161]
000000018274876A  40 8a b5 60 01 00 00           mov      sil, byte ptr [rbp + 0x160]
0000000182748771  4c 8b b5 d8 00 00 00           mov      r14, qword ptr [rbp + 0xd8]
0000000182748778  4c 8b ad e0 00 00 00           mov      r13, qword ptr [rbp + 0xe0]
000000018274877F  4c 8b a5 d0 00 00 00           mov      r12, qword ptr [rbp + 0xd0]
0000000182748786  48 8b 9d c0 00 00 00           mov      rbx, qword ptr [rbp + 0xc0]
000000018274878D  48 8b bd c8 00 00 00           mov      rdi, qword ptr [rbp + 0xc8]
0000000182748794  48 8d 4d 70                    lea      rcx, [rbp + 0x70]
0000000182748798  48 8d 95 f8 01 00 00           lea      rdx, [rbp + 0x1f8]
000000018274879F  e8 8c 49 03 fe                 call     0x18077d130
00000001827487A4  48 8d 8d 88 00 00 00           lea      rcx, [rbp + 0x88]
00000001827487AB  48 8d 95 b8 01 00 00           lea      rdx, [rbp + 0x1b8]
00000001827487B2  e8 79 49 03 fe                 call     0x18077d130
00000001827487B7  48 8d 4d 40                    lea      rcx, [rbp + 0x40]
00000001827487BB  48 8d 95 e0 01 00 00           lea      rdx, [rbp + 0x1e0]
00000001827487C2  e8 69 49 03 fe                 call     0x18077d130
00000001827487C7  48 8d 0d f9 c4 2d 02           lea      rcx, [rip + 0x22dc4f9] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
00000001827487CE  6a 5c                          push     0x5c
00000001827487D0  5a                             pop      rdx
00000001827487D1  e8 4a 45 8b 01                 call     0x183ffcd20
00000001827487D6  4c 8d 40 01                    lea      r8, [rax + 1]
00000001827487DA  48 85 c0                       test     rax, rax
00000001827487DD  48 8d 05 e3 c4 2d 02           lea      rax, [rip + 0x22dc4e3] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
00000001827487E4  4c 0f 44 c0                    cmove    r8, rax
00000001827487E8  80 bd 2c 02 00 00 00           cmp      byte ptr [rbp + 0x22c], 0
00000001827487EF  4c 89 74 24 68                 mov      qword ptr [rsp + 0x68], r14
00000001827487F4  4c 89 6c 24 60                 mov      qword ptr [rsp + 0x60], r13
00000001827487F9  4c 89 64 24 58                 mov      qword ptr [rsp + 0x58], r12
00000001827487FE  44 88 7c 24 78                 mov      byte ptr [rsp + 0x78], r15b
0000000182748803  0f 95 84 24 80 00 00 00        setne    byte ptr [rsp + 0x80]
000000018274880B  40 88 74 24 70                 mov      byte ptr [rsp + 0x70], sil
0000000182748810  48 89 7c 24 50                 mov      qword ptr [rsp + 0x50], rdi
0000000182748815  48 89 5c 24 48                 mov      qword ptr [rsp + 0x48], rbx
000000018274881A  48 8d 45 70                    lea      rax, [rbp + 0x70]
000000018274881E  48 89 44 24 40                 mov      qword ptr [rsp + 0x40], rax
0000000182748823  48 8d 85 88 00 00 00           lea      rax, [rbp + 0x88]
000000018274882A  48 89 44 24 38                 mov      qword ptr [rsp + 0x38], rax
000000018274882F  48 8d 45 40                    lea      rax, [rbp + 0x40]
0000000182748833  48 89 44 24 30                 mov      qword ptr [rsp + 0x30], rax
0000000182748838  48 8d 05 33 85 0b 02           lea      rax, [rip + 0x20b8533] ; [Msg] on c2c recall nfy! frm:{} to:{}, p:{} seq:{} c_seq:{} rd:{} t:{} m_uid:{} is_off:{} trl_flag:{}  is_andr_silence:{}
000000018274883F  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
0000000182748844  48 8d 05 24 1e 21 02           lea      rax, [rip + 0x2211e24] ; HandleRecallSysMsg
000000018274884B  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
0000000182748850  48 8d 0d 19 c4 cf 01           lea      rcx, [rip + 0x1cfc419]
0000000182748857  6a 02                          push     2
0000000182748859  5a                             pop      rdx
000000018274885A  41 b9 0a 01 00 00              mov      r9d, 0x10a
0000000182748860  e8 14 07 00 00                 call     0x182748f79
0000000182748865  48 8b 8d 20 02 00 00           mov      rcx, qword ptr [rbp + 0x220]
000000018274886C  48 8d 95 a0 00 00 00           lea      rdx, [rbp + 0xa0]
0000000182748873  e8 f8 08 00 00                 call     0x182749170
0000000182748878  48 8d 8d f8 01 00 00           lea      rcx, [rbp + 0x1f8]
000000018274887F  e8 7c 49 03 fe                 call     0x18077d200
0000000182748884  48 8d 8d b8 01 00 00           lea      rcx, [rbp + 0x1b8]
000000018274888B  e8 70 49 03 fe                 call     0x18077d200
0000000182748890  48 8d bd e0 01 00 00           lea      rdi, [rbp + 0x1e0]
0000000182748897  48 89 f9                       mov      rcx, rdi
000000018274889A  e8 61 49 03 fe                 call     0x18077d200
000000018274889F  48 8d 8d 78 01 00 00           lea      rcx, [rbp + 0x178]
00000001827488A6  e8 55 49 03 fe                 call     0x18077d200
00000001827488AB  48 8d 8d a0 00 00 00           lea      rcx, [rbp + 0xa0]
00000001827488B2  e8 03 ef de fe                 call     0x1815377ba
00000001827488B7  48 8b b5 40 02 00 00           mov      rsi, qword ptr [rbp + 0x240]
00000001827488BE  48 83 c6 10                    add      rsi, 0x10
00000001827488C2  e9 8c fa ff ff                 jmp      0x182748353
