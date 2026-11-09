; pdata range 0x18153df6c .. 0x18153e267 (exclusive)
; PE unwind range; not necessarily an entire source-level function.
000000018153DF6C  55                             push     rbp
000000018153DF6D  41 57                          push     r15
000000018153DF6F  41 56                          push     r14
000000018153DF71  41 55                          push     r13
000000018153DF73  41 54                          push     r12
000000018153DF75  56                             push     rsi
000000018153DF76  57                             push     rdi
000000018153DF77  53                             push     rbx
000000018153DF78  48 81 ec f8 01 00 00           sub      rsp, 0x1f8
000000018153DF7F  48 8d ac 24 80 00 00 00        lea      rbp, [rsp + 0x80]
000000018153DF87  48 c7 85 70 01 00 00 fe ff ff ff mov      qword ptr [rbp + 0x170], 0xfffffffffffffffe
000000018153DF92  48 89 d6                       mov      rsi, rdx
000000018153DF95  48 89 cb                       mov      rbx, rcx
000000018153DF98  4c 8b 62 40                    mov      r12, qword ptr [rdx + 0x40]
000000018153DF9C  4c 8b 6a 20                    mov      r13, qword ptr [rdx + 0x20]
000000018153DFA0  48 8b 7a 30                    mov      rdi, qword ptr [rdx + 0x30]
000000018153DFA4  48 8d 42 20                    lea      rax, [rdx + 0x20]
000000018153DFA8  48 89 85 60 01 00 00           mov      qword ptr [rbp + 0x160], rax
000000018153DFAF  44 0f b6 72 18                 movzx    r14d, byte ptr [rdx + 0x18]
000000018153DFB4  48 8d 8d f0 00 00 00           lea      rcx, [rbp + 0xf0]
000000018153DFBB  e8 70 f1 23 ff                 call     0x18077d130
000000018153DFC0  4c 8d 3d 80 ef 4d 03           lea      r15, [rip + 0x34def80]
000000018153DFC7  6a 5c                          push     0x5c
000000018153DFC9  5a                             pop      rdx
000000018153DFCA  4c 89 f9                       mov      rcx, r15
000000018153DFCD  e8 4e ed ab 02                 call     0x183ffcd20
000000018153DFD2  4c 8d 40 01                    lea      r8, [rax + 1]
000000018153DFD6  48 85 c0                       test     rax, rax
000000018153DFD9  4d 0f 44 c7                    cmove    r8, r15
000000018153DFDD  4c 89 64 24 50                 mov      qword ptr [rsp + 0x50], r12
000000018153DFE2  48 89 7c 24 48                 mov      qword ptr [rsp + 0x48], rdi
000000018153DFE7  4c 89 6c 24 40                 mov      qword ptr [rsp + 0x40], r13
000000018153DFEC  44 89 74 24 38                 mov      dword ptr [rsp + 0x38], r14d
000000018153DFF1  48 8d 85 f0 00 00 00           lea      rax, [rbp + 0xf0]
000000018153DFF8  48 89 44 24 30                 mov      qword ptr [rsp + 0x30], rax
000000018153DFFD  48 8d 05 ab d1 2b 03           lea      rax, [rip + 0x32bd1ab]
000000018153E004  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018153E009  48 8d 05 85 9a 31 03           lea      rax, [rip + 0x3319a85] ; OnDelayHandleRecallMsgNotify
000000018153E010  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018153E015  48 8d 0d ac c1 d1 02           lea      rcx, [rip + 0x2d1c1ac]
000000018153E01C  6a 02                          push     2
000000018153E01E  5a                             pop      rdx
000000018153E01F  41 b9 8b 06 00 00              mov      r9d, 0x68b
000000018153E025  e8 7d 62 37 ff                 call     0x1808b42a7
000000018153E02A  0f 57 c0                       xorps    xmm0, xmm0
000000018153E02D  48 8d 8d 20 01 00 00           lea      rcx, [rbp + 0x120]
000000018153E034  0f 29 01                       movaps   xmmword ptr [rcx], xmm0
000000018153E037  48 83 61 10 00                 and      qword ptr [rcx + 0x10], 0
000000018153E03C  48 8b 95 60 01 00 00           mov      rdx, qword ptr [rbp + 0x160]
000000018153E043  e8 8c 2b cb fe                 call     0x1801f0bd4
000000018153E048  48 8d 53 60                    lea      rdx, [rbx + 0x60]
000000018153E04C  48 8d 4d f0                    lea      rcx, [rbp - 0x10]
000000018153E050  e8 75 90 b0 fe                 call     0x1800470ca
000000018153E055  4c 8b 7d f0                    mov      r15, qword ptr [rbp - 0x10]
000000018153E059  48 8b 7d f8                    mov      rdi, qword ptr [rbp - 8]
000000018153E05D  4c 89 bd 50 01 00 00           mov      qword ptr [rbp + 0x150], r15
000000018153E064  48 89 bd 58 01 00 00           mov      qword ptr [rbp + 0x158], rdi
000000018153E06B  48 85 ff                       test     rdi, rdi
000000018153E06E  74 1d                          je       0x18153e08d
000000018153E070  f0 ff 47 10                    lock inc dword ptr [rdi + 0x10]
000000018153E074  4c 8d 75 f0                    lea      r14, [rbp - 0x10]
000000018153E078  4c 89 f1                       mov      rcx, r14
000000018153E07B  e8 32 3d ac fe                 call     0x180001db2
000000018153E080  4d 89 3e                       mov      qword ptr [r14], r15
000000018153E083  49 89 7e 08                    mov      qword ptr [r14 + 8], rdi
000000018153E087  f0 ff 47 10                    lock inc dword ptr [rdi + 0x10]
000000018153E08B  eb 13                          jmp      0x18153e0a0
000000018153E08D  4c 8d 75 f0                    lea      r14, [rbp - 0x10]
000000018153E091  4c 89 f1                       mov      rcx, r14
000000018153E094  e8 19 3d ac fe                 call     0x180001db2
000000018153E099  4d 89 3e                       mov      qword ptr [r14], r15
000000018153E09C  49 89 7e 08                    mov      qword ptr [r14 + 8], rdi
000000018153E0A0  48 8d 4d 00                    lea      rcx, [rbp]
000000018153E0A4  48 89 f2                       mov      rdx, rsi
000000018153E0A7  e8 80 e2 ff ff                 call     0x18153c32c
000000018153E0AC  83 a5 6c 01 00 00 00           and      dword ptr [rbp + 0x16c], 0
000000018153E0B3  0f b6 43 08                    movzx    eax, byte ptr [rbx + 8]
000000018153E0B7  a8 01                          test     al, 1
000000018153E0B9  75 08                          jne      0x18153e0c3
000000018153E0BB  d1 e8                          shr      eax, 1
000000018153E0BD  48 83 c3 09                    add      rbx, 9
000000018153E0C1  eb 08                          jmp      0x18153e0cb
000000018153E0C3  48 8b 43 10                    mov      rax, qword ptr [rbx + 0x10]
000000018153E0C7  48 8b 5b 18                    mov      rbx, qword ptr [rbx + 0x18]
000000018153E0CB  48 8d 95 c8 00 00 00           lea      rdx, [rbp + 0xc8]
000000018153E0D2  48 89 1a                       mov      qword ptr [rdx], rbx
000000018153E0D5  48 89 42 08                    mov      qword ptr [rdx + 8], rax
000000018153E0D9  48 8d 8d 38 01 00 00           lea      rcx, [rbp + 0x138]
000000018153E0E0  e8 29 d6 d1 fe                 call     0x18025b70e
000000018153E0E5  48 8d 8d 08 01 00 00           lea      rcx, [rbp + 0x108]
000000018153E0EC  e8 c5 5a ac fe                 call     0x180003bb6
000000018153E0F1  e8 94 d7 d1 fe                 call     0x18025b88a
000000018153E0F6  84 c0                          test     al, al
000000018153E0F8  75 56                          jne      0x18153e150
000000018153E0FA  48 8d 5d d8                    lea      rbx, [rbp - 0x28]
000000018153E0FE  48 8d 95 38 01 00 00           lea      rdx, [rbp + 0x138]
000000018153E105  48 89 d9                       mov      rcx, rbx
000000018153E108  e8 23 f0 23 ff                 call     0x18077d130
000000018153E10D  4c 8d 35 bc 9c 41 03           lea      r14, [rip + 0x3419cbc]
000000018153E114  6a 5c                          push     0x5c
000000018153E116  5a                             pop      rdx
000000018153E117  4c 89 f1                       mov      rcx, r14
000000018153E11A  e8 01 ec ab 02                 call     0x183ffcd20
000000018153E11F  48 8d 50 01                    lea      rdx, [rax + 1]
000000018153E123  48 85 c0                       test     rax, rax
000000018153E126  49 0f 44 d6                    cmove    rdx, r14
000000018153E12A  48 89 5c 24 28                 mov      qword ptr [rsp + 0x28], rbx
000000018153E12F  48 8d 05 b6 b1 4c 03           lea      rax, [rip + 0x34cb1b6]
000000018153E136  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018153E13B  4c 8d 0d 9f 50 52 03           lea      r9, [rip + 0x352509f]
000000018153E142  6a 04                          push     4
000000018153E144  59                             pop      rcx
000000018153E145  41 b8 a0 01 00 00              mov      r8d, 0x1a0
000000018153E14B  e8 58 3d ac fe                 call     0x180001ea8
000000018153E150  48 8d 5e 18                    lea      rbx, [rsi + 0x18]
000000018153E154  48 83 bd 18 01 00 00 00        cmp      qword ptr [rbp + 0x118], 0
000000018153E15C  0f 84 89 00 00 00              je       0x18153e1eb
000000018153E162  48 8d bd 10 01 00 00           lea      rdi, [rbp + 0x110]
000000018153E169  4c 8b 67 f8                    mov      r12, qword ptr [rdi - 8]
000000018153E16D  4c 8d b5 d8 00 00 00           lea      r14, [rbp + 0xd8]
000000018153E174  4c 8d bd 6c 01 00 00           lea      r15, [rbp + 0x16c]
000000018153E17B  4c 8d ad 20 01 00 00           lea      r13, [rbp + 0x120]
000000018153E182  49 39 fc                       cmp      r12, rdi
000000018153E185  0f 84 8e 00 00 00              je       0x18153e219
000000018153E18B  41 0f b6 44 24 20              movzx    eax, byte ptr [r12 + 0x20]
000000018153E191  a8 01                          test     al, 1
000000018153E193  75 04                          jne      0x18153e199
000000018153E195  d1 e8                          shr      eax, 1
000000018153E197  eb 05                          jmp      0x18153e19e
000000018153E199  49 8b 44 24 28                 mov      rax, qword ptr [r12 + 0x28]
000000018153E19E  48 85 c0                       test     rax, rax
000000018153E1A1  74 3b                          je       0x18153e1de
000000018153E1A3  4d 8d 44 24 20                 lea      r8, [r12 + 0x20]
000000018153E1A8  4c 89 f1                       mov      rcx, r14
000000018153E1AB  48 8d 95 38 01 00 00           lea      rdx, [rbp + 0x138]
000000018153E1B2  e8 ef d7 d1 fe                 call     0x18025b9a6
000000018153E1B7  48 8d 45 f0                    lea      rax, [rbp - 0x10]
000000018153E1BB  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018153E1C0  4c 89 7c 24 20                 mov      qword ptr [rsp + 0x20], r15
000000018153E1C5  4c 89 f1                       mov      rcx, r14
000000018153E1C8  48 89 f2                       mov      rdx, rsi
000000018153E1CB  49 89 d8                       mov      r8, rbx
000000018153E1CE  4d 89 e9                       mov      r9, r13
000000018153E1D1  e8 2e e4 00 00                 call     0x18154c604
000000018153E1D6  4c 89 f1                       mov      rcx, r14
000000018153E1D9  e8 22 f0 23 ff                 call     0x18077d200
000000018153E1DE  4c 89 e1                       mov      rcx, r12
000000018153E1E1  e8 0f 64 ac fe                 call     0x1800045f5
000000018153E1E6  49 89 c4                       mov      r12, rax
000000018153E1E9  eb 97                          jmp      0x18153e182
000000018153E1EB  48 8d 45 f0                    lea      rax, [rbp - 0x10]
000000018153E1EF  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018153E1F4  48 8d 85 6c 01 00 00           lea      rax, [rbp + 0x16c]
000000018153E1FB  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018153E200  48 8d 8d 38 01 00 00           lea      rcx, [rbp + 0x138]
000000018153E207  4c 8d 8d 20 01 00 00           lea      r9, [rbp + 0x120]
000000018153E20E  48 89 f2                       mov      rdx, rsi
000000018153E211  49 89 d8                       mov      r8, rbx
000000018153E214  e8 eb e3 00 00                 call     0x18154c604
000000018153E219  48 8d 8d 08 01 00 00           lea      rcx, [rbp + 0x108]
000000018153E220  e8 fd 63 ac fe                 call     0x180004622
000000018153E225  48 8d 8d 38 01 00 00           lea      rcx, [rbp + 0x138]
000000018153E22C  e8 cf ef 23 ff                 call     0x18077d200
000000018153E231  48 8d 4d f0                    lea      rcx, [rbp - 0x10]
000000018153E235  e8 42 e2 ff ff                 call     0x18153c47c
000000018153E23A  48 8d 8d 50 01 00 00           lea      rcx, [rbp + 0x150]
000000018153E241  e8 74 5d ac fe                 call     0x180003fba
000000018153E246  48 8d 8d 20 01 00 00           lea      rcx, [rbp + 0x120]
000000018153E24D  e8 ac dc b0 fe                 call     0x18004befe
000000018153E252  90                             nop      
000000018153E253  48 81 c4 f8 01 00 00           add      rsp, 0x1f8
000000018153E25A  5b                             pop      rbx
000000018153E25B  5f                             pop      rdi
000000018153E25C  5e                             pop      rsi
000000018153E25D  41 5c                          pop      r12
000000018153E25F  41 5d                          pop      r13
000000018153E261  41 5e                          pop      r14
000000018153E263  41 5f                          pop      r15
000000018153E265  5d                             pop      rbp
000000018153E266  c3                             ret      
