; pdata range 0x182776716 .. 0x182776d3c (exclusive)
; PE unwind range; not necessarily an entire source-level function.
0000000182776716  55                             push     rbp
0000000182776717  41 56                          push     r14
0000000182776719  56                             push     rsi
000000018277671A  57                             push     rdi
000000018277671B  53                             push     rbx
000000018277671C  48 81 ec 00 01 00 00           sub      rsp, 0x100
0000000182776723  48 8d ac 24 80 00 00 00        lea      rbp, [rsp + 0x80]
000000018277672B  48 c7 45 78 fe ff ff ff        mov      qword ptr [rbp + 0x78], 0xfffffffffffffffe
0000000182776733  48 89 ce                       mov      rsi, rcx
0000000182776736  44 8a b5 d0 00 00 00           mov      r14b, byte ptr [rbp + 0xd0]
000000018277673D  48 81 fa 10 02 00 00           cmp      rdx, 0x210
0000000182776744  0f 85 db 00 00 00              jne      0x182776825
000000018277674A  4c 89 cf                       mov      rdi, r9
000000018277674D  49 8b 09                       mov      rcx, qword ptr [r9]
0000000182776750  48 85 c9                       test     rcx, rcx
0000000182776753  0f 84 ae 01 00 00              je       0x182776907
0000000182776759  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018277675D  48 83 c1 08                    add      rcx, 8
0000000182776761  6a 01                          push     1
0000000182776763  5a                             pop      rdx
0000000182776764  ff 90 28 01 00 00              call     qword ptr [rax + 0x128]
000000018277676A  84 c0                          test     al, al
000000018277676C  0f 84 29 02 00 00              je       0x18277699b
0000000182776772  48 8b 0f                       mov      rcx, qword ptr [rdi]
0000000182776775  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
0000000182776779  48 83 c1 08                    add      rcx, 8
000000018277677D  48 8d 55 40                    lea      rdx, [rbp + 0x40]
0000000182776781  6a 01                          push     1
0000000182776783  41 58                          pop      r8
0000000182776785  ff 50 68                       call     qword ptr [rax + 0x68]
0000000182776788  48 8b 0f                       mov      rcx, qword ptr [rdi]
000000018277678B  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
000000018277678F  48 83 c1 08                    add      rcx, 8
0000000182776793  48 8d 55 f8                    lea      rdx, [rbp - 8]
0000000182776797  6a 02                          push     2
0000000182776799  41 58                          pop      r8
000000018277679B  ff 50 68                       call     qword ptr [rax + 0x68]
000000018277679E  48 8b 0f                       mov      rcx, qword ptr [rdi]
00000001827767A1  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
00000001827767A5  48 83 c1 08                    add      rcx, 8
00000001827767A9  6a 04                          push     4
00000001827767AB  5a                             pop      rdx
00000001827767AC  ff 50 50                       call     qword ptr [rax + 0x50]
00000001827767AF  48 89 45 c0                    mov      qword ptr [rbp - 0x40], rax
00000001827767B3  48 8b 0f                       mov      rcx, qword ptr [rdi]
00000001827767B6  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
00000001827767BA  48 83 c1 08                    add      rcx, 8
00000001827767BE  6a 05                          push     5
00000001827767C0  5a                             pop      rdx
00000001827767C1  ff 50 50                       call     qword ptr [rax + 0x50]
00000001827767C4  48 89 45 10                    mov      qword ptr [rbp + 0x10], rax
00000001827767C8  48 8b 0f                       mov      rcx, qword ptr [rdi]
00000001827767CB  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
00000001827767CF  48 83 c1 08                    add      rcx, 8
00000001827767D3  48 8d 55 28                    lea      rdx, [rbp + 0x28]
00000001827767D7  6a 03                          push     3
00000001827767D9  41 58                          pop      r8
00000001827767DB  ff 50 68                       call     qword ptr [rax + 0x68]
00000001827767DE  44 88 74 24 28                 mov      byte ptr [rsp + 0x28], r14b
00000001827767E3  48 8d 45 10                    lea      rax, [rbp + 0x10]
00000001827767E7  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
00000001827767EC  c6 44 24 30 00                 mov      byte ptr [rsp + 0x30], 0
00000001827767F1  48 8d 55 28                    lea      rdx, [rbp + 0x28]
00000001827767F5  4c 8d 45 40                    lea      r8, [rbp + 0x40]
00000001827767F9  4c 8d 4d c0                    lea      r9, [rbp - 0x40]
00000001827767FD  48 89 f1                       mov      rcx, rsi
0000000182776800  e8 1b 07 00 00                 call     0x182776f20
0000000182776805  48 8d 4d 28                    lea      rcx, [rbp + 0x28]
0000000182776809  e8 f2 83 01 fe                 call     0x18078ec00
000000018277680E  48 8d 4d f8                    lea      rcx, [rbp - 8]
0000000182776812  e8 e9 83 01 fe                 call     0x18078ec00
0000000182776817  48 8d 4d 40                    lea      rcx, [rbp + 0x40]
000000018277681B  e8 e0 83 01 fe                 call     0x18078ec00
0000000182776820  e9 07 02 00 00                 jmp      0x182776a2c
0000000182776825  4c 89 c3                       mov      rbx, r8
0000000182776828  49 8b 08                       mov      rcx, qword ptr [r8]
000000018277682B  48 85 c9                       test     rcx, rcx
000000018277682E  0f 84 1d 01 00 00              je       0x182776951
0000000182776834  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
0000000182776838  48 83 c1 08                    add      rcx, 8
000000018277683C  6a 03                          push     3
000000018277683E  5a                             pop      rdx
000000018277683F  ff 90 28 01 00 00              call     qword ptr [rax + 0x128]
0000000182776845  84 c0                          test     al, al
0000000182776847  0f 84 95 01 00 00              je       0x1827769e2
000000018277684D  48 8b 0b                       mov      rcx, qword ptr [rbx]
0000000182776850  48 8b 01                       mov      rax, qword ptr [rcx]
0000000182776853  48 8d 7d d8                    lea      rdi, [rbp - 0x28]
0000000182776857  6a 03                          push     3
0000000182776859  41 58                          pop      r8
000000018277685B  48 89 fa                       mov      rdx, rdi
000000018277685E  ff 90 18 01 00 00              call     qword ptr [rax + 0x118]
0000000182776864  48 8b 0f                       mov      rcx, qword ptr [rdi]
0000000182776867  48 85 c9                       test     rcx, rcx
000000018277686A  0f 84 cb 01 00 00              je       0x182776a3b
0000000182776870  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
0000000182776874  48 83 c1 08                    add      rcx, 8
0000000182776878  6a 02                          push     2
000000018277687A  5a                             pop      rdx
000000018277687B  ff 90 28 01 00 00              call     qword ptr [rax + 0x128]
0000000182776881  84 c0                          test     al, al
0000000182776883  0f 84 01 02 00 00              je       0x182776a8a
0000000182776889  48 8b 4d d8                    mov      rcx, qword ptr [rbp - 0x28]
000000018277688D  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
0000000182776891  48 83 c1 08                    add      rcx, 8
0000000182776895  48 8d 55 40                    lea      rdx, [rbp + 0x40]
0000000182776899  6a 02                          push     2
000000018277689B  41 58                          pop      r8
000000018277689D  ff 50 70                       call     qword ptr [rax + 0x70]
00000001827768A0  48 8b 55 40                    mov      rdx, qword ptr [rbp + 0x40]
00000001827768A4  4c 8b 45 48                    mov      r8, qword ptr [rbp + 0x48]
00000001827768A8  4c 89 c0                       mov      rax, r8
00000001827768AB  48 29 d0                       sub      rax, rdx
00000001827768AE  48 83 f8 07                    cmp      rax, 7
00000001827768B2  0f 87 21 02 00 00              ja       0x182776ad9
00000001827768B8  48 8d 35 fc 33 2e 02           lea      rsi, [rip + 0x22e33fc] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
00000001827768BF  6a 5c                          push     0x5c
00000001827768C1  5a                             pop      rdx
00000001827768C2  48 89 f1                       mov      rcx, rsi
00000001827768C5  e8 26 54 8b 01                 call     0x18402bcf0
00000001827768CA  4c 8d 40 01                    lea      r8, [rax + 1]
00000001827768CE  48 85 c0                       test     rax, rax
00000001827768D1  4c 0f 44 c6                    cmove    r8, rsi
00000001827768D5  48 8d 05 99 0d 1a 02           lea      rax, [rip + 0x21a0d99] ; on recall group PaiYiPai sys msg! im_msg_body::MsgBody::kBytesMsgContent is error
00000001827768DC  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
00000001827768E1  48 8d 05 fc 7f 21 02           lea      rax, [rip + 0x2217ffc] ; HandleRecallSysMsg
00000001827768E8  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
00000001827768ED  48 8d 0d 7c f3 cf 01           lea      rcx, [rip + 0x1cff37c]
00000001827768F4  6a 04                          push     4
00000001827768F6  5a                             pop      rdx
00000001827768F7  41 b9 f0 02 00 00              mov      r9d, 0x2f0
00000001827768FD  e8 28 cc 88 fd                 call     0x18000352a
0000000182776902  e9 1e 04 00 00                 jmp      0x182776d25
0000000182776907  48 8d 35 ad 33 2e 02           lea      rsi, [rip + 0x22e33ad] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
000000018277690E  6a 5c                          push     0x5c
0000000182776910  5a                             pop      rdx
0000000182776911  48 89 f1                       mov      rcx, rsi
0000000182776914  e8 d7 53 8b 01                 call     0x18402bcf0
0000000182776919  4c 8d 40 01                    lea      r8, [rax + 1]
000000018277691D  48 85 c0                       test     rax, rax
0000000182776920  4c 0f 44 c6                    cmove    r8, rsi
0000000182776924  48 8d 05 6a d6 12 02           lea      rax, [rip + 0x212d66a] ; on recall c2c PaiYiPai sys msg! no content
000000018277692B  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
0000000182776930  48 8d 05 ad 7f 21 02           lea      rax, [rip + 0x2217fad] ; HandleRecallSysMsg
0000000182776937  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
000000018277693C  48 8d 0d 2d f3 cf 01           lea      rcx, [rip + 0x1cff32d]
0000000182776943  6a 04                          push     4
0000000182776945  5a                             pop      rdx
0000000182776946  41 b9 ce 02 00 00              mov      r9d, 0x2ce
000000018277694C  e9 d6 00 00 00                 jmp      0x182776a27
0000000182776951  48 8d 35 63 33 2e 02           lea      rsi, [rip + 0x22e3363] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
0000000182776958  6a 5c                          push     0x5c
000000018277695A  5a                             pop      rdx
000000018277695B  48 89 f1                       mov      rcx, rsi
000000018277695E  e8 8d 53 8b 01                 call     0x18402bcf0
0000000182776963  4c 8d 40 01                    lea      r8, [rax + 1]
0000000182776967  48 85 c0                       test     rax, rax
000000018277696A  4c 0f 44 c6                    cmove    r8, rsi
000000018277696E  48 8d 05 79 f2 1f 02           lea      rax, [rip + 0x21ff279] ; on recall group PaiYiPai sys msg! sys_msg is null
0000000182776975  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
000000018277697A  48 8d 05 63 7f 21 02           lea      rax, [rip + 0x2217f63] ; HandleRecallSysMsg
0000000182776981  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
0000000182776986  48 8d 0d e3 f2 cf 01           lea      rcx, [rip + 0x1cff2e3]
000000018277698D  6a 04                          push     4
000000018277698F  5a                             pop      rdx
0000000182776990  41 b9 de 02 00 00              mov      r9d, 0x2de
0000000182776996  e9 8c 00 00 00                 jmp      0x182776a27
000000018277699B  48 8d 35 19 33 2e 02           lea      rsi, [rip + 0x22e3319] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
00000001827769A2  6a 5c                          push     0x5c
00000001827769A4  5a                             pop      rdx
00000001827769A5  48 89 f1                       mov      rcx, rsi
00000001827769A8  e8 43 53 8b 01                 call     0x18402bcf0
00000001827769AD  4c 8d 40 01                    lea      r8, [rax + 1]
00000001827769B1  48 85 c0                       test     rax, rax
00000001827769B4  4c 0f 44 c6                    cmove    r8, rsi
00000001827769B8  48 8d 05 81 a1 18 02           lea      rax, [rip + 0x218a181] ; on recall c2c PaiYiPai sys msg! no msg infos
00000001827769BF  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
00000001827769C4  48 8d 05 19 7f 21 02           lea      rax, [rip + 0x2217f19] ; HandleRecallSysMsg
00000001827769CB  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
00000001827769D0  48 8d 0d 99 f2 cf 01           lea      rcx, [rip + 0x1cff299]
00000001827769D7  6a 04                          push     4
00000001827769D9  5a                             pop      rdx
00000001827769DA  41 b9 d2 02 00 00              mov      r9d, 0x2d2
00000001827769E0  eb 45                          jmp      0x182776a27
00000001827769E2  48 8d 35 d2 32 2e 02           lea      rsi, [rip + 0x22e32d2] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
00000001827769E9  6a 5c                          push     0x5c
00000001827769EB  5a                             pop      rdx
00000001827769EC  48 89 f1                       mov      rcx, rsi
00000001827769EF  e8 fc 52 8b 01                 call     0x18402bcf0
00000001827769F4  4c 8d 40 01                    lea      r8, [rax + 1]
00000001827769F8  48 85 c0                       test     rax, rax
00000001827769FB  4c 0f 44 c6                    cmove    r8, rsi
00000001827769FF  48 8d 05 2f 64 11 02           lea      rax, [rip + 0x211642f] ; on recall group PaiYiPai sys msg! hasn't msg_common::Msg::kBody
0000000182776A06  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
0000000182776A0B  48 8d 05 d2 7e 21 02           lea      rax, [rip + 0x2217ed2] ; HandleRecallSysMsg
0000000182776A12  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
0000000182776A17  48 8d 0d 52 f2 cf 01           lea      rcx, [rip + 0x1cff252]
0000000182776A1E  6a 04                          push     4
0000000182776A20  5a                             pop      rdx
0000000182776A21  41 b9 e2 02 00 00              mov      r9d, 0x2e2
0000000182776A27  e8 fe ca 88 fd                 call     0x18000352a
0000000182776A2C  90                             nop      
0000000182776A2D  48 81 c4 00 01 00 00           add      rsp, 0x100
0000000182776A34  5b                             pop      rbx
0000000182776A35  5f                             pop      rdi
0000000182776A36  5e                             pop      rsi
0000000182776A37  41 5e                          pop      r14
0000000182776A39  5d                             pop      rbp
0000000182776A3A  c3                             ret      
0000000182776A3B  48 8d 35 79 32 2e 02           lea      rsi, [rip + 0x22e3279] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
0000000182776A42  6a 5c                          push     0x5c
0000000182776A44  5a                             pop      rdx
0000000182776A45  48 89 f1                       mov      rcx, rsi
0000000182776A48  e8 a3 52 8b 01                 call     0x18402bcf0
0000000182776A4D  4c 8d 40 01                    lea      r8, [rax + 1]
0000000182776A51  48 85 c0                       test     rax, rax
0000000182776A54  4c 0f 44 c6                    cmove    r8, rsi
0000000182776A58  48 8d 05 76 26 20 02           lea      rax, [rip + 0x2202676] ; on recall group PaiYiPai sys msg! msg_common::Msg::kBody = null
0000000182776A5F  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
0000000182776A64  48 8d 05 79 7e 21 02           lea      rax, [rip + 0x2217e79] ; HandleRecallSysMsg
0000000182776A6B  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
0000000182776A70  48 8d 0d f9 f1 cf 01           lea      rcx, [rip + 0x1cff1f9]
0000000182776A77  6a 04                          push     4
0000000182776A79  5a                             pop      rdx
0000000182776A7A  41 b9 e7 02 00 00              mov      r9d, 0x2e7
0000000182776A80  e8 a5 ca 88 fd                 call     0x18000352a
0000000182776A85  e9 a4 02 00 00                 jmp      0x182776d2e
0000000182776A8A  48 8d 35 2a 32 2e 02           lea      rsi, [rip + 0x22e322a] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
0000000182776A91  6a 5c                          push     0x5c
0000000182776A93  5a                             pop      rdx
0000000182776A94  48 89 f1                       mov      rcx, rsi
0000000182776A97  e8 54 52 8b 01                 call     0x18402bcf0
0000000182776A9C  4c 8d 40 01                    lea      r8, [rax + 1]
0000000182776AA0  48 85 c0                       test     rax, rax
0000000182776AA3  4c 0f 44 c6                    cmove    r8, rsi
0000000182776AA7  48 8d 05 20 df 12 02           lea      rax, [rip + 0x212df20] ; on recall group PaiYiPai sys msg! hasn't im_msg_body::MsgBody::kBytesMsgContent
0000000182776AAE  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
0000000182776AB3  48 8d 05 2a 7e 21 02           lea      rax, [rip + 0x2217e2a] ; HandleRecallSysMsg
0000000182776ABA  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
0000000182776ABF  48 8d 0d aa f1 cf 01           lea      rcx, [rip + 0x1cff1aa]
0000000182776AC6  6a 04                          push     4
0000000182776AC8  5a                             pop      rdx
0000000182776AC9  41 b9 eb 02 00 00              mov      r9d, 0x2eb
0000000182776ACF  e8 56 ca 88 fd                 call     0x18000352a
0000000182776AD4  e9 55 02 00 00                 jmp      0x182776d2e
0000000182776AD9  48 83 c2 07                    add      rdx, 7
0000000182776ADD  48 8d 4d f8                    lea      rcx, [rbp - 8]
0000000182776AE1  e8 64 c8 88 fd                 call     0x18000334a
0000000182776AE6  48 8d 4d 58                    lea      rcx, [rbp + 0x58]
0000000182776AEA  e8 51 90 62 fe                 call     0x180d9fb40
0000000182776AEF  48 8b 4d 58                    mov      rcx, qword ptr [rbp + 0x58]
0000000182776AF3  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
0000000182776AF7  48 83 c1 08                    add      rcx, 8
0000000182776AFB  48 8d 55 f8                    lea      rdx, [rbp - 8]
0000000182776AFF  ff 90 10 01 00 00              call     qword ptr [rax + 0x110]
0000000182776B05  84 c0                          test     al, al
0000000182776B07  0f 84 06 01 00 00              je       0x182776c13
0000000182776B0D  48 8b 4d 58                    mov      rcx, qword ptr [rbp + 0x58]
0000000182776B11  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
0000000182776B15  48 83 c1 08                    add      rcx, 8
0000000182776B19  6a 01                          push     1
0000000182776B1B  5a                             pop      rdx
0000000182776B1C  ff 50 50                       call     qword ptr [rax + 0x50]
0000000182776B1F  48 83 f8 20                    cmp      rax, 0x20
0000000182776B23  0f 85 ea 01 00 00              jne      0x182776d13
0000000182776B29  48 8b 4d 58                    mov      rcx, qword ptr [rbp + 0x58]
0000000182776B2D  48 8b 01                       mov      rax, qword ptr [rcx]
0000000182776B30  48 8d 55 68                    lea      rdx, [rbp + 0x68]
0000000182776B34  6a 28                          push     0x28
0000000182776B36  41 58                          pop      r8
0000000182776B38  ff 90 18 01 00 00              call     qword ptr [rax + 0x118]
0000000182776B3E  48 8b 4d 68                    mov      rcx, qword ptr [rbp + 0x68]
0000000182776B42  48 85 c9                       test     rcx, rcx
0000000182776B45  0f 84 17 01 00 00              je       0x182776c62
0000000182776B4B  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
0000000182776B4F  48 83 c1 08                    add      rcx, 8
0000000182776B53  48 8d 55 28                    lea      rdx, [rbp + 0x28]
0000000182776B57  6a 01                          push     1
0000000182776B59  41 58                          pop      r8
0000000182776B5B  ff 50 68                       call     qword ptr [rax + 0x68]
0000000182776B5E  48 8b 4d 68                    mov      rcx, qword ptr [rbp + 0x68]
0000000182776B62  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
0000000182776B66  48 83 c1 08                    add      rcx, 8
0000000182776B6A  48 8d 55 c0                    lea      rdx, [rbp - 0x40]
0000000182776B6E  6a 02                          push     2
0000000182776B70  41 58                          pop      r8
0000000182776B72  ff 50 68                       call     qword ptr [rax + 0x68]
0000000182776B75  48 8b 4d 68                    mov      rcx, qword ptr [rbp + 0x68]
0000000182776B79  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
0000000182776B7D  48 83 c1 08                    add      rcx, 8
0000000182776B81  6a 04                          push     4
0000000182776B83  5a                             pop      rdx
0000000182776B84  ff 50 50                       call     qword ptr [rax + 0x50]
0000000182776B87  48 89 45 e8                    mov      qword ptr [rbp - 0x18], rax
0000000182776B8B  48 8b 4d 68                    mov      rcx, qword ptr [rbp + 0x68]
0000000182776B8F  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
0000000182776B93  48 83 c1 08                    add      rcx, 8
0000000182776B97  6a 05                          push     5
0000000182776B99  5a                             pop      rdx
0000000182776B9A  ff 50 50                       call     qword ptr [rax + 0x50]
0000000182776B9D  48 89 45 f0                    mov      qword ptr [rbp - 0x10], rax
0000000182776BA1  48 8b 4d 68                    mov      rcx, qword ptr [rbp + 0x68]
0000000182776BA5  48 8b 41 08                    mov      rax, qword ptr [rcx + 8]
0000000182776BA9  48 83 c1 08                    add      rcx, 8
0000000182776BAD  6a 03                          push     3
0000000182776BAF  5a                             pop      rdx
0000000182776BB0  ff 50 50                       call     qword ptr [rax + 0x50]
0000000182776BB3  48 89 c7                       mov      rdi, rax
0000000182776BB6  48 85 c0                       test     rax, rax
0000000182776BB9  0f 84 ef 00 00 00              je       0x182776cae
0000000182776BBF  48 8d 15 a7 88 38 02           lea      rdx, [rip + 0x23888a7]
0000000182776BC6  48 8d 4d 10                    lea      rcx, [rbp + 0x10]
0000000182776BCA  e8 4f c7 88 fd                 call     0x18000331e
0000000182776BCF  6a 0a                          push     0xa
0000000182776BD1  5a                             pop      rdx
0000000182776BD2  4c 8d 45 10                    lea      r8, [rbp + 0x10]
0000000182776BD6  48 89 f9                       mov      rcx, rdi
0000000182776BD9  e8 fe bf 27 fe                 call     0x1809f2bdc
0000000182776BDE  44 88 74 24 28                 mov      byte ptr [rsp + 0x28], r14b
0000000182776BE3  48 8d 45 f0                    lea      rax, [rbp - 0x10]
0000000182776BE7  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
0000000182776BEC  c6 44 24 30 00                 mov      byte ptr [rsp + 0x30], 0
0000000182776BF1  48 8d 55 10                    lea      rdx, [rbp + 0x10]
0000000182776BF5  4c 8d 45 28                    lea      r8, [rbp + 0x28]
0000000182776BF9  4c 8d 4d e8                    lea      r9, [rbp - 0x18]
0000000182776BFD  48 89 f1                       mov      rcx, rsi
0000000182776C00  e8 1b 03 00 00                 call     0x182776f20
0000000182776C05  48 8d 4d 10                    lea      rcx, [rbp + 0x10]
0000000182776C09  e8 f2 7f 01 fe                 call     0x18078ec00
0000000182776C0E  e9 e5 00 00 00                 jmp      0x182776cf8
0000000182776C13  48 8d 35 a1 30 2e 02           lea      rsi, [rip + 0x22e30a1] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
0000000182776C1A  6a 5c                          push     0x5c
0000000182776C1C  5a                             pop      rdx
0000000182776C1D  48 89 f1                       mov      rcx, rsi
0000000182776C20  e8 cb 50 8b 01                 call     0x18402bcf0
0000000182776C25  4c 8d 40 01                    lea      r8, [rax + 1]
0000000182776C29  48 85 c0                       test     rax, rax
0000000182776C2C  4c 0f 44 c6                    cmove    r8, rsi
0000000182776C30  48 8d 05 a1 41 20 02           lea      rax, [rip + 0x22041a1] ; on recall group PaiYiPai sys msg! decode kBytesMsgContent fail
0000000182776C37  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
0000000182776C3C  48 8d 05 a1 7c 21 02           lea      rax, [rip + 0x2217ca1] ; HandleRecallSysMsg
0000000182776C43  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
0000000182776C48  48 8d 0d 21 f0 cf 01           lea      rcx, [rip + 0x1cff021]
0000000182776C4F  6a 04                          push     4
0000000182776C51  5a                             pop      rdx
0000000182776C52  41 b9 f7 02 00 00              mov      r9d, 0x2f7
0000000182776C58  e8 cd c8 88 fd                 call     0x18000352a
0000000182776C5D  e9 b1 00 00 00                 jmp      0x182776d13
0000000182776C62  48 8d 35 52 30 2e 02           lea      rsi, [rip + 0x22e3052] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
0000000182776C69  6a 5c                          push     0x5c
0000000182776C6B  5a                             pop      rdx
0000000182776C6C  48 89 f1                       mov      rcx, rsi
0000000182776C6F  e8 7c 50 8b 01                 call     0x18402bcf0
0000000182776C74  4c 8d 40 01                    lea      r8, [rax + 1]
0000000182776C78  48 85 c0                       test     rax, rax
0000000182776C7B  4c 0f 44 c6                    cmove    r8, rsi
0000000182776C7F  48 8d 05 f3 25 20 02           lea      rax, [rip + 0x22025f3] ; on recall group PaiYiPai sys msg! NotifyMsgBody::kRevertGrayTipsMsgTraceless = null
0000000182776C86  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
0000000182776C8B  48 8d 05 52 7c 21 02           lea      rax, [rip + 0x2217c52] ; HandleRecallSysMsg
0000000182776C92  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
0000000182776C97  48 8d 0d d2 ef cf 01           lea      rcx, [rip + 0x1cfefd2]
0000000182776C9E  6a 04                          push     4
0000000182776CA0  5a                             pop      rdx
0000000182776CA1  41 b9 03 03 00 00              mov      r9d, 0x303
0000000182776CA7  e8 7e c8 88 fd                 call     0x18000352a
0000000182776CAC  eb 5c                          jmp      0x182776d0a
0000000182776CAE  48 8d 35 06 30 2e 02           lea      rsi, [rip + 0x22e3006] ; ..\modules\im_core\msg\recall\msg_recall_worker.cc
0000000182776CB5  6a 5c                          push     0x5c
0000000182776CB7  5a                             pop      rdx
0000000182776CB8  48 89 f1                       mov      rcx, rsi
0000000182776CBB  e8 30 50 8b 01                 call     0x18402bcf0
0000000182776CC0  4c 8d 40 01                    lea      r8, [rax + 1]
0000000182776CC4  48 85 c0                       test     rax, rax
0000000182776CC7  4c 0f 44 c6                    cmove    r8, rsi
0000000182776CCB  48 8d 05 80 82 34 02           lea      rax, [rip + 0x2348280] ; on recall group PaiYiPai sys msg! group code is 0.
0000000182776CD2  48 89 44 24 28                 mov      qword ptr [rsp + 0x28], rax
0000000182776CD7  48 8d 05 06 7c 21 02           lea      rax, [rip + 0x2217c06] ; HandleRecallSysMsg
0000000182776CDE  48 89 44 24 20                 mov      qword ptr [rsp + 0x20], rax
0000000182776CE3  48 8d 0d 86 ef cf 01           lea      rcx, [rip + 0x1cfef86]
0000000182776CEA  6a 04                          push     4
0000000182776CEC  5a                             pop      rdx
0000000182776CED  41 b9 0c 03 00 00              mov      r9d, 0x30c
0000000182776CF3  e8 32 c8 88 fd                 call     0x18000352a
0000000182776CF8  48 8d 4d c0                    lea      rcx, [rbp - 0x40]
0000000182776CFC  e8 ff 7e 01 fe                 call     0x18078ec00
0000000182776D01  48 8d 4d 28                    lea      rcx, [rbp + 0x28]
0000000182776D05  e8 f6 7e 01 fe                 call     0x18078ec00
0000000182776D0A  48 8d 4d 68                    lea      rcx, [rbp + 0x68]
0000000182776D0E  e8 9f b0 88 fd                 call     0x180001db2
0000000182776D13  48 8d 4d 58                    lea      rcx, [rbp + 0x58]
0000000182776D17  e8 96 b0 88 fd                 call     0x180001db2
0000000182776D1C  48 8d 4d f8                    lea      rcx, [rbp - 8]
0000000182776D20  e8 f5 bb 88 fd                 call     0x18000291a
0000000182776D25  48 8d 4d 40                    lea      rcx, [rbp + 0x40]
0000000182776D29  e8 ec bb 88 fd                 call     0x18000291a
0000000182776D2E  48 8d 4d d8                    lea      rcx, [rbp - 0x28]
0000000182776D32  e8 7b b0 88 fd                 call     0x180001db2
0000000182776D37  e9 f0 fc ff ff                 jmp      0x182776a2c
