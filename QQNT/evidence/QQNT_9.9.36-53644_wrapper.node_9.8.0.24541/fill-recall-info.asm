; pdata range 0x182748c8a .. 0x182748ec2 (exclusive)
; PE unwind range; not necessarily an entire source-level function.
0000000182748C8A  55                             push     rbp
0000000182748C8B  41 57                          push     r15
0000000182748C8D  41 56                          push     r14
0000000182748C8F  41 55                          push     r13
0000000182748C91  41 54                          push     r12
0000000182748C93  56                             push     rsi
0000000182748C94  57                             push     rdi
0000000182748C95  53                             push     rbx
0000000182748C96  48 81 ec 68 01 00 00           sub      rsp, 0x168
0000000182748C9D  48 8d ac 24 80 00 00 00        lea      rbp, [rsp + 0x80]
0000000182748CA5  48 c7 85 e0 00 00 00 fe ff ff ff mov      qword ptr [rbp + 0xe0], 0xfffffffffffffffe
0000000182748CB0  4c 89 c3                       mov      rbx, r8
0000000182748CB3  48 89 95 d8 00 00 00           mov      qword ptr [rbp + 0xd8], rdx
0000000182748CBA  49 89 ce                       mov      r14, rcx
0000000182748CBD  48 8d 7d 60                    lea      rdi, [rbp + 0x60]
0000000182748CC1  48 89 f9                       mov      rcx, rdi
0000000182748CC4  e8 11 96 c9 fd                 call     0x1803e22da
0000000182748CC9  c6 07 01                       mov      byte ptr [rdi], 1
0000000182748CCC  48 8d 7d 68                    lea      rdi, [rbp + 0x68]
0000000182748CD0  48 89 f9                       mov      rcx, rdi
0000000182748CD3  48 89 da                       mov      rdx, rbx
0000000182748CD6  e8 05 5b 03 fe                 call     0x18077e7e0
0000000182748CDB  80 7b 18 02                    cmp      byte ptr [rbx + 0x18], 2
0000000182748CDF  75 1d                          jne      0x182748cfe
0000000182748CE1  6a 02                          push     2
0000000182748CE3  58                             pop      rax
0000000182748CE4  48 8b 8d d8 00 00 00           mov      rcx, qword ptr [rbp + 0xd8]
0000000182748CEB  48 8b 89 f8 00 00 00           mov      rcx, qword ptr [rcx + 0xf8]
0000000182748CF2  48 89 8d 80 00 00 00           mov      qword ptr [rbp + 0x80], rcx
0000000182748CF9  e9 80 00 00 00                 jmp      0x182748d7e
0000000182748CFE  4c 8d 7d 30                    lea      r15, [rbp + 0x30]
0000000182748D02  4c 89 f9                       mov      rcx, r15
0000000182748D05  e8 76 d5 8b fd                 call     0x180006280
0000000182748D0A  c7 85 d0 00 00 00 8b 13 00 00  mov      dword ptr [rbp + 0xd0], 0x138b
0000000182748D14  41 0f b6 06                    movzx    eax, byte ptr [r14]
0000000182748D18  a8 01                          test     al, 1
0000000182748D1A  74 0a                          je       0x182748d26
0000000182748D1C  49 8b 46 08                    mov      rax, qword ptr [r14 + 8]
0000000182748D20  4d 8b 76 10                    mov      r14, qword ptr [r14 + 0x10]
0000000182748D24  eb 05                          jmp      0x182748d2b
0000000182748D26  d1 e8                          shr      eax, 1
0000000182748D28  49 ff c6                       inc      r14
0000000182748D2B  48 8d 4d 08                    lea      rcx, [rbp + 8]
0000000182748D2F  4c 89 31                       mov      qword ptr [rcx], r14
0000000182748D32  48 89 41 08                    mov      qword ptr [rcx + 8], rax
0000000182748D36  48 8d 15 7d 57 94 fd           lea      rdx, [rip - 0x26ba883]
0000000182748D3D  4c 8d 85 d0 00 00 00           lea      r8, [rbp + 0xd0]
0000000182748D44  4d 89 f9                       mov      r9, r15
0000000182748D47  e8 22 c1 aa fd                 call     0x1801f4e6e
0000000182748D4C  48 8b b5 d8 00 00 00           mov      rsi, qword ptr [rbp + 0xd8]
0000000182748D53  48 8d 56 40                    lea      rdx, [rsi + 0x40]
0000000182748D57  4c 8d 75 30                    lea      r14, [rbp + 0x30]
0000000182748D5B  4c 89 f1                       mov      rcx, r14
0000000182748D5E  e8 00 4e 8f fd                 call     0x18003db63
0000000182748D63  0f b6 c0                       movzx    eax, al
0000000182748D66  48 8b 44 c6 30                 mov      rax, qword ptr [rsi + rax*8 + 0x30]
0000000182748D6B  48 89 85 80 00 00 00           mov      qword ptr [rbp + 0x80], rax
0000000182748D72  4c 89 f1                       mov      rcx, r14
0000000182748D75  e8 86 44 03 fe                 call     0x18077d200
0000000182748D7A  0f b6 43 18                    movzx    eax, byte ptr [rbx + 0x18]
0000000182748D7E  4c 8d b5 90 00 00 00           lea      r14, [rbp + 0x90]
0000000182748D85  41 89 46 f8                    mov      dword ptr [r14 - 8], eax
0000000182748D89  48 8d 53 48                    lea      rdx, [rbx + 0x48]
0000000182748D8D  4c 89 f1                       mov      rcx, r14
0000000182748D90  e8 4b 5a 03 fe                 call     0x18077e7e0
0000000182748D95  4c 8b 7b 20                    mov      r15, qword ptr [rbx + 0x20]
0000000182748D99  4c 89 bd a8 00 00 00           mov      qword ptr [rbp + 0xa8], r15
0000000182748DA0  4c 8b 63 30                    mov      r12, qword ptr [rbx + 0x30]
0000000182748DA4  4c 89 a5 b0 00 00 00           mov      qword ptr [rbp + 0xb0], r12
0000000182748DAB  4c 8b 6b 40                    mov      r13, qword ptr [rbx + 0x40]
0000000182748DAF  4c 89 ad b8 00 00 00           mov      qword ptr [rbp + 0xb8], r13
0000000182748DB6  48 8b 73 28                    mov      rsi, qword ptr [rbx + 0x28]
0000000182748DBA  48 89 b5 c0 00 00 00           mov      qword ptr [rbp + 0xc0], rsi
0000000182748DC1  8a 9b c1 00 00 00              mov      bl, byte ptr [rbx + 0xc1]
0000000182748DC7  88 5d 61                       mov      byte ptr [rbp + 0x61], bl
0000000182748DCA  48 8d 4d 48                    lea      rcx, [rbp + 0x48]
0000000182748DCE  4c 89 f2                       mov      rdx, r14
0000000182748DD1  e8 5a 43 03 fe                 call     0x18077d130
0000000182748DD6  8b 85 88 00 00 00              mov      eax, dword ptr [rbp + 0x88]
0000000182748DDC  89 85 d4 00 00 00              mov      dword ptr [rbp + 0xd4], eax
0000000182748DE2  48 8b 85 80 00 00 00           mov      rax, qword ptr [rbp + 0x80]
0000000182748DE9  48 89 85 c8 00 00 00           mov      qword ptr [rbp + 0xc8], rax
0000000182748DF0  48 8d 4d 18                    lea      rcx, [rbp + 0x18]
0000000182748DF4  48 89 fa                       mov      rdx, rdi
0000000182748DF7  e8 34 43 03 fe                 call     0x18077d130
0000000182748DFC  44 8a 75 60                    mov      r14b, byte ptr [rbp + 0x60]
0000000182748E00  48 8d 3d c0 be 2d 02           lea      rdi, [rip + 0x22dbec0] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
0000000182748E07  6a 5c                          push     0x5c
0000000182748E09  5a                             pop      rdx
0000000182748E0A  48 89 f9                       mov      rcx, rdi
0000000182748E0D  e8 0e 3f 8b 01                 call     0x183ffcd20
0000000182748E12  4c 8d 40 01                    lea      r8, [rax + 1]
0000000182748E16  48 85 c0                       test     rax, rax
0000000182748E19  4c 0f 44 c7                    cmove    r8, rdi
0000000182748E1D  88 5c 24 78                    mov      byte ptr [rsp + 0x78], bl
0000000182748E21  48 89 74 24 70                 mov      qword ptr [rsp + 0x70], rsi
0000000182748E26  4c 89 6c 24 68                 mov      qword ptr [rsp + 0x68], r13
0000000182748E2B  4c 89 64 24 60                 mov      qword ptr [rsp + 0x60], r12
0000000182748E30  4c 89 7c 24 58                 mov      qword ptr [rsp + 0x58], r15
0000000182748E35  48 8d 45 48                    lea      rax, [rbp + 0x48]
0000000182748E39  48 89 44 24 50                 mov      qword ptr [rsp + 0x50], rax
0000000182748E3E  8b 85 d4 00 00 00              mov      eax, dword ptr [rbp + 0xd4]
0000000182748E44  89 44 24 48                    mov      dword ptr [rsp + 0x48], eax
0000000182748E48  48 8b 85 c8 00 00 00           mov      rax, qword ptr [rbp + 0xc8]
0000000182748E4F  48 89 44 24 40                 mov      qword ptr [rsp + 0x40], rax
0000000182748E54  48 8d 45 18                    lea      rax, [rbp + 0x18]
0000000182748E58  48 89 44 24 38                 mov      qword ptr [rsp + 0x38], rax
0000000182748E5D  44 88 74 24 30                 mov      byte ptr [rsp + 0x30], r14b
0000000182748E62  48 8d 05 90 68 07 02           lea      rax, [rip + 0x2076890] ; fill recall info: recall:{} peer_uid:{} peer_uin:{} chat_type:{} sender_uid:{} seq:{} random:{} time:{} c_seq:{} traceless:{}
0000000182748E69  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
0000000182748E6E  48 8d 05 3f fb 23 02           lea      rax, [rip + 0x223fb3f] ; FillRecallInfoToMsgNotifyInAndrSilence
0000000182748E75  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
0000000182748E7A  48 8d 0d ef bd cf 01           lea      rcx, [rip + 0x1cfbdef]
0000000182748E81  6a 02                          push     2
0000000182748E83  5a                             pop      rdx
0000000182748E84  6a 47                          push     0x47
0000000182748E86  41 59                          pop      r9
0000000182748E88  e8 ad 54 00 00                 call     0x18274e33a
0000000182748E8D  48 8b 8d d8 00 00 00           mov      rcx, qword ptr [rbp + 0xd8]
0000000182748E94  48 81 c1 f0 01 00 00           add      rcx, 0x1f0
0000000182748E9B  48 8d 55 60                    lea      rdx, [rbp + 0x60]
0000000182748E9F  e8 72 94 c9 fd                 call     0x1803e2316
0000000182748EA4  48 8d 4d 60                    lea      rcx, [rbp + 0x60]
0000000182748EA8  e8 f5 21 92 fd                 call     0x18006b0a2
0000000182748EAD  90                             nop      
0000000182748EAE  48 81 c4 68 01 00 00           add      rsp, 0x168
0000000182748EB5  5b                             pop      rbx
0000000182748EB6  5f                             pop      rdi
0000000182748EB7  5e                             pop      rsi
0000000182748EB8  41 5c                          pop      r12
0000000182748EBA  41 5d                          pop      r13
0000000182748EBC  41 5e                          pop      r14
0000000182748EBE  41 5f                          pop      r15
0000000182748EC0  5d                             pop      rbp
0000000182748EC1  c3                             ret      
