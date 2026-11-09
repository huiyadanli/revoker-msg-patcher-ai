; pdata range 0x18155f904 .. 0x18155fbff (exclusive)
; PE unwind range; not necessarily an entire source-level function.
000000018155F904  55                             push     rbp
000000018155F905  41 57                          push     r15
000000018155F907  41 56                          push     r14
000000018155F909  41 55                          push     r13
000000018155F90B  41 54                          push     r12
000000018155F90D  56                             push     rsi
000000018155F90E  57                             push     rdi
000000018155F90F  53                             push     rbx
000000018155F910  48 81 ec f8 01 00 00           sub      rsp, 0x1f8
000000018155F917  48 8d ac 24 80 00 00 00        lea      rbp, [rsp + 0x80]
000000018155F91F  48 c7 85 70 01 00 00 fe ff ff ff mov      qword ptr [rbp + 0x170], 0xfffffffffffffffe
000000018155F92A  48 89 d6                       mov      rsi, rdx
000000018155F92D  48 89 cb                       mov      rbx, rcx
000000018155F930  4c 8b 62 40                    mov      r12, qword ptr [rdx + 0x40]
000000018155F934  4c 8b 6a 20                    mov      r13, qword ptr [rdx + 0x20]
000000018155F938  48 8b 7a 30                    mov      rdi, qword ptr [rdx + 0x30]
000000018155F93C  48 8d 42 20                    lea      rax, [rdx + 0x20]
000000018155F940  48 89 85 60 01 00 00           mov      qword ptr [rbp + 0x160], rax
000000018155F947  44 0f b6 72 18                 movzx    r14d, byte ptr [rdx + 0x18]
000000018155F94C  48 8d 8d f0 00 00 00           lea      rcx, [rbp + 0xf0]
000000018155F953  e8 d8 f1 22 ff                 call     0x18078eb30
000000018155F958  4c 8d 3d a8 25 4f 03           lea      r15, [rip + 0x34f25a8]
000000018155F95F  6a 5c                          push     0x5c
000000018155F961  5a                             pop      rdx
000000018155F962  4c 89 f9                       mov      rcx, r15
000000018155F965  e8 86 c3 ac 02                 call     0x18402bcf0
000000018155F96A  4c 8d 40 01                    lea      r8, [rax + 1]
000000018155F96E  48 85 c0                       test     rax, rax
000000018155F971  4d 0f 44 c7                    cmove    r8, r15
000000018155F975  4c 89 64 24 50                 mov      qword ptr [rsp + 0x50], r12
000000018155F97A  48 89 7c 24 48                 mov      qword ptr [rsp + 0x48], rdi
000000018155F97F  4c 89 6c 24 40                 mov      qword ptr [rsp + 0x40], r13
000000018155F984  44 89 74 24 38                 mov      dword ptr [rsp + 0x38], r14d
000000018155F989  48 8d 85 f0 00 00 00           lea      rax, [rbp + 0xf0]
000000018155F990  48 89 44 24 30                 mov      qword ptr [rsp + 0x30], rax
000000018155F995  48 8d 05 3d e6 2c 03           lea      rax, [rip + 0x32ce63d]
000000018155F99C  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018155F9A1  48 8d 05 c9 b5 32 03           lea      rax, [rip + 0x332b5c9] ; OnDelayHandleRecallMsgNotify
000000018155F9A8  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018155F9AD  48 8d 0d 24 b6 d2 02           lea      rcx, [rip + 0x2d2b624]
000000018155F9B4  6a 02                          push     2
000000018155F9B6  5a                             pop      rdx
000000018155F9B7  41 b9 8b 06 00 00              mov      r9d, 0x68b
000000018155F9BD  e8 6b e1 36 ff                 call     0x1808cdb2d
000000018155F9C2  0f 57 c0                       xorps    xmm0, xmm0
000000018155F9C5  48 8d 8d 20 01 00 00           lea      rcx, [rbp + 0x120]
000000018155F9CC  0f 29 01                       movaps   xmmword ptr [rcx], xmm0
000000018155F9CF  48 83 61 10 00                 and      qword ptr [rcx + 0x10], 0
000000018155F9D4  48 8b 95 60 01 00 00           mov      rdx, qword ptr [rbp + 0x160]
000000018155F9DB  e8 04 51 c9 fe                 call     0x1801f4ae4
000000018155F9E0  48 8d 53 60                    lea      rdx, [rbx + 0x60]
000000018155F9E4  48 8d 4d f0                    lea      rcx, [rbp - 0x10]
000000018155F9E8  e8 87 8a ae fe                 call     0x180048474
000000018155F9ED  4c 8b 7d f0                    mov      r15, qword ptr [rbp - 0x10]
000000018155F9F1  48 8b 7d f8                    mov      rdi, qword ptr [rbp - 8]
000000018155F9F5  4c 89 bd 50 01 00 00           mov      qword ptr [rbp + 0x150], r15
000000018155F9FC  48 89 bd 58 01 00 00           mov      qword ptr [rbp + 0x158], rdi
000000018155FA03  48 85 ff                       test     rdi, rdi
000000018155FA06  74 1d                          je       0x18155fa25
000000018155FA08  f0 ff 47 10                    lock inc dword ptr [rdi + 0x10]
000000018155FA0C  4c 8d 75 f0                    lea      r14, [rbp - 0x10]
000000018155FA10  4c 89 f1                       mov      rcx, r14
000000018155FA13  e8 9a 23 aa fe                 call     0x180001db2
000000018155FA18  4d 89 3e                       mov      qword ptr [r14], r15
000000018155FA1B  49 89 7e 08                    mov      qword ptr [r14 + 8], rdi
000000018155FA1F  f0 ff 47 10                    lock inc dword ptr [rdi + 0x10]
000000018155FA23  eb 13                          jmp      0x18155fa38
000000018155FA25  4c 8d 75 f0                    lea      r14, [rbp - 0x10]
000000018155FA29  4c 89 f1                       mov      rcx, r14
000000018155FA2C  e8 81 23 aa fe                 call     0x180001db2
000000018155FA31  4d 89 3e                       mov      qword ptr [r14], r15
000000018155FA34  49 89 7e 08                    mov      qword ptr [r14 + 8], rdi
000000018155FA38  48 8d 4d 00                    lea      rcx, [rbp]
000000018155FA3C  48 89 f2                       mov      rdx, rsi
000000018155FA3F  e8 80 e2 ff ff                 call     0x18155dcc4
000000018155FA44  83 a5 6c 01 00 00 00           and      dword ptr [rbp + 0x16c], 0
000000018155FA4B  0f b6 43 08                    movzx    eax, byte ptr [rbx + 8]
000000018155FA4F  a8 01                          test     al, 1
000000018155FA51  75 08                          jne      0x18155fa5b
000000018155FA53  d1 e8                          shr      eax, 1
000000018155FA55  48 83 c3 09                    add      rbx, 9
000000018155FA59  eb 08                          jmp      0x18155fa63
000000018155FA5B  48 8b 43 10                    mov      rax, qword ptr [rbx + 0x10]
000000018155FA5F  48 8b 5b 18                    mov      rbx, qword ptr [rbx + 0x18]
000000018155FA63  48 8d 95 c8 00 00 00           lea      rdx, [rbp + 0xc8]
000000018155FA6A  48 89 1a                       mov      qword ptr [rdx], rbx
000000018155FA6D  48 89 42 08                    mov      qword ptr [rdx + 8], rax
000000018155FA71  48 8d 8d 38 01 00 00           lea      rcx, [rbp + 0x138]
000000018155FA78  e8 6f f9 cf fe                 call     0x18025f3ec
000000018155FA7D  48 8d 8d 08 01 00 00           lea      rcx, [rbp + 0x108]
000000018155FA84  e8 2d 41 aa fe                 call     0x180003bb6
000000018155FA89  e8 da fa cf fe                 call     0x18025f568
000000018155FA8E  84 c0                          test     al, al
000000018155FA90  75 56                          jne      0x18155fae8
000000018155FA92  48 8d 5d d8                    lea      rbx, [rbp - 0x28]
000000018155FA96  48 8d 95 38 01 00 00           lea      rdx, [rbp + 0x138]
000000018155FA9D  48 89 d9                       mov      rcx, rbx
000000018155FAA0  e8 8b f0 22 ff                 call     0x18078eb30
000000018155FAA5  4c 8d 35 26 c5 42 03           lea      r14, [rip + 0x342c526]
000000018155FAAC  6a 5c                          push     0x5c
000000018155FAAE  5a                             pop      rdx
000000018155FAAF  4c 89 f1                       mov      rcx, r14
000000018155FAB2  e8 39 c2 ac 02                 call     0x18402bcf0
000000018155FAB7  48 8d 50 01                    lea      rdx, [rax + 1]
000000018155FABB  48 85 c0                       test     rax, rax
000000018155FABE  49 0f 44 d6                    cmove    rdx, r14
000000018155FAC2  48 89 5c 24 28                 mov      qword ptr [rsp + 0x28], rbx
000000018155FAC7  48 8d 05 1b e7 4d 03           lea      rax, [rip + 0x34de71b]
000000018155FACE  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018155FAD3  4c 8d 0d eb 88 53 03           lea      r9, [rip + 0x35388eb]
000000018155FADA  6a 04                          push     4
000000018155FADC  59                             pop      rcx
000000018155FADD  41 b8 a0 01 00 00              mov      r8d, 0x1a0
000000018155FAE3  e8 c0 23 aa fe                 call     0x180001ea8
000000018155FAE8  48 8d 5e 18                    lea      rbx, [rsi + 0x18]
000000018155FAEC  48 83 bd 18 01 00 00 00        cmp      qword ptr [rbp + 0x118], 0
000000018155FAF4  0f 84 89 00 00 00              je       0x18155fb83
000000018155FAFA  48 8d bd 10 01 00 00           lea      rdi, [rbp + 0x110]
000000018155FB01  4c 8b 67 f8                    mov      r12, qword ptr [rdi - 8]
000000018155FB05  4c 8d b5 d8 00 00 00           lea      r14, [rbp + 0xd8]
000000018155FB0C  4c 8d bd 6c 01 00 00           lea      r15, [rbp + 0x16c]
000000018155FB13  4c 8d ad 20 01 00 00           lea      r13, [rbp + 0x120]
000000018155FB1A  49 39 fc                       cmp      r12, rdi
000000018155FB1D  0f 84 8e 00 00 00              je       0x18155fbb1
000000018155FB23  41 0f b6 44 24 20              movzx    eax, byte ptr [r12 + 0x20]
000000018155FB29  a8 01                          test     al, 1
000000018155FB2B  75 04                          jne      0x18155fb31
000000018155FB2D  d1 e8                          shr      eax, 1
000000018155FB2F  eb 05                          jmp      0x18155fb36
000000018155FB31  49 8b 44 24 28                 mov      rax, qword ptr [r12 + 0x28]
000000018155FB36  48 85 c0                       test     rax, rax
000000018155FB39  74 3b                          je       0x18155fb76
000000018155FB3B  4d 8d 44 24 20                 lea      r8, [r12 + 0x20]
000000018155FB40  4c 89 f1                       mov      rcx, r14
000000018155FB43  48 8d 95 38 01 00 00           lea      rdx, [rbp + 0x138]
000000018155FB4A  e8 35 fb cf fe                 call     0x18025f684
000000018155FB4F  48 8d 45 f0                    lea      rax, [rbp - 0x10]
000000018155FB53  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018155FB58  4c 89 7c 24 20                 mov      qword ptr [rsp + 0x20], r15
000000018155FB5D  4c 89 f1                       mov      rcx, r14
000000018155FB60  48 89 f2                       mov      rdx, rsi
000000018155FB63  49 89 d8                       mov      r8, rbx
000000018155FB66  4d 89 e9                       mov      r9, r13
000000018155FB69  e8 2e e4 00 00                 call     0x18156df9c
000000018155FB6E  4c 89 f1                       mov      rcx, r14
000000018155FB71  e8 8a f0 22 ff                 call     0x18078ec00
000000018155FB76  4c 89 e1                       mov      rcx, r12
000000018155FB79  e8 77 4a aa fe                 call     0x1800045f5
000000018155FB7E  49 89 c4                       mov      r12, rax
000000018155FB81  eb 97                          jmp      0x18155fb1a
000000018155FB83  48 8d 45 f0                    lea      rax, [rbp - 0x10]
000000018155FB87  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018155FB8C  48 8d 85 6c 01 00 00           lea      rax, [rbp + 0x16c]
000000018155FB93  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018155FB98  48 8d 8d 38 01 00 00           lea      rcx, [rbp + 0x138]
000000018155FB9F  4c 8d 8d 20 01 00 00           lea      r9, [rbp + 0x120]
000000018155FBA6  48 89 f2                       mov      rdx, rsi
000000018155FBA9  49 89 d8                       mov      r8, rbx
000000018155FBAC  e8 eb e3 00 00                 call     0x18156df9c
000000018155FBB1  48 8d 8d 08 01 00 00           lea      rcx, [rbp + 0x108]
000000018155FBB8  e8 65 4a aa fe                 call     0x180004622
000000018155FBBD  48 8d 8d 38 01 00 00           lea      rcx, [rbp + 0x138]
000000018155FBC4  e8 37 f0 22 ff                 call     0x18078ec00
000000018155FBC9  48 8d 4d f0                    lea      rcx, [rbp - 0x10]
000000018155FBCD  e8 42 e2 ff ff                 call     0x18155de14
000000018155FBD2  48 8d 8d 50 01 00 00           lea      rcx, [rbp + 0x150]
000000018155FBD9  e8 dc 43 aa fe                 call     0x180003fba
000000018155FBDE  48 8d 8d 20 01 00 00           lea      rcx, [rbp + 0x120]
000000018155FBE5  e8 4e 03 af fe                 call     0x18004ff38
000000018155FBEA  90                             nop      
000000018155FBEB  48 81 c4 f8 01 00 00           add      rsp, 0x1f8
000000018155FBF2  5b                             pop      rbx
000000018155FBF3  5f                             pop      rdi
000000018155FBF4  5e                             pop      rsi
000000018155FBF5  41 5c                          pop      r12
000000018155FBF7  41 5d                          pop      r13
000000018155FBF9  41 5e                          pop      r14
000000018155FBFB  41 5f                          pop      r15
000000018155FBFD  5d                             pop      rbp
000000018155FBFE  c3                             ret      
