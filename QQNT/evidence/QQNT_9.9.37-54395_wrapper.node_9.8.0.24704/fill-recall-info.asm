; pdata range 0x182772b32 .. 0x182772d6a (exclusive)
; PE unwind range; not necessarily an entire source-level function.
0000000182772B32  55                             push     rbp
0000000182772B33  41 57                          push     r15
0000000182772B35  41 56                          push     r14
0000000182772B37  41 55                          push     r13
0000000182772B39  41 54                          push     r12
0000000182772B3B  56                             push     rsi
0000000182772B3C  57                             push     rdi
0000000182772B3D  53                             push     rbx
0000000182772B3E  48 81 ec 68 01 00 00           sub      rsp, 0x168
0000000182772B45  48 8d ac 24 80 00 00 00        lea      rbp, [rsp + 0x80]
0000000182772B4D  48 c7 85 e0 00 00 00 fe ff ff ff mov      qword ptr [rbp + 0xe0], 0xfffffffffffffffe
0000000182772B58  4c 89 c3                       mov      rbx, r8
0000000182772B5B  48 89 95 d8 00 00 00           mov      qword ptr [rbp + 0xd8], rdx
0000000182772B62  49 89 ce                       mov      r14, rcx
0000000182772B65  48 8d 7d 60                    lea      rdi, [rbp + 0x60]
0000000182772B69  48 89 f9                       mov      rcx, rdi
0000000182772B6C  e8 ad 55 c7 fd                 call     0x1803e811e
0000000182772B71  c6 07 01                       mov      byte ptr [rdi], 1
0000000182772B74  48 8d 7d 68                    lea      rdi, [rbp + 0x68]
0000000182772B78  48 89 f9                       mov      rcx, rdi
0000000182772B7B  48 89 da                       mov      rdx, rbx
0000000182772B7E  e8 5d d6 01 fe                 call     0x1807901e0
0000000182772B83  80 7b 18 02                    cmp      byte ptr [rbx + 0x18], 2
0000000182772B87  75 1d                          jne      0x182772ba6
0000000182772B89  6a 02                          push     2
0000000182772B8B  58                             pop      rax
0000000182772B8C  48 8b 8d d8 00 00 00           mov      rcx, qword ptr [rbp + 0xd8]
0000000182772B93  48 8b 89 f8 00 00 00           mov      rcx, qword ptr [rcx + 0xf8]
0000000182772B9A  48 89 8d 80 00 00 00           mov      qword ptr [rbp + 0x80], rcx
0000000182772BA1  e9 80 00 00 00                 jmp      0x182772c26
0000000182772BA6  4c 8d 7d 30                    lea      r15, [rbp + 0x30]
0000000182772BAA  4c 89 f9                       mov      rcx, r15
0000000182772BAD  e8 ce 36 89 fd                 call     0x180006280
0000000182772BB2  c7 85 d0 00 00 00 8b 13 00 00  mov      dword ptr [rbp + 0xd0], 0x138b
0000000182772BBC  41 0f b6 06                    movzx    eax, byte ptr [r14]
0000000182772BC0  a8 01                          test     al, 1
0000000182772BC2  74 0a                          je       0x182772bce
0000000182772BC4  49 8b 46 08                    mov      rax, qword ptr [r14 + 8]
0000000182772BC8  4d 8b 76 10                    mov      r14, qword ptr [r14 + 0x10]
0000000182772BCC  eb 05                          jmp      0x182772bd3
0000000182772BCE  d1 e8                          shr      eax, 1
0000000182772BD0  49 ff c6                       inc      r14
0000000182772BD3  48 8d 4d 08                    lea      rcx, [rbp + 8]
0000000182772BD7  4c 89 31                       mov      qword ptr [rcx], r14
0000000182772BDA  48 89 41 08                    mov      qword ptr [rcx + 8], rax
0000000182772BDE  48 8d 15 85 f7 91 fd           lea      rdx, [rip - 0x26e087b]
0000000182772BE5  4c 8d 85 d0 00 00 00           lea      r8, [rbp + 0xd0]
0000000182772BEC  4d 89 f9                       mov      r9, r15
0000000182772BEF  e8 8a 61 a8 fd                 call     0x1801f8d7e
0000000182772BF4  48 8b b5 d8 00 00 00           mov      rsi, qword ptr [rbp + 0xd8]
0000000182772BFB  48 8d 56 40                    lea      rdx, [rsi + 0x40]
0000000182772BFF  4c 8d 75 30                    lea      r14, [rbp + 0x30]
0000000182772C03  4c 89 f1                       mov      rcx, r14
0000000182772C06  e8 08 cb 8c fd                 call     0x18003f713
0000000182772C0B  0f b6 c0                       movzx    eax, al
0000000182772C0E  48 8b 44 c6 30                 mov      rax, qword ptr [rsi + rax*8 + 0x30]
0000000182772C13  48 89 85 80 00 00 00           mov      qword ptr [rbp + 0x80], rax
0000000182772C1A  4c 89 f1                       mov      rcx, r14
0000000182772C1D  e8 de bf 01 fe                 call     0x18078ec00
0000000182772C22  0f b6 43 18                    movzx    eax, byte ptr [rbx + 0x18]
0000000182772C26  4c 8d b5 90 00 00 00           lea      r14, [rbp + 0x90]
0000000182772C2D  41 89 46 f8                    mov      dword ptr [r14 - 8], eax
0000000182772C31  48 8d 53 48                    lea      rdx, [rbx + 0x48]
0000000182772C35  4c 89 f1                       mov      rcx, r14
0000000182772C38  e8 a3 d5 01 fe                 call     0x1807901e0
0000000182772C3D  4c 8b 7b 20                    mov      r15, qword ptr [rbx + 0x20]
0000000182772C41  4c 89 bd a8 00 00 00           mov      qword ptr [rbp + 0xa8], r15
0000000182772C48  4c 8b 63 30                    mov      r12, qword ptr [rbx + 0x30]
0000000182772C4C  4c 89 a5 b0 00 00 00           mov      qword ptr [rbp + 0xb0], r12
0000000182772C53  4c 8b 6b 40                    mov      r13, qword ptr [rbx + 0x40]
0000000182772C57  4c 89 ad b8 00 00 00           mov      qword ptr [rbp + 0xb8], r13
0000000182772C5E  48 8b 73 28                    mov      rsi, qword ptr [rbx + 0x28]
0000000182772C62  48 89 b5 c0 00 00 00           mov      qword ptr [rbp + 0xc0], rsi
0000000182772C69  8a 9b c1 00 00 00              mov      bl, byte ptr [rbx + 0xc1]
0000000182772C6F  88 5d 61                       mov      byte ptr [rbp + 0x61], bl
0000000182772C72  48 8d 4d 48                    lea      rcx, [rbp + 0x48]
0000000182772C76  4c 89 f2                       mov      rdx, r14
0000000182772C79  e8 b2 be 01 fe                 call     0x18078eb30
0000000182772C7E  8b 85 88 00 00 00              mov      eax, dword ptr [rbp + 0x88]
0000000182772C84  89 85 d4 00 00 00              mov      dword ptr [rbp + 0xd4], eax
0000000182772C8A  48 8b 85 80 00 00 00           mov      rax, qword ptr [rbp + 0x80]
0000000182772C91  48 89 85 c8 00 00 00           mov      qword ptr [rbp + 0xc8], rax
0000000182772C98  48 8d 4d 18                    lea      rcx, [rbp + 0x18]
0000000182772C9C  48 89 fa                       mov      rdx, rdi
0000000182772C9F  e8 8c be 01 fe                 call     0x18078eb30
0000000182772CA4  44 8a 75 60                    mov      r14b, byte ptr [rbp + 0x60]
0000000182772CA8  48 8d 3d 0c 70 2e 02           lea      rdi, [rip + 0x22e700c] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
0000000182772CAF  6a 5c                          push     0x5c
0000000182772CB1  5a                             pop      rdx
0000000182772CB2  48 89 f9                       mov      rcx, rdi
0000000182772CB5  e8 36 90 8b 01                 call     0x18402bcf0
0000000182772CBA  4c 8d 40 01                    lea      r8, [rax + 1]
0000000182772CBE  48 85 c0                       test     rax, rax
0000000182772CC1  4c 0f 44 c7                    cmove    r8, rdi
0000000182772CC5  88 5c 24 78                    mov      byte ptr [rsp + 0x78], bl
0000000182772CC9  48 89 74 24 70                 mov      qword ptr [rsp + 0x70], rsi
0000000182772CCE  4c 89 6c 24 68                 mov      qword ptr [rsp + 0x68], r13
0000000182772CD3  4c 89 64 24 60                 mov      qword ptr [rsp + 0x60], r12
0000000182772CD8  4c 89 7c 24 58                 mov      qword ptr [rsp + 0x58], r15
0000000182772CDD  48 8d 45 48                    lea      rax, [rbp + 0x48]
0000000182772CE1  48 89 44 24 50                 mov      qword ptr [rsp + 0x50], rax
0000000182772CE6  8b 85 d4 00 00 00              mov      eax, dword ptr [rbp + 0xd4]
0000000182772CEC  89 44 24 48                    mov      dword ptr [rsp + 0x48], eax
0000000182772CF0  48 8b 85 c8 00 00 00           mov      rax, qword ptr [rbp + 0xc8]
0000000182772CF7  48 89 44 24 40                 mov      qword ptr [rsp + 0x40], rax
0000000182772CFC  48 8d 45 18                    lea      rax, [rbp + 0x18]
0000000182772D00  48 89 44 24 38                 mov      qword ptr [rsp + 0x38], rax
0000000182772D05  44 88 74 24 30                 mov      byte ptr [rsp + 0x30], r14b
0000000182772D0A  48 8d 05 69 f0 07 02           lea      rax, [rip + 0x207f069] ; fill recall info: recall:{} peer_uid:{} peer_uin:{} chat_type:{} sender_uid:{} seq:{} random:{} time:{} c_seq:{} traceless:{}
0000000182772D11  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
0000000182772D16  48 8d 05 65 a2 24 02           lea      rax, [rip + 0x224a265] ; FillRecallInfoToMsgNotifyInAndrSilence
0000000182772D1D  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
0000000182772D22  48 8d 0d 47 2f d0 01           lea      rcx, [rip + 0x1d02f47]
0000000182772D29  6a 02                          push     2
0000000182772D2B  5a                             pop      rdx
0000000182772D2C  6a 47                          push     0x47
0000000182772D2E  41 59                          pop      r9
0000000182772D30  e8 ad 54 00 00                 call     0x1827781e2
0000000182772D35  48 8b 8d d8 00 00 00           mov      rcx, qword ptr [rbp + 0xd8]
0000000182772D3C  48 81 c1 f0 01 00 00           add      rcx, 0x1f0
0000000182772D43  48 8d 55 60                    lea      rdx, [rbp + 0x60]
0000000182772D47  e8 0e 54 c7 fd                 call     0x1803e815a
0000000182772D4C  48 8d 4d 60                    lea      rcx, [rbp + 0x60]
0000000182772D50  e8 09 c2 8f fd                 call     0x18006ef5e
0000000182772D55  90                             nop      
0000000182772D56  48 81 c4 68 01 00 00           add      rsp, 0x168
0000000182772D5D  5b                             pop      rbx
0000000182772D5E  5f                             pop      rdi
0000000182772D5F  5e                             pop      rsi
0000000182772D60  41 5c                          pop      r12
0000000182772D62  41 5d                          pop      r13
0000000182772D64  41 5e                          pop      r14
0000000182772D66  41 5f                          pop      r15
0000000182772D68  5d                             pop      rbp
0000000182772D69  c3                             ret      
