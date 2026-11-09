; pdata range 0x18274c86e .. 0x18274ce94 (exclusive)
; PE unwind range; not necessarily an entire source-level function.
000000018274C86E  55                             push     rbp
000000018274C86F  41 56                          push     r14
000000018274C871  56                             push     rsi
000000018274C872  57                             push     rdi
000000018274C873  53                             push     rbx
000000018274C874  48 81 ec 00 01 00 00           sub      rsp, 0x100
000000018274C87B  48 8d ac 24 80 00 00 00        lea      rbp, [rsp + 0x80]
000000018274C883  48 c7 45 78 fe ff ff ff        mov      qword ptr [rbp + 0x78], 0xfffffffffffffffe
000000018274C88B  48 89 ce                       mov      rsi, rcx
000000018274C88E  44 8a b5 d0 00 00 00           mov      r14b, byte ptr [rbp + 0xd0]
000000018274C895  48 81 fa 10 02 00 00           cmp      rdx, 0x210
000000018274C89C  0f 85 db 00 00 00              jne      0x18274c97d
000000018274C8A2  4c 89 cf                       mov      rdi, r9
000000018274C8A5  49 8b 09                       mov      rcx, qword ptr [r9]
000000018274C8A8  48 85 c9                       test     rcx, rcx
000000018274C8AB  0f 84 ae 01 00 00              je       0x18274ca5f
000000018274C8B1  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274C8B5  48 83 c1 08                    add      rcx, 8
000000018274C8B9  6a 01                          push     1
000000018274C8BB  5a                             pop      rdx
000000018274C8BC  ff 90 28 01 00 00              call     qword ptr [rax + 0x128]
000000018274C8C2  84 c0                          test     al, al
000000018274C8C4  0f 84 29 02 00 00              je       0x18274caf3
000000018274C8CA  48 8b 0f                       mov      rcx, qword ptr [rdi]
000000018274C8CD  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274C8D1  48 83 c1 08                    add      rcx, 8
000000018274C8D5  48 8d 55 40                    lea      rdx, [rbp + 0x40]
000000018274C8D9  6a 01                          push     1
000000018274C8DB  41 58                          pop      r8
000000018274C8DD  ff 50 68                       call     qword ptr [rax + 0x68]
000000018274C8E0  48 8b 0f                       mov      rcx, qword ptr [rdi]
000000018274C8E3  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274C8E7  48 83 c1 08                    add      rcx, 8
000000018274C8EB  48 8d 55 f8                    lea      rdx, [rbp - 8]
000000018274C8EF  6a 02                          push     2
000000018274C8F1  41 58                          pop      r8
000000018274C8F3  ff 50 68                       call     qword ptr [rax + 0x68]
000000018274C8F6  48 8b 0f                       mov      rcx, qword ptr [rdi]
000000018274C8F9  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274C8FD  48 83 c1 08                    add      rcx, 8
000000018274C901  6a 04                          push     4
000000018274C903  5a                             pop      rdx
000000018274C904  ff 50 50                       call     qword ptr [rax + 0x50]
000000018274C907  48 89 45 c0                    mov      qword ptr [rbp - 0x40], rax
000000018274C90B  48 8b 0f                       mov      rcx, qword ptr [rdi]
000000018274C90E  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274C912  48 83 c1 08                    add      rcx, 8
000000018274C916  6a 05                          push     5
000000018274C918  5a                             pop      rdx
000000018274C919  ff 50 50                       call     qword ptr [rax + 0x50]
000000018274C91C  48 89 45 10                    mov      qword ptr [rbp + 0x10], rax
000000018274C920  48 8b 0f                       mov      rcx, qword ptr [rdi]
000000018274C923  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274C927  48 83 c1 08                    add      rcx, 8
000000018274C92B  48 8d 55 28                    lea      rdx, [rbp + 0x28]
000000018274C92F  6a 03                          push     3
000000018274C931  41 58                          pop      r8
000000018274C933  ff 50 68                       call     qword ptr [rax + 0x68]
000000018274C936  44 88 74 24 28                 mov      byte ptr [rsp + 0x28], r14b
000000018274C93B  48 8d 45 10                    lea      rax, [rbp + 0x10]
000000018274C93F  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018274C944  c6 44 24 30 00                 mov      byte ptr [rsp + 0x30], 0
000000018274C949  48 8d 55 28                    lea      rdx, [rbp + 0x28]
000000018274C94D  4c 8d 45 40                    lea      r8, [rbp + 0x40]
000000018274C951  4c 8d 4d c0                    lea      r9, [rbp - 0x40]
000000018274C955  48 89 f1                       mov      rcx, rsi
000000018274C958  e8 1b 07 00 00                 call     0x18274d078
000000018274C95D  48 8d 4d 28                    lea      rcx, [rbp + 0x28]
000000018274C961  e8 9a 08 03 fe                 call     0x18077d200
000000018274C966  48 8d 4d f8                    lea      rcx, [rbp - 8]
000000018274C96A  e8 91 08 03 fe                 call     0x18077d200
000000018274C96F  48 8d 4d 40                    lea      rcx, [rbp + 0x40]
000000018274C973  e8 88 08 03 fe                 call     0x18077d200
000000018274C978  e9 07 02 00 00                 jmp      0x18274cb84
000000018274C97D  4c 89 c3                       mov      rbx, r8
000000018274C980  49 8b 08                       mov      rcx, qword ptr [r8]
000000018274C983  48 85 c9                       test     rcx, rcx
000000018274C986  0f 84 1d 01 00 00              je       0x18274caa9
000000018274C98C  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274C990  48 83 c1 08                    add      rcx, 8
000000018274C994  6a 03                          push     3
000000018274C996  5a                             pop      rdx
000000018274C997  ff 90 28 01 00 00              call     qword ptr [rax + 0x128]
000000018274C99D  84 c0                          test     al, al
000000018274C99F  0f 84 95 01 00 00              je       0x18274cb3a
000000018274C9A5  48 8b 0b                       mov      rcx, qword ptr [rbx]
000000018274C9A8  48 8b 01                       mov      rax, qword ptr [rcx]
000000018274C9AB  48 8d 7d d8                    lea      rdi, [rbp - 0x28]
000000018274C9AF  6a 03                          push     3
000000018274C9B1  41 58                          pop      r8
000000018274C9B3  48 89 fa                       mov      rdx, rdi
000000018274C9B6  ff 90 18 01 00 00              call     qword ptr [rax + 0x118]
000000018274C9BC  48 8b 0f                       mov      rcx, qword ptr [rdi]
000000018274C9BF  48 85 c9                       test     rcx, rcx
000000018274C9C2  0f 84 cb 01 00 00              je       0x18274cb93
000000018274C9C8  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274C9CC  48 83 c1 08                    add      rcx, 8
000000018274C9D0  6a 02                          push     2
000000018274C9D2  5a                             pop      rdx
000000018274C9D3  ff 90 28 01 00 00              call     qword ptr [rax + 0x128]
000000018274C9D9  84 c0                          test     al, al
000000018274C9DB  0f 84 01 02 00 00              je       0x18274cbe2
000000018274C9E1  48 8b 4d d8                    mov      rcx, qword ptr [rbp - 0x28]
000000018274C9E5  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274C9E9  48 83 c1 08                    add      rcx, 8
000000018274C9ED  48 8d 55 40                    lea      rdx, [rbp + 0x40]
000000018274C9F1  6a 02                          push     2
000000018274C9F3  41 58                          pop      r8
000000018274C9F5  ff 50 70                       call     qword ptr [rax + 0x70]
000000018274C9F8  48 8b 55 40                    mov      rdx, qword ptr [rbp + 0x40]
000000018274C9FC  4c 8b 45 48                    mov      r8, qword ptr [rbp + 0x48]
000000018274CA00  4c 89 c0                       mov      rax, r8
000000018274CA03  48 29 d0                       sub      rax, rdx
000000018274CA06  48 83 f8 07                    cmp      rax, 7
000000018274CA0A  0f 87 21 02 00 00              ja       0x18274cc31
000000018274CA10  48 8d 35 b0 82 2d 02           lea      rsi, [rip + 0x22d82b0] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
000000018274CA17  6a 5c                          push     0x5c
000000018274CA19  5a                             pop      rdx
000000018274CA1A  48 89 f1                       mov      rcx, rsi
000000018274CA1D  e8 fe 02 8b 01                 call     0x183ffcd20
000000018274CA22  4c 8d 40 01                    lea      r8, [rax + 1]
000000018274CA26  48 85 c0                       test     rax, rax
000000018274CA29  4c 0f 44 c6                    cmove    r8, rsi
000000018274CA2D  48 8d 05 b6 6e 19 02           lea      rax, [rip + 0x2196eb6] ; on recall group PaiYiPai sys msg! im_msg_body::MsgBody::kBytesMsgContent is error
000000018274CA34  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018274CA39  48 8d 05 2f dc 20 02           lea      rax, [rip + 0x220dc2f] ; HandleRecallSysMsg
000000018274CA40  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018274CA45  48 8d 0d 24 82 cf 01           lea      rcx, [rip + 0x1cf8224]
000000018274CA4C  6a 04                          push     4
000000018274CA4E  5a                             pop      rdx
000000018274CA4F  41 b9 f0 02 00 00              mov      r9d, 0x2f0
000000018274CA55  e8 d0 6a 8b fd                 call     0x18000352a
000000018274CA5A  e9 1e 04 00 00                 jmp      0x18274ce7d
000000018274CA5F  48 8d 35 61 82 2d 02           lea      rsi, [rip + 0x22d8261] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
000000018274CA66  6a 5c                          push     0x5c
000000018274CA68  5a                             pop      rdx
000000018274CA69  48 89 f1                       mov      rcx, rsi
000000018274CA6C  e8 af 02 8b 01                 call     0x183ffcd20
000000018274CA71  4c 8d 40 01                    lea      r8, [rax + 1]
000000018274CA75  48 85 c0                       test     rax, rax
000000018274CA78  4c 0f 44 c6                    cmove    r8, rsi
000000018274CA7C  48 8d 05 04 3f 12 02           lea      rax, [rip + 0x2123f04] ; on recall c2c PaiYiPai sys msg! no content
000000018274CA83  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018274CA88  48 8d 05 e0 db 20 02           lea      rax, [rip + 0x220dbe0] ; HandleRecallSysMsg
000000018274CA8F  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018274CA94  48 8d 0d d5 81 cf 01           lea      rcx, [rip + 0x1cf81d5]
000000018274CA9B  6a 04                          push     4
000000018274CA9D  5a                             pop      rdx
000000018274CA9E  41 b9 ce 02 00 00              mov      r9d, 0x2ce
000000018274CAA4  e9 d6 00 00 00                 jmp      0x18274cb7f
000000018274CAA9  48 8d 35 17 82 2d 02           lea      rsi, [rip + 0x22d8217] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
000000018274CAB0  6a 5c                          push     0x5c
000000018274CAB2  5a                             pop      rdx
000000018274CAB3  48 89 f1                       mov      rcx, rsi
000000018274CAB6  e8 65 02 8b 01                 call     0x183ffcd20
000000018274CABB  4c 8d 40 01                    lea      r8, [rax + 1]
000000018274CABF  48 85 c0                       test     rax, rax
000000018274CAC2  4c 0f 44 c6                    cmove    r8, rsi
000000018274CAC6  48 8d 05 a6 50 1f 02           lea      rax, [rip + 0x21f50a6] ; on recall group PaiYiPai sys msg! sys_msg is null
000000018274CACD  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018274CAD2  48 8d 05 96 db 20 02           lea      rax, [rip + 0x220db96] ; HandleRecallSysMsg
000000018274CAD9  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018274CADE  48 8d 0d 8b 81 cf 01           lea      rcx, [rip + 0x1cf818b]
000000018274CAE5  6a 04                          push     4
000000018274CAE7  5a                             pop      rdx
000000018274CAE8  41 b9 de 02 00 00              mov      r9d, 0x2de
000000018274CAEE  e9 8c 00 00 00                 jmp      0x18274cb7f
000000018274CAF3  48 8d 35 cd 81 2d 02           lea      rsi, [rip + 0x22d81cd] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
000000018274CAFA  6a 5c                          push     0x5c
000000018274CAFC  5a                             pop      rdx
000000018274CAFD  48 89 f1                       mov      rcx, rsi
000000018274CB00  e8 1b 02 8b 01                 call     0x183ffcd20
000000018274CB05  4c 8d 40 01                    lea      r8, [rax + 1]
000000018274CB09  48 85 c0                       test     rax, rax
000000018274CB0C  4c 0f 44 c6                    cmove    r8, rsi
000000018274CB10  48 8d 05 7a 03 18 02           lea      rax, [rip + 0x218037a] ; on recall c2c PaiYiPai sys msg! no msg infos
000000018274CB17  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018274CB1C  48 8d 05 4c db 20 02           lea      rax, [rip + 0x220db4c] ; HandleRecallSysMsg
000000018274CB23  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018274CB28  48 8d 0d 41 81 cf 01           lea      rcx, [rip + 0x1cf8141]
000000018274CB2F  6a 04                          push     4
000000018274CB31  5a                             pop      rdx
000000018274CB32  41 b9 d2 02 00 00              mov      r9d, 0x2d2
000000018274CB38  eb 45                          jmp      0x18274cb7f
000000018274CB3A  48 8d 35 86 81 2d 02           lea      rsi, [rip + 0x22d8186] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
000000018274CB41  6a 5c                          push     0x5c
000000018274CB43  5a                             pop      rdx
000000018274CB44  48 89 f1                       mov      rcx, rsi
000000018274CB47  e8 d4 01 8b 01                 call     0x183ffcd20
000000018274CB4C  4c 8d 40 01                    lea      r8, [rax + 1]
000000018274CB50  48 85 c0                       test     rax, rax
000000018274CB53  4c 0f 44 c6                    cmove    r8, rsi
000000018274CB57  48 8d 05 fb cd 10 02           lea      rax, [rip + 0x210cdfb] ; on recall group PaiYiPai sys msg! hasn't msg_common::Msg::kBody
000000018274CB5E  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018274CB63  48 8d 05 05 db 20 02           lea      rax, [rip + 0x220db05] ; HandleRecallSysMsg
000000018274CB6A  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018274CB6F  48 8d 0d fa 80 cf 01           lea      rcx, [rip + 0x1cf80fa]
000000018274CB76  6a 04                          push     4
000000018274CB78  5a                             pop      rdx
000000018274CB79  41 b9 e2 02 00 00              mov      r9d, 0x2e2
000000018274CB7F  e8 a6 69 8b fd                 call     0x18000352a
000000018274CB84  90                             nop      
000000018274CB85  48 81 c4 00 01 00 00           add      rsp, 0x100
000000018274CB8C  5b                             pop      rbx
000000018274CB8D  5f                             pop      rdi
000000018274CB8E  5e                             pop      rsi
000000018274CB8F  41 5e                          pop      r14
000000018274CB91  5d                             pop      rbp
000000018274CB92  c3                             ret      
000000018274CB93  48 8d 35 2d 81 2d 02           lea      rsi, [rip + 0x22d812d] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
000000018274CB9A  6a 5c                          push     0x5c
000000018274CB9C  5a                             pop      rdx
000000018274CB9D  48 89 f1                       mov      rcx, rsi
000000018274CBA0  e8 7b 01 8b 01                 call     0x183ffcd20
000000018274CBA5  4c 8d 40 01                    lea      r8, [rax + 1]
000000018274CBA9  48 85 c0                       test     rax, rax
000000018274CBAC  4c 0f 44 c6                    cmove    r8, rsi
000000018274CBB0  48 8d 05 78 84 1f 02           lea      rax, [rip + 0x21f8478] ; on recall group PaiYiPai sys msg! msg_common::Msg::kBody = null
000000018274CBB7  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018274CBBC  48 8d 05 ac da 20 02           lea      rax, [rip + 0x220daac] ; HandleRecallSysMsg
000000018274CBC3  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018274CBC8  48 8d 0d a1 80 cf 01           lea      rcx, [rip + 0x1cf80a1]
000000018274CBCF  6a 04                          push     4
000000018274CBD1  5a                             pop      rdx
000000018274CBD2  41 b9 e7 02 00 00              mov      r9d, 0x2e7
000000018274CBD8  e8 4d 69 8b fd                 call     0x18000352a
000000018274CBDD  e9 a4 02 00 00                 jmp      0x18274ce86
000000018274CBE2  48 8d 35 de 80 2d 02           lea      rsi, [rip + 0x22d80de] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
000000018274CBE9  6a 5c                          push     0x5c
000000018274CBEB  5a                             pop      rdx
000000018274CBEC  48 89 f1                       mov      rcx, rsi
000000018274CBEF  e8 2c 01 8b 01                 call     0x183ffcd20
000000018274CBF4  4c 8d 40 01                    lea      r8, [rax + 1]
000000018274CBF8  48 85 c0                       test     rax, rax
000000018274CBFB  4c 0f 44 c6                    cmove    r8, rsi
000000018274CBFF  48 8d 05 ba 47 12 02           lea      rax, [rip + 0x21247ba] ; on recall group PaiYiPai sys msg! hasn't im_msg_body::MsgBody::kBytesMsgContent
000000018274CC06  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018274CC0B  48 8d 05 5d da 20 02           lea      rax, [rip + 0x220da5d] ; HandleRecallSysMsg
000000018274CC12  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018274CC17  48 8d 0d 52 80 cf 01           lea      rcx, [rip + 0x1cf8052]
000000018274CC1E  6a 04                          push     4
000000018274CC20  5a                             pop      rdx
000000018274CC21  41 b9 eb 02 00 00              mov      r9d, 0x2eb
000000018274CC27  e8 fe 68 8b fd                 call     0x18000352a
000000018274CC2C  e9 55 02 00 00                 jmp      0x18274ce86
000000018274CC31  48 83 c2 07                    add      rdx, 7
000000018274CC35  48 8d 4d f8                    lea      rcx, [rbp - 8]
000000018274CC39  e8 0c 67 8b fd                 call     0x18000334a
000000018274CC3E  48 8d 4d 58                    lea      rcx, [rbp + 0x58]
000000018274CC42  e8 19 82 63 fe                 call     0x180d84e60
000000018274CC47  48 8b 4d 58                    mov      rcx, qword ptr [rbp + 0x58]
000000018274CC4B  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274CC4F  48 83 c1 08                    add      rcx, 8
000000018274CC53  48 8d 55 f8                    lea      rdx, [rbp - 8]
000000018274CC57  ff 90 10 01 00 00              call     qword ptr [rax + 0x110]
000000018274CC5D  84 c0                          test     al, al
000000018274CC5F  0f 84 06 01 00 00              je       0x18274cd6b
000000018274CC65  48 8b 4d 58                    mov      rcx, qword ptr [rbp + 0x58]
000000018274CC69  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274CC6D  48 83 c1 08                    add      rcx, 8
000000018274CC71  6a 01                          push     1
000000018274CC73  5a                             pop      rdx
000000018274CC74  ff 50 50                       call     qword ptr [rax + 0x50]
000000018274CC77  48 83 f8 20                    cmp      rax, 0x20
000000018274CC7B  0f 85 ea 01 00 00              jne      0x18274ce6b
000000018274CC81  48 8b 4d 58                    mov      rcx, qword ptr [rbp + 0x58]
000000018274CC85  48 8b 01                       mov      rax, qword ptr [rcx]
000000018274CC88  48 8d 55 68                    lea      rdx, [rbp + 0x68]
000000018274CC8C  6a 28                          push     0x28
000000018274CC8E  41 58                          pop      r8
000000018274CC90  ff 90 18 01 00 00              call     qword ptr [rax + 0x118]
000000018274CC96  48 8b 4d 68                    mov      rcx, qword ptr [rbp + 0x68]
000000018274CC9A  48 85 c9                       test     rcx, rcx
000000018274CC9D  0f 84 17 01 00 00              je       0x18274cdba
000000018274CCA3  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274CCA7  48 83 c1 08                    add      rcx, 8
000000018274CCAB  48 8d 55 28                    lea      rdx, [rbp + 0x28]
000000018274CCAF  6a 01                          push     1
000000018274CCB1  41 58                          pop      r8
000000018274CCB3  ff 50 68                       call     qword ptr [rax + 0x68]
000000018274CCB6  48 8b 4d 68                    mov      rcx, qword ptr [rbp + 0x68]
000000018274CCBA  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274CCBE  48 83 c1 08                    add      rcx, 8
000000018274CCC2  48 8d 55 c0                    lea      rdx, [rbp - 0x40]
000000018274CCC6  6a 02                          push     2
000000018274CCC8  41 58                          pop      r8
000000018274CCCA  ff 50 68                       call     qword ptr [rax + 0x68]
000000018274CCCD  48 8b 4d 68                    mov      rcx, qword ptr [rbp + 0x68]
000000018274CCD1  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274CCD5  48 83 c1 08                    add      rcx, 8
000000018274CCD9  6a 04                          push     4
000000018274CCDB  5a                             pop      rdx
000000018274CCDC  ff 50 50                       call     qword ptr [rax + 0x50]
000000018274CCDF  48 89 45 e8                    mov      qword ptr [rbp - 0x18], rax
000000018274CCE3  48 8b 4d 68                    mov      rcx, qword ptr [rbp + 0x68]
000000018274CCE7  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274CCEB  48 83 c1 08                    add      rcx, 8
000000018274CCEF  6a 05                          push     5
000000018274CCF1  5a                             pop      rdx
000000018274CCF2  ff 50 50                       call     qword ptr [rax + 0x50]
000000018274CCF5  48 89 45 f0                    mov      qword ptr [rbp - 0x10], rax
000000018274CCF9  48 8b 4d 68                    mov      rcx, qword ptr [rbp + 0x68]
000000018274CCFD  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274CD01  48 83 c1 08                    add      rcx, 8
000000018274CD05  6a 03                          push     3
000000018274CD07  5a                             pop      rdx
000000018274CD08  ff 50 50                       call     qword ptr [rax + 0x50]
000000018274CD0B  48 89 c7                       mov      rdi, rax
000000018274CD0E  48 85 c0                       test     rax, rax
000000018274CD11  0f 84 ef 00 00 00              je       0x18274ce06
000000018274CD17  48 8d 15 16 d1 37 02           lea      rdx, [rip + 0x237d116]
000000018274CD1E  48 8d 4d 10                    lea      rcx, [rbp + 0x10]
000000018274CD22  e8 f7 65 8b fd                 call     0x18000331e
000000018274CD27  6a 0a                          push     0xa
000000018274CD29  5a                             pop      rdx
000000018274CD2A  4c 8d 45 10                    lea      r8, [rbp + 0x10]
000000018274CD2E  48 89 f9                       mov      rcx, rdi
000000018274CD31  e8 f6 c0 28 fe                 call     0x1809d8e2c
000000018274CD36  44 88 74 24 28                 mov      byte ptr [rsp + 0x28], r14b
000000018274CD3B  48 8d 45 f0                    lea      rax, [rbp - 0x10]
000000018274CD3F  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018274CD44  c6 44 24 30 00                 mov      byte ptr [rsp + 0x30], 0
000000018274CD49  48 8d 55 10                    lea      rdx, [rbp + 0x10]
000000018274CD4D  4c 8d 45 28                    lea      r8, [rbp + 0x28]
000000018274CD51  4c 8d 4d e8                    lea      r9, [rbp - 0x18]
000000018274CD55  48 89 f1                       mov      rcx, rsi
000000018274CD58  e8 1b 03 00 00                 call     0x18274d078
000000018274CD5D  48 8d 4d 10                    lea      rcx, [rbp + 0x10]
000000018274CD61  e8 9a 04 03 fe                 call     0x18077d200
000000018274CD66  e9 e5 00 00 00                 jmp      0x18274ce50
000000018274CD6B  48 8d 35 55 7f 2d 02           lea      rsi, [rip + 0x22d7f55] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
000000018274CD72  6a 5c                          push     0x5c
000000018274CD74  5a                             pop      rdx
000000018274CD75  48 89 f1                       mov      rcx, rsi
000000018274CD78  e8 a3 ff 8a 01                 call     0x183ffcd20
000000018274CD7D  4c 8d 40 01                    lea      r8, [rax + 1]
000000018274CD81  48 85 c0                       test     rax, rax
000000018274CD84  4c 0f 44 c6                    cmove    r8, rsi
000000018274CD88  48 8d 05 8b 9f 1f 02           lea      rax, [rip + 0x21f9f8b] ; on recall group PaiYiPai sys msg! decode kBytesMsgContent fail
000000018274CD8F  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018274CD94  48 8d 05 d4 d8 20 02           lea      rax, [rip + 0x220d8d4] ; HandleRecallSysMsg
000000018274CD9B  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018274CDA0  48 8d 0d c9 7e cf 01           lea      rcx, [rip + 0x1cf7ec9]
000000018274CDA7  6a 04                          push     4
000000018274CDA9  5a                             pop      rdx
000000018274CDAA  41 b9 f7 02 00 00              mov      r9d, 0x2f7
000000018274CDB0  e8 75 67 8b fd                 call     0x18000352a
000000018274CDB5  e9 b1 00 00 00                 jmp      0x18274ce6b
000000018274CDBA  48 8d 35 06 7f 2d 02           lea      rsi, [rip + 0x22d7f06] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
000000018274CDC1  6a 5c                          push     0x5c
000000018274CDC3  5a                             pop      rdx
000000018274CDC4  48 89 f1                       mov      rcx, rsi
000000018274CDC7  e8 54 ff 8a 01                 call     0x183ffcd20
000000018274CDCC  4c 8d 40 01                    lea      r8, [rax + 1]
000000018274CDD0  48 85 c0                       test     rax, rax
000000018274CDD3  4c 0f 44 c6                    cmove    r8, rsi
000000018274CDD7  48 8d 05 f5 83 1f 02           lea      rax, [rip + 0x21f83f5] ; on recall group PaiYiPai sys msg! NotifyMsgBody::kRevertGrayTipsMsgTraceless = null
000000018274CDDE  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018274CDE3  48 8d 05 85 d8 20 02           lea      rax, [rip + 0x220d885] ; HandleRecallSysMsg
000000018274CDEA  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018274CDEF  48 8d 0d 7a 7e cf 01           lea      rcx, [rip + 0x1cf7e7a]
000000018274CDF6  6a 04                          push     4
000000018274CDF8  5a                             pop      rdx
000000018274CDF9  41 b9 03 03 00 00              mov      r9d, 0x303
000000018274CDFF  e8 26 67 8b fd                 call     0x18000352a
000000018274CE04  eb 5c                          jmp      0x18274ce62
000000018274CE06  48 8d 35 ba 7e 2d 02           lea      rsi, [rip + 0x22d7eba] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
000000018274CE0D  6a 5c                          push     0x5c
000000018274CE0F  5a                             pop      rdx
000000018274CE10  48 89 f1                       mov      rcx, rsi
000000018274CE13  e8 08 ff 8a 01                 call     0x183ffcd20
000000018274CE18  4c 8d 40 01                    lea      r8, [rax + 1]
000000018274CE1C  48 85 c0                       test     rax, rax
000000018274CE1F  4c 0f 44 c6                    cmove    r8, rsi
000000018274CE23  48 8d 05 01 ce 33 02           lea      rax, [rip + 0x233ce01] ; on recall group PaiYiPai sys msg! group code is 0.
000000018274CE2A  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018274CE2F  48 8d 05 39 d8 20 02           lea      rax, [rip + 0x220d839] ; HandleRecallSysMsg
000000018274CE36  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018274CE3B  48 8d 0d 2e 7e cf 01           lea      rcx, [rip + 0x1cf7e2e]
000000018274CE42  6a 04                          push     4
000000018274CE44  5a                             pop      rdx
000000018274CE45  41 b9 0c 03 00 00              mov      r9d, 0x30c
000000018274CE4B  e8 da 66 8b fd                 call     0x18000352a
000000018274CE50  48 8d 4d c0                    lea      rcx, [rbp - 0x40]
000000018274CE54  e8 a7 03 03 fe                 call     0x18077d200
000000018274CE59  48 8d 4d 28                    lea      rcx, [rbp + 0x28]
000000018274CE5D  e8 9e 03 03 fe                 call     0x18077d200
000000018274CE62  48 8d 4d 68                    lea      rcx, [rbp + 0x68]
000000018274CE66  e8 47 4f 8b fd                 call     0x180001db2
000000018274CE6B  48 8d 4d 58                    lea      rcx, [rbp + 0x58]
000000018274CE6F  e8 3e 4f 8b fd                 call     0x180001db2
000000018274CE74  48 8d 4d f8                    lea      rcx, [rbp - 8]
000000018274CE78  e8 9d 5a 8b fd                 call     0x18000291a
000000018274CE7D  48 8d 4d 40                    lea      rcx, [rbp + 0x40]
000000018274CE81  e8 94 5a 8b fd                 call     0x18000291a
000000018274CE86  48 8d 4d d8                    lea      rcx, [rbp - 0x28]
000000018274CE8A  e8 23 4f 8b fd                 call     0x180001db2
000000018274CE8F  e9 f0 fc ff ff                 jmp      0x18274cb84
