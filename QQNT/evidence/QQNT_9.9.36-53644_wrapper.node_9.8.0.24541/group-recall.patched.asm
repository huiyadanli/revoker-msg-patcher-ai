; pdata range 0x18274b606 .. 0x18274bfe8 (exclusive)
; PE unwind range; not necessarily an entire source-level function.
000000018274B606  55                             push     rbp
000000018274B607  41 57                          push     r15
000000018274B609  41 56                          push     r14
000000018274B60B  41 55                          push     r13
000000018274B60D  41 54                          push     r12
000000018274B60F  56                             push     rsi
000000018274B610  57                             push     rdi
000000018274B611  53                             push     rbx
000000018274B612  48 81 ec d8 02 00 00           sub      rsp, 0x2d8
000000018274B619  48 8d ac 24 80 00 00 00        lea      rbp, [rsp + 0x80]
000000018274B621  48 c7 85 50 02 00 00 fe ff ff ff mov      qword ptr [rbp + 0x250], 0xfffffffffffffffe
000000018274B62C  44 88 cb                       mov      bl, r9b
000000018274B62F  4c 89 85 08 02 00 00           mov      qword ptr [rbp + 0x208], r8
000000018274B636  48 89 ce                       mov      rsi, rcx
000000018274B639  48 89 95 28 02 00 00           mov      qword ptr [rbp + 0x228], rdx
000000018274B640  48 8b 0a                       mov      rcx, qword ptr [rdx]
000000018274B643  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274B647  48 83 c1 08                    add      rcx, 8
000000018274B64B  6a 03                          push     3
000000018274B64D  5a                             pop      rdx
000000018274B64E  ff 90 28 01 00 00              call     qword ptr [rax + 0x128]
000000018274B654  84 c0                          test     al, al
000000018274B656  0f 84 d1 00 00 00              je       0x18274b72d
000000018274B65C  48 8b 85 28 02 00 00           mov      rax, qword ptr [rbp + 0x228]
000000018274B663  48 8b 08                       mov      rcx, qword ptr [rax]
000000018274B666  48 8b 01                       mov      rax, qword ptr [rcx]
000000018274B669  48 8d 95 e0 01 00 00           lea      rdx, [rbp + 0x1e0]
000000018274B670  6a 03                          push     3
000000018274B672  41 58                          pop      r8
000000018274B674  ff 90 18 01 00 00              call     qword ptr [rax + 0x118]
000000018274B67A  48 8b 8d e0 01 00 00           mov      rcx, qword ptr [rbp + 0x1e0]
000000018274B681  48 85 c9                       test     rcx, rcx
000000018274B684  0f 84 f2 00 00 00              je       0x18274b77c
000000018274B68A  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274B68E  48 83 c1 08                    add      rcx, 8
000000018274B692  6a 02                          push     2
000000018274B694  5a                             pop      rdx
000000018274B695  ff 90 28 01 00 00              call     qword ptr [rax + 0x128]
000000018274B69B  84 c0                          test     al, al
000000018274B69D  0f 84 28 01 00 00              je       0x18274b7cb
000000018274B6A3  48 8b 8d e0 01 00 00           mov      rcx, qword ptr [rbp + 0x1e0]
000000018274B6AA  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274B6AE  48 83 c1 08                    add      rcx, 8
000000018274B6B2  48 8d 95 48 01 00 00           lea      rdx, [rbp + 0x148]
000000018274B6B9  6a 02                          push     2
000000018274B6BB  41 58                          pop      r8
000000018274B6BD  ff 50 70                       call     qword ptr [rax + 0x70]
000000018274B6C0  48 8b 95 48 01 00 00           mov      rdx, qword ptr [rbp + 0x148]
000000018274B6C7  4c 8b 85 50 01 00 00           mov      r8, qword ptr [rbp + 0x150]
000000018274B6CE  4c 89 c0                       mov      rax, r8
000000018274B6D1  48 29 d0                       sub      rax, rdx
000000018274B6D4  48 83 f8 07                    cmp      rax, 7
000000018274B6D8  90                             nop      
000000018274B6D9  90                             nop      
000000018274B6DA  90                             nop      
000000018274B6DB  90                             nop      
000000018274B6DC  90                             nop      
000000018274B6DD  90                             nop      
000000018274B6DE  48 8d 35 e2 95 2d 02           lea      rsi, [rip + 0x22d95e2] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
000000018274B6E5  6a 5c                          push     0x5c
000000018274B6E7  5a                             pop      rdx
000000018274B6E8  48 89 f1                       mov      rcx, rsi
000000018274B6EB  e8 30 16 8b 01                 call     0x183ffcd20
000000018274B6F0  4c 8d 40 01                    lea      r8, [rax + 1]
000000018274B6F4  48 85 c0                       test     rax, rax
000000018274B6F7  4c 0f 44 c6                    cmove    r8, rsi
000000018274B6FB  48 8d 05 9f 81 19 02           lea      rax, [rip + 0x219819f] ; on recall group sys msg! im_msg_body::MsgBody::kBytesMsgContent is error
000000018274B702  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018274B707  48 8d 05 61 ef 20 02           lea      rax, [rip + 0x220ef61] ; HandleRecallSysMsg
000000018274B70E  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018274B713  48 8d 0d 56 95 cf 01           lea      rcx, [rip + 0x1cf9556]
000000018274B71A  6a 04                          push     4
000000018274B71C  5a                             pop      rdx
000000018274B71D  41 b9 5b 02 00 00              mov      r9d, 0x25b
000000018274B723  e8 02 7e 8b fd                 call     0x18000352a
000000018274B728  e9 76 08 00 00                 jmp      0x18274bfa3
000000018274B72D  48 8d 35 93 95 2d 02           lea      rsi, [rip + 0x22d9593] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
000000018274B734  6a 5c                          push     0x5c
000000018274B736  5a                             pop      rdx
000000018274B737  48 89 f1                       mov      rcx, rsi
000000018274B73A  e8 e1 15 8b 01                 call     0x183ffcd20
000000018274B73F  4c 8d 40 01                    lea      r8, [rax + 1]
000000018274B743  48 85 c0                       test     rax, rax
000000018274B746  4c 0f 44 c6                    cmove    r8, rsi
000000018274B74A  48 8d 05 d1 e1 10 02           lea      rax, [rip + 0x210e1d1] ; on recall group sys msg! hasn't msg_common::Msg::kBody
000000018274B751  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018274B756  48 8d 05 12 ef 20 02           lea      rax, [rip + 0x220ef12] ; HandleRecallSysMsg
000000018274B75D  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018274B762  48 8d 0d 07 95 cf 01           lea      rcx, [rip + 0x1cf9507]
000000018274B769  6a 04                          push     4
000000018274B76B  5a                             pop      rdx
000000018274B76C  41 b9 4d 02 00 00              mov      r9d, 0x24d
000000018274B772  e8 b3 7d 8b fd                 call     0x18000352a
000000018274B777  e9 3f 08 00 00                 jmp      0x18274bfbb
000000018274B77C  48 8d 35 44 95 2d 02           lea      rsi, [rip + 0x22d9544] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
000000018274B783  6a 5c                          push     0x5c
000000018274B785  5a                             pop      rdx
000000018274B786  48 89 f1                       mov      rcx, rsi
000000018274B789  e8 92 15 8b 01                 call     0x183ffcd20
000000018274B78E  4c 8d 40 01                    lea      r8, [rax + 1]
000000018274B792  48 85 c0                       test     rax, rax
000000018274B795  4c 0f 44 c6                    cmove    r8, rsi
000000018274B799  48 8d 05 58 98 1f 02           lea      rax, [rip + 0x21f9858] ; on recall group sys msg! msg_common::Msg::kBody = null
000000018274B7A0  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018274B7A5  48 8d 05 c3 ee 20 02           lea      rax, [rip + 0x220eec3] ; HandleRecallSysMsg
000000018274B7AC  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018274B7B1  48 8d 0d b8 94 cf 01           lea      rcx, [rip + 0x1cf94b8]
000000018274B7B8  6a 04                          push     4
000000018274B7BA  5a                             pop      rdx
000000018274B7BB  41 b9 52 02 00 00              mov      r9d, 0x252
000000018274B7C1  e8 64 7d 8b fd                 call     0x18000352a
000000018274B7C6  e9 e4 07 00 00                 jmp      0x18274bfaf
000000018274B7CB  48 8d 35 f5 94 2d 02           lea      rsi, [rip + 0x22d94f5] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
000000018274B7D2  6a 5c                          push     0x5c
000000018274B7D4  5a                             pop      rdx
000000018274B7D5  48 89 f1                       mov      rcx, rsi
000000018274B7D8  e8 43 15 8b 01                 call     0x183ffcd20
000000018274B7DD  4c 8d 40 01                    lea      r8, [rax + 1]
000000018274B7E1  48 85 c0                       test     rax, rax
000000018274B7E4  4c 0f 44 c6                    cmove    r8, rsi
000000018274B7E8  48 8d 05 8a 5b 12 02           lea      rax, [rip + 0x2125b8a] ; on recall group sys msg! hasn't im_msg_body::MsgBody::kBytesMsgContent
000000018274B7EF  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018274B7F4  48 8d 05 74 ee 20 02           lea      rax, [rip + 0x220ee74] ; HandleRecallSysMsg
000000018274B7FB  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018274B800  48 8d 0d 69 94 cf 01           lea      rcx, [rip + 0x1cf9469]
000000018274B807  6a 04                          push     4
000000018274B809  5a                             pop      rdx
000000018274B80A  41 b9 56 02 00 00              mov      r9d, 0x256
000000018274B810  e8 15 7d 8b fd                 call     0x18000352a
000000018274B815  e9 95 07 00 00                 jmp      0x18274bfaf
000000018274B81A  48 83 c2 07                    add      rdx, 7
000000018274B81E  48 8d 8d 30 01 00 00           lea      rcx, [rbp + 0x130]
000000018274B825  e8 20 7b 8b fd                 call     0x18000334a
000000018274B82A  48 8d 8d 18 02 00 00           lea      rcx, [rbp + 0x218]
000000018274B831  e8 2a 96 63 fe                 call     0x180d84e60
000000018274B836  48 8b 8d 18 02 00 00           mov      rcx, qword ptr [rbp + 0x218]
000000018274B83D  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274B841  48 83 c1 08                    add      rcx, 8
000000018274B845  48 8d 95 30 01 00 00           lea      rdx, [rbp + 0x130]
000000018274B84C  ff 90 10 01 00 00              call     qword ptr [rax + 0x110]
000000018274B852  84 c0                          test     al, al
000000018274B854  0f 84 e5 01 00 00              je       0x18274ba3f
000000018274B85A  48 8b 8d 18 02 00 00           mov      rcx, qword ptr [rbp + 0x218]
000000018274B861  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274B865  48 83 c1 08                    add      rcx, 8
000000018274B869  6a 04                          push     4
000000018274B86B  5a                             pop      rdx
000000018274B86C  ff 50 50                       call     qword ptr [rax + 0x50]
000000018274B86F  48 89 c7                       mov      rdi, rax
000000018274B872  48 85 c0                       test     rax, rax
000000018274B875  0f 84 67 02 00 00              je       0x18274bae2
000000018274B87B  48 8d 15 b2 e5 37 02           lea      rdx, [rip + 0x237e5b2]
000000018274B882  48 8d 8d b0 01 00 00           lea      rcx, [rbp + 0x1b0]
000000018274B889  e8 90 7a 8b fd                 call     0x18000331e
000000018274B88E  6a 0a                          push     0xa
000000018274B890  5a                             pop      rdx
000000018274B891  4c 8d 85 b0 01 00 00           lea      r8, [rbp + 0x1b0]
000000018274B898  48 89 f9                       mov      rcx, rdi
000000018274B89B  e8 8c d5 28 fe                 call     0x1809d8e2c
000000018274B8A0  48 8b 8d 18 02 00 00           mov      rcx, qword ptr [rbp + 0x218]
000000018274B8A7  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274B8AB  48 83 c1 08                    add      rcx, 8
000000018274B8AF  6a 01                          push     1
000000018274B8B1  5a                             pop      rdx
000000018274B8B2  ff 50 50                       call     qword ptr [rax + 0x50]
000000018274B8B5  48 89 c7                       mov      rdi, rax
000000018274B8B8  48 83 f8 07                    cmp      rax, 7
000000018274B8BC  0f 85 cc 01 00 00              jne      0x18274ba8e
000000018274B8C2  48 8b 8d 18 02 00 00           mov      rcx, qword ptr [rbp + 0x218]
000000018274B8C9  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274B8CD  48 83 c1 08                    add      rcx, 8
000000018274B8D1  6a 0b                          push     0xb
000000018274B8D3  5a                             pop      rdx
000000018274B8D4  ff 90 28 01 00 00              call     qword ptr [rax + 0x128]
000000018274B8DA  84 c0                          test     al, al
000000018274B8DC  0f 84 ac 01 00 00              je       0x18274ba8e
000000018274B8E2  48 8b 8d 18 02 00 00           mov      rcx, qword ptr [rbp + 0x218]
000000018274B8E9  48 8b 01                       mov      rax, qword ptr [rcx]
000000018274B8EC  48 8d 95 38 02 00 00           lea      rdx, [rbp + 0x238]
000000018274B8F3  6a 0b                          push     0xb
000000018274B8F5  41 58                          pop      r8
000000018274B8F7  ff 90 18 01 00 00              call     qword ptr [rax + 0x118]
000000018274B8FD  48 8b 8d 38 02 00 00           mov      rcx, qword ptr [rbp + 0x238]
000000018274B904  48 85 c9                       test     rcx, rcx
000000018274B907  0f 84 24 02 00 00              je       0x18274bb31
000000018274B90D  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274B911  48 83 c1 08                    add      rcx, 8
000000018274B915  6a 03                          push     3
000000018274B917  5a                             pop      rdx
000000018274B918  ff 90 28 01 00 00              call     qword ptr [rax + 0x128]
000000018274B91E  84 c0                          test     al, al
000000018274B920  0f 84 5a 02 00 00              je       0x18274bb80
000000018274B926  48 8b 8d 38 02 00 00           mov      rcx, qword ptr [rbp + 0x238]
000000018274B92D  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274B931  48 83 c1 08                    add      rcx, 8
000000018274B935  48 8d 95 c8 01 00 00           lea      rdx, [rbp + 0x1c8]
000000018274B93C  6a 03                          push     3
000000018274B93E  41 58                          pop      r8
000000018274B940  ff 90 f0 00 00 00              call     qword ptr [rax + 0xf0]
000000018274B946  48 8b 85 d0 01 00 00           mov      rax, qword ptr [rbp + 0x1d0]
000000018274B94D  48 3b 85 c8 01 00 00           cmp      rax, qword ptr [rbp + 0x1c8]
000000018274B954  0f 84 75 02 00 00              je       0x18274bbcf
000000018274B95A  48 8d 8d 60 01 00 00           lea      rcx, [rbp + 0x160]
000000018274B961  e8 1a a9 8b fd                 call     0x180006280
000000018274B966  48 8b 8d 38 02 00 00           mov      rcx, qword ptr [rbp + 0x238]
000000018274B96D  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274B971  48 83 c1 08                    add      rcx, 8
000000018274B975  6a 09                          push     9
000000018274B977  5a                             pop      rdx
000000018274B978  ff 90 28 01 00 00              call     qword ptr [rax + 0x128]
000000018274B97E  84 c0                          test     al, al
000000018274B980  74 7d                          je       0x18274b9ff
000000018274B982  48 8b 8d 38 02 00 00           mov      rcx, qword ptr [rbp + 0x238]
000000018274B989  48 8b 01                       mov      rax, qword ptr [rcx]
000000018274B98C  48 8d 95 f0 01 00 00           lea      rdx, [rbp + 0x1f0]
000000018274B993  6a 09                          push     9
000000018274B995  41 58                          pop      r8
000000018274B997  ff 90 18 01 00 00              call     qword ptr [rax + 0x118]
000000018274B99D  48 8b 8d f0 01 00 00           mov      rcx, qword ptr [rbp + 0x1f0]
000000018274B9A4  48 85 c9                       test     rcx, rcx
000000018274B9A7  74 4a                          je       0x18274b9f3
000000018274B9A9  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274B9AD  48 83 c1 08                    add      rcx, 8
000000018274B9B1  6a 02                          push     2
000000018274B9B3  5a                             pop      rdx
000000018274B9B4  ff 90 28 01 00 00              call     qword ptr [rax + 0x128]
000000018274B9BA  84 c0                          test     al, al
000000018274B9BC  74 35                          je       0x18274b9f3
000000018274B9BE  48 8b 8d f0 01 00 00           mov      rcx, qword ptr [rbp + 0x1f0]
000000018274B9C5  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274B9C9  48 83 c1 08                    add      rcx, 8
000000018274B9CD  48 8d 55 68                    lea      rdx, [rbp + 0x68]
000000018274B9D1  6a 02                          push     2
000000018274B9D3  41 58                          pop      r8
000000018274B9D5  ff 50 68                       call     qword ptr [rax + 0x68]
000000018274B9D8  48 8d 8d 60 01 00 00           lea      rcx, [rbp + 0x160]
000000018274B9DF  48 8d 7d 68                    lea      rdi, [rbp + 0x68]
000000018274B9E3  48 89 fa                       mov      rdx, rdi
000000018274B9E6  e8 07 a6 8b fd                 call     0x180005ff2
000000018274B9EB  48 89 f9                       mov      rcx, rdi
000000018274B9EE  e8 0d 18 03 fe                 call     0x18077d200
000000018274B9F3  48 8d 8d f0 01 00 00           lea      rcx, [rbp + 0x1f0]
000000018274B9FA  e8 b3 63 8b fd                 call     0x180001db2
000000018274B9FF  48 8b 8d 38 02 00 00           mov      rcx, qword ptr [rbp + 0x238]
000000018274BA06  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274BA0A  48 83 c1 08                    add      rcx, 8
000000018274BA0E  6a 0a                          push     0xa
000000018274BA10  5a                             pop      rdx
000000018274BA11  ff 90 28 01 00 00              call     qword ptr [rax + 0x128]
000000018274BA17  84 c0                          test     al, al
000000018274BA19  0f 84 ff 01 00 00              je       0x18274bc1e
000000018274BA1F  48 8b 8d 38 02 00 00           mov      rcx, qword ptr [rbp + 0x238]
000000018274BA26  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274BA2A  48 83 c1 08                    add      rcx, 8
000000018274BA2E  6a 0a                          push     0xa
000000018274BA30  5a                             pop      rdx
000000018274BA31  ff 50 10                       call     qword ptr [rax + 0x10]
000000018274BA34  89 85 34 02 00 00              mov      dword ptr [rbp + 0x234], eax
000000018274BA3A  e9 e9 01 00 00                 jmp      0x18274bc28
000000018274BA3F  48 8d 35 81 92 2d 02           lea      rsi, [rip + 0x22d9281] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
000000018274BA46  6a 5c                          push     0x5c
000000018274BA48  5a                             pop      rdx
000000018274BA49  48 89 f1                       mov      rcx, rsi
000000018274BA4C  e8 cf 12 8b 01                 call     0x183ffcd20
000000018274BA51  4c 8d 40 01                    lea      r8, [rax + 1]
000000018274BA55  48 85 c0                       test     rax, rax
000000018274BA58  4c 0f 44 c6                    cmove    r8, rsi
000000018274BA5C  48 8d 05 81 b2 1f 02           lea      rax, [rip + 0x21fb281] ; on recall group sys msg! decode kBytesMsgContent fail
000000018274BA63  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018274BA68  48 8d 05 00 ec 20 02           lea      rax, [rip + 0x220ec00] ; HandleRecallSysMsg
000000018274BA6F  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018274BA74  48 8d 0d f5 91 cf 01           lea      rcx, [rip + 0x1cf91f5]
000000018274BA7B  6a 04                          push     4
000000018274BA7D  5a                             pop      rdx
000000018274BA7E  41 b9 62 02 00 00              mov      r9d, 0x262
000000018274BA84  e8 a1 7a 8b fd                 call     0x18000352a
000000018274BA89  e9 fd 04 00 00                 jmp      0x18274bf8b
000000018274BA8E  48 8d 35 32 92 2d 02           lea      rsi, [rip + 0x22d9232] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
000000018274BA95  6a 5c                          push     0x5c
000000018274BA97  5a                             pop      rdx
000000018274BA98  48 89 f1                       mov      rcx, rsi
000000018274BA9B  e8 80 12 8b 01                 call     0x183ffcd20
000000018274BAA0  4c 8d 40 01                    lea      r8, [rax + 1]
000000018274BAA4  48 85 c0                       test     rax, rax
000000018274BAA7  4c 0f 44 c6                    cmove    r8, rsi
000000018274BAAB  48 89 7c 24 30                 mov      qword ptr [rsp + 0x30], rdi
000000018274BAB0  48 8d 05 c7 93 0a 02           lea      rax, [rip + 0x20a93c7] ; on recall group sys msg! no Prompt_MsgRecallReminder op_type:{}
000000018274BAB7  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018274BABC  48 8d 05 ac eb 20 02           lea      rax, [rip + 0x220ebac] ; HandleRecallSysMsg
000000018274BAC3  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018274BAC8  48 8d 0d a1 91 cf 01           lea      rcx, [rip + 0x1cf91a1]
000000018274BACF  6a 04                          push     4
000000018274BAD1  5a                             pop      rdx
000000018274BAD2  41 b9 b1 02 00 00              mov      r9d, 0x2b1
000000018274BAD8  e8 a3 89 8c fd                 call     0x180014480
000000018274BADD  e9 9d 04 00 00                 jmp      0x18274bf7f
000000018274BAE2  48 8d 35 de 91 2d 02           lea      rsi, [rip + 0x22d91de] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
000000018274BAE9  6a 5c                          push     0x5c
000000018274BAEB  5a                             pop      rdx
000000018274BAEC  48 89 f1                       mov      rcx, rsi
000000018274BAEF  e8 2c 12 8b 01                 call     0x183ffcd20
000000018274BAF4  4c 8d 40 01                    lea      r8, [rax + 1]
000000018274BAF8  48 85 c0                       test     rax, rax
000000018274BAFB  4c 0f 44 c6                    cmove    r8, rsi
000000018274BAFF  48 8d 05 af c8 32 02           lea      rax, [rip + 0x232c8af] ; on recall group sys msg! group code is 0
000000018274BB06  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018274BB0B  48 8d 05 5d eb 20 02           lea      rax, [rip + 0x220eb5d] ; HandleRecallSysMsg
000000018274BB12  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018274BB17  48 8d 0d 52 91 cf 01           lea      rcx, [rip + 0x1cf9152]
000000018274BB1E  6a 04                          push     4
000000018274BB20  5a                             pop      rdx
000000018274BB21  41 b9 67 02 00 00              mov      r9d, 0x267
000000018274BB27  e8 fe 79 8b fd                 call     0x18000352a
000000018274BB2C  e9 5a 04 00 00                 jmp      0x18274bf8b
000000018274BB31  48 8d 35 8f 91 2d 02           lea      rsi, [rip + 0x22d918f] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
000000018274BB38  6a 5c                          push     0x5c
000000018274BB3A  5a                             pop      rdx
000000018274BB3B  48 89 f1                       mov      rcx, rsi
000000018274BB3E  e8 dd 11 8b 01                 call     0x183ffcd20
000000018274BB43  4c 8d 40 01                    lea      r8, [rax + 1]
000000018274BB47  48 85 c0                       test     rax, rax
000000018274BB4A  4c 0f 44 c6                    cmove    r8, rsi
000000018274BB4E  48 8d 05 05 98 1f 02           lea      rax, [rip + 0x21f9805] ; on recall group sys msg! NotifyMsgBody::opt_msg_recall = null
000000018274BB55  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018274BB5A  48 8d 05 0e eb 20 02           lea      rax, [rip + 0x220eb0e] ; HandleRecallSysMsg
000000018274BB61  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018274BB66  48 8d 0d 03 91 cf 01           lea      rcx, [rip + 0x1cf9103]
000000018274BB6D  6a 04                          push     4
000000018274BB6F  5a                             pop      rdx
000000018274BB70  41 b9 71 02 00 00              mov      r9d, 0x271
000000018274BB76  e8 af 79 8b fd                 call     0x18000352a
000000018274BB7B  e9 f3 03 00 00                 jmp      0x18274bf73
000000018274BB80  48 8d 35 40 91 2d 02           lea      rsi, [rip + 0x22d9140] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
000000018274BB87  6a 5c                          push     0x5c
000000018274BB89  5a                             pop      rdx
000000018274BB8A  48 89 f1                       mov      rcx, rsi
000000018274BB8D  e8 8e 11 8b 01                 call     0x183ffcd20
000000018274BB92  4c 8d 40 01                    lea      r8, [rax + 1]
000000018274BB96  48 85 c0                       test     rax, rax
000000018274BB99  4c 0f 44 c6                    cmove    r8, rsi
000000018274BB9D  48 8d 05 ae 11 18 02           lea      rax, [rip + 0x21811ae] ; on recall group sys msg! no msg_infos
000000018274BBA4  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018274BBA9  48 8d 05 bf ea 20 02           lea      rax, [rip + 0x220eabf] ; HandleRecallSysMsg
000000018274BBB0  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018274BBB5  48 8d 0d b4 90 cf 01           lea      rcx, [rip + 0x1cf90b4]
000000018274BBBC  6a 04                          push     4
000000018274BBBE  5a                             pop      rdx
000000018274BBBF  41 b9 75 02 00 00              mov      r9d, 0x275
000000018274BBC5  e8 60 79 8b fd                 call     0x18000352a
000000018274BBCA  e9 a4 03 00 00                 jmp      0x18274bf73
000000018274BBCF  48 8d 35 f1 90 2d 02           lea      rsi, [rip + 0x22d90f1] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
000000018274BBD6  6a 5c                          push     0x5c
000000018274BBD8  5a                             pop      rdx
000000018274BBD9  48 89 f1                       mov      rcx, rsi
000000018274BBDC  e8 3f 11 8b 01                 call     0x183ffcd20
000000018274BBE1  4c 8d 40 01                    lea      r8, [rax + 1]
000000018274BBE5  48 85 c0                       test     rax, rax
000000018274BBE8  4c 0f 44 c6                    cmove    r8, rsi
000000018274BBEC  48 8d 05 89 7f 1d 02           lea      rax, [rip + 0x21d7f89] ; on recall group sys msg! no any msg info
000000018274BBF3  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018274BBF8  48 8d 05 70 ea 20 02           lea      rax, [rip + 0x220ea70] ; HandleRecallSysMsg
000000018274BBFF  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018274BC04  48 8d 0d 65 90 cf 01           lea      rcx, [rip + 0x1cf9065]
000000018274BC0B  6a 04                          push     4
000000018274BC0D  5a                             pop      rdx
000000018274BC0E  41 b9 7b 02 00 00              mov      r9d, 0x27b
000000018274BC14  e8 11 79 8b fd                 call     0x18000352a
000000018274BC19  e9 49 03 00 00                 jmp      0x18274bf67
000000018274BC1E  c7 85 34 02 00 00 00 00 00 00  mov      dword ptr [rbp + 0x234], 0
000000018274BC28  48 8b 8d 38 02 00 00           mov      rcx, qword ptr [rbp + 0x238]
000000018274BC2F  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274BC33  48 83 c1 08                    add      rcx, 8
000000018274BC37  6a 07                          push     7
000000018274BC39  5a                             pop      rdx
000000018274BC3A  ff 50 30                       call     qword ptr [rax + 0x30]
000000018274BC3D  89 85 14 02 00 00              mov      dword ptr [rbp + 0x214], eax
000000018274BC43  48 8b 8d 38 02 00 00           mov      rcx, qword ptr [rbp + 0x238]
000000018274BC4A  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274BC4E  48 83 c1 08                    add      rcx, 8
000000018274BC52  48 8d 95 f0 01 00 00           lea      rdx, [rbp + 0x1f0]
000000018274BC59  6a 01                          push     1
000000018274BC5B  41 58                          pop      r8
000000018274BC5D  ff 50 68                       call     qword ptr [rax + 0x68]
000000018274BC60  48 8b bd c8 01 00 00           mov      rdi, qword ptr [rbp + 0x1c8]
000000018274BC67  48 8b 85 d0 01 00 00           mov      rax, qword ptr [rbp + 0x1d0]
000000018274BC6E  48 89 85 98 01 00 00           mov      qword ptr [rbp + 0x198], rax
000000018274BC75  4c 8d a5 e8 00 00 00           lea      r12, [rbp + 0xe8]
000000018274BC7C  48 8d 46 08                    lea      rax, [rsi + 8]
000000018274BC80  48 89 85 a8 01 00 00           mov      qword ptr [rbp + 0x1a8], rax
000000018274BC87  48 83 c6 30                    add      rsi, 0x30
000000018274BC8B  4c 8d 75 68                    lea      r14, [rbp + 0x68]
000000018274BC8F  48 89 b5 a0 01 00 00           mov      qword ptr [rbp + 0x1a0], rsi
000000018274BC96  88 9d 4f 02 00 00              mov      byte ptr [rbp + 0x24f], bl
000000018274BC9C  48 3b bd 98 01 00 00           cmp      rdi, qword ptr [rbp + 0x198]
000000018274BCA3  0f 84 a6 02 00 00              je       0x18274bf4f
000000018274BCA9  4c 89 f1                       mov      rcx, r14
000000018274BCAC  e8 eb b9 de fe                 call     0x18153769c
000000018274BCB1  4c 89 f1                       mov      rcx, r14
000000018274BCB4  48 8d 95 b0 01 00 00           lea      rdx, [rbp + 0x1b0]
000000018274BCBB  e8 20 2b 03 fe                 call     0x18077e7e0
000000018274BCC0  c6 85 80 00 00 00 02           mov      byte ptr [rbp + 0x80], 2
000000018274BCC7  48 8b 0f                       mov      rcx, qword ptr [rdi]
000000018274BCCA  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274BCCE  48 83 c1 08                    add      rcx, 8
000000018274BCD2  6a 01                          push     1
000000018274BCD4  5a                             pop      rdx
000000018274BCD5  ff 50 30                       call     qword ptr [rax + 0x30]
000000018274BCD8  89 c0                          mov      eax, eax
000000018274BCDA  48 89 85 88 00 00 00           mov      qword ptr [rbp + 0x88], rax
000000018274BCE1  48 8b 0f                       mov      rcx, qword ptr [rdi]
000000018274BCE4  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274BCE8  48 83 c1 08                    add      rcx, 8
000000018274BCEC  6a 03                          push     3
000000018274BCEE  5a                             pop      rdx
000000018274BCEF  ff 50 30                       call     qword ptr [rax + 0x30]
000000018274BCF2  89 c0                          mov      eax, eax
000000018274BCF4  48 89 85 98 00 00 00           mov      qword ptr [rbp + 0x98], rax
000000018274BCFB  48 8b 0f                       mov      rcx, qword ptr [rdi]
000000018274BCFE  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274BD02  48 83 c1 08                    add      rcx, 8
000000018274BD06  6a 02                          push     2
000000018274BD08  5a                             pop      rdx
000000018274BD09  ff 50 50                       call     qword ptr [rax + 0x50]
000000018274BD0C  48 89 85 a8 00 00 00           mov      qword ptr [rbp + 0xa8], rax
000000018274BD13  48 8b 0f                       mov      rcx, qword ptr [rdi]
000000018274BD16  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018274BD1A  48 83 c1 08                    add      rcx, 8
000000018274BD1E  48 8d 95 78 01 00 00           lea      rdx, [rbp + 0x178]
000000018274BD25  6a 06                          push     6
000000018274BD27  41 58                          pop      r8
000000018274BD29  ff 50 68                       call     qword ptr [rax + 0x68]
000000018274BD2C  48 8d 8d b0 00 00 00           lea      rcx, [rbp + 0xb0]
000000018274BD33  4c 8d b5 78 01 00 00           lea      r14, [rbp + 0x178]
000000018274BD3A  4c 89 f2                       mov      rdx, r14
000000018274BD3D  e8 b0 a2 8b fd                 call     0x180005ff2
000000018274BD42  4c 89 f1                       mov      rcx, r14
000000018274BD45  e8 b6 14 03 fe                 call     0x18077d200
000000018274BD4A  48 8d 8d c8 00 00 00           lea      rcx, [rbp + 0xc8]
000000018274BD51  48 8d 95 b0 01 00 00           lea      rdx, [rbp + 0x1b0]
000000018274BD58  e8 83 2a 03 fe                 call     0x18077e7e0
000000018274BD5D  4c 89 e1                       mov      rcx, r12
000000018274BD60  48 8d 95 f0 01 00 00           lea      rdx, [rbp + 0x1f0]
000000018274BD67  e8 74 2a 03 fe                 call     0x18077e7e0
000000018274BD6C  8b 85 14 02 00 00              mov      eax, dword ptr [rbp + 0x214]
000000018274BD72  89 85 e0 00 00 00              mov      dword ptr [rbp + 0xe0], eax
000000018274BD78  48 8d 8d 10 01 00 00           lea      rcx, [rbp + 0x110]
000000018274BD7F  48 8d 95 60 01 00 00           lea      rdx, [rbp + 0x160]
000000018274BD86  e8 55 2a 03 fe                 call     0x18077e7e0
000000018274BD8B  84 db                          test     bl, bl
000000018274BD8D  75 07                          jne      0x18274bd96
000000018274BD8F  c6 85 28 01 00 00 01           mov      byte ptr [rbp + 0x128], 1
000000018274BD96  80 bd 34 02 00 00 00           cmp      byte ptr [rbp + 0x234], 0
000000018274BD9D  74 07                          je       0x18274bda6
000000018274BD9F  c6 85 29 01 00 00 01           mov      byte ptr [rbp + 0x129], 1
000000018274BDA6  8a 85 c0 02 00 00              mov      al, byte ptr [rbp + 0x2c0]
000000018274BDAC  88 85 2a 01 00 00              mov      byte ptr [rbp + 0x12a], al
000000018274BDB2  84 c0                          test     al, al
000000018274BDB4  74 25                          je       0x18274bddb
000000018274BDB6  48 8b 8d a8 01 00 00           mov      rcx, qword ptr [rbp + 0x1a8]
000000018274BDBD  48 8b 95 c8 02 00 00           mov      rdx, qword ptr [rbp + 0x2c8]
000000018274BDC4  4c 8d 45 68                    lea      r8, [rbp + 0x68]
000000018274BDC8  e8 bd ce ff ff                 call     0x182748c8a
000000018274BDCD  8a 85 2a 01 00 00              mov      al, byte ptr [rbp + 0x12a]
000000018274BDD3  89 85 30 02 00 00              mov      dword ptr [rbp + 0x230], eax
000000018274BDD9  eb 0a                          jmp      0x18274bde5
000000018274BDDB  c7 85 30 02 00 00 00 00 00 00  mov      dword ptr [rbp + 0x230], 0
000000018274BDE5  44 8a bd 29 01 00 00           mov      r15b, byte ptr [rbp + 0x129]
000000018274BDEC  44 8a b5 28 01 00 00           mov      r14b, byte ptr [rbp + 0x128]
000000018274BDF3  44 8b ad e0 00 00 00           mov      r13d, dword ptr [rbp + 0xe0]
000000018274BDFA  48 8d 4d 20                    lea      rcx, [rbp + 0x20]
000000018274BDFE  4c 89 e2                       mov      rdx, r12
000000018274BE01  e8 2a 13 03 fe                 call     0x18077d130
000000018274BE06  48 89 bd 90 01 00 00           mov      qword ptr [rbp + 0x190], rdi
000000018274BE0D  48 8b 9d a8 00 00 00           mov      rbx, qword ptr [rbp + 0xa8]
000000018274BE14  4c 8b a5 88 00 00 00           mov      r12, qword ptr [rbp + 0x88]
000000018274BE1B  48 8b bd 98 00 00 00           mov      rdi, qword ptr [rbp + 0x98]
000000018274BE22  48 8d 4d 38                    lea      rcx, [rbp + 0x38]
000000018274BE26  48 8d 95 b0 01 00 00           lea      rdx, [rbp + 0x1b0]
000000018274BE2D  e8 fe 12 03 fe                 call     0x18077d130
000000018274BE32  48 8d 4d 50                    lea      rcx, [rbp + 0x50]
000000018274BE36  48 8d 95 c8 00 00 00           lea      rdx, [rbp + 0xc8]
000000018274BE3D  e8 ee 12 03 fe                 call     0x18077d130
000000018274BE42  48 8d 75 08                    lea      rsi, [rbp + 8]
000000018274BE46  48 89 f1                       mov      rcx, rsi
000000018274BE49  48 8d 95 b0 00 00 00           lea      rdx, [rbp + 0xb0]
000000018274BE50  e8 db 12 03 fe                 call     0x18077d130
000000018274BE55  48 8d 0d 6b 8e 2d 02           lea      rcx, [rip + 0x22d8e6b] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
000000018274BE5C  6a 5c                          push     0x5c
000000018274BE5E  5a                             pop      rdx
000000018274BE5F  e8 bc 0e 8b 01                 call     0x183ffcd20
000000018274BE64  4c 8d 40 01                    lea      r8, [rax + 1]
000000018274BE68  48 85 c0                       test     rax, rax
000000018274BE6B  48 8d 05 55 8e 2d 02           lea      rax, [rip + 0x22d8e55] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
000000018274BE72  4c 0f 44 c0                    cmove    r8, rax
000000018274BE76  80 bd 30 02 00 00 00           cmp      byte ptr [rbp + 0x230], 0
000000018274BE7D  44 89 6c 24 68                 mov      dword ptr [rsp + 0x68], r13d
000000018274BE82  48 89 5c 24 58                 mov      qword ptr [rsp + 0x58], rbx
000000018274BE87  44 88 7c 24 78                 mov      byte ptr [rsp + 0x78], r15b
000000018274BE8C  44 88 74 24 70                 mov      byte ptr [rsp + 0x70], r14b
000000018274BE91  0f 95 84 24 80 00 00 00        setne    byte ptr [rsp + 0x80]
000000018274BE99  48 8d 45 20                    lea      rax, [rbp + 0x20]
000000018274BE9D  48 89 44 24 60                 mov      qword ptr [rsp + 0x60], rax
000000018274BEA2  48 89 7c 24 50                 mov      qword ptr [rsp + 0x50], rdi
000000018274BEA7  4c 89 64 24 48                 mov      qword ptr [rsp + 0x48], r12
000000018274BEAC  48 8d 45 38                    lea      rax, [rbp + 0x38]
000000018274BEB0  48 89 44 24 40                 mov      qword ptr [rsp + 0x40], rax
000000018274BEB5  48 8d 45 50                    lea      rax, [rbp + 0x50]
000000018274BEB9  48 89 44 24 38                 mov      qword ptr [rsp + 0x38], rax
000000018274BEBE  48 89 74 24 30                 mov      qword ptr [rsp + 0x30], rsi
000000018274BEC3  48 8d 05 ce 4d 0b 02           lea      rax, [rip + 0x20b4dce] ; [Msg] on grp recall nfy ! frm:{} to:{}, pr:{} seq:{} rd:{} t:{} op_uid:{} op_t:{} is_off:{} trl_flag:{} is_andr_silence:{}
000000018274BECA  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018274BECF  48 8d 05 99 e7 20 02           lea      rax, [rip + 0x220e799] ; HandleRecallSysMsg
000000018274BED6  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018274BEDB  48 8d 0d 8e 8d cf 01           lea      rcx, [rip + 0x1cf8d8e]
000000018274BEE2  6a 02                          push     2
000000018274BEE4  5a                             pop      rdx
000000018274BEE5  41 b9 aa 02 00 00              mov      r9d, 0x2aa
000000018274BEEB  e8 c8 04 00 00                 call     0x18274c3b8
000000018274BEF0  8a 9d 4f 02 00 00              mov      bl, byte ptr [rbp + 0x24f]
000000018274BEF6  48 8b b5 a0 01 00 00           mov      rsi, qword ptr [rbp + 0x1a0]
000000018274BEFD  48 8b bd 90 01 00 00           mov      rdi, qword ptr [rbp + 0x190]
000000018274BF04  4c 8d a5 e8 00 00 00           lea      r12, [rbp + 0xe8]
000000018274BF0B  48 89 f1                       mov      rcx, rsi
000000018274BF0E  48 8d 95 78 01 00 00           lea      rdx, [rbp + 0x178]
000000018274BF15  e8 66 80 8b fd                 call     0x180003f80
000000018274BF1A  48 8b 8d 78 01 00 00           mov      rcx, qword ptr [rbp + 0x178]
000000018274BF21  48 85 c9                       test     rcx, rcx
000000018274BF24  4c 8d 75 68                    lea      r14, [rbp + 0x68]
000000018274BF28  74 08                          je       0x18274bf32
000000018274BF2A  48 8b 01                       mov      rax, qword ptr [rcx]
000000018274BF2D  4c 89 f2                       mov      rdx, r14
000000018274BF30  ff 10                          call     qword ptr [rax]
000000018274BF32  48 8d 8d 78 01 00 00           lea      rcx, [rbp + 0x178]
000000018274BF39  e8 74 5e 8b fd                 call     0x180001db2
000000018274BF3E  4c 89 f1                       mov      rcx, r14
000000018274BF41  e8 74 b8 de fe                 call     0x1815377ba
000000018274BF46  48 83 c7 10                    add      rdi, 0x10
000000018274BF4A  e9 4d fd ff ff                 jmp      0x18274bc9c
000000018274BF4F  48 8d 8d f0 01 00 00           lea      rcx, [rbp + 0x1f0]
000000018274BF56  e8 a5 12 03 fe                 call     0x18077d200
000000018274BF5B  48 8d 8d 60 01 00 00           lea      rcx, [rbp + 0x160]
000000018274BF62  e8 99 12 03 fe                 call     0x18077d200
000000018274BF67  48 8d 8d c8 01 00 00           lea      rcx, [rbp + 0x1c8]
000000018274BF6E  e8 cd 88 8c fd                 call     0x180014840
000000018274BF73  48 8d 8d 38 02 00 00           lea      rcx, [rbp + 0x238]
000000018274BF7A  e8 33 5e 8b fd                 call     0x180001db2
000000018274BF7F  48 8d 8d b0 01 00 00           lea      rcx, [rbp + 0x1b0]
000000018274BF86  e8 75 12 03 fe                 call     0x18077d200
000000018274BF8B  48 8d 8d 18 02 00 00           lea      rcx, [rbp + 0x218]
000000018274BF92  e8 1b 5e 8b fd                 call     0x180001db2
000000018274BF97  48 8d 8d 30 01 00 00           lea      rcx, [rbp + 0x130]
000000018274BF9E  e8 77 69 8b fd                 call     0x18000291a
000000018274BFA3  48 8d 8d 48 01 00 00           lea      rcx, [rbp + 0x148]
000000018274BFAA  e8 6b 69 8b fd                 call     0x18000291a
000000018274BFAF  48 8d 8d e0 01 00 00           lea      rcx, [rbp + 0x1e0]
000000018274BFB6  e8 f7 5d 8b fd                 call     0x180001db2
000000018274BFBB  48 8b 8d 28 02 00 00           mov      rcx, qword ptr [rbp + 0x228]
000000018274BFC2  e8 eb 5d 8b fd                 call     0x180001db2
000000018274BFC7  48 8b 8d 08 02 00 00           mov      rcx, qword ptr [rbp + 0x208]
000000018274BFCE  e8 df 5d 8b fd                 call     0x180001db2
000000018274BFD3  90                             nop      
000000018274BFD4  48 81 c4 d8 02 00 00           add      rsp, 0x2d8
000000018274BFDB  5b                             pop      rbx
000000018274BFDC  5f                             pop      rdi
000000018274BFDD  5e                             pop      rsi
000000018274BFDE  41 5c                          pop      r12
000000018274BFE0  41 5d                          pop      r13
000000018274BFE2  41 5e                          pop      r14
000000018274BFE4  41 5f                          pop      r15
000000018274BFE6  5d                             pop      rbp
000000018274BFE7  c3                             ret      
