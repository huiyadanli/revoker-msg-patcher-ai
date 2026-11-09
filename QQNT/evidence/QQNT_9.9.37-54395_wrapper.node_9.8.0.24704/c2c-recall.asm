; pdata range 0x182771fb6 .. 0x18277276f (exclusive)
; PE unwind range; not necessarily an entire source-level function.
0000000182771FB6  55                             push     rbp
0000000182771FB7  41 57                          push     r15
0000000182771FB9  41 56                          push     r14
0000000182771FBB  41 55                          push     r13
0000000182771FBD  41 54                          push     r12
0000000182771FBF  56                             push     rsi
0000000182771FC0  57                             push     rdi
0000000182771FC1  53                             push     rbx
0000000182771FC2  48 81 ec d8 02 00 00           sub      rsp, 0x2d8
0000000182771FC9  48 8d ac 24 80 00 00 00        lea      rbp, [rsp + 0x80]
0000000182771FD1  48 c7 85 50 02 00 00 fe ff ff ff mov      qword ptr [rbp + 0x250], 0xfffffffffffffffe
0000000182771FDC  44 88 8d 4f 02 00 00           mov      byte ptr [rbp + 0x24f], r9b
0000000182771FE3  48 89 95 18 02 00 00           mov      qword ptr [rbp + 0x218], rdx
0000000182771FEA  48 89 8d 20 02 00 00           mov      qword ptr [rbp + 0x220], rcx
0000000182771FF1  4c 89 85 30 02 00 00           mov      qword ptr [rbp + 0x230], r8
0000000182771FF8  49 8b 08                       mov      rcx, qword ptr [r8]
0000000182771FFB  48 85 c9                       test     rcx, rcx
0000000182771FFE  0f 84 96 00 00 00              je       0x18277209a
0000000182772004  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
0000000182772008  48 83 c1 08                    add      rcx, 8
000000018277200C  6a 01                          push     1
000000018277200E  5a                             pop      rdx
000000018277200F  ff 90 28 01 00 00              call     qword ptr [rax + 0x128]
0000000182772015  84 c0                          test     al, al
0000000182772017  0f 84 cc 00 00 00              je       0x1827720e9
000000018277201D  48 8b 85 30 02 00 00           mov      rax, qword ptr [rbp + 0x230]
0000000182772024  48 8b 08                       mov      rcx, qword ptr [rax]
0000000182772027  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018277202B  48 83 c1 08                    add      rcx, 8
000000018277202F  48 8d 95 a0 01 00 00           lea      rdx, [rbp + 0x1a0]
0000000182772036  6a 01                          push     1
0000000182772038  41 58                          pop      r8
000000018277203A  ff 90 f0 00 00 00              call     qword ptr [rax + 0xf0]
0000000182772040  48 8b 85 a8 01 00 00           mov      rax, qword ptr [rbp + 0x1a8]
0000000182772047  48 3b 85 a0 01 00 00           cmp      rax, qword ptr [rbp + 0x1a0]
000000018277204E  0f 84 e1 00 00 00              je       0x182772135
0000000182772054  48 8b 85 30 02 00 00           mov      rax, qword ptr [rbp + 0x230]
000000018277205B  48 8b 08                       mov      rcx, qword ptr [rax]
000000018277205E  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
0000000182772062  48 83 c1 08                    add      rcx, 8
0000000182772066  6a 06                          push     6
0000000182772068  5a                             pop      rdx
0000000182772069  ff 90 28 01 00 00              call     qword ptr [rax + 0x128]
000000018277206F  84 c0                          test     al, al
0000000182772071  0f 84 41 01 00 00              je       0x1827721b8
0000000182772077  48 8b 85 30 02 00 00           mov      rax, qword ptr [rbp + 0x230]
000000018277207E  48 8b 08                       mov      rcx, qword ptr [rax]
0000000182772081  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
0000000182772085  48 83 c1 08                    add      rcx, 8
0000000182772089  6a 06                          push     6
000000018277208B  5a                             pop      rdx
000000018277208C  ff 50 10                       call     qword ptr [rax + 0x10]
000000018277208F  89 85 3c 02 00 00              mov      dword ptr [rbp + 0x23c], eax
0000000182772095  e9 28 01 00 00                 jmp      0x1827721c2
000000018277209A  48 8d 35 1a 7c 2e 02           lea      rsi, [rip + 0x22e7c1a] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
00000001827720A1  6a 5c                          push     0x5c
00000001827720A3  5a                             pop      rdx
00000001827720A4  48 89 f1                       mov      rcx, rsi
00000001827720A7  e8 44 9c 8b 01                 call     0x18402bcf0
00000001827720AC  4c 8d 40 01                    lea      r8, [rax + 1]
00000001827720B0  48 85 c0                       test     rax, rax
00000001827720B3  4c 0f 44 c6                    cmove    r8, rsi
00000001827720B7  48 8d 05 02 1f 13 02           lea      rax, [rip + 0x2131f02] ; on recall c2c sys msg! no content
00000001827720BE  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
00000001827720C3  48 8d 05 1a c8 21 02           lea      rax, [rip + 0x221c81a] ; HandleRecallSysMsg
00000001827720CA  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
00000001827720CF  48 8d 0d 9a 3b d0 01           lea      rcx, [rip + 0x1d03b9a]
00000001827720D6  6a 04                          push     4
00000001827720D8  5a                             pop      rdx
00000001827720D9  41 b9 c6 00 00 00              mov      r9d, 0xc6
00000001827720DF  e8 46 14 89 fd                 call     0x18000352a
00000001827720E4  e9 a2 00 00 00                 jmp      0x18277218b
00000001827720E9  48 8d 35 cb 7b 2e 02           lea      rsi, [rip + 0x22e7bcb] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
00000001827720F0  6a 5c                          push     0x5c
00000001827720F2  5a                             pop      rdx
00000001827720F3  48 89 f1                       mov      rcx, rsi
00000001827720F6  e8 f5 9b 8b 01                 call     0x18402bcf0
00000001827720FB  4c 8d 40 01                    lea      r8, [rax + 1]
00000001827720FF  48 85 c0                       test     rax, rax
0000000182772102  4c 0f 44 c6                    cmove    r8, rsi
0000000182772106  48 8d 05 60 ea 18 02           lea      rax, [rip + 0x218ea60] ; on recall c2c sys msg! no msg infos
000000018277210D  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
0000000182772112  48 8d 05 cb c7 21 02           lea      rax, [rip + 0x221c7cb] ; HandleRecallSysMsg
0000000182772119  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018277211E  48 8d 0d 4b 3b d0 01           lea      rcx, [rip + 0x1d03b4b]
0000000182772125  6a 04                          push     4
0000000182772127  5a                             pop      rdx
0000000182772128  41 b9 ca 00 00 00              mov      r9d, 0xca
000000018277212E  e8 f7 13 89 fd                 call     0x18000352a
0000000182772133  eb 56                          jmp      0x18277218b
0000000182772135  48 8d 35 7f 7b 2e 02           lea      rsi, [rip + 0x22e7b7f] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
000000018277213C  6a 5c                          push     0x5c
000000018277213E  5a                             pop      rdx
000000018277213F  48 89 f1                       mov      rcx, rsi
0000000182772142  e8 a9 9b 8b 01                 call     0x18402bcf0
0000000182772147  4c 8d 40 01                    lea      r8, [rax + 1]
000000018277214B  48 85 c0                       test     rax, rax
000000018277214E  4c 0f 44 c6                    cmove    r8, rsi
0000000182772152  48 8d 05 78 59 1e 02           lea      rax, [rip + 0x21e5978] ; on recall c2c sys msg! no any msg info
0000000182772159  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018277215E  48 8d 05 7f c7 21 02           lea      rax, [rip + 0x221c77f] ; HandleRecallSysMsg
0000000182772165  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018277216A  48 8d 0d ff 3a d0 01           lea      rcx, [rip + 0x1d03aff]
0000000182772171  6a 04                          push     4
0000000182772173  5a                             pop      rdx
0000000182772174  41 b9 cf 00 00 00              mov      r9d, 0xcf
000000018277217A  e8 ab 13 89 fd                 call     0x18000352a
000000018277217F  48 8d 8d a0 01 00 00           lea      rcx, [rbp + 0x1a0]
0000000182772186  e8 b5 26 8a fd                 call     0x180014840
000000018277218B  48 8b 8d 18 02 00 00           mov      rcx, qword ptr [rbp + 0x218]
0000000182772192  e8 1b fc 88 fd                 call     0x180001db2
0000000182772197  48 8b 8d 30 02 00 00           mov      rcx, qword ptr [rbp + 0x230]
000000018277219E  e8 0f fc 88 fd                 call     0x180001db2
00000001827721A3  90                             nop      
00000001827721A4  48 81 c4 d8 02 00 00           add      rsp, 0x2d8
00000001827721AB  5b                             pop      rbx
00000001827721AC  5f                             pop      rdi
00000001827721AD  5e                             pop      rsi
00000001827721AE  41 5c                          pop      r12
00000001827721B0  41 5d                          pop      r13
00000001827721B2  41 5e                          pop      r14
00000001827721B4  41 5f                          pop      r15
00000001827721B6  5d                             pop      rbp
00000001827721B7  c3                             ret      
00000001827721B8  c7 85 3c 02 00 00 00 00 00 00  mov      dword ptr [rbp + 0x23c], 0
00000001827721C2  48 8b b5 a0 01 00 00           mov      rsi, qword ptr [rbp + 0x1a0]
00000001827721C9  48 8b 85 a8 01 00 00           mov      rax, qword ptr [rbp + 0x1a8]
00000001827721D0  48 89 85 90 01 00 00           mov      qword ptr [rbp + 0x190], rax
00000001827721D7  48 8b 85 20 02 00 00           mov      rax, qword ptr [rbp + 0x220]
00000001827721DE  48 8d 48 08                    lea      rcx, [rax + 8]
00000001827721E2  48 89 8d 10 02 00 00           mov      qword ptr [rbp + 0x210], rcx
00000001827721E9  48 83 c0 09                    add      rax, 9
00000001827721ED  48 89 85 98 01 00 00           mov      qword ptr [rbp + 0x198], rax
00000001827721F4  48 8d bd e0 01 00 00           lea      rdi, [rbp + 0x1e0]
00000001827721FB  48 3b b5 90 01 00 00           cmp      rsi, qword ptr [rbp + 0x190]
0000000182772202  0f 84 77 ff ff ff              je       0x18277217f
0000000182772208  48 8d 8d a0 00 00 00           lea      rcx, [rbp + 0xa0]
000000018277220F  e8 20 6e de fe                 call     0x181559034
0000000182772214  48 8d 8d 78 01 00 00           lea      rcx, [rbp + 0x178]
000000018277221B  e8 60 40 89 fd                 call     0x180006280
0000000182772220  c7 85 e0 01 00 00 8b 13 00 00  mov      dword ptr [rbp + 0x1e0], 0x138b
000000018277222A  48 8b 85 10 02 00 00           mov      rax, qword ptr [rbp + 0x210]
0000000182772231  0f b6 00                       movzx    eax, byte ptr [rax]
0000000182772234  a8 01                          test     al, 1
0000000182772236  75 0b                          jne      0x182772243
0000000182772238  d1 e8                          shr      eax, 1
000000018277223A  48 8b 8d 98 01 00 00           mov      rcx, qword ptr [rbp + 0x198]
0000000182772241  eb 0f                          jmp      0x182772252
0000000182772243  48 8b 8d 20 02 00 00           mov      rcx, qword ptr [rbp + 0x220]
000000018277224A  48 8b 41 10                    mov      rax, qword ptr [rcx + 0x10]
000000018277224E  48 8b 49 18                    mov      rcx, qword ptr [rcx + 0x18]
0000000182772252  48 89 8d 68 01 00 00           mov      qword ptr [rbp + 0x168], rcx
0000000182772259  48 89 85 70 01 00 00           mov      qword ptr [rbp + 0x170], rax
0000000182772260  48 8d 8d 68 01 00 00           lea      rcx, [rbp + 0x168]
0000000182772267  48 8d 15 fc 00 92 fd           lea      rdx, [rip - 0x26dff04]
000000018277226E  49 89 f8                       mov      r8, rdi
0000000182772271  4c 8d 8d 78 01 00 00           lea      r9, [rbp + 0x178]
0000000182772278  e8 01 6b a8 fd                 call     0x1801f8d7e
000000018277227D  48 8b 0e                       mov      rcx, qword ptr [rsi]
0000000182772280  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
0000000182772284  48 83 c1 08                    add      rcx, 8
0000000182772288  48 89 fa                       mov      rdx, rdi
000000018277228B  6a 01                          push     1
000000018277228D  41 58                          pop      r8
000000018277228F  ff 50 68                       call     qword ptr [rax + 0x68]
0000000182772292  48 8b 0e                       mov      rcx, qword ptr [rsi]
0000000182772295  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
0000000182772299  48 83 c1 08                    add      rcx, 8
000000018277229D  48 8d 95 b8 01 00 00           lea      rdx, [rbp + 0x1b8]
00000001827722A4  6a 02                          push     2
00000001827722A6  41 58                          pop      r8
00000001827722A8  ff 50 68                       call     qword ptr [rax + 0x68]
00000001827722AB  48 8d 8d f8 01 00 00           lea      rcx, [rbp + 0x1f8]
00000001827722B2  48 8d 15 b4 d1 38 02           lea      rdx, [rip + 0x238d1b4]
00000001827722B9  e8 60 10 89 fd                 call     0x18000331e
00000001827722BE  48 89 b5 40 02 00 00           mov      qword ptr [rbp + 0x240], rsi
00000001827722C5  48 8d 8d 78 01 00 00           lea      rcx, [rbp + 0x178]
00000001827722CC  48 89 fa                       mov      rdx, rdi
00000001827722CF  e8 3f d4 8c fd                 call     0x18003f713
00000001827722D4  84 c0                          test     al, al
00000001827722D6  74 15                          je       0x1827722ed
00000001827722D8  48 8d 8d f8 01 00 00           lea      rcx, [rbp + 0x1f8]
00000001827722DF  48 8d 95 b8 01 00 00           lea      rdx, [rbp + 0x1b8]
00000001827722E6  e8 f5 de 01 fe                 call     0x1807901e0
00000001827722EB  eb 0f                          jmp      0x1827722fc
00000001827722ED  48 8d 8d f8 01 00 00           lea      rcx, [rbp + 0x1f8]
00000001827722F4  48 89 fa                       mov      rdx, rdi
00000001827722F7  e8 e4 de 01 fe                 call     0x1807901e0
00000001827722FC  0f b6 85 f8 01 00 00           movzx    eax, byte ptr [rbp + 0x1f8]
0000000182772303  a8 01                          test     al, 1
0000000182772305  74 09                          je       0x182772310
0000000182772307  48 8b 85 00 02 00 00           mov      rax, qword ptr [rbp + 0x200]
000000018277230E  eb 02                          jmp      0x182772312
0000000182772310  d1 e8                          shr      eax, 1
0000000182772312  48 85 c0                       test     rax, rax
0000000182772315  0f 84 f5 01 00 00              je       0x182772510
000000018277231B  48 8d 8d a0 00 00 00           lea      rcx, [rbp + 0xa0]
0000000182772322  48 8d 95 f8 01 00 00           lea      rdx, [rbp + 0x1f8]
0000000182772329  e8 b2 de 01 fe                 call     0x1807901e0
000000018277232E  c6 85 b8 00 00 00 01           mov      byte ptr [rbp + 0xb8], 1
0000000182772335  48 8d 8d e8 00 00 00           lea      rcx, [rbp + 0xe8]
000000018277233C  48 8d 95 e0 01 00 00           lea      rdx, [rbp + 0x1e0]
0000000182772343  e8 98 de 01 fe                 call     0x1807901e0
0000000182772348  48 8d 8d 00 01 00 00           lea      rcx, [rbp + 0x100]
000000018277234F  48 8d 95 b8 01 00 00           lea      rdx, [rbp + 0x1b8]
0000000182772356  e8 85 de 01 fe                 call     0x1807901e0
000000018277235B  48 8d 8d 20 01 00 00           lea      rcx, [rbp + 0x120]
0000000182772362  48 8d 95 e0 01 00 00           lea      rdx, [rbp + 0x1e0]
0000000182772369  e8 72 de 01 fe                 call     0x1807901e0
000000018277236E  83 a5 18 01 00 00 00           and      dword ptr [rbp + 0x118], 0
0000000182772375  48 8b 85 40 02 00 00           mov      rax, qword ptr [rbp + 0x240]
000000018277237C  48 8b 08                       mov      rcx, qword ptr [rax]
000000018277237F  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
0000000182772383  48 83 c1 08                    add      rcx, 8
0000000182772387  6a 06                          push     6
0000000182772389  5a                             pop      rdx
000000018277238A  ff 50 50                       call     qword ptr [rax + 0x50]
000000018277238D  48 89 85 d0 00 00 00           mov      qword ptr [rbp + 0xd0], rax
0000000182772394  48 8b 85 40 02 00 00           mov      rax, qword ptr [rbp + 0x240]
000000018277239B  48 8b 08                       mov      rcx, qword ptr [rax]
000000018277239E  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
00000001827723A2  48 83 c1 08                    add      rcx, 8
00000001827723A6  6a 05                          push     5
00000001827723A8  5a                             pop      rdx
00000001827723A9  ff 50 50                       call     qword ptr [rax + 0x50]
00000001827723AC  48 89 85 e0 00 00 00           mov      qword ptr [rbp + 0xe0], rax
00000001827723B3  48 8b 85 40 02 00 00           mov      rax, qword ptr [rbp + 0x240]
00000001827723BA  48 8b 08                       mov      rcx, qword ptr [rax]
00000001827723BD  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
00000001827723C1  48 83 c1 08                    add      rcx, 8
00000001827723C5  6a 04                          push     4
00000001827723C7  5a                             pop      rdx
00000001827723C8  ff 50 50                       call     qword ptr [rax + 0x50]
00000001827723CB  48 89 85 d8 00 00 00           mov      qword ptr [rbp + 0xd8], rax
00000001827723D2  48 8b 85 40 02 00 00           mov      rax, qword ptr [rbp + 0x240]
00000001827723D9  48 8b 08                       mov      rcx, qword ptr [rax]
00000001827723DC  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
00000001827723E0  48 83 c1 08                    add      rcx, 8
00000001827723E4  6a 14                          push     0x14
00000001827723E6  5a                             pop      rdx
00000001827723E7  ff 50 50                       call     qword ptr [rax + 0x50]
00000001827723EA  48 89 85 c0 00 00 00           mov      qword ptr [rbp + 0xc0], rax
00000001827723F1  48 8b 85 40 02 00 00           mov      rax, qword ptr [rbp + 0x240]
00000001827723F8  48 8b 08                       mov      rcx, qword ptr [rax]
00000001827723FB  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
00000001827723FF  48 83 c1 08                    add      rcx, 8
0000000182772403  6a 03                          push     3
0000000182772405  5a                             pop      rdx
0000000182772406  ff 50 30                       call     qword ptr [rax + 0x30]
0000000182772409  89 c0                          mov      eax, eax
000000018277240B  48 89 85 c8 00 00 00           mov      qword ptr [rbp + 0xc8], rax
0000000182772412  48 8b 85 40 02 00 00           mov      rax, qword ptr [rbp + 0x240]
0000000182772419  48 8b 08                       mov      rcx, qword ptr [rax]
000000018277241C  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
0000000182772420  48 83 c1 08                    add      rcx, 8
0000000182772424  6a 0d                          push     0xd
0000000182772426  5a                             pop      rdx
0000000182772427  ff 90 28 01 00 00              call     qword ptr [rax + 0x128]
000000018277242D  84 c0                          test     al, al
000000018277242F  48 8b 85 40 02 00 00           mov      rax, qword ptr [rbp + 0x240]
0000000182772436  74 79                          je       0x1827724b1
0000000182772438  48 8b 08                       mov      rcx, qword ptr [rax]
000000018277243B  48 8b 01                       mov      rax, qword ptr [rcx]
000000018277243E  48 8d 95 d0 01 00 00           lea      rdx, [rbp + 0x1d0]
0000000182772445  6a 0d                          push     0xd
0000000182772447  41 58                          pop      r8
0000000182772449  ff 90 18 01 00 00              call     qword ptr [rax + 0x118]
000000018277244F  48 8b 8d d0 01 00 00           mov      rcx, qword ptr [rbp + 0x1d0]
0000000182772456  48 85 c9                       test     rcx, rcx
0000000182772459  74 4a                          je       0x1827724a5
000000018277245B  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018277245F  48 83 c1 08                    add      rcx, 8
0000000182772463  6a 02                          push     2
0000000182772465  5a                             pop      rdx
0000000182772466  ff 90 28 01 00 00              call     qword ptr [rax + 0x128]
000000018277246C  84 c0                          test     al, al
000000018277246E  74 35                          je       0x1827724a5
0000000182772470  48 8b 8d d0 01 00 00           mov      rcx, qword ptr [rbp + 0x1d0]
0000000182772477  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018277247B  48 83 c1 08                    add      rcx, 8
000000018277247F  48 8d 55 28                    lea      rdx, [rbp + 0x28]
0000000182772483  6a 02                          push     2
0000000182772485  41 58                          pop      r8
0000000182772487  ff 50 68                       call     qword ptr [rax + 0x68]
000000018277248A  48 8d 8d 48 01 00 00           lea      rcx, [rbp + 0x148]
0000000182772491  48 8d 75 28                    lea      rsi, [rbp + 0x28]
0000000182772495  48 89 f2                       mov      rdx, rsi
0000000182772498  e8 55 3b 89 fd                 call     0x180005ff2
000000018277249D  48 89 f1                       mov      rcx, rsi
00000001827724A0  e8 5b c7 01 fe                 call     0x18078ec00
00000001827724A5  48 8d 8d d0 01 00 00           lea      rcx, [rbp + 0x1d0]
00000001827724AC  e8 01 f9 88 fd                 call     0x180001db2
00000001827724B1  80 bd 4f 02 00 00 00           cmp      byte ptr [rbp + 0x24f], 0
00000001827724B8  75 07                          jne      0x1827724c1
00000001827724BA  c6 85 60 01 00 00 01           mov      byte ptr [rbp + 0x160], 1
00000001827724C1  80 bd 3c 02 00 00 00           cmp      byte ptr [rbp + 0x23c], 0
00000001827724C8  74 07                          je       0x1827724d1
00000001827724CA  c6 85 61 01 00 00 01           mov      byte ptr [rbp + 0x161], 1
00000001827724D1  8a 85 c0 02 00 00              mov      al, byte ptr [rbp + 0x2c0]
00000001827724D7  88 85 62 01 00 00              mov      byte ptr [rbp + 0x162], al
00000001827724DD  84 c0                          test     al, al
00000001827724DF  0f 84 1c 01 00 00              je       0x182772601
00000001827724E5  48 8b 8d 10 02 00 00           mov      rcx, qword ptr [rbp + 0x210]
00000001827724EC  48 8b 95 c8 02 00 00           mov      rdx, qword ptr [rbp + 0x2c8]
00000001827724F3  4c 8d 85 a0 00 00 00           lea      r8, [rbp + 0xa0]
00000001827724FA  e8 33 06 00 00                 call     0x182772b32
00000001827724FF  8a 85 62 01 00 00              mov      al, byte ptr [rbp + 0x162]
0000000182772505  89 85 2c 02 00 00              mov      dword ptr [rbp + 0x22c], eax
000000018277250B  e9 fb 00 00 00                 jmp      0x18277260b
0000000182772510  48 8d 35 a4 77 2e 02           lea      rsi, [rip + 0x22e77a4] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
0000000182772517  48 89 f1                       mov      rcx, rsi
000000018277251A  6a 5c                          push     0x5c
000000018277251C  5a                             pop      rdx
000000018277251D  e8 ce 97 8b 01                 call     0x18402bcf0
0000000182772522  4c 8d 78 01                    lea      r15, [rax + 1]
0000000182772526  48 85 c0                       test     rax, rax
0000000182772529  4c 0f 44 fe                    cmove    r15, rsi
000000018277252D  48 8d 05 83 18 11 02           lea      rax, [rip + 0x2111883] ; [Msg] on recall c2c sys msg! but peer_uid is empty
0000000182772534  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
0000000182772539  48 8d 05 a4 c3 21 02           lea      rax, [rip + 0x221c3a4] ; HandleRecallSysMsg
0000000182772540  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
0000000182772545  48 8d 0d 24 37 d0 01           lea      rcx, [rip + 0x1d03724]
000000018277254C  6a 04                          push     4
000000018277254E  5a                             pop      rdx
000000018277254F  4d 89 f8                       mov      r8, r15
0000000182772552  41 b9 e4 00 00 00              mov      r9d, 0xe4
0000000182772558  e8 cd 0f 89 fd                 call     0x18000352a
000000018277255D  48 8b 85 40 02 00 00           mov      rax, qword ptr [rbp + 0x240]
0000000182772564  48 8b 08                       mov      rcx, qword ptr [rax]
0000000182772567  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018277256B  48 83 c1 08                    add      rcx, 8
000000018277256F  6a 05                          push     5
0000000182772571  5a                             pop      rdx
0000000182772572  ff 50 50                       call     qword ptr [rax + 0x50]
0000000182772575  48 89 c6                       mov      rsi, rax
0000000182772578  48 8b 85 40 02 00 00           mov      rax, qword ptr [rbp + 0x240]
000000018277257F  48 8b 08                       mov      rcx, qword ptr [rax]
0000000182772582  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
0000000182772586  48 83 c1 08                    add      rcx, 8
000000018277258A  6a 14                          push     0x14
000000018277258C  5a                             pop      rdx
000000018277258D  ff 50 50                       call     qword ptr [rax + 0x50]
0000000182772590  49 89 c4                       mov      r12, rax
0000000182772593  48 8d 4d 58                    lea      rcx, [rbp + 0x58]
0000000182772597  48 8d 95 b8 01 00 00           lea      rdx, [rbp + 0x1b8]
000000018277259E  e8 8d c5 01 fe                 call     0x18078eb30
00000001827725A3  48 8d 7d 10                    lea      rdi, [rbp + 0x10]
00000001827725A7  48 89 f9                       mov      rcx, rdi
00000001827725AA  48 8d 95 e0 01 00 00           lea      rdx, [rbp + 0x1e0]
00000001827725B1  e8 7a c5 01 fe                 call     0x18078eb30
00000001827725B6  8b 85 3c 02 00 00              mov      eax, dword ptr [rbp + 0x23c]
00000001827725BC  88 44 24 48                    mov      byte ptr [rsp + 0x48], al
00000001827725C0  48 89 74 24 40                 mov      qword ptr [rsp + 0x40], rsi
00000001827725C5  4c 89 64 24 38                 mov      qword ptr [rsp + 0x38], r12
00000001827725CA  48 8d 45 58                    lea      rax, [rbp + 0x58]
00000001827725CE  48 89 44 24 30                 mov      qword ptr [rsp + 0x30], rax
00000001827725D3  48 89 7c 24 28                 mov      qword ptr [rsp + 0x28], rdi
00000001827725D8  48 8d 05 90 54 0a 02           lea      rax, [rip + 0x20a5490]
00000001827725DF  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
00000001827725E4  6a 04                          push     4
00000001827725E6  59                             pop      rcx
00000001827725E7  4c 89 fa                       mov      rdx, r15
00000001827725EA  41 b8 e7 00 00 00              mov      r8d, 0xe7
00000001827725F0  4c 8d 0d ed c2 21 02           lea      r9, [rip + 0x221c2ed] ; HandleRecallSysMsg
00000001827725F7  e8 08 04 00 00                 call     0x182772a04
00000001827725FC  e9 1f 01 00 00                 jmp      0x182772720
0000000182772601  c7 85 2c 02 00 00 00 00 00 00  mov      dword ptr [rbp + 0x22c], 0
000000018277260B  44 8a bd 61 01 00 00           mov      r15b, byte ptr [rbp + 0x161]
0000000182772612  40 8a b5 60 01 00 00           mov      sil, byte ptr [rbp + 0x160]
0000000182772619  4c 8b b5 d8 00 00 00           mov      r14, qword ptr [rbp + 0xd8]
0000000182772620  4c 8b ad e0 00 00 00           mov      r13, qword ptr [rbp + 0xe0]
0000000182772627  4c 8b a5 d0 00 00 00           mov      r12, qword ptr [rbp + 0xd0]
000000018277262E  48 8b 9d c0 00 00 00           mov      rbx, qword ptr [rbp + 0xc0]
0000000182772635  48 8b bd c8 00 00 00           mov      rdi, qword ptr [rbp + 0xc8]
000000018277263C  48 8d 4d 70                    lea      rcx, [rbp + 0x70]
0000000182772640  48 8d 95 f8 01 00 00           lea      rdx, [rbp + 0x1f8]
0000000182772647  e8 e4 c4 01 fe                 call     0x18078eb30
000000018277264C  48 8d 8d 88 00 00 00           lea      rcx, [rbp + 0x88]
0000000182772653  48 8d 95 b8 01 00 00           lea      rdx, [rbp + 0x1b8]
000000018277265A  e8 d1 c4 01 fe                 call     0x18078eb30
000000018277265F  48 8d 4d 40                    lea      rcx, [rbp + 0x40]
0000000182772663  48 8d 95 e0 01 00 00           lea      rdx, [rbp + 0x1e0]
000000018277266A  e8 c1 c4 01 fe                 call     0x18078eb30
000000018277266F  48 8d 0d 45 76 2e 02           lea      rcx, [rip + 0x22e7645] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
0000000182772676  6a 5c                          push     0x5c
0000000182772678  5a                             pop      rdx
0000000182772679  e8 72 96 8b 01                 call     0x18402bcf0
000000018277267E  4c 8d 40 01                    lea      r8, [rax + 1]
0000000182772682  48 85 c0                       test     rax, rax
0000000182772685  48 8d 05 2f 76 2e 02           lea      rax, [rip + 0x22e762f] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
000000018277268C  4c 0f 44 c0                    cmove    r8, rax
0000000182772690  80 bd 2c 02 00 00 00           cmp      byte ptr [rbp + 0x22c], 0
0000000182772697  4c 89 74 24 68                 mov      qword ptr [rsp + 0x68], r14
000000018277269C  4c 89 6c 24 60                 mov      qword ptr [rsp + 0x60], r13
00000001827726A1  4c 89 64 24 58                 mov      qword ptr [rsp + 0x58], r12
00000001827726A6  44 88 7c 24 78                 mov      byte ptr [rsp + 0x78], r15b
00000001827726AB  0f 95 84 24 80 00 00 00        setne    byte ptr [rsp + 0x80]
00000001827726B3  40 88 74 24 70                 mov      byte ptr [rsp + 0x70], sil
00000001827726B8  48 89 7c 24 50                 mov      qword ptr [rsp + 0x50], rdi
00000001827726BD  48 89 5c 24 48                 mov      qword ptr [rsp + 0x48], rbx
00000001827726C2  48 8d 45 70                    lea      rax, [rbp + 0x70]
00000001827726C6  48 89 44 24 40                 mov      qword ptr [rsp + 0x40], rax
00000001827726CB  48 8d 85 88 00 00 00           lea      rax, [rbp + 0x88]
00000001827726D2  48 89 44 24 38                 mov      qword ptr [rsp + 0x38], rax
00000001827726D7  48 8d 45 40                    lea      rax, [rbp + 0x40]
00000001827726DB  48 89 44 24 30                 mov      qword ptr [rsp + 0x30], rax
00000001827726E0  48 8d 05 62 15 0c 02           lea      rax, [rip + 0x20c1562] ; [Msg] on c2c recall nfy! frm:{} to:{}, p:{} seq:{} c_seq:{} rd:{} t:{} m_uid:{} is_off:{} trl_flag:{}  is_andr_silence:{}
00000001827726E7  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
00000001827726EC  48 8d 05 f1 c1 21 02           lea      rax, [rip + 0x221c1f1] ; HandleRecallSysMsg
00000001827726F3  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
00000001827726F8  48 8d 0d 71 35 d0 01           lea      rcx, [rip + 0x1d03571]
00000001827726FF  6a 02                          push     2
0000000182772701  5a                             pop      rdx
0000000182772702  41 b9 0a 01 00 00              mov      r9d, 0x10a
0000000182772708  e8 14 07 00 00                 call     0x182772e21
000000018277270D  48 8b 8d 20 02 00 00           mov      rcx, qword ptr [rbp + 0x220]
0000000182772714  48 8d 95 a0 00 00 00           lea      rdx, [rbp + 0xa0]
000000018277271B  e8 f8 08 00 00                 call     0x182773018
0000000182772720  48 8d 8d f8 01 00 00           lea      rcx, [rbp + 0x1f8]
0000000182772727  e8 d4 c4 01 fe                 call     0x18078ec00
000000018277272C  48 8d 8d b8 01 00 00           lea      rcx, [rbp + 0x1b8]
0000000182772733  e8 c8 c4 01 fe                 call     0x18078ec00
0000000182772738  48 8d bd e0 01 00 00           lea      rdi, [rbp + 0x1e0]
000000018277273F  48 89 f9                       mov      rcx, rdi
0000000182772742  e8 b9 c4 01 fe                 call     0x18078ec00
0000000182772747  48 8d 8d 78 01 00 00           lea      rcx, [rbp + 0x178]
000000018277274E  e8 ad c4 01 fe                 call     0x18078ec00
0000000182772753  48 8d 8d a0 00 00 00           lea      rcx, [rbp + 0xa0]
000000018277275A  e8 f3 69 de fe                 call     0x181559152
000000018277275F  48 8b b5 40 02 00 00           mov      rsi, qword ptr [rbp + 0x240]
0000000182772766  48 83 c6 10                    add      rsi, 0x10
000000018277276A  e9 8c fa ff ff                 jmp      0x1827721fb
