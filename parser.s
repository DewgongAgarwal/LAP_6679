	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 1
	.file	1 "/Users/dk/Desktop/6679" "./definitions.h"
	.file	2 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types" "_int32_t.h"
	.globl	_parseFile                      ## -- Begin function parseFile
	.p2align	4, 0x90
_parseFile:                             ## @parseFile
Lfunc_begin0:
	.file	3 "/Users/dk/Desktop/6679" "parser.c"
	.loc	3 7 0                           ## parser.c:7:0
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	%r8, -40(%rbp)
	movl	%r9d, -44(%rbp)
Ltmp0:
	.loc	3 9 13 prologue_end             ## parser.c:9:13
	movl	$0, -48(%rbp)
	.loc	3 9 37 is_stmt 0                ## parser.c:9:37
	movl	$1, -52(%rbp)
	.loc	3 9 53                          ## parser.c:9:53
	movl	$0, -56(%rbp)
LBB0_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_5 Depth 2
                                        ##     Child Loop BB0_14 Depth 2
                                        ##     Child Loop BB0_22 Depth 2
                                        ##       Child Loop BB0_24 Depth 3
	.loc	3 10 11 is_stmt 1               ## parser.c:10:11
	movl	-52(%rbp), %eax
	.loc	3 10 22 is_stmt 0               ## parser.c:10:22
	cmpl	-44(%rbp), %eax
	.loc	3 10 5                          ## parser.c:10:5
	jge	LBB0_37
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
Ltmp1:
	.loc	3 11 20 is_stmt 1               ## parser.c:11:20
	movq	-8(%rbp), %rax
	movslq	-52(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 11 13 is_stmt 0               ## parser.c:11:13
	leaq	L_.str(%rip), %rsi
	callq	_strstr
	.loc	3 11 46                         ## parser.c:11:46
	cmpq	$0, %rax
Ltmp2:
	.loc	3 11 13                         ## parser.c:11:13
	je	LBB0_4
## %bb.3:
Ltmp3:
	.loc	3 12 13 is_stmt 1               ## parser.c:12:13
	jmp	LBB0_37
Ltmp4:
LBB0_4:                                 ##   in Loop: Header=BB0_1 Depth=1
	.loc	3 14 9                          ## parser.c:14:9
	jmp	LBB0_5
LBB0_5:                                 ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	.loc	3 14 22 is_stmt 0               ## parser.c:14:22
	movq	-8(%rbp), %rax
	movslq	-52(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 14 15                         ## parser.c:14:15
	callq	_strlen
	.loc	3 14 41                         ## parser.c:14:41
	cmpq	$1, %rax
	.loc	3 14 9                          ## parser.c:14:9
	ja	LBB0_7
## %bb.6:                               ##   in Loop: Header=BB0_5 Depth=2
Ltmp5:
	.loc	3 15 23 is_stmt 1               ## parser.c:15:23
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
Ltmp6:
	.loc	3 14 9                          ## parser.c:14:9
	jmp	LBB0_5
LBB0_7:                                 ##   in Loop: Header=BB0_1 Depth=1
Ltmp7:
	.loc	3 17 19                         ## parser.c:17:19
	movq	-8(%rbp), %rax
	movslq	-52(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 17 12 is_stmt 0               ## parser.c:17:12
	leaq	L_.str.1(%rip), %rsi
	callq	_strstr
	.loc	3 17 52                         ## parser.c:17:52
	cmpq	$0, %rax
Ltmp8:
	.loc	3 17 12                         ## parser.c:17:12
	je	LBB0_9
## %bb.8:                               ##   in Loop: Header=BB0_1 Depth=1
Ltmp9:
	.loc	3 18 24 is_stmt 1               ## parser.c:18:24
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
Ltmp10:
LBB0_9:                                 ##   in Loop: Header=BB0_1 Depth=1
	.loc	3 20 12                         ## parser.c:20:12
	movl	-52(%rbp), %eax
	.loc	3 20 23 is_stmt 0               ## parser.c:20:23
	cmpl	-44(%rbp), %eax
	.loc	3 20 39                         ## parser.c:20:39
	jge	LBB0_13
## %bb.10:                              ##   in Loop: Header=BB0_1 Depth=1
	.loc	3 20 50                         ## parser.c:20:50
	movq	-8(%rbp), %rax
	movslq	-52(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 20 43                         ## parser.c:20:43
	leaq	L_.str.2(%rip), %rsi
	callq	_strstr
	.loc	3 20 79                         ## parser.c:20:79
	cmpq	$0, %rax
	.loc	3 20 87                         ## parser.c:20:87
	jne	LBB0_12
## %bb.11:                              ##   in Loop: Header=BB0_1 Depth=1
	.loc	3 20 97                         ## parser.c:20:97
	movq	-8(%rbp), %rax
	movslq	-52(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 20 90                         ## parser.c:20:90
	leaq	L_.str.3(%rip), %rsi
	callq	_strstr
	.loc	3 20 126                        ## parser.c:20:126
	cmpq	$0, %rax
Ltmp11:
	.loc	3 20 12                         ## parser.c:20:12
	je	LBB0_13
LBB0_12:
Ltmp12:
	.loc	3 21 13 is_stmt 1               ## parser.c:21:13
	jmp	LBB0_37
Ltmp13:
LBB0_13:                                ##   in Loop: Header=BB0_1 Depth=1
	.loc	3 23 9                          ## parser.c:23:9
	movq	-16(%rbp), %rax
	movslq	-48(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	movq	-8(%rbp), %rax
	movslq	-52(%rbp), %rcx
	movq	(%rax,%rcx,8), %rsi
	addq	$1, %rsi
	movq	$-1, %rdx
	callq	___strcat_chk
	.loc	3 24 23                         ## parser.c:24:23
	movq	-16(%rbp), %rax
	movslq	-48(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 24 16 is_stmt 0               ## parser.c:24:16
	callq	_strlen
                                        ## kill: def $eax killed $eax killed $rax
	.loc	3 24 14                         ## parser.c:24:14
	movl	%eax, -56(%rbp)
LBB0_14:                                ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	.loc	3 25 16 is_stmt 1               ## parser.c:25:16
	movq	-16(%rbp), %rax
	movslq	-48(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	3 25 50 is_stmt 0               ## parser.c:25:50
	movl	-56(%rbp), %ecx
	.loc	3 25 55                         ## parser.c:25:55
	subl	$1, %ecx
	.loc	3 25 16                         ## parser.c:25:16
	movslq	%ecx, %rcx
	movsbl	(%rax,%rcx), %eax
	.loc	3 25 60                         ## parser.c:25:60
	cmpl	$32, %eax
	.loc	3 25 9                          ## parser.c:25:9
	jne	LBB0_16
## %bb.15:                              ##   in Loop: Header=BB0_14 Depth=2
Ltmp14:
	.loc	3 26 13 is_stmt 1               ## parser.c:26:13
	movq	-16(%rbp), %rax
	movslq	-48(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	3 26 47 is_stmt 0               ## parser.c:26:47
	movl	-56(%rbp), %ecx
	.loc	3 26 52                         ## parser.c:26:52
	subl	$1, %ecx
	.loc	3 26 13                         ## parser.c:26:13
	movslq	%ecx, %rcx
	.loc	3 26 57                         ## parser.c:26:57
	movb	$0, (%rax,%rcx)
	.loc	3 27 18 is_stmt 1               ## parser.c:27:18
	movl	-56(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -56(%rbp)
Ltmp15:
	.loc	3 25 9                          ## parser.c:25:9
	jmp	LBB0_14
LBB0_16:                                ##   in Loop: Header=BB0_1 Depth=1
Ltmp16:
	.loc	3 29 19                         ## parser.c:29:19
	movq	-8(%rbp), %rax
	movslq	-52(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 29 12 is_stmt 0               ## parser.c:29:12
	movl	$61, %esi
	callq	_strchr
	.loc	3 29 43                         ## parser.c:29:43
	cmpq	$0, %rax
Ltmp17:
	.loc	3 29 12                         ## parser.c:29:12
	je	LBB0_21
## %bb.17:                              ##   in Loop: Header=BB0_1 Depth=1
Ltmp18:
	.loc	3 30 17 is_stmt 1               ## parser.c:30:17
	movl	-52(%rbp), %eax
	.loc	3 30 28 is_stmt 0               ## parser.c:30:28
	addl	$1, %eax
	.loc	3 30 32                         ## parser.c:30:32
	cmpl	-44(%rbp), %eax
	.loc	3 30 48                         ## parser.c:30:48
	jge	LBB0_20
## %bb.18:                              ##   in Loop: Header=BB0_1 Depth=1
	.loc	3 30 58                         ## parser.c:30:58
	movq	-8(%rbp), %rax
	.loc	3 30 64                         ## parser.c:30:64
	movl	-52(%rbp), %ecx
	.loc	3 30 75                         ## parser.c:30:75
	addl	$1, %ecx
	.loc	3 30 58                         ## parser.c:30:58
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 30 51                         ## parser.c:30:51
	movl	$58, %esi
	callq	_strchr
	.loc	3 30 86                         ## parser.c:30:86
	cmpq	$0, %rax
Ltmp19:
	.loc	3 30 17                         ## parser.c:30:17
	jne	LBB0_20
## %bb.19:                              ##   in Loop: Header=BB0_1 Depth=1
Ltmp20:
	.loc	3 31 17 is_stmt 1               ## parser.c:31:17
	movq	-16(%rbp), %rax
	movslq	-48(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	movq	-8(%rbp), %rax
	movl	-52(%rbp), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rsi
	addq	$1, %rsi
	movq	$-1, %rdx
	callq	___strcat_chk
	.loc	3 32 28                         ## parser.c:32:28
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
Ltmp21:
LBB0_20:                                ##   in Loop: Header=BB0_1 Depth=1
	.loc	3 34 32                         ## parser.c:34:32
	movl	-48(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -48(%rbp)
	.loc	3 35 23                         ## parser.c:35:23
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
	.loc	3 36 13                         ## parser.c:36:13
	jmp	LBB0_1
Ltmp22:
LBB0_21:                                ##   in Loop: Header=BB0_1 Depth=1
	.loc	3 38 9                          ## parser.c:38:9
	jmp	LBB0_22
LBB0_22:                                ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB0_24 Depth 3
	.loc	3 38 15 is_stmt 0               ## parser.c:38:15
	movl	-52(%rbp), %eax
	.loc	3 38 26                         ## parser.c:38:26
	addl	$1, %eax
	.loc	3 38 30                         ## parser.c:38:30
	cmpl	-44(%rbp), %eax
	.loc	3 38 9                          ## parser.c:38:9
	jge	LBB0_36
## %bb.23:                              ##   in Loop: Header=BB0_22 Depth=2
Ltmp23:
	.loc	3 39 24 is_stmt 1               ## parser.c:39:24
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
	.loc	3 40 13                         ## parser.c:40:13
	movq	-16(%rbp), %rax
	movslq	-48(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	movq	-8(%rbp), %rax
	movslq	-52(%rbp), %rcx
	movq	(%rax,%rcx,8), %rsi
	addq	$1, %rsi
	movq	$-1, %rdx
	callq	___strcat_chk
	.loc	3 41 27                         ## parser.c:41:27
	movq	-16(%rbp), %rax
	movslq	-48(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 41 20 is_stmt 0               ## parser.c:41:20
	callq	_strlen
                                        ## kill: def $eax killed $eax killed $rax
	.loc	3 41 18                         ## parser.c:41:18
	movl	%eax, -56(%rbp)
LBB0_24:                                ##   Parent Loop BB0_1 Depth=1
                                        ##     Parent Loop BB0_22 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	.loc	3 42 20 is_stmt 1               ## parser.c:42:20
	movq	-16(%rbp), %rax
	movslq	-48(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	3 42 54 is_stmt 0               ## parser.c:42:54
	movl	-56(%rbp), %ecx
	.loc	3 42 59                         ## parser.c:42:59
	subl	$1, %ecx
	.loc	3 42 20                         ## parser.c:42:20
	movslq	%ecx, %rcx
	movsbl	(%rax,%rcx), %eax
	.loc	3 42 64                         ## parser.c:42:64
	cmpl	$32, %eax
	.loc	3 42 13                         ## parser.c:42:13
	jne	LBB0_26
## %bb.25:                              ##   in Loop: Header=BB0_24 Depth=3
Ltmp24:
	.loc	3 43 17 is_stmt 1               ## parser.c:43:17
	movq	-16(%rbp), %rax
	movslq	-48(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	3 43 51 is_stmt 0               ## parser.c:43:51
	movl	-56(%rbp), %ecx
	.loc	3 43 56                         ## parser.c:43:56
	subl	$1, %ecx
	.loc	3 43 17                         ## parser.c:43:17
	movslq	%ecx, %rcx
	.loc	3 43 61                         ## parser.c:43:61
	movb	$0, (%rax,%rcx)
	.loc	3 44 22 is_stmt 1               ## parser.c:44:22
	movl	-56(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -56(%rbp)
Ltmp25:
	.loc	3 42 13                         ## parser.c:42:13
	jmp	LBB0_24
LBB0_26:                                ##   in Loop: Header=BB0_22 Depth=2
Ltmp26:
	.loc	3 46 23                         ## parser.c:46:23
	movq	-8(%rbp), %rax
	movslq	-52(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 46 16 is_stmt 0               ## parser.c:46:16
	movl	$61, %esi
	callq	_strchr
	.loc	3 46 47                         ## parser.c:46:47
	cmpq	$0, %rax
Ltmp27:
	.loc	3 46 16                         ## parser.c:46:16
	je	LBB0_28
## %bb.27:                              ##   in Loop: Header=BB0_1 Depth=1
Ltmp28:
	.loc	3 47 27 is_stmt 1               ## parser.c:47:27
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
	.loc	3 48 17                         ## parser.c:48:17
	jmp	LBB0_36
Ltmp29:
LBB0_28:                                ##   in Loop: Header=BB0_22 Depth=2
	.loc	3 51 17                         ## parser.c:51:17
	movl	-52(%rbp), %eax
	.loc	3 51 28 is_stmt 0               ## parser.c:51:28
	addl	$1, %eax
	.loc	3 51 32                         ## parser.c:51:32
	cmpl	-44(%rbp), %eax
	.loc	3 51 48                         ## parser.c:51:48
	jge	LBB0_31
## %bb.29:                              ##   in Loop: Header=BB0_22 Depth=2
	.loc	3 51 58                         ## parser.c:51:58
	movq	-8(%rbp), %rax
	.loc	3 51 64                         ## parser.c:51:64
	movl	-52(%rbp), %ecx
	.loc	3 51 75                         ## parser.c:51:75
	addl	$1, %ecx
	.loc	3 51 58                         ## parser.c:51:58
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 51 51                         ## parser.c:51:51
	callq	_strlen
	.loc	3 51 81                         ## parser.c:51:81
	cmpq	$1, %rax
Ltmp30:
	.loc	3 51 17                         ## parser.c:51:17
	ja	LBB0_31
## %bb.30:                              ##   in Loop: Header=BB0_1 Depth=1
Ltmp31:
	.loc	3 52 27 is_stmt 1               ## parser.c:52:27
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
	.loc	3 53 17                         ## parser.c:53:17
	jmp	LBB0_36
Ltmp32:
LBB0_31:                                ##   in Loop: Header=BB0_22 Depth=2
	.loc	3 56 16                         ## parser.c:56:16
	movl	-52(%rbp), %eax
	.loc	3 56 27 is_stmt 0               ## parser.c:56:27
	addl	$1, %eax
	.loc	3 56 31                         ## parser.c:56:31
	cmpl	-44(%rbp), %eax
	.loc	3 56 47                         ## parser.c:56:47
	jge	LBB0_35
## %bb.32:                              ##   in Loop: Header=BB0_22 Depth=2
	.loc	3 56 58                         ## parser.c:56:58
	movq	-8(%rbp), %rax
	.loc	3 56 64                         ## parser.c:56:64
	movl	-52(%rbp), %ecx
	.loc	3 56 75                         ## parser.c:56:75
	addl	$1, %ecx
	.loc	3 56 58                         ## parser.c:56:58
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 56 51                         ## parser.c:56:51
	leaq	L_.str.2(%rip), %rsi
	callq	_strstr
	.loc	3 56 91                         ## parser.c:56:91
	cmpq	$0, %rax
	.loc	3 56 99                         ## parser.c:56:99
	jne	LBB0_34
## %bb.33:                              ##   in Loop: Header=BB0_22 Depth=2
	.loc	3 56 109                        ## parser.c:56:109
	movq	-8(%rbp), %rax
	.loc	3 56 115                        ## parser.c:56:115
	movl	-52(%rbp), %ecx
	.loc	3 56 126                        ## parser.c:56:126
	addl	$1, %ecx
	.loc	3 56 109                        ## parser.c:56:109
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 56 102                        ## parser.c:56:102
	leaq	L_.str.3(%rip), %rsi
	callq	_strstr
	.loc	3 56 142                        ## parser.c:56:142
	cmpq	$0, %rax
Ltmp33:
	.loc	3 56 16                         ## parser.c:56:16
	je	LBB0_35
LBB0_34:                                ##   in Loop: Header=BB0_1 Depth=1
Ltmp34:
	.loc	3 57 28 is_stmt 1               ## parser.c:57:28
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
	.loc	3 58 17                         ## parser.c:58:17
	jmp	LBB0_36
Ltmp35:
LBB0_35:                                ##   in Loop: Header=BB0_22 Depth=2
	.loc	3 38 9                          ## parser.c:38:9
	jmp	LBB0_22
LBB0_36:                                ##   in Loop: Header=BB0_1 Depth=1
	.loc	3 61 28                         ## parser.c:61:28
	movl	-48(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -48(%rbp)
Ltmp36:
	.loc	3 10 5                          ## parser.c:10:5
	jmp	LBB0_1
LBB0_37:
	.loc	3 64 5                          ## parser.c:64:5
	jmp	LBB0_38
LBB0_38:                                ## =>This Inner Loop Header: Depth=1
	.loc	3 0 5 is_stmt 0                 ## parser.c:0:5
	xorl	%eax, %eax
                                        ## kill: def $al killed $al killed $eax
	.loc	3 64 12                         ## parser.c:64:12
	movl	-52(%rbp), %ecx
	.loc	3 64 23                         ## parser.c:64:23
	cmpl	-44(%rbp), %ecx
	movb	%al, -61(%rbp)                  ## 1-byte Spill
	.loc	3 64 39                         ## parser.c:64:39
	jge	LBB0_40
## %bb.39:                              ##   in Loop: Header=BB0_38 Depth=1
	.loc	3 64 49                         ## parser.c:64:49
	movq	-8(%rbp), %rax
	movslq	-52(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 64 42                         ## parser.c:64:42
	leaq	L_.str.3(%rip), %rsi
	callq	_strstr
	.loc	3 64 78                         ## parser.c:64:78
	cmpq	$0, %rax
	setne	%al
	movb	%al, -61(%rbp)                  ## 1-byte Spill
LBB0_40:                                ##   in Loop: Header=BB0_38 Depth=1
	.loc	3 0 78                          ## parser.c:0:78
	movb	-61(%rbp), %al                  ## 1-byte Reload
	.loc	3 64 5                          ## parser.c:64:5
	testb	$1, %al
	jne	LBB0_41
	jmp	LBB0_44
LBB0_41:                                ##   in Loop: Header=BB0_38 Depth=1
Ltmp37:
	.loc	3 65 20 is_stmt 1               ## parser.c:65:20
	movq	-8(%rbp), %rax
	movslq	-52(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 65 13 is_stmt 0               ## parser.c:65:13
	leaq	L_.str.2(%rip), %rsi
	callq	_strstr
	.loc	3 65 49                         ## parser.c:65:49
	cmpq	$0, %rax
Ltmp38:
	.loc	3 65 13                         ## parser.c:65:13
	je	LBB0_43
## %bb.42:
Ltmp39:
	.loc	3 66 13 is_stmt 1               ## parser.c:66:13
	jmp	LBB0_44
Ltmp40:
LBB0_43:                                ##   in Loop: Header=BB0_38 Depth=1
	.loc	3 68 20                         ## parser.c:68:20
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
Ltmp41:
	.loc	3 64 5                          ## parser.c:64:5
	jmp	LBB0_38
LBB0_44:
	.loc	3 70 13                         ## parser.c:70:13
	movl	$0, -60(%rbp)
Ltmp42:
	.loc	3 71 9                          ## parser.c:71:9
	movl	-52(%rbp), %eax
	.loc	3 71 20 is_stmt 0               ## parser.c:71:20
	cmpl	-44(%rbp), %eax
	.loc	3 71 37                         ## parser.c:71:37
	je	LBB0_52
## %bb.45:
	.loc	3 71 47                         ## parser.c:71:47
	movq	-8(%rbp), %rax
	movslq	-52(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 71 40                         ## parser.c:71:40
	leaq	L_.str.2(%rip), %rsi
	callq	_strstr
	.loc	3 71 76                         ## parser.c:71:76
	cmpq	$0, %rax
Ltmp43:
	.loc	3 71 9                          ## parser.c:71:9
	jne	LBB0_52
## %bb.46:
Ltmp44:
	.loc	3 73 9 is_stmt 1                ## parser.c:73:9
	jmp	LBB0_47
LBB0_47:                                ## =>This Inner Loop Header: Depth=1
	.loc	3 73 22 is_stmt 0               ## parser.c:73:22
	movq	-8(%rbp), %rax
	movslq	-52(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 73 15                         ## parser.c:73:15
	callq	_strlen
	.loc	3 73 41                         ## parser.c:73:41
	cmpq	$2, %rax
	.loc	3 73 9                          ## parser.c:73:9
	jb	LBB0_51
## %bb.48:                              ##   in Loop: Header=BB0_47 Depth=1
Ltmp45:
	.loc	3 74 24 is_stmt 1               ## parser.c:74:24
	movq	-8(%rbp), %rax
	movslq	-52(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 74 17 is_stmt 0               ## parser.c:74:17
	leaq	L_.str.4(%rip), %rsi
	callq	_strstr
	.loc	3 74 51                         ## parser.c:74:51
	cmpq	$0, %rax
Ltmp46:
	.loc	3 74 17                         ## parser.c:74:17
	je	LBB0_50
## %bb.49:                              ##   in Loop: Header=BB0_47 Depth=1
Ltmp47:
	.loc	3 75 28 is_stmt 1               ## parser.c:75:28
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
	.loc	3 76 17                         ## parser.c:76:17
	jmp	LBB0_47
Ltmp48:
LBB0_50:                                ##   in Loop: Header=BB0_47 Depth=1
	.loc	3 78 13                         ## parser.c:78:13
	movq	-24(%rbp), %rax
	movslq	-60(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	movq	-8(%rbp), %rax
	movslq	-52(%rbp), %rcx
	movq	(%rax,%rcx,8), %rsi
	addq	$1, %rsi
	movq	$-1, %rdx
	callq	___strcat_chk
	.loc	3 79 23                         ## parser.c:79:23
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
	.loc	3 80 28                         ## parser.c:80:28
	movl	-60(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -60(%rbp)
Ltmp49:
	.loc	3 73 9                          ## parser.c:73:9
	jmp	LBB0_47
LBB0_51:
	.loc	3 82 5                          ## parser.c:82:5
	jmp	LBB0_52
Ltmp50:
LBB0_52:
	.loc	3 84 5                          ## parser.c:84:5
	jmp	LBB0_53
LBB0_53:                                ## =>This Inner Loop Header: Depth=1
	.loc	3 0 5 is_stmt 0                 ## parser.c:0:5
	xorl	%eax, %eax
                                        ## kill: def $al killed $al killed $eax
	.loc	3 84 12                         ## parser.c:84:12
	movl	-52(%rbp), %ecx
	.loc	3 84 23                         ## parser.c:84:23
	cmpl	-44(%rbp), %ecx
	movb	%al, -62(%rbp)                  ## 1-byte Spill
	.loc	3 84 39                         ## parser.c:84:39
	jge	LBB0_55
## %bb.54:                              ##   in Loop: Header=BB0_53 Depth=1
	.loc	3 84 49                         ## parser.c:84:49
	movq	-8(%rbp), %rax
	movslq	-52(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 84 42                         ## parser.c:84:42
	leaq	L_.str.2(%rip), %rsi
	callq	_strstr
	.loc	3 84 78                         ## parser.c:84:78
	cmpq	$0, %rax
	sete	%al
	movb	%al, -62(%rbp)                  ## 1-byte Spill
LBB0_55:                                ##   in Loop: Header=BB0_53 Depth=1
	.loc	3 0 78                          ## parser.c:0:78
	movb	-62(%rbp), %al                  ## 1-byte Reload
	.loc	3 84 5                          ## parser.c:84:5
	testb	$1, %al
	jne	LBB0_56
	jmp	LBB0_57
LBB0_56:                                ##   in Loop: Header=BB0_53 Depth=1
Ltmp51:
	.loc	3 85 20 is_stmt 1               ## parser.c:85:20
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
Ltmp52:
	.loc	3 84 5                          ## parser.c:84:5
	jmp	LBB0_53
LBB0_57:
Ltmp53:
	.loc	3 87 9                          ## parser.c:87:9
	movl	-52(%rbp), %eax
	.loc	3 87 20 is_stmt 0               ## parser.c:87:20
	cmpl	-44(%rbp), %eax
Ltmp54:
	.loc	3 87 9                          ## parser.c:87:9
	je	LBB0_65
## %bb.58:
Ltmp55:
	.loc	3 88 19 is_stmt 1               ## parser.c:88:19
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
LBB0_59:                                ## =>This Inner Loop Header: Depth=1
	.loc	3 89 22                         ## parser.c:89:22
	movq	-8(%rbp), %rax
	movslq	-52(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 89 15 is_stmt 0               ## parser.c:89:15
	callq	_strlen
	.loc	3 89 41                         ## parser.c:89:41
	cmpq	$2, %rax
	.loc	3 89 9                          ## parser.c:89:9
	jb	LBB0_64
## %bb.60:                              ##   in Loop: Header=BB0_59 Depth=1
Ltmp56:
	.loc	3 90 16 is_stmt 1               ## parser.c:90:16
	movq	-32(%rbp), %rax
	movsbl	(%rax), %eax
	.loc	3 90 26 is_stmt 0               ## parser.c:90:26
	cmpl	$0, %eax
Ltmp57:
	.loc	3 90 16                         ## parser.c:90:16
	jne	LBB0_62
## %bb.61:                              ##   in Loop: Header=BB0_59 Depth=1
Ltmp58:
	.loc	3 91 17 is_stmt 1               ## parser.c:91:17
	movq	-32(%rbp), %rdi
	movq	-8(%rbp), %rax
	movslq	-52(%rbp), %rcx
	movq	(%rax,%rcx,8), %rsi
	addq	$1, %rsi
	movq	$-1, %rdx
	callq	___strcat_chk
	.loc	3 92 13                         ## parser.c:92:13
	jmp	LBB0_63
Ltmp59:
LBB0_62:                                ##   in Loop: Header=BB0_59 Depth=1
	.loc	3 93 17                         ## parser.c:93:17
	movq	-32(%rbp), %rdi
	movq	-8(%rbp), %rax
	movslq	-52(%rbp), %rcx
	movq	(%rax,%rcx,8), %rsi
	movq	$-1, %rdx
	callq	___strcat_chk
Ltmp60:
LBB0_63:                                ##   in Loop: Header=BB0_59 Depth=1
	.loc	3 96 23                         ## parser.c:96:23
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
Ltmp61:
	.loc	3 89 9                          ## parser.c:89:9
	jmp	LBB0_59
LBB0_64:
	.loc	3 98 5                          ## parser.c:98:5
	jmp	LBB0_65
Ltmp62:
LBB0_65:
	.loc	3 0 5 is_stmt 0                 ## parser.c:0:5
	xorl	%eax, %eax
	.loc	3 99 18 is_stmt 1               ## parser.c:99:18
	movl	-48(%rbp), %edx
	.loc	3 99 5 is_stmt 0                ## parser.c:99:5
	movq	-40(%rbp), %rcx
	.loc	3 99 16                         ## parser.c:99:16
	movl	%edx, (%rcx)
	.loc	3 100 18 is_stmt 1              ## parser.c:100:18
	movl	-60(%rbp), %edx
	.loc	3 100 5 is_stmt 0               ## parser.c:100:5
	movq	-40(%rbp), %rcx
	.loc	3 100 16                        ## parser.c:100:16
	movl	%edx, 4(%rcx)
	.loc	3 101 5 is_stmt 1               ## parser.c:101:5
	addq	$64, %rsp
	popq	%rbp
	retq
Ltmp63:
Lfunc_end0:
	.cfi_endproc
                                        ## -- End function
	.globl	_convertStringToTerm            ## -- Begin function convertStringToTerm
	.p2align	4, 0x90
_convertStringToTerm:                   ## @convertStringToTerm
Lfunc_begin1:
	.loc	3 104 0                         ## parser.c:104:0
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$256, %rsp                      ## imm = 0x100
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	%rdi, -16(%rbp)
	movl	%esi, -20(%rbp)
	movq	%rdx, -32(%rbp)
LBB1_1:                                 ## =>This Inner Loop Header: Depth=1
Ltmp64:
	.loc	3 105 11 prologue_end           ## parser.c:105:11
	movq	-16(%rbp), %rax
	movsbl	(%rax), %eax
	.loc	3 105 25 is_stmt 0              ## parser.c:105:25
	cmpl	$32, %eax
	.loc	3 105 5                         ## parser.c:105:5
	jne	LBB1_3
## %bb.2:                               ##   in Loop: Header=BB1_1 Depth=1
Ltmp65:
	.loc	3 106 20 is_stmt 1              ## parser.c:106:20
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -16(%rbp)
Ltmp66:
	.loc	3 105 5                         ## parser.c:105:5
	jmp	LBB1_1
LBB1_3:
	.loc	3 108 27                        ## parser.c:108:27
	movq	-16(%rbp), %rdi
	.loc	3 108 20 is_stmt 0              ## parser.c:108:20
	callq	_strlen
                                        ## kill: def $eax killed $eax killed $rax
	.loc	3 108 13                        ## parser.c:108:13
	movl	%eax, -36(%rbp)
LBB1_4:                                 ## =>This Inner Loop Header: Depth=1
	.loc	3 109 12 is_stmt 1              ## parser.c:109:12
	movq	-16(%rbp), %rax
	.loc	3 109 23 is_stmt 0              ## parser.c:109:23
	movl	-36(%rbp), %ecx
	.loc	3 109 28                        ## parser.c:109:28
	subl	$1, %ecx
	.loc	3 109 12                        ## parser.c:109:12
	movslq	%ecx, %rcx
	movsbl	(%rax,%rcx), %eax
	.loc	3 109 33                        ## parser.c:109:33
	cmpl	$32, %eax
	.loc	3 109 5                         ## parser.c:109:5
	jne	LBB1_6
## %bb.5:                               ##   in Loop: Header=BB1_4 Depth=1
Ltmp67:
	.loc	3 110 9 is_stmt 1               ## parser.c:110:9
	movq	-16(%rbp), %rax
	.loc	3 110 20 is_stmt 0              ## parser.c:110:20
	movl	-36(%rbp), %ecx
	.loc	3 110 25                        ## parser.c:110:25
	subl	$1, %ecx
	.loc	3 110 9                         ## parser.c:110:9
	movslq	%ecx, %rcx
	.loc	3 110 30                        ## parser.c:110:30
	movb	$0, (%rax,%rcx)
	.loc	3 111 14 is_stmt 1              ## parser.c:111:14
	movl	-36(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -36(%rbp)
Ltmp68:
	.loc	3 109 5                         ## parser.c:109:5
	jmp	LBB1_4
LBB1_6:
	.loc	3 114 35                        ## parser.c:114:35
	movslq	-36(%rbp), %rdi
	.loc	3 114 28 is_stmt 0              ## parser.c:114:28
	movl	$1, %esi
	callq	_calloc
	.loc	3 114 11                        ## parser.c:114:11
	movq	%rax, -48(%rbp)
	.loc	3 116 12 is_stmt 1              ## parser.c:116:12
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -64(%rbp)
	.loc	3 117 5                         ## parser.c:117:5
	movq	-48(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movq	$-1, %rdx
	callq	___strcpy_chk
	.loc	3 119 10                        ## parser.c:119:10
	movw	L___const.convertStringToTerm.space(%rip), %ax
	movw	%ax, -66(%rbp)
	leaq	-66(%rbp), %rsi
	.loc	3 121 31                        ## parser.c:121:31
	movq	-16(%rbp), %rdi
	.loc	3 121 24 is_stmt 0              ## parser.c:121:24
	callq	_strtok
	.loc	3 121 11                        ## parser.c:121:11
	movq	%rax, -80(%rbp)
Ltmp69:
	.loc	3 122 9 is_stmt 1               ## parser.c:122:9
	movq	-80(%rbp), %rax
	movsbl	(%rax), %eax
	.loc	3 122 23 is_stmt 0              ## parser.c:122:23
	cmpl	$48, %eax
	.loc	3 122 30                        ## parser.c:122:30
	jne	LBB1_9
## %bb.7:
	.loc	3 122 40                        ## parser.c:122:40
	movq	-80(%rbp), %rdi
	.loc	3 122 33                        ## parser.c:122:33
	callq	_strlen
	.loc	3 122 52                        ## parser.c:122:52
	cmpq	$1, %rax
Ltmp70:
	.loc	3 122 9                         ## parser.c:122:9
	jne	LBB1_9
## %bb.8:
Ltmp71:
	.loc	3 123 9 is_stmt 1               ## parser.c:123:9
	jmp	LBB1_46
Ltmp72:
LBB1_9:
	.loc	3 125 19                        ## parser.c:125:19
	cvtsi2sdl	-20(%rbp), %xmm0
	movsd	%xmm0, -216(%rbp)               ## 8-byte Spill
	.loc	3 125 39 is_stmt 0              ## parser.c:125:39
	movq	-80(%rbp), %rdi
	.loc	3 125 32                        ## parser.c:125:32
	leaq	-56(%rbp), %rsi
	callq	_strtod
	movaps	%xmm0, %xmm1
	movsd	-216(%rbp), %xmm0               ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	.loc	3 125 30                        ## parser.c:125:30
	mulsd	%xmm1, %xmm0
	.loc	3 125 17                        ## parser.c:125:17
	movsd	%xmm0, -64(%rbp)
Ltmp73:
	.loc	3 126 9 is_stmt 1               ## parser.c:126:9
	movsd	-64(%rbp), %xmm0                ## xmm0 = mem[0],zero
	.loc	3 126 21 is_stmt 0              ## parser.c:126:21
	xorps	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
Ltmp74:
	.loc	3 126 9                         ## parser.c:126:9
	jne	LBB1_11
	jp	LBB1_11
## %bb.10:
Ltmp75:
	.loc	3 127 23 is_stmt 1              ## parser.c:127:23
	movl	-20(%rbp), %eax
	.loc	3 127 34 is_stmt 0              ## parser.c:127:34
	shll	$0, %eax
	.loc	3 127 23                        ## parser.c:127:23
	cvtsi2sd	%eax, %xmm0
	.loc	3 127 21                        ## parser.c:127:21
	movsd	%xmm0, -64(%rbp)
	.loc	3 128 5 is_stmt 1               ## parser.c:128:5
	jmp	LBB1_12
Ltmp76:
LBB1_11:
	.loc	3 0 5 is_stmt 0                 ## parser.c:0:5
	xorl	%eax, %eax
	movl	%eax, %edi
	leaq	-66(%rbp), %rsi
Ltmp77:
	.loc	3 129 22 is_stmt 1              ## parser.c:129:22
	callq	_strtok
	.loc	3 129 20 is_stmt 0              ## parser.c:129:20
	movq	%rax, -80(%rbp)
Ltmp78:
LBB1_12:
	.loc	3 132 20 is_stmt 1              ## parser.c:132:20
	movsd	-64(%rbp), %xmm0                ## xmm0 = mem[0],zero
	.loc	3 132 5 is_stmt 0               ## parser.c:132:5
	leaq	L_.str.5(%rip), %rdi
	movb	$1, %al
	callq	_printf
	.loc	3 134 26 is_stmt 1              ## parser.c:134:26
	movq	-16(%rbp), %rdi
	.loc	3 134 19 is_stmt 0              ## parser.c:134:19
	callq	_strlen
	movq	%rax, -248(%rbp)                ## 8-byte Spill
	.loc	3 134 5                         ## parser.c:134:5
	movq	%rsp, %rcx
	movq	%rcx, -88(%rbp)
	shlq	$2, %rax
	callq	____chkstk_darwin
	addq	$15, %rax
	andq	$-16, %rax
	subq	%rax, %rsp
	movq	-248(%rbp), %rax                ## 8-byte Reload
	movq	%rsp, %rcx
Ltmp79:
	##DEBUG_VALUE: convertStringToTerm:terms <- [$rcx+0]
	.loc	3 0 5                           ## parser.c:0:5
	movq	%rcx, -240(%rbp)                ## 8-byte Spill
Ltmp80:
	##DEBUG_VALUE: convertStringToTerm:terms <- [DW_OP_constu 240, DW_OP_minus] [$rbp+0]
	.loc	3 134 5                         ## parser.c:134:5
	movq	%rax, -96(%rbp)
	.loc	3 135 26 is_stmt 1              ## parser.c:135:26
	movq	-16(%rbp), %rdi
	.loc	3 135 19 is_stmt 0              ## parser.c:135:19
	callq	_strlen
	movq	%rax, %rcx
	movq	%rcx, -232(%rbp)                ## 8-byte Spill
	.loc	3 135 5                         ## parser.c:135:5
	shlq	$2, %rax
	callq	____chkstk_darwin
	addq	$15, %rax
	andq	$-16, %rax
	subq	%rax, %rsp
	movq	-232(%rbp), %rax                ## 8-byte Reload
	movq	%rsp, %rcx
	movq	%rcx, -224(%rbp)                ## 8-byte Spill
Ltmp81:
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	movq	%rax, -104(%rbp)
Ltmp82:
	##DEBUG_VALUE: convertStringToTerm:power <- [$rcx+0]
	.loc	3 137 16 is_stmt 1              ## parser.c:137:16
	movw	l___const.convertStringToTerm.carat(%rip), %ax
	movw	%ax, -107(%rbp)
	movb	l___const.convertStringToTerm.carat+2(%rip), %al
	movb	%al, -105(%rbp)
	.loc	3 139 13                        ## parser.c:139:13
	movl	$0, -112(%rbp)
	.loc	3 140 29                        ## parser.c:140:29
	movq	-80(%rbp), %rdi
	.loc	3 140 22 is_stmt 0              ## parser.c:140:22
	movl	$94, %esi
	callq	_strchr
Ltmp83:
	.loc	3 140 11                        ## parser.c:140:11
	movq	%rax, -120(%rbp)
Ltmp84:
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
LBB1_13:                                ## =>This Inner Loop Header: Depth=1
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 143 5 is_stmt 1               ## parser.c:143:5
	cmpq	$0, -80(%rbp)
	je	LBB1_25
Ltmp85:
## %bb.14:                              ##   in Loop: Header=BB1_13 Depth=1
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 144 27                        ## parser.c:144:27
	movq	-80(%rbp), %rdi
	.loc	3 144 20 is_stmt 0              ## parser.c:144:20
	movl	$94, %esi
	callq	_strchr
	.loc	3 144 18                        ## parser.c:144:18
	movq	%rax, -120(%rbp)
Ltmp86:
	.loc	3 145 12 is_stmt 1              ## parser.c:145:12
	cmpq	$0, -120(%rbp)
Ltmp87:
	.loc	3 145 12 is_stmt 0              ## parser.c:145:12
	je	LBB1_16
Ltmp88:
## %bb.15:                              ##   in Loop: Header=BB1_13 Depth=1
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 146 31 is_stmt 1              ## parser.c:146:31
	movq	-120(%rbp), %rax
	.loc	3 146 42 is_stmt 0              ## parser.c:146:42
	movq	-80(%rbp), %rcx
	.loc	3 146 40                        ## parser.c:146:40
	subq	%rcx, %rax
                                        ## kill: def $eax killed $eax killed $rax
	.loc	3 146 19                        ## parser.c:146:19
	movl	%eax, -124(%rbp)
	.loc	3 147 9 is_stmt 1               ## parser.c:147:9
	jmp	LBB1_17
Ltmp89:
LBB1_16:                                ##   in Loop: Header=BB1_13 Depth=1
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 148 37                        ## parser.c:148:37
	movq	-80(%rbp), %rdi
	.loc	3 148 30 is_stmt 0              ## parser.c:148:30
	callq	_strlen
                                        ## kill: def $eax killed $eax killed $rax
	.loc	3 148 19                        ## parser.c:148:19
	movl	%eax, -124(%rbp)
Ltmp90:
LBB1_17:                                ##   in Loop: Header=BB1_13 Depth=1
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 151 29 is_stmt 1              ## parser.c:151:29
	movslq	-124(%rbp), %rdi
	.loc	3 151 22 is_stmt 0              ## parser.c:151:22
	movl	$1, %esi
	callq	_calloc
	.loc	3 151 15                        ## parser.c:151:15
	movq	%rax, -136(%rbp)
	.loc	3 152 9 is_stmt 1               ## parser.c:152:9
	movq	-136(%rbp), %rdi
	movq	-80(%rbp), %rsi
	movslq	-124(%rbp), %rdx
	movq	$-1, %rcx
	callq	___strncpy_chk
Ltmp91:
	.loc	3 154 13                        ## parser.c:154:13
	cmpq	$0, -136(%rbp)
	.loc	3 154 18 is_stmt 0              ## parser.c:154:18
	je	LBB1_20
Ltmp92:
## %bb.18:                              ##   in Loop: Header=BB1_13 Depth=1
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 154 28                        ## parser.c:154:28
	movq	-136(%rbp), %rdi
	.loc	3 154 21                        ## parser.c:154:21
	leaq	L_.str.6(%rip), %rsi
	callq	_strcmp
	.loc	3 154 44                        ## parser.c:154:44
	cmpl	$0, %eax
Ltmp93:
	.loc	3 154 13                        ## parser.c:154:13
	jne	LBB1_20
Ltmp94:
## %bb.19:                              ##   in Loop: Header=BB1_13 Depth=1
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 0 13                          ## parser.c:0:13
	movq	-240(%rbp), %rax                ## 8-byte Reload
Ltmp95:
	##DEBUG_VALUE: convertStringToTerm:terms <- [$rax+0]
	.loc	3 155 13 is_stmt 1              ## parser.c:155:13
	movslq	-112(%rbp), %rcx
	.loc	3 155 28 is_stmt 0              ## parser.c:155:28
	movl	$0, (%rax,%rcx,4)
	.loc	3 156 9 is_stmt 1               ## parser.c:156:9
	jmp	LBB1_21
Ltmp96:
LBB1_20:                                ##   in Loop: Header=BB1_13 Depth=1
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 157 46                        ## parser.c:157:46
	movq	-136(%rbp), %rdi
	.loc	3 157 51 is_stmt 0              ## parser.c:157:51
	addq	$1, %rdi
	.loc	3 157 39                        ## parser.c:157:39
	leaq	-144(%rbp), %rsi
	movl	$10, %edx
	callq	_strtol
	movq	%rax, %rcx
	movq	-240(%rbp), %rax                ## 8-byte Reload
Ltmp97:
	##DEBUG_VALUE: convertStringToTerm:terms <- [$rax+0]
	.loc	3 157 30                        ## parser.c:157:30
	movl	%ecx, %edx
	.loc	3 157 13                        ## parser.c:157:13
	movslq	-112(%rbp), %rcx
	.loc	3 157 28                        ## parser.c:157:28
	movl	%edx, (%rax,%rcx,4)
Ltmp98:
LBB1_21:                                ##   in Loop: Header=BB1_13 Depth=1
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 159 12 is_stmt 1              ## parser.c:159:12
	cmpq	$0, -120(%rbp)
Ltmp99:
	.loc	3 159 12 is_stmt 0              ## parser.c:159:12
	je	LBB1_23
Ltmp100:
## %bb.22:                              ##   in Loop: Header=BB1_13 Depth=1
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 160 30 is_stmt 1              ## parser.c:160:30
	movq	-80(%rbp), %rax
	.loc	3 160 41 is_stmt 0              ## parser.c:160:41
	movslq	-124(%rbp), %rcx
	addq	%rcx, %rax
	.loc	3 160 49                        ## parser.c:160:49
	addq	$1, %rax
	.loc	3 160 19                        ## parser.c:160:19
	movq	%rax, -152(%rbp)
	.loc	3 161 46 is_stmt 1              ## parser.c:161:46
	movq	-152(%rbp), %rdi
	.loc	3 161 39 is_stmt 0              ## parser.c:161:39
	leaq	-144(%rbp), %rsi
	movl	$10, %edx
	callq	_strtol
	movq	%rax, %rcx
	movq	-224(%rbp), %rax                ## 8-byte Reload
	.loc	3 161 30                        ## parser.c:161:30
	movl	%ecx, %edx
	.loc	3 161 13                        ## parser.c:161:13
	movslq	-112(%rbp), %rcx
	.loc	3 161 28                        ## parser.c:161:28
	movl	%edx, (%rax,%rcx,4)
	.loc	3 162 9 is_stmt 1               ## parser.c:162:9
	jmp	LBB1_24
Ltmp101:
LBB1_23:                                ##   in Loop: Header=BB1_13 Depth=1
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 0 9 is_stmt 0                 ## parser.c:0:9
	movq	-224(%rbp), %rax                ## 8-byte Reload
Ltmp102:
	.loc	3 163 13 is_stmt 1              ## parser.c:163:13
	movslq	-112(%rbp), %rcx
	.loc	3 163 28 is_stmt 0              ## parser.c:163:28
	movl	$1, (%rax,%rcx,4)
Ltmp103:
LBB1_24:                                ##   in Loop: Header=BB1_13 Depth=1
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 0 28                          ## parser.c:0:28
	xorl	%eax, %eax
	movl	%eax, %edi
	leaq	-66(%rbp), %rsi
	.loc	3 166 17 is_stmt 1              ## parser.c:166:17
	movl	-112(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -112(%rbp)
	.loc	3 167 22                        ## parser.c:167:22
	callq	_strtok
	.loc	3 167 20 is_stmt 0              ## parser.c:167:20
	movq	%rax, -80(%rbp)
	.loc	3 168 14 is_stmt 1              ## parser.c:168:14
	movq	-136(%rbp), %rdi
	.loc	3 168 9 is_stmt 0               ## parser.c:168:9
	callq	_free
Ltmp104:
	.loc	3 143 5 is_stmt 1               ## parser.c:143:5
	jmp	LBB1_13
Ltmp105:
LBB1_25:
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 171 13                        ## parser.c:171:13
	movl	$0, -156(%rbp)
Ltmp106:
LBB1_26:                                ## =>This Inner Loop Header: Depth=1
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 171 21 is_stmt 0              ## parser.c:171:21
	movl	-156(%rbp), %eax
	.loc	3 171 23                        ## parser.c:171:23
	cmpl	-112(%rbp), %eax
Ltmp107:
	.loc	3 171 5                         ## parser.c:171:5
	jge	LBB1_29
Ltmp108:
## %bb.27:                              ##   in Loop: Header=BB1_26 Depth=1
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 0 5                           ## parser.c:0:5
	movq	-224(%rbp), %rax                ## 8-byte Reload
	movq	-240(%rbp), %rcx                ## 8-byte Reload
Ltmp109:
	##DEBUG_VALUE: convertStringToTerm:terms <- [$rcx+0]
	.loc	3 172 28 is_stmt 1              ## parser.c:172:28
	movslq	-156(%rbp), %rdx
	movl	(%rcx,%rdx,4), %esi
	.loc	3 172 38 is_stmt 0              ## parser.c:172:38
	movslq	-156(%rbp), %rcx
Ltmp110:
	movl	(%rax,%rcx,4), %edx
	.loc	3 172 9                         ## parser.c:172:9
	leaq	L_.str.7(%rip), %rdi
	movb	$0, %al
	callq	_printf
Ltmp111:
## %bb.28:                              ##   in Loop: Header=BB1_26 Depth=1
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 171 36 is_stmt 1              ## parser.c:171:36
	movl	-156(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -156(%rbp)
	.loc	3 171 5 is_stmt 0               ## parser.c:171:5
	jmp	LBB1_26
Ltmp112:
LBB1_29:
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 175 25 is_stmt 1              ## parser.c:175:25
	movsd	-64(%rbp), %xmm0                ## xmm0 = mem[0],zero
	.loc	3 175 5 is_stmt 0               ## parser.c:175:5
	movq	-32(%rbp), %rax
	.loc	3 175 23                        ## parser.c:175:23
	movsd	%xmm0, 8(%rax)
	.loc	3 177 13 is_stmt 1              ## parser.c:177:13
	movl	$0, -160(%rbp)
Ltmp113:
	.loc	3 178 13                        ## parser.c:178:13
	movl	$0, -164(%rbp)
Ltmp114:
LBB1_30:                                ## =>This Inner Loop Header: Depth=1
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 178 21 is_stmt 0              ## parser.c:178:21
	movl	-164(%rbp), %eax
	.loc	3 178 23                        ## parser.c:178:23
	cmpl	-112(%rbp), %eax
Ltmp115:
	.loc	3 178 5                         ## parser.c:178:5
	jge	LBB1_33
Ltmp116:
## %bb.31:                              ##   in Loop: Header=BB1_30 Depth=1
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 0 5                           ## parser.c:0:5
	movq	-224(%rbp), %rax                ## 8-byte Reload
Ltmp117:
	.loc	3 179 25 is_stmt 1              ## parser.c:179:25
	movslq	-164(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	.loc	3 179 22 is_stmt 0              ## parser.c:179:22
	addl	-160(%rbp), %eax
	movl	%eax, -160(%rbp)
Ltmp118:
## %bb.32:                              ##   in Loop: Header=BB1_30 Depth=1
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 178 36 is_stmt 1              ## parser.c:178:36
	movl	-164(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -164(%rbp)
	.loc	3 178 5 is_stmt 0               ## parser.c:178:5
	jmp	LBB1_30
Ltmp119:
LBB1_33:
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 181 32 is_stmt 1              ## parser.c:181:32
	movslq	-160(%rbp), %rdi
	.loc	3 181 25 is_stmt 0              ## parser.c:181:25
	movl	$4, %esi
	callq	_calloc
	.loc	3 181 14                        ## parser.c:181:14
	movq	%rax, -176(%rbp)
	.loc	3 182 13 is_stmt 1              ## parser.c:182:13
	movl	$0, -180(%rbp)
Ltmp120:
	.loc	3 183 17                        ## parser.c:183:17
	movl	$0, -184(%rbp)
Ltmp121:
LBB1_34:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_36 Depth 2
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 183 24 is_stmt 0              ## parser.c:183:24
	movl	-184(%rbp), %eax
	.loc	3 183 26                        ## parser.c:183:26
	cmpl	-112(%rbp), %eax
Ltmp122:
	.loc	3 183 5                         ## parser.c:183:5
	jge	LBB1_41
Ltmp123:
## %bb.35:                              ##   in Loop: Header=BB1_34 Depth=1
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 184 21 is_stmt 1              ## parser.c:184:21
	movl	$0, -188(%rbp)
Ltmp124:
LBB1_36:                                ##   Parent Loop BB1_34 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 0 21 is_stmt 0                ## parser.c:0:21
	movq	-224(%rbp), %rcx                ## 8-byte Reload
Ltmp125:
	.loc	3 184 28                        ## parser.c:184:28
	movl	-188(%rbp), %eax
	.loc	3 184 32                        ## parser.c:184:32
	movslq	-184(%rbp), %rdx
	.loc	3 184 30                        ## parser.c:184:30
	cmpl	(%rcx,%rdx,4), %eax
Ltmp126:
	.loc	3 184 9                         ## parser.c:184:9
	jge	LBB1_39
Ltmp127:
## %bb.37:                              ##   in Loop: Header=BB1_36 Depth=2
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 0 9                           ## parser.c:0:9
	movq	-240(%rbp), %rax                ## 8-byte Reload
Ltmp128:
	##DEBUG_VALUE: convertStringToTerm:terms <- [$rax+0]
	.loc	3 185 27 is_stmt 1              ## parser.c:185:27
	movslq	-184(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	.loc	3 185 13 is_stmt 0              ## parser.c:185:13
	movq	-176(%rbp), %rax
Ltmp129:
	movslq	-180(%rbp), %rcx
	.loc	3 185 25                        ## parser.c:185:25
	movl	%edx, (%rax,%rcx,4)
	.loc	3 186 14 is_stmt 1              ## parser.c:186:14
	movl	-180(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -180(%rbp)
Ltmp130:
## %bb.38:                              ##   in Loop: Header=BB1_36 Depth=2
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 184 43                        ## parser.c:184:43
	movl	-188(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -188(%rbp)
	.loc	3 184 9 is_stmt 0               ## parser.c:184:9
	jmp	LBB1_36
Ltmp131:
LBB1_39:                                ##   in Loop: Header=BB1_34 Depth=1
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 188 5 is_stmt 1               ## parser.c:188:5
	jmp	LBB1_40
Ltmp132:
LBB1_40:                                ##   in Loop: Header=BB1_34 Depth=1
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 183 38                        ## parser.c:183:38
	movl	-184(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -184(%rbp)
	.loc	3 183 5 is_stmt 0               ## parser.c:183:5
	jmp	LBB1_34
Ltmp133:
LBB1_41:
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 190 10 is_stmt 1              ## parser.c:190:10
	movq	-48(%rbp), %rdi
	.loc	3 190 5 is_stmt 0               ## parser.c:190:5
	callq	_free
	.loc	3 192 22 is_stmt 1              ## parser.c:192:22
	movl	$1, %edi
	movl	$32, %esi
	callq	_calloc
	.loc	3 192 10 is_stmt 0              ## parser.c:192:10
	movq	%rax, -200(%rbp)
	.loc	3 193 24 is_stmt 1              ## parser.c:193:24
	movq	-176(%rbp), %rcx
	.loc	3 193 5 is_stmt 0               ## parser.c:193:5
	movq	-200(%rbp), %rax
	.loc	3 193 22                        ## parser.c:193:22
	movq	%rcx, (%rax)
	.loc	3 194 23 is_stmt 1              ## parser.c:194:23
	movslq	-160(%rbp), %rcx
	.loc	3 194 5 is_stmt 0               ## parser.c:194:5
	movq	-200(%rbp), %rax
	.loc	3 194 21                        ## parser.c:194:21
	movq	%rcx, 8(%rax)
	.loc	3 195 5 is_stmt 1               ## parser.c:195:5
	movq	-200(%rbp), %rax
	.loc	3 195 27 is_stmt 0              ## parser.c:195:27
	movq	$0, 24(%rax)
	.loc	3 196 5 is_stmt 1               ## parser.c:196:5
	movq	-200(%rbp), %rax
	.loc	3 196 27 is_stmt 0              ## parser.c:196:27
	movq	$0, 16(%rax)
	.loc	3 197 23 is_stmt 1              ## parser.c:197:23
	movq	-200(%rbp), %rcx
	.loc	3 197 5 is_stmt 0               ## parser.c:197:5
	movq	-32(%rbp), %rax
	.loc	3 197 21                        ## parser.c:197:21
	movq	%rcx, (%rax)
Ltmp134:
	.loc	3 198 13 is_stmt 1              ## parser.c:198:13
	movl	$0, -204(%rbp)
Ltmp135:
LBB1_42:                                ## =>This Inner Loop Header: Depth=1
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 198 21 is_stmt 0              ## parser.c:198:21
	movl	-204(%rbp), %eax
	.loc	3 198 23                        ## parser.c:198:23
	cmpl	-160(%rbp), %eax
Ltmp136:
	.loc	3 198 5                         ## parser.c:198:5
	jge	LBB1_45
Ltmp137:
## %bb.43:                              ##   in Loop: Header=BB1_42 Depth=1
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 199 25 is_stmt 1              ## parser.c:199:25
	movq	-32(%rbp), %rax
	.loc	3 199 31 is_stmt 0              ## parser.c:199:31
	movq	(%rax), %rax
	.loc	3 199 42                        ## parser.c:199:42
	movq	(%rax), %rax
	.loc	3 199 24                        ## parser.c:199:24
	movslq	-204(%rbp), %rcx
	movl	(%rax,%rcx,4), %esi
	.loc	3 199 9                         ## parser.c:199:9
	leaq	L_.str.8(%rip), %rdi
	movb	$0, %al
	callq	_printf
Ltmp138:
## %bb.44:                              ##   in Loop: Header=BB1_42 Depth=1
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 198 41 is_stmt 1              ## parser.c:198:41
	movl	-204(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -204(%rbp)
	.loc	3 198 5 is_stmt 0               ## parser.c:198:5
	jmp	LBB1_42
Ltmp139:
LBB1_45:
	##DEBUG_VALUE: convertStringToTerm:power <- [DW_OP_constu 224, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 201 1 is_stmt 1               ## parser.c:201:1
	movq	-88(%rbp), %rax
	movq	%rax, %rsp
Ltmp140:
LBB1_46:
	.loc	3 0 1 is_stmt 0                 ## parser.c:0:1
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	cmpq	%rcx, %rax
	jne	LBB1_48
## %bb.47:
	.loc	3 201 1                         ## parser.c:201:1
	movq	%rbp, %rsp
	popq	%rbp
	retq
LBB1_48:
	.loc	3 0 0                           ## parser.c:0:0
	callq	___stack_chk_fail
	ud2
Ltmp141:
Lfunc_end1:
	.cfi_endproc
                                        ## -- End function
	.globl	_processEachSideOfConstraint    ## -- Begin function processEachSideOfConstraint
	.p2align	4, 0x90
_processEachSideOfConstraint:           ## @processEachSideOfConstraint
Lfunc_begin2:
	.loc	3 203 0 is_stmt 1               ## parser.c:203:0
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$288, %rsp                      ## imm = 0x120
	movb	%dl, %al
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movq	%rcx, -8(%rbp)
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	andb	$1, %al
	movb	%al, -25(%rbp)
Ltmp142:
	.loc	3 204 16 prologue_end           ## parser.c:204:16
	movw	l___const.processEachSideOfConstraint.plus(%rip), %ax
	movw	%ax, -28(%rbp)
	movb	l___const.processEachSideOfConstraint.plus+2(%rip), %al
	movb	%al, -26(%rbp)
	.loc	3 205 16                        ## parser.c:205:16
	movw	l___const.processEachSideOfConstraint.minus(%rip), %ax
	movw	%ax, -31(%rbp)
	movb	l___const.processEachSideOfConstraint.minus+2(%rip), %al
	movb	%al, -29(%rbp)
	.loc	3 206 21                        ## parser.c:206:21
	movl	$1000000, %edi                  ## imm = 0xF4240
	movl	$1, %esi
	callq	_calloc
	.loc	3 206 11 is_stmt 0              ## parser.c:206:11
	movq	%rax, -40(%rbp)
	.loc	3 207 5 is_stmt 1               ## parser.c:207:5
	movq	-40(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movq	$-1, %rdx
	callq	___strcpy_chk
	leaq	-28(%rbp), %rsi
	.loc	3 208 33                        ## parser.c:208:33
	movq	-16(%rbp), %rdi
	.loc	3 208 26 is_stmt 0              ## parser.c:208:26
	callq	_strtok
	.loc	3 208 11                        ## parser.c:208:11
	movq	%rax, -48(%rbp)
	.loc	3 209 13 is_stmt 1              ## parser.c:209:13
	movl	$0, -52(%rbp)
LBB2_1:                                 ## =>This Inner Loop Header: Depth=1
	.loc	3 211 5                         ## parser.c:211:5
	cmpq	$0, -48(%rbp)
	je	LBB2_3
## %bb.2:                               ##   in Loop: Header=BB2_1 Depth=1
	.loc	3 0 5 is_stmt 0                 ## parser.c:0:5
	xorl	%eax, %eax
	movl	%eax, %edi
	leaq	-28(%rbp), %rsi
Ltmp143:
	.loc	3 212 23 is_stmt 1              ## parser.c:212:23
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
	.loc	3 213 24                        ## parser.c:213:24
	callq	_strtok
	.loc	3 213 22 is_stmt 0              ## parser.c:213:22
	movq	%rax, -48(%rbp)
Ltmp144:
	.loc	3 211 5 is_stmt 1               ## parser.c:211:5
	jmp	LBB2_1
LBB2_3:
	.loc	3 0 5 is_stmt 0                 ## parser.c:0:5
	leaq	-28(%rbp), %rax
	movq	%rax, -224(%rbp)                ## 8-byte Spill
	.loc	3 216 21 is_stmt 1              ## parser.c:216:21
	movl	-52(%rbp), %eax
                                        ## kill: def $rax killed $eax
	movq	%rax, -216(%rbp)                ## 8-byte Spill
	.loc	3 216 5 is_stmt 0               ## parser.c:216:5
	movq	%rsp, %rcx
	movq	%rcx, -64(%rbp)
	shlq	$3, %rax
	callq	____chkstk_darwin
	movq	-224(%rbp), %rsi                ## 8-byte Reload
	addq	$15, %rax
	andq	$-16, %rax
	subq	%rax, %rsp
	movq	-216(%rbp), %rax                ## 8-byte Reload
	movq	%rsp, %rcx
	movq	%rcx, -208(%rbp)                ## 8-byte Spill
	movq	%rax, -72(%rbp)
Ltmp145:
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 218 27 is_stmt 1              ## parser.c:218:27
	movq	-40(%rbp), %rdi
	.loc	3 218 20 is_stmt 0              ## parser.c:218:20
	callq	_strtok
	movq	%rax, %rcx
	movq	-208(%rbp), %rax                ## 8-byte Reload
	.loc	3 218 18                        ## parser.c:218:18
	movq	%rcx, (%rax)
Ltmp146:
	.loc	3 219 13 is_stmt 1              ## parser.c:219:13
	movl	$1, -76(%rbp)
Ltmp147:
LBB2_4:                                 ## =>This Inner Loop Header: Depth=1
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 219 20 is_stmt 0              ## parser.c:219:20
	movl	-76(%rbp), %eax
	.loc	3 219 22                        ## parser.c:219:22
	cmpl	-52(%rbp), %eax
Ltmp148:
	.loc	3 219 5                         ## parser.c:219:5
	jge	LBB2_7
Ltmp149:
## %bb.5:                               ##   in Loop: Header=BB2_4 Depth=1
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 0 5                           ## parser.c:0:5
	xorl	%eax, %eax
	movl	%eax, %edi
	leaq	-28(%rbp), %rsi
Ltmp150:
	.loc	3 220 24 is_stmt 1              ## parser.c:220:24
	callq	_strtok
	movq	%rax, %rdx
	movq	-208(%rbp), %rax                ## 8-byte Reload
	.loc	3 220 9 is_stmt 0               ## parser.c:220:9
	movslq	-76(%rbp), %rcx
	.loc	3 220 22                        ## parser.c:220:22
	movq	%rdx, (%rax,%rcx,8)
Ltmp151:
## %bb.6:                               ##   in Loop: Header=BB2_4 Depth=1
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 219 42 is_stmt 1              ## parser.c:219:42
	movl	-76(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -76(%rbp)
	.loc	3 219 5 is_stmt 0               ## parser.c:219:5
	jmp	LBB2_4
Ltmp152:
LBB2_7:
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 222 10 is_stmt 1              ## parser.c:222:10
	movq	-40(%rbp), %rdi
	.loc	3 222 5 is_stmt 0               ## parser.c:222:5
	callq	_free
	.loc	3 223 13 is_stmt 1              ## parser.c:223:13
	movl	$0, -80(%rbp)
	.loc	3 225 35                        ## parser.c:225:35
	movslq	-52(%rbp), %rdi
	.loc	3 225 28 is_stmt 0              ## parser.c:225:28
	movl	$8, %esi
	callq	_calloc
	.loc	3 225 12                        ## parser.c:225:12
	movq	%rax, -88(%rbp)
Ltmp153:
	.loc	3 226 15 is_stmt 1              ## parser.c:226:15
	movl	$0, -92(%rbp)
Ltmp154:
LBB2_8:                                 ## =>This Inner Loop Header: Depth=1
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 226 22 is_stmt 0              ## parser.c:226:22
	movl	-92(%rbp), %eax
	.loc	3 226 24                        ## parser.c:226:24
	cmpl	-52(%rbp), %eax
Ltmp155:
	.loc	3 226 5                         ## parser.c:226:5
	jge	LBB2_11
Ltmp156:
## %bb.9:                               ##   in Loop: Header=BB2_8 Depth=1
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 0 5                           ## parser.c:0:5
	movq	-208(%rbp), %rax                ## 8-byte Reload
Ltmp157:
	.loc	3 227 42 is_stmt 1              ## parser.c:227:42
	movslq	-92(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 227 35 is_stmt 0              ## parser.c:227:35
	callq	_strlen
	movq	%rax, %rdi
	.loc	3 227 28                        ## parser.c:227:28
	movl	$1, %esi
	callq	_calloc
	movq	%rax, %rsi
	movq	-208(%rbp), %rax                ## 8-byte Reload
	.loc	3 227 9                         ## parser.c:227:9
	movq	-88(%rbp), %rcx
	movslq	-92(%rbp), %rdx
	.loc	3 227 26                        ## parser.c:227:26
	movq	%rsi, (%rcx,%rdx,8)
	.loc	3 228 9 is_stmt 1               ## parser.c:228:9
	movq	-88(%rbp), %rcx
	movslq	-92(%rbp), %rdx
	movq	(%rcx,%rdx,8), %rcx
	movq	%rcx, -240(%rbp)                ## 8-byte Spill
	movslq	-92(%rbp), %rcx
	movq	(%rax,%rcx,8), %rcx
	movq	%rcx, -232(%rbp)                ## 8-byte Spill
	movslq	-92(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	callq	_strlen
	movq	-240(%rbp), %rdi                ## 8-byte Reload
	movq	-232(%rbp), %rsi                ## 8-byte Reload
	movq	%rax, %rdx
	shlq	$0, %rdx
	movq	$-1, %rcx
	callq	___memcpy_chk
Ltmp158:
## %bb.10:                              ##   in Loop: Header=BB2_8 Depth=1
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 226 43                        ## parser.c:226:43
	movl	-92(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -92(%rbp)
	.loc	3 226 5 is_stmt 0               ## parser.c:226:5
	jmp	LBB2_8
Ltmp159:
LBB2_11:
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 231 13 is_stmt 1              ## parser.c:231:13
	movl	$0, -96(%rbp)
Ltmp160:
LBB2_12:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_14 Depth 2
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 231 20 is_stmt 0              ## parser.c:231:20
	movl	-96(%rbp), %eax
	.loc	3 231 22                        ## parser.c:231:22
	cmpl	-52(%rbp), %eax
Ltmp161:
	.loc	3 231 5                         ## parser.c:231:5
	jge	LBB2_21
Ltmp162:
## %bb.13:                              ##   in Loop: Header=BB2_12 Depth=1
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 0 5                           ## parser.c:0:5
	movq	-208(%rbp), %rax                ## 8-byte Reload
	leaq	-31(%rbp), %rsi
Ltmp163:
	.loc	3 232 37 is_stmt 1              ## parser.c:232:37
	movslq	-96(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 232 30 is_stmt 0              ## parser.c:232:30
	callq	_strtok
	.loc	3 232 15                        ## parser.c:232:15
	movq	%rax, -104(%rbp)
Ltmp164:
LBB2_14:                                ##   Parent Loop BB2_12 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 233 9 is_stmt 1               ## parser.c:233:9
	cmpq	$0, -104(%rbp)
	je	LBB2_19
Ltmp165:
## %bb.15:                              ##   in Loop: Header=BB2_14 Depth=2
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 234 24                        ## parser.c:234:24
	movq	-104(%rbp), %rdi
	.loc	3 234 17 is_stmt 0              ## parser.c:234:17
	callq	_strlen
	.loc	3 234 38                        ## parser.c:234:38
	cmpq	$1, %rax
	.loc	3 234 43                        ## parser.c:234:43
	jne	LBB2_17
Ltmp166:
## %bb.16:                              ##   in Loop: Header=BB2_14 Depth=2
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 234 46                        ## parser.c:234:46
	movq	-104(%rbp), %rax
	movsbl	(%rax), %eax
	.loc	3 234 62                        ## parser.c:234:62
	cmpl	$32, %eax
Ltmp167:
	.loc	3 234 17                        ## parser.c:234:17
	je	LBB2_18
Ltmp168:
LBB2_17:                                ##   in Loop: Header=BB2_14 Depth=2
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 235 35 is_stmt 1              ## parser.c:235:35
	movl	-80(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -80(%rbp)
Ltmp169:
LBB2_18:                                ##   in Loop: Header=BB2_14 Depth=2
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 0 35 is_stmt 0                ## parser.c:0:35
	xorl	%eax, %eax
	movl	%eax, %edi
	leaq	-31(%rbp), %rsi
	.loc	3 236 28 is_stmt 1              ## parser.c:236:28
	callq	_strtok
	.loc	3 236 26 is_stmt 0              ## parser.c:236:26
	movq	%rax, -104(%rbp)
Ltmp170:
	.loc	3 233 9 is_stmt 1               ## parser.c:233:9
	jmp	LBB2_14
Ltmp171:
LBB2_19:                                ##   in Loop: Header=BB2_12 Depth=1
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 238 5                         ## parser.c:238:5
	jmp	LBB2_20
Ltmp172:
LBB2_20:                                ##   in Loop: Header=BB2_12 Depth=1
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 231 41                        ## parser.c:231:41
	movl	-96(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -96(%rbp)
	.loc	3 231 5 is_stmt 0               ## parser.c:231:5
	jmp	LBB2_12
Ltmp173:
LBB2_21:
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 240 21 is_stmt 1              ## parser.c:240:21
	movl	-80(%rbp), %eax
                                        ## kill: def $rax killed $eax
	movq	%rax, -272(%rbp)                ## 8-byte Spill
	.loc	3 240 5 is_stmt 0               ## parser.c:240:5
	shlq	$2, %rax
	callq	____chkstk_darwin
	addq	$15, %rax
	andq	$-16, %rax
	subq	%rax, %rsp
	movq	-272(%rbp), %rax                ## 8-byte Reload
	movq	%rsp, %rcx
Ltmp174:
	##DEBUG_VALUE: processEachSideOfConstraint:multipliers <- [$rcx+0]
	.loc	3 0 5                           ## parser.c:0:5
	movq	%rcx, -264(%rbp)                ## 8-byte Spill
Ltmp175:
	##DEBUG_VALUE: processEachSideOfConstraint:multipliers <- [DW_OP_constu 264, DW_OP_minus] [$rbp+0]
	.loc	3 240 5                         ## parser.c:240:5
	movq	%rax, -112(%rbp)
	.loc	3 241 28 is_stmt 1              ## parser.c:241:28
	movl	-80(%rbp), %eax
                                        ## kill: def $rax killed $eax
	movq	%rax, -256(%rbp)                ## 8-byte Spill
	.loc	3 241 5 is_stmt 0               ## parser.c:241:5
	shlq	$3, %rax
	callq	____chkstk_darwin
	addq	$15, %rax
	andq	$-16, %rax
	subq	%rax, %rsp
	movq	-256(%rbp), %rax                ## 8-byte Reload
	movq	%rsp, %rcx
	movq	%rcx, -248(%rbp)                ## 8-byte Spill
Ltmp176:
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	movq	%rax, -120(%rbp)
Ltmp177:
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [$rcx+0]
	.loc	3 242 13 is_stmt 1              ## parser.c:242:13
	movl	$1, -124(%rbp)
	.loc	3 242 29 is_stmt 0              ## parser.c:242:29
	movl	$0, -128(%rbp)
Ltmp178:
	.loc	3 244 15 is_stmt 1              ## parser.c:244:15
	movl	$0, -132(%rbp)
Ltmp179:
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
LBB2_22:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_24 Depth 2
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 244 22 is_stmt 0              ## parser.c:244:22
	movl	-132(%rbp), %eax
	.loc	3 244 24                        ## parser.c:244:24
	cmpl	-52(%rbp), %eax
Ltmp180:
	.loc	3 244 5                         ## parser.c:244:5
	jge	LBB2_32
Ltmp181:
## %bb.23:                              ##   in Loop: Header=BB2_22 Depth=1
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 0 5                           ## parser.c:0:5
	leaq	-31(%rbp), %rsi
Ltmp182:
	.loc	3 245 22 is_stmt 1              ## parser.c:245:22
	movb	-25(%rbp), %al
	testb	$1, %al
	movl	$1, %ecx
	movl	$4294967295, %eax               ## imm = 0xFFFFFFFF
	cmovnel	%ecx, %eax
	.loc	3 245 20 is_stmt 0              ## parser.c:245:20
	movl	%eax, -124(%rbp)
	.loc	3 246 37 is_stmt 1              ## parser.c:246:37
	movq	-88(%rbp), %rax
	movslq	-132(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 246 30 is_stmt 0              ## parser.c:246:30
	callq	_strtok
	.loc	3 246 15                        ## parser.c:246:15
	movq	%rax, -144(%rbp)
Ltmp183:
LBB2_24:                                ##   Parent Loop BB2_22 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 247 9 is_stmt 1               ## parser.c:247:9
	cmpq	$0, -144(%rbp)
	je	LBB2_30
Ltmp184:
## %bb.25:                              ##   in Loop: Header=BB2_24 Depth=2
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 248 24                        ## parser.c:248:24
	movq	-144(%rbp), %rdi
	.loc	3 248 17 is_stmt 0              ## parser.c:248:17
	callq	_strlen
	.loc	3 248 38                        ## parser.c:248:38
	cmpq	$1, %rax
	.loc	3 248 43                        ## parser.c:248:43
	jne	LBB2_27
Ltmp185:
## %bb.26:                              ##   in Loop: Header=BB2_24 Depth=2
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 248 46                        ## parser.c:248:46
	movq	-144(%rbp), %rax
	movsbl	(%rax), %eax
	.loc	3 248 62                        ## parser.c:248:62
	cmpl	$32, %eax
Ltmp186:
	.loc	3 248 17                        ## parser.c:248:17
	je	LBB2_28
Ltmp187:
LBB2_27:                                ##   in Loop: Header=BB2_24 Depth=2
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 0 17                          ## parser.c:0:17
	movq	-248(%rbp), %rax                ## 8-byte Reload
	movq	-264(%rbp), %rcx                ## 8-byte Reload
Ltmp188:
	##DEBUG_VALUE: processEachSideOfConstraint:multipliers <- [$rcx+0]
	.loc	3 249 40 is_stmt 1              ## parser.c:249:40
	movl	-124(%rbp), %esi
	.loc	3 249 17 is_stmt 0              ## parser.c:249:17
	movslq	-128(%rbp), %rdx
	.loc	3 249 38                        ## parser.c:249:38
	movl	%esi, (%rcx,%rdx,4)
	.loc	3 250 45 is_stmt 1              ## parser.c:250:45
	movq	-144(%rbp), %rdx
	.loc	3 250 17 is_stmt 0              ## parser.c:250:17
	movslq	-128(%rbp), %rcx
Ltmp189:
	.loc	3 250 43                        ## parser.c:250:43
	movq	%rdx, (%rax,%rcx,8)
	.loc	3 251 25 is_stmt 1              ## parser.c:251:25
	movl	-128(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -128(%rbp)
	.loc	3 252 13                        ## parser.c:252:13
	jmp	LBB2_29
Ltmp190:
LBB2_28:                                ##   in Loop: Header=BB2_24 Depth=2
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 254 30                        ## parser.c:254:30
	movb	-25(%rbp), %al
	testb	$1, %al
	movl	$4294967295, %ecx               ## imm = 0xFFFFFFFF
	movl	$1, %eax
	cmovnel	%ecx, %eax
	.loc	3 254 28 is_stmt 0              ## parser.c:254:28
	movl	%eax, -124(%rbp)
Ltmp191:
LBB2_29:                                ##   in Loop: Header=BB2_24 Depth=2
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 0 28                          ## parser.c:0:28
	xorl	%eax, %eax
	movl	%eax, %edi
	leaq	-31(%rbp), %rsi
	.loc	3 256 28 is_stmt 1              ## parser.c:256:28
	callq	_strtok
	.loc	3 256 26 is_stmt 0              ## parser.c:256:26
	movq	%rax, -144(%rbp)
Ltmp192:
	.loc	3 247 9 is_stmt 1               ## parser.c:247:9
	jmp	LBB2_24
Ltmp193:
LBB2_30:                                ##   in Loop: Header=BB2_22 Depth=1
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 258 5                         ## parser.c:258:5
	jmp	LBB2_31
Ltmp194:
LBB2_31:                                ##   in Loop: Header=BB2_22 Depth=1
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 244 43                        ## parser.c:244:43
	movl	-132(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -132(%rbp)
	.loc	3 244 5 is_stmt 0               ## parser.c:244:5
	jmp	LBB2_22
Ltmp195:
LBB2_32:
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 260 13 is_stmt 1              ## parser.c:260:13
	movl	$0, -148(%rbp)
	.loc	3 262 27                        ## parser.c:262:27
	movslq	-80(%rbp), %rdi
	.loc	3 262 20 is_stmt 0              ## parser.c:262:20
	movl	$8, %esi
	callq	_calloc
	.loc	3 262 12                        ## parser.c:262:12
	movq	%rax, -160(%rbp)
Ltmp196:
	.loc	3 263 15 is_stmt 1              ## parser.c:263:15
	movl	$0, -164(%rbp)
Ltmp197:
LBB2_33:                                ## =>This Inner Loop Header: Depth=1
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 263 22 is_stmt 0              ## parser.c:263:22
	movl	-164(%rbp), %eax
	.loc	3 263 24                        ## parser.c:263:24
	cmpl	-80(%rbp), %eax
Ltmp198:
	.loc	3 263 5                         ## parser.c:263:5
	jge	LBB2_38
Ltmp199:
## %bb.34:                              ##   in Loop: Header=BB2_33 Depth=1
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 264 20 is_stmt 1              ## parser.c:264:20
	movl	$1, %edi
	movl	$16, %esi
	callq	_calloc
	movq	-248(%rbp), %rcx                ## 8-byte Reload
	movq	%rax, %rdi
	movq	-264(%rbp), %rax                ## 8-byte Reload
Ltmp200:
	##DEBUG_VALUE: processEachSideOfConstraint:multipliers <- [$rax+0]
	.loc	3 264 9 is_stmt 0               ## parser.c:264:9
	movq	-160(%rbp), %rdx
	movslq	-164(%rbp), %rsi
	.loc	3 264 18                        ## parser.c:264:18
	movq	%rdi, (%rdx,%rsi,8)
	.loc	3 265 29 is_stmt 1              ## parser.c:265:29
	movslq	-164(%rbp), %rdx
	movq	(%rcx,%rdx,8), %rdi
	.loc	3 265 50 is_stmt 0              ## parser.c:265:50
	movslq	-164(%rbp), %rcx
	movl	(%rax,%rcx,4), %esi
	.loc	3 265 66                        ## parser.c:265:66
	movq	-160(%rbp), %rax
Ltmp201:
	movslq	-164(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdx
	.loc	3 265 9                         ## parser.c:265:9
	callq	_convertStringToTerm
Ltmp202:
	.loc	3 266 13 is_stmt 1              ## parser.c:266:13
	movq	-160(%rbp), %rax
	movslq	-164(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	3 266 23 is_stmt 0              ## parser.c:266:23
	movsd	8(%rax), %xmm0                  ## xmm0 = mem[0],zero
	.loc	3 266 35                        ## parser.c:266:35
	xorps	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
Ltmp203:
	.loc	3 266 13                        ## parser.c:266:13
	jne	LBB2_36
	jp	LBB2_36
Ltmp204:
## %bb.35:                              ##   in Loop: Header=BB2_33 Depth=1
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 267 28 is_stmt 1              ## parser.c:267:28
	movl	-148(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -148(%rbp)
Ltmp205:
LBB2_36:                                ##   in Loop: Header=BB2_33 Depth=1
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 269 5                         ## parser.c:269:5
	jmp	LBB2_37
Ltmp206:
LBB2_37:                                ##   in Loop: Header=BB2_33 Depth=1
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 263 46                        ## parser.c:263:46
	movl	-164(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -164(%rbp)
	.loc	3 263 5 is_stmt 0               ## parser.c:263:5
	jmp	LBB2_33
Ltmp207:
LBB2_38:
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 271 23 is_stmt 1              ## parser.c:271:23
	movl	-80(%rbp), %ecx
	.loc	3 271 41 is_stmt 0              ## parser.c:271:41
	subl	-148(%rbp), %ecx
	.loc	3 271 6                         ## parser.c:271:6
	movq	-24(%rbp), %rax
	.loc	3 271 21                        ## parser.c:271:21
	movl	%ecx, (%rax)
Ltmp208:
	.loc	3 273 15 is_stmt 1              ## parser.c:273:15
	movl	$0, -168(%rbp)
Ltmp209:
LBB2_39:                                ## =>This Inner Loop Header: Depth=1
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 273 22 is_stmt 0              ## parser.c:273:22
	movl	-168(%rbp), %eax
	.loc	3 273 24                        ## parser.c:273:24
	cmpl	-52(%rbp), %eax
Ltmp210:
	.loc	3 273 5                         ## parser.c:273:5
	jge	LBB2_42
Ltmp211:
## %bb.40:                              ##   in Loop: Header=BB2_39 Depth=1
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 274 14 is_stmt 1              ## parser.c:274:14
	movq	-88(%rbp), %rax
	movslq	-168(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 274 9 is_stmt 0               ## parser.c:274:9
	callq	_free
Ltmp212:
## %bb.41:                              ##   in Loop: Header=BB2_39 Depth=1
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 273 43 is_stmt 1              ## parser.c:273:43
	movl	-168(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -168(%rbp)
	.loc	3 273 5 is_stmt 0               ## parser.c:273:5
	jmp	LBB2_39
Ltmp213:
LBB2_42:
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 276 10 is_stmt 1              ## parser.c:276:10
	movq	-88(%rbp), %rdi
	.loc	3 276 5 is_stmt 0               ## parser.c:276:5
	callq	_free
	.loc	3 278 13 is_stmt 1              ## parser.c:278:13
	movl	$0, -172(%rbp)
	.loc	3 279 40                        ## parser.c:279:40
	movl	-80(%rbp), %eax
	.loc	3 279 58 is_stmt 0              ## parser.c:279:58
	subl	-148(%rbp), %eax
	.loc	3 279 40                        ## parser.c:279:40
	movslq	%eax, %rdi
	.loc	3 279 33                        ## parser.c:279:33
	movl	$8, %esi
	callq	_calloc
	.loc	3 279 12                        ## parser.c:279:12
	movq	%rax, -184(%rbp)
Ltmp214:
	.loc	3 280 15 is_stmt 1              ## parser.c:280:15
	movl	$0, -188(%rbp)
Ltmp215:
LBB2_43:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_47 Depth 2
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 280 22 is_stmt 0              ## parser.c:280:22
	movl	-188(%rbp), %eax
	.loc	3 280 24                        ## parser.c:280:24
	cmpl	-80(%rbp), %eax
Ltmp216:
	.loc	3 280 5                         ## parser.c:280:5
	jge	LBB2_52
Ltmp217:
## %bb.44:                              ##   in Loop: Header=BB2_43 Depth=1
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 281 13 is_stmt 1              ## parser.c:281:13
	movq	-160(%rbp), %rax
	movslq	-188(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	3 281 23 is_stmt 0              ## parser.c:281:23
	movsd	8(%rax), %xmm0                  ## xmm0 = mem[0],zero
	.loc	3 281 35                        ## parser.c:281:35
	xorps	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
Ltmp218:
	.loc	3 281 13                        ## parser.c:281:13
	jne	LBB2_46
	jp	LBB2_46
Ltmp219:
## %bb.45:                              ##   in Loop: Header=BB2_43 Depth=1
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 282 18 is_stmt 1              ## parser.c:282:18
	movq	-160(%rbp), %rax
	movslq	-188(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 282 13 is_stmt 0              ## parser.c:282:13
	callq	_free
	.loc	3 283 13 is_stmt 1              ## parser.c:283:13
	jmp	LBB2_51
Ltmp220:
LBB2_46:                                ##   in Loop: Header=BB2_43 Depth=1
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 285 35                        ## parser.c:285:35
	movl	$1, %edi
	movl	$8, %esi
	callq	_calloc
	movq	%rax, %rdx
	.loc	3 285 9 is_stmt 0               ## parser.c:285:9
	movq	-184(%rbp), %rax
	movslq	-172(%rbp), %rcx
	.loc	3 285 33                        ## parser.c:285:33
	movq	%rdx, (%rax,%rcx,8)
	.loc	3 286 9 is_stmt 1               ## parser.c:286:9
	movq	-184(%rbp), %rax
	movslq	-172(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	movq	-160(%rbp), %rax
	movslq	-188(%rbp), %rcx
	movq	(%rax,%rcx,8), %rsi
	movl	$16, %edx
	movq	$-1, %rcx
	callq	___memcpy_chk
	.loc	3 287 41                        ## parser.c:287:41
	movq	-184(%rbp), %rax
	movslq	-172(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	3 287 66 is_stmt 0              ## parser.c:287:66
	movsd	8(%rax), %xmm0                  ## xmm0 = mem[0],zero
	.loc	3 287 9                         ## parser.c:287:9
	leaq	L_.str.9(%rip), %rdi
	movb	$1, %al
	callq	_printf
Ltmp221:
	.loc	3 288 20 is_stmt 1              ## parser.c:288:20
	movq	$0, -200(%rbp)
Ltmp222:
LBB2_47:                                ##   Parent Loop BB2_43 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 288 27 is_stmt 0              ## parser.c:288:27
	movq	-200(%rbp), %rax
	.loc	3 288 31                        ## parser.c:288:31
	movq	-184(%rbp), %rcx
	movslq	-172(%rbp), %rdx
	movq	(%rcx,%rdx,8), %rcx
	.loc	3 288 56                        ## parser.c:288:56
	movq	(%rcx), %rcx
	.loc	3 288 29                        ## parser.c:288:29
	cmpq	8(%rcx), %rax
Ltmp223:
	.loc	3 288 9                         ## parser.c:288:9
	jae	LBB2_50
Ltmp224:
## %bb.48:                              ##   in Loop: Header=BB2_47 Depth=2
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 289 29 is_stmt 1              ## parser.c:289:29
	movq	-184(%rbp), %rax
	movslq	-172(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	3 289 54 is_stmt 0              ## parser.c:289:54
	movq	(%rax), %rax
	.loc	3 289 65                        ## parser.c:289:65
	movq	(%rax), %rax
	.loc	3 289 72                        ## parser.c:289:72
	movq	-200(%rbp), %rcx
	.loc	3 289 28                        ## parser.c:289:28
	movl	(%rax,%rcx,4), %esi
	.loc	3 289 13                        ## parser.c:289:13
	leaq	L_.str.10(%rip), %rdi
	movb	$0, %al
	callq	_printf
Ltmp225:
## %bb.49:                              ##   in Loop: Header=BB2_47 Depth=2
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 288 74 is_stmt 1              ## parser.c:288:74
	movq	-200(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -200(%rbp)
	.loc	3 288 9 is_stmt 0               ## parser.c:288:9
	jmp	LBB2_47
Ltmp226:
LBB2_50:                                ##   in Loop: Header=BB2_43 Depth=1
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 291 9 is_stmt 1               ## parser.c:291:9
	leaq	L_.str.11(%rip), %rdi
	movb	$0, %al
	callq	_printf
	.loc	3 292 12                        ## parser.c:292:12
	movl	-172(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -172(%rbp)
	.loc	3 293 14                        ## parser.c:293:14
	movq	-160(%rbp), %rax
	movslq	-188(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 293 9 is_stmt 0               ## parser.c:293:9
	callq	_free
Ltmp227:
LBB2_51:                                ##   in Loop: Header=BB2_43 Depth=1
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 280 46 is_stmt 1              ## parser.c:280:46
	movl	-188(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -188(%rbp)
	.loc	3 280 5 is_stmt 0               ## parser.c:280:5
	jmp	LBB2_43
Ltmp228:
LBB2_52:
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 295 10 is_stmt 1              ## parser.c:295:10
	movq	-160(%rbp), %rdi
	.loc	3 295 5 is_stmt 0               ## parser.c:295:5
	callq	_free
	.loc	3 296 12 is_stmt 1              ## parser.c:296:12
	movq	-184(%rbp), %rax
	movq	%rax, -280(%rbp)                ## 8-byte Spill
	.loc	3 297 1                         ## parser.c:297:1
	movq	-64(%rbp), %rax
	movq	%rax, %rsp
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	cmpq	%rcx, %rax
	jne	LBB2_54
Ltmp229:
## %bb.53:
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 0 1 is_stmt 0                 ## parser.c:0:1
	movq	-280(%rbp), %rax                ## 8-byte Reload
	.loc	3 297 1                         ## parser.c:297:1
	movq	%rbp, %rsp
	popq	%rbp
	retq
Ltmp230:
LBB2_54:
	##DEBUG_VALUE: processEachSideOfConstraint:subsubTokensList <- [DW_OP_constu 248, DW_OP_minus, DW_OP_deref] [$rbp+0]
	##DEBUG_VALUE: processEachSideOfConstraint:subTokens <- [DW_OP_constu 208, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	3 0 0                           ## parser.c:0:0
	callq	___stack_chk_fail
	ud2
Ltmp231:
Lfunc_end2:
	.cfi_endproc
                                        ## -- End function
	.globl	_processConstraint              ## -- Begin function processConstraint
	.p2align	4, 0x90
_processConstraint:                     ## @processConstraint
Lfunc_begin3:
	.loc	3 299 0 is_stmt 1               ## parser.c:299:0
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$144, %rsp
	movq	%rdi, -8(%rbp)
Ltmp232:
	.loc	3 300 16 prologue_end           ## parser.c:300:16
	movw	$61, -10(%rbp)
	.loc	3 301 24                        ## parser.c:301:24
	movq	-8(%rbp), %rdi
	leaq	-10(%rbp), %rsi
	movq	%rsi, -136(%rbp)                ## 8-byte Spill
	.loc	3 301 17 is_stmt 0              ## parser.c:301:17
	callq	_strtok
	movq	-136(%rbp), %rsi                ## 8-byte Reload
	.loc	3 301 11                        ## parser.c:301:11
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	%eax, -124(%rbp)                ## 4-byte Spill
	movl	%eax, %edi
	.loc	3 302 17 is_stmt 1              ## parser.c:302:17
	callq	_strtok
	movq	%rax, %rcx
	movl	-124(%rbp), %eax                ## 4-byte Reload
	.loc	3 302 11 is_stmt 0              ## parser.c:302:11
	movq	%rcx, -32(%rbp)
	.loc	3 303 20 is_stmt 1              ## parser.c:303:20
	movq	-24(%rbp), %rsi
	.loc	3 303 5 is_stmt 0               ## parser.c:303:5
	leaq	L_.str.12(%rip), %rdi
	movq	%rdi, -120(%rbp)                ## 8-byte Spill
                                        ## kill: def $al killed $al killed $eax
	movb	%al, -105(%rbp)                 ## 1-byte Spill
	callq	_printf
	movq	-120(%rbp), %rdi                ## 8-byte Reload
                                        ## kill: def $ecx killed $eax
	movb	-105(%rbp), %al                 ## 1-byte Reload
	.loc	3 304 20 is_stmt 1              ## parser.c:304:20
	movq	-32(%rbp), %rsi
	.loc	3 304 5 is_stmt 0               ## parser.c:304:5
	callq	_printf
	.loc	3 306 17 is_stmt 1              ## parser.c:306:17
	movq	-24(%rbp), %rdi
	movq	%rdi, -104(%rbp)                ## 8-byte Spill
	.loc	3 306 21 is_stmt 0              ## parser.c:306:21
	callq	_strlen
	movq	-104(%rbp), %rcx                ## 8-byte Reload
	.loc	3 306 17                        ## parser.c:306:17
	movb	-1(%rax,%rcx), %al
	.loc	3 306 10                        ## parser.c:306:10
	movb	%al, -33(%rbp)
	.loc	3 308 12 is_stmt 1              ## parser.c:308:12
	movl	$2, -40(%rbp)
	.loc	3 309 12                        ## parser.c:309:12
	movsbl	-33(%rbp), %eax
	movl	%eax, -96(%rbp)                 ## 4-byte Spill
	.loc	3 309 5 is_stmt 0               ## parser.c:309:5
	subl	$60, %eax
	je	LBB3_1
	jmp	LBB3_17
LBB3_17:
	.loc	3 0 5                           ## parser.c:0:5
	movl	-96(%rbp), %eax                 ## 4-byte Reload
	.loc	3 309 5                         ## parser.c:309:5
	subl	$62, %eax
	je	LBB3_2
	jmp	LBB3_3
LBB3_1:
Ltmp233:
	.loc	3 310 25 is_stmt 1              ## parser.c:310:25
	movl	$1, -40(%rbp)
	.loc	3 310 35 is_stmt 0              ## parser.c:310:35
	jmp	LBB3_4
LBB3_2:
	.loc	3 311 25 is_stmt 1              ## parser.c:311:25
	movl	$0, -40(%rbp)
	.loc	3 311 36 is_stmt 0              ## parser.c:311:36
	jmp	LBB3_4
LBB3_3:
	.loc	3 312 24 is_stmt 1              ## parser.c:312:24
	movl	$2, -40(%rbp)
Ltmp234:
LBB3_4:
	.loc	3 314 5                         ## parser.c:314:5
	movq	-24(%rbp), %rax
	movq	%rax, -144(%rbp)                ## 8-byte Spill
	.loc	3 314 16 is_stmt 0              ## parser.c:314:16
	movq	-24(%rbp), %rdi
	.loc	3 314 9                         ## parser.c:314:9
	callq	_strlen
	movq	%rax, %rcx
	movq	-144(%rbp), %rax                ## 8-byte Reload
	.loc	3 314 21                        ## parser.c:314:21
	subq	$1, %rcx
	.loc	3 314 26                        ## parser.c:314:26
	movb	$0, (%rax,%rcx)
	.loc	3 316 18 is_stmt 1              ## parser.c:316:18
	movq	-24(%rbp), %rdi
	.loc	3 316 11 is_stmt 0              ## parser.c:316:11
	movl	$58, %esi
	callq	_strchr
	.loc	3 316 28                        ## parser.c:316:28
	addq	$1, %rax
	.loc	3 316 9                         ## parser.c:316:9
	movq	%rax, -24(%rbp)
	.loc	3 317 26 is_stmt 1              ## parser.c:317:26
	movl	$1, %edi
	movl	$4, %esi
	callq	_calloc
	.loc	3 317 14 is_stmt 0              ## parser.c:317:14
	movq	%rax, -48(%rbp)
	.loc	3 318 26 is_stmt 1              ## parser.c:318:26
	movl	$1, %edi
	movl	$4, %esi
	callq	_calloc
	.loc	3 318 14 is_stmt 0              ## parser.c:318:14
	movq	%rax, -56(%rbp)
	.loc	3 322 5 is_stmt 1               ## parser.c:322:5
	leaq	L_.str.13(%rip), %rdi
	movb	$0, %al
	callq	_printf
	.loc	3 323 43                        ## parser.c:323:43
	movq	-24(%rbp), %rdi
	.loc	3 323 48 is_stmt 0              ## parser.c:323:48
	movq	-48(%rbp), %rsi
	.loc	3 323 15                        ## parser.c:323:15
	movl	$1, %edx
	callq	_processEachSideOfConstraint
	.loc	3 323 13                        ## parser.c:323:13
	movq	%rax, -64(%rbp)
	.loc	3 324 21 is_stmt 1              ## parser.c:324:21
	movq	-48(%rbp), %rax
	.loc	3 324 20 is_stmt 0              ## parser.c:324:20
	movl	(%rax), %esi
	.loc	3 324 5                         ## parser.c:324:5
	leaq	L_.str.8(%rip), %rdi
	movb	$0, %al
	callq	_printf
	.loc	3 325 5 is_stmt 1               ## parser.c:325:5
	leaq	L_.str.14(%rip), %rdi
	movb	$0, %al
	callq	_printf
	xorl	%edx, %edx
	.loc	3 326 43                        ## parser.c:326:43
	movq	-32(%rbp), %rdi
	.loc	3 326 48 is_stmt 0              ## parser.c:326:48
	movq	-56(%rbp), %rsi
	.loc	3 326 15                        ## parser.c:326:15
	callq	_processEachSideOfConstraint
	.loc	3 326 13                        ## parser.c:326:13
	movq	%rax, -72(%rbp)
	.loc	3 327 21 is_stmt 1              ## parser.c:327:21
	movq	-56(%rbp), %rax
	.loc	3 327 20 is_stmt 0              ## parser.c:327:20
	movl	(%rax), %esi
	.loc	3 327 5                         ## parser.c:327:5
	leaq	L_.str.8(%rip), %rdi
	movb	$0, %al
	callq	_printf
	.loc	3 329 25 is_stmt 1              ## parser.c:329:25
	movq	-48(%rbp), %rax
	.loc	3 329 24 is_stmt 0              ## parser.c:329:24
	movl	(%rax), %eax
	.loc	3 329 38                        ## parser.c:329:38
	movq	-56(%rbp), %rcx
	.loc	3 329 35                        ## parser.c:329:35
	addl	(%rcx), %eax
	.loc	3 329 24                        ## parser.c:329:24
	movslq	%eax, %rdi
	.loc	3 329 17                        ## parser.c:329:17
	movl	$8, %esi
	callq	_calloc
	.loc	3 329 15                        ## parser.c:329:15
	movq	%rax, -80(%rbp)
Ltmp235:
	.loc	3 331 17 is_stmt 1              ## parser.c:331:17
	movl	$0, -84(%rbp)
LBB3_5:                                 ## =>This Inner Loop Header: Depth=1
Ltmp236:
	.loc	3 331 24 is_stmt 0              ## parser.c:331:24
	movl	-84(%rbp), %eax
	.loc	3 331 29                        ## parser.c:331:29
	movq	-48(%rbp), %rcx
	.loc	3 331 26                        ## parser.c:331:26
	cmpl	(%rcx), %eax
Ltmp237:
	.loc	3 331 5                         ## parser.c:331:5
	jge	LBB3_8
## %bb.6:                               ##   in Loop: Header=BB3_5 Depth=1
Ltmp238:
	.loc	3 332 24 is_stmt 1              ## parser.c:332:24
	movl	$1, %edi
	movl	$16, %esi
	callq	_calloc
	movq	%rax, %rdx
	.loc	3 332 9 is_stmt 0               ## parser.c:332:9
	movq	-80(%rbp), %rax
	movslq	-84(%rbp), %rcx
	.loc	3 332 22                        ## parser.c:332:22
	movq	%rdx, (%rax,%rcx,8)
	.loc	3 333 9 is_stmt 1               ## parser.c:333:9
	movq	-80(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	movq	-64(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rsi
	movl	$16, %edx
	movq	$-1, %rcx
	callq	___memcpy_chk
Ltmp239:
## %bb.7:                               ##   in Loop: Header=BB3_5 Depth=1
	.loc	3 331 41                        ## parser.c:331:41
	movl	-84(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -84(%rbp)
	.loc	3 331 5 is_stmt 0               ## parser.c:331:5
	jmp	LBB3_5
Ltmp240:
LBB3_8:
	.loc	3 335 22 is_stmt 1              ## parser.c:335:22
	movq	-48(%rbp), %rax
	.loc	3 335 21 is_stmt 0              ## parser.c:335:21
	movl	(%rax), %eax
	.loc	3 335 17                        ## parser.c:335:17
	movl	%eax, -88(%rbp)
LBB3_9:                                 ## =>This Inner Loop Header: Depth=1
Ltmp241:
	.loc	3 335 33                        ## parser.c:335:33
	movl	-88(%rbp), %eax
	.loc	3 335 38                        ## parser.c:335:38
	movq	-48(%rbp), %rcx
	.loc	3 335 37                        ## parser.c:335:37
	movl	(%rcx), %ecx
	.loc	3 335 51                        ## parser.c:335:51
	movq	-56(%rbp), %rdx
	.loc	3 335 48                        ## parser.c:335:48
	addl	(%rdx), %ecx
	.loc	3 335 35                        ## parser.c:335:35
	cmpl	%ecx, %eax
Ltmp242:
	.loc	3 335 5                         ## parser.c:335:5
	jge	LBB3_12
## %bb.10:                              ##   in Loop: Header=BB3_9 Depth=1
Ltmp243:
	.loc	3 336 24 is_stmt 1              ## parser.c:336:24
	movl	$1, %edi
	movl	$16, %esi
	callq	_calloc
	movq	%rax, %rdx
	.loc	3 336 9 is_stmt 0               ## parser.c:336:9
	movq	-80(%rbp), %rax
	movslq	-88(%rbp), %rcx
	.loc	3 336 22                        ## parser.c:336:22
	movq	%rdx, (%rax,%rcx,8)
	.loc	3 337 9 is_stmt 1               ## parser.c:337:9
	movq	-80(%rbp), %rax
	movslq	-88(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	movq	-72(%rbp), %rax
	movl	-88(%rbp), %ecx
	movq	-48(%rbp), %rdx
	subl	(%rdx), %ecx
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rsi
	movl	$16, %edx
	movq	$-1, %rcx
	callq	___memcpy_chk
Ltmp244:
## %bb.11:                              ##   in Loop: Header=BB3_9 Depth=1
	.loc	3 335 63                        ## parser.c:335:63
	movl	-88(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -88(%rbp)
	.loc	3 335 5 is_stmt 0               ## parser.c:335:5
	jmp	LBB3_9
Ltmp245:
LBB3_12:
	.loc	3 340 17 is_stmt 1              ## parser.c:340:17
	movl	$0, -92(%rbp)
LBB3_13:                                ## =>This Inner Loop Header: Depth=1
Ltmp246:
	.loc	3 340 24 is_stmt 0              ## parser.c:340:24
	movl	-92(%rbp), %eax
	.loc	3 340 29                        ## parser.c:340:29
	movq	-48(%rbp), %rcx
	.loc	3 340 28                        ## parser.c:340:28
	movl	(%rcx), %ecx
	.loc	3 340 42                        ## parser.c:340:42
	movq	-56(%rbp), %rdx
	.loc	3 340 39                        ## parser.c:340:39
	addl	(%rdx), %ecx
	.loc	3 340 26                        ## parser.c:340:26
	cmpl	%ecx, %eax
Ltmp247:
	.loc	3 340 5                         ## parser.c:340:5
	jge	LBB3_16
## %bb.14:                              ##   in Loop: Header=BB3_13 Depth=1
Ltmp248:
	.loc	3 341 24 is_stmt 1              ## parser.c:341:24
	movq	-80(%rbp), %rax
	movslq	-92(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	.loc	3 341 38 is_stmt 0              ## parser.c:341:38
	movsd	8(%rax), %xmm0                  ## xmm0 = mem[0],zero
	.loc	3 341 9                         ## parser.c:341:9
	leaq	L_.str.5(%rip), %rdi
	movb	$1, %al
	callq	_printf
	.loc	3 342 14 is_stmt 1              ## parser.c:342:14
	movq	-80(%rbp), %rax
	movslq	-92(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 342 9 is_stmt 0               ## parser.c:342:9
	callq	_free
Ltmp249:
## %bb.15:                              ##   in Loop: Header=BB3_13 Depth=1
	.loc	3 340 54 is_stmt 1              ## parser.c:340:54
	movl	-92(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -92(%rbp)
	.loc	3 340 5 is_stmt 0               ## parser.c:340:5
	jmp	LBB3_13
Ltmp250:
LBB3_16:
	.loc	3 344 10 is_stmt 1              ## parser.c:344:10
	movq	-48(%rbp), %rdi
	.loc	3 344 5 is_stmt 0               ## parser.c:344:5
	callq	_free
	.loc	3 345 10 is_stmt 1              ## parser.c:345:10
	movq	-56(%rbp), %rdi
	.loc	3 345 5 is_stmt 0               ## parser.c:345:5
	callq	_free
	.loc	3 346 10 is_stmt 1              ## parser.c:346:10
	movq	-80(%rbp), %rdi
	.loc	3 346 5 is_stmt 0               ## parser.c:346:5
	callq	_free
	.loc	3 347 1 is_stmt 1               ## parser.c:347:1
	addq	$144, %rsp
	popq	%rbp
	retq
Ltmp251:
Lfunc_end3:
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
Lfunc_begin4:
	.loc	3 349 0                         ## parser.c:349:0
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$112, %rsp
	movl	$0, -4(%rbp)
Ltmp252:
	.loc	3 350 12 prologue_end           ## parser.c:350:12
	movq	$10000, -16(%rbp)               ## imm = 0x2710
	.loc	3 350 41 is_stmt 0              ## parser.c:350:41
	movq	$1000, -24(%rbp)                ## imm = 0x3E8
	.loc	3 353 16 is_stmt 1              ## parser.c:353:16
	leaq	L_.str.15(%rip), %rdi
	leaq	L_.str.16(%rip), %rsi
	callq	_fopen
	.loc	3 353 11 is_stmt 0              ## parser.c:353:11
	movq	%rax, -40(%rbp)
Ltmp253:
	.loc	3 355 10 is_stmt 1              ## parser.c:355:10
	cmpq	$0, -40(%rbp)
Ltmp254:
	.loc	3 355 9 is_stmt 0               ## parser.c:355:9
	jne	LBB4_2
## %bb.1:
Ltmp255:
	.loc	3 356 9 is_stmt 1               ## parser.c:356:9
	leaq	L_.str.17(%rip), %rdi
	callq	_perror
	.loc	3 357 9                         ## parser.c:357:9
	movl	$1, -4(%rbp)
	jmp	LBB4_16
Ltmp256:
LBB4_2:
	.loc	3 360 13                        ## parser.c:360:13
	movl	$0, -44(%rbp)
	.loc	3 361 20                        ## parser.c:361:20
	movq	-16(%rbp), %rdi
	.loc	3 361 13 is_stmt 0              ## parser.c:361:13
	movl	$8, %esi
	callq	_calloc
	.loc	3 361 11                        ## parser.c:361:11
	movq	%rax, -32(%rbp)
	.loc	3 362 23 is_stmt 1              ## parser.c:362:23
	movq	-24(%rbp), %rdi
	.loc	3 362 16 is_stmt 0              ## parser.c:362:16
	movl	$1, %esi
	callq	_calloc
	movq	%rax, %rcx
	.loc	3 362 5                         ## parser.c:362:5
	movq	-32(%rbp), %rax
	.loc	3 362 14                        ## parser.c:362:14
	movq	%rcx, (%rax)
LBB4_3:                                 ## =>This Inner Loop Header: Depth=1
	.loc	3 363 19 is_stmt 1              ## parser.c:363:19
	movq	-32(%rbp), %rax
	movslq	-44(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 363 29 is_stmt 0              ## parser.c:363:29
	movq	-24(%rbp), %rax
	movl	%eax, %esi
	.loc	3 363 45                        ## parser.c:363:45
	movq	-40(%rbp), %rdx
	.loc	3 363 12                        ## parser.c:363:12
	callq	_fgets
	.loc	3 363 5                         ## parser.c:363:5
	cmpq	$0, %rax
	je	LBB4_7
## %bb.4:                               ##   in Loop: Header=BB4_3 Depth=1
Ltmp257:
	.loc	3 364 13 is_stmt 1              ## parser.c:364:13
	movq	-32(%rbp), %rax
	movslq	-44(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movsbl	(%rax), %eax
	.loc	3 364 25 is_stmt 0              ## parser.c:364:25
	cmpl	$92, %eax
Ltmp258:
	.loc	3 364 13                        ## parser.c:364:13
	jne	LBB4_6
## %bb.5:                               ##   in Loop: Header=BB4_3 Depth=1
Ltmp259:
	.loc	3 365 13 is_stmt 1              ## parser.c:365:13
	jmp	LBB4_3
Ltmp260:
LBB4_6:                                 ##   in Loop: Header=BB4_3 Depth=1
	.loc	3 367 9                         ## parser.c:367:9
	movq	-32(%rbp), %rax
	movslq	-44(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	%rax, -104(%rbp)                ## 8-byte Spill
	.loc	3 367 26 is_stmt 0              ## parser.c:367:26
	movq	-32(%rbp), %rax
	movslq	-44(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 367 18                        ## parser.c:367:18
	leaq	L_.str.11(%rip), %rsi
	callq	_strcspn
	movq	%rax, %rcx
	movq	-104(%rbp), %rax                ## 8-byte Reload
	.loc	3 367 43                        ## parser.c:367:43
	movb	$0, (%rax,%rcx)
	.loc	3 368 10 is_stmt 1              ## parser.c:368:10
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -44(%rbp)
	.loc	3 369 27                        ## parser.c:369:27
	movq	-24(%rbp), %rdi
	.loc	3 369 20 is_stmt 0              ## parser.c:369:20
	movl	$1, %esi
	callq	_calloc
	movq	%rax, %rdx
	.loc	3 369 9                         ## parser.c:369:9
	movq	-32(%rbp), %rax
	movslq	-44(%rbp), %rcx
	.loc	3 369 18                        ## parser.c:369:18
	movq	%rdx, (%rax,%rcx,8)
Ltmp261:
	.loc	3 363 5 is_stmt 1               ## parser.c:363:5
	jmp	LBB4_3
LBB4_7:
	.loc	3 372 29                        ## parser.c:372:29
	movl	-44(%rbp), %eax
	.loc	3 372 13 is_stmt 0              ## parser.c:372:13
	movl	%eax, -48(%rbp)
	.loc	3 374 13 is_stmt 1              ## parser.c:374:13
	movq	-40(%rbp), %rdi
	.loc	3 374 5 is_stmt 0               ## parser.c:374:5
	callq	_fclose
	.loc	3 377 20 is_stmt 1              ## parser.c:377:20
	movl	$1000000, %edi                  ## imm = 0xF4240
	movl	$8, %esi
	callq	_calloc
	.loc	3 377 11 is_stmt 0              ## parser.c:377:11
	movq	%rax, -72(%rbp)
	.loc	3 378 28 is_stmt 1              ## parser.c:378:28
	movslq	-48(%rbp), %rdi
	.loc	3 378 21 is_stmt 0              ## parser.c:378:21
	movl	$8, %esi
	callq	_calloc
	.loc	3 378 19                        ## parser.c:378:19
	movq	%rax, -56(%rbp)
	.loc	3 379 21 is_stmt 1              ## parser.c:379:21
	movslq	-48(%rbp), %rdi
	.loc	3 379 14 is_stmt 0              ## parser.c:379:14
	movl	$8, %esi
	callq	_calloc
	.loc	3 379 12                        ## parser.c:379:12
	movq	%rax, -64(%rbp)
Ltmp262:
	.loc	3 380 17 is_stmt 1              ## parser.c:380:17
	movl	$0, -76(%rbp)
LBB4_8:                                 ## =>This Inner Loop Header: Depth=1
Ltmp263:
	.loc	3 380 24 is_stmt 0              ## parser.c:380:24
	movl	-76(%rbp), %eax
	.loc	3 380 26                        ## parser.c:380:26
	cmpl	-48(%rbp), %eax
Ltmp264:
	.loc	3 380 5                         ## parser.c:380:5
	jge	LBB4_11
## %bb.9:                               ##   in Loop: Header=BB4_8 Depth=1
Ltmp265:
	.loc	3 381 28 is_stmt 1              ## parser.c:381:28
	movq	-24(%rbp), %rdi
	.loc	3 381 21 is_stmt 0              ## parser.c:381:21
	movl	$1, %esi
	callq	_calloc
	movq	%rax, %rdx
	.loc	3 381 9                         ## parser.c:381:9
	movq	-64(%rbp), %rax
	movslq	-76(%rbp), %rcx
	.loc	3 381 19                        ## parser.c:381:19
	movq	%rdx, (%rax,%rcx,8)
	.loc	3 382 28 is_stmt 1              ## parser.c:382:28
	movl	$1000000, %edi                  ## imm = 0xF4240
	movl	$1, %esi
	callq	_calloc
	movq	%rax, %rdx
	.loc	3 382 9 is_stmt 0               ## parser.c:382:9
	movq	-56(%rbp), %rax
	movslq	-76(%rbp), %rcx
	.loc	3 382 26                        ## parser.c:382:26
	movq	%rdx, (%rax,%rcx,8)
Ltmp266:
## %bb.10:                              ##   in Loop: Header=BB4_8 Depth=1
	.loc	3 380 44 is_stmt 1              ## parser.c:380:44
	movl	-76(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -76(%rbp)
	.loc	3 380 5 is_stmt 0               ## parser.c:380:5
	jmp	LBB4_8
Ltmp267:
LBB4_11:
	.loc	3 384 24 is_stmt 1              ## parser.c:384:24
	movl	$2, %edi
	movl	$4, %esi
	callq	_calloc
	.loc	3 384 14 is_stmt 0              ## parser.c:384:14
	movq	%rax, -88(%rbp)
	.loc	3 385 15 is_stmt 1              ## parser.c:385:15
	movq	-32(%rbp), %rdi
	.loc	3 385 22 is_stmt 0              ## parser.c:385:22
	movq	-56(%rbp), %rsi
	.loc	3 385 37                        ## parser.c:385:37
	movq	-64(%rbp), %rdx
	.loc	3 385 45                        ## parser.c:385:45
	movq	-72(%rbp), %rcx
	.loc	3 385 53                        ## parser.c:385:53
	movq	-88(%rbp), %r8
	.loc	3 385 62                        ## parser.c:385:62
	movl	-48(%rbp), %r9d
	.loc	3 385 5                         ## parser.c:385:5
	callq	_parseFile
	.loc	3 387 23 is_stmt 1              ## parser.c:387:23
	movq	-56(%rbp), %rax
	movq	960(%rax), %rdi
	.loc	3 387 5 is_stmt 0               ## parser.c:387:5
	callq	_processConstraint
Ltmp268:
	.loc	3 389 17 is_stmt 1              ## parser.c:389:17
	movl	$0, -92(%rbp)
LBB4_12:                                ## =>This Inner Loop Header: Depth=1
Ltmp269:
	.loc	3 389 24 is_stmt 0              ## parser.c:389:24
	movl	-92(%rbp), %eax
	.loc	3 389 26                        ## parser.c:389:26
	cmpl	-48(%rbp), %eax
Ltmp270:
	.loc	3 389 5                         ## parser.c:389:5
	jge	LBB4_15
## %bb.13:                              ##   in Loop: Header=BB4_12 Depth=1
Ltmp271:
	.loc	3 390 15 is_stmt 1              ## parser.c:390:15
	movq	-32(%rbp), %rax
	movslq	-92(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 390 9 is_stmt 0               ## parser.c:390:9
	callq	_free
	.loc	3 391 14 is_stmt 1              ## parser.c:391:14
	movq	-56(%rbp), %rax
	movslq	-92(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 391 9 is_stmt 0               ## parser.c:391:9
	callq	_free
	.loc	3 392 14 is_stmt 1              ## parser.c:392:14
	movq	-64(%rbp), %rax
	movslq	-92(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	.loc	3 392 9 is_stmt 0               ## parser.c:392:9
	callq	_free
Ltmp272:
## %bb.14:                              ##   in Loop: Header=BB4_12 Depth=1
	.loc	3 389 44 is_stmt 1              ## parser.c:389:44
	movl	-92(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -92(%rbp)
	.loc	3 389 5 is_stmt 0               ## parser.c:389:5
	jmp	LBB4_12
Ltmp273:
LBB4_15:
	.loc	3 396 10 is_stmt 1              ## parser.c:396:10
	movq	-72(%rbp), %rdi
	.loc	3 396 5 is_stmt 0               ## parser.c:396:5
	callq	_free
	.loc	3 397 10 is_stmt 1              ## parser.c:397:10
	movq	-64(%rbp), %rdi
	.loc	3 397 5 is_stmt 0               ## parser.c:397:5
	callq	_free
	.loc	3 398 10 is_stmt 1              ## parser.c:398:10
	movq	-56(%rbp), %rdi
	.loc	3 398 5 is_stmt 0               ## parser.c:398:5
	callq	_free
	.loc	3 399 11 is_stmt 1              ## parser.c:399:11
	movq	-32(%rbp), %rdi
	.loc	3 399 5 is_stmt 0               ## parser.c:399:5
	callq	_free
	.loc	3 400 5 is_stmt 1               ## parser.c:400:5
	movl	$0, -4(%rbp)
LBB4_16:
	.loc	3 401 2                         ## parser.c:401:2
	movl	-4(%rbp), %eax
	addq	$112, %rsp
	popq	%rbp
	retq
Ltmp274:
Lfunc_end4:
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"End"

L_.str.1:                               ## @.str.1
	.asciz	"Subject To"

L_.str.2:                               ## @.str.2
	.asciz	"Binary"

L_.str.3:                               ## @.str.3
	.asciz	"Bounds"

L_.str.4:                               ## @.str.4
	.asciz	"Free"

L___const.convertStringToTerm.space:    ## @__const.convertStringToTerm.space
	.asciz	" "

L_.str.5:                               ## @.str.5
	.asciz	"%f\n"

	.section	__TEXT,__const
l___const.convertStringToTerm.carat:    ## @__const.convertStringToTerm.carat
	.asciz	"^\000"

	.section	__TEXT,__cstring,cstring_literals
L_.str.6:                               ## @.str.6
	.asciz	"objvar"

L_.str.7:                               ## @.str.7
	.asciz	"%d, %d\n"

L_.str.8:                               ## @.str.8
	.asciz	"%d\n"

	.section	__TEXT,__const
l___const.processEachSideOfConstraint.plus: ## @__const.processEachSideOfConstraint.plus
	.asciz	"+\000"

l___const.processEachSideOfConstraint.minus: ## @__const.processEachSideOfConstraint.minus
	.asciz	"-\000"

	.section	__TEXT,__cstring,cstring_literals
L_.str.9:                               ## @.str.9
	.asciz	"Main Term Coeff: %f\n"

L_.str.10:                              ## @.str.10
	.asciz	"%d, "

L_.str.11:                              ## @.str.11
	.asciz	"\n"

L___const.processConstraint.delim:      ## @__const.processConstraint.delim
	.asciz	"="

L_.str.12:                              ## @.str.12
	.asciz	"%s\n"

L_.str.13:                              ## @.str.13
	.asciz	"LHS\n"

L_.str.14:                              ## @.str.14
	.asciz	"RHS\n"

L_.str.15:                              ## @.str.15
	.asciz	"clay0205m.pip.txt"

L_.str.16:                              ## @.str.16
	.asciz	"r"

L_.str.17:                              ## @.str.17
	.asciz	"Cannot Open File"

	.file	4 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/i386" "_types.h"
	.file	5 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types" "_size_t.h"
	.file	6 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include" "_stdio.h"
	.file	7 "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys" "_types.h"
	.section	__DWARF,__debug_loc,regular,debug
Lsection_debug_loc:
Ldebug_loc0:
.set Lset0, Ltmp79-Lfunc_begin0
	.quad	Lset0
.set Lset1, Ltmp80-Lfunc_begin0
	.quad	Lset1
	.short	2                               ## Loc expr size
	.byte	114                             ## DW_OP_breg2
	.byte	0                               ## 0
.set Lset2, Ltmp80-Lfunc_begin0
	.quad	Lset2
.set Lset3, Ltmp84-Lfunc_begin0
	.quad	Lset3
	.short	3                               ## Loc expr size
	.byte	118                             ## DW_OP_breg6
	.byte	144                             ## -240
	.byte	126                             ## 
.set Lset4, Ltmp95-Lfunc_begin0
	.quad	Lset4
.set Lset5, Ltmp96-Lfunc_begin0
	.quad	Lset5
	.short	2                               ## Loc expr size
	.byte	112                             ## DW_OP_breg0
	.byte	0                               ## 0
.set Lset6, Ltmp97-Lfunc_begin0
	.quad	Lset6
.set Lset7, Ltmp98-Lfunc_begin0
	.quad	Lset7
	.short	2                               ## Loc expr size
	.byte	112                             ## DW_OP_breg0
	.byte	0                               ## 0
.set Lset8, Ltmp109-Lfunc_begin0
	.quad	Lset8
.set Lset9, Ltmp110-Lfunc_begin0
	.quad	Lset9
	.short	2                               ## Loc expr size
	.byte	114                             ## DW_OP_breg2
	.byte	0                               ## 0
.set Lset10, Ltmp128-Lfunc_begin0
	.quad	Lset10
.set Lset11, Ltmp129-Lfunc_begin0
	.quad	Lset11
	.short	2                               ## Loc expr size
	.byte	112                             ## DW_OP_breg0
	.byte	0                               ## 0
	.quad	0
	.quad	0
Ldebug_loc1:
.set Lset12, Ltmp81-Lfunc_begin0
	.quad	Lset12
.set Lset13, Ltmp82-Lfunc_begin0
	.quad	Lset13
	.short	4                               ## Loc expr size
	.byte	118                             ## DW_OP_breg6
	.byte	160                             ## -224
	.byte	126                             ## 
	.byte	6                               ## DW_OP_deref
.set Lset14, Ltmp82-Lfunc_begin0
	.quad	Lset14
.set Lset15, Ltmp83-Lfunc_begin0
	.quad	Lset15
	.short	2                               ## Loc expr size
	.byte	114                             ## DW_OP_breg2
	.byte	0                               ## 0
.set Lset16, Ltmp84-Lfunc_begin0
	.quad	Lset16
.set Lset17, Ltmp140-Lfunc_begin0
	.quad	Lset17
	.short	4                               ## Loc expr size
	.byte	118                             ## DW_OP_breg6
	.byte	160                             ## -224
	.byte	126                             ## 
	.byte	6                               ## DW_OP_deref
	.quad	0
	.quad	0
Ldebug_loc2:
.set Lset18, Ltmp145-Lfunc_begin0
	.quad	Lset18
.set Lset19, Lfunc_end2-Lfunc_begin0
	.quad	Lset19
	.short	4                               ## Loc expr size
	.byte	118                             ## DW_OP_breg6
	.byte	176                             ## -208
	.byte	126                             ## 
	.byte	6                               ## DW_OP_deref
	.quad	0
	.quad	0
Ldebug_loc3:
.set Lset20, Ltmp174-Lfunc_begin0
	.quad	Lset20
.set Lset21, Ltmp175-Lfunc_begin0
	.quad	Lset21
	.short	2                               ## Loc expr size
	.byte	114                             ## DW_OP_breg2
	.byte	0                               ## 0
.set Lset22, Ltmp175-Lfunc_begin0
	.quad	Lset22
.set Lset23, Ltmp179-Lfunc_begin0
	.quad	Lset23
	.short	3                               ## Loc expr size
	.byte	118                             ## DW_OP_breg6
	.byte	248                             ## -264
	.byte	125                             ## 
.set Lset24, Ltmp188-Lfunc_begin0
	.quad	Lset24
.set Lset25, Ltmp189-Lfunc_begin0
	.quad	Lset25
	.short	2                               ## Loc expr size
	.byte	114                             ## DW_OP_breg2
	.byte	0                               ## 0
.set Lset26, Ltmp200-Lfunc_begin0
	.quad	Lset26
.set Lset27, Ltmp201-Lfunc_begin0
	.quad	Lset27
	.short	2                               ## Loc expr size
	.byte	112                             ## DW_OP_breg0
	.byte	0                               ## 0
	.quad	0
	.quad	0
Ldebug_loc4:
.set Lset28, Ltmp176-Lfunc_begin0
	.quad	Lset28
.set Lset29, Ltmp177-Lfunc_begin0
	.quad	Lset29
	.short	4                               ## Loc expr size
	.byte	118                             ## DW_OP_breg6
	.byte	136                             ## -248
	.byte	126                             ## 
	.byte	6                               ## DW_OP_deref
.set Lset30, Ltmp177-Lfunc_begin0
	.quad	Lset30
.set Lset31, Ltmp179-Lfunc_begin0
	.quad	Lset31
	.short	2                               ## Loc expr size
	.byte	114                             ## DW_OP_breg2
	.byte	0                               ## 0
.set Lset32, Ltmp179-Lfunc_begin0
	.quad	Lset32
.set Lset33, Lfunc_end2-Lfunc_begin0
	.quad	Lset33
	.short	4                               ## Loc expr size
	.byte	118                             ## DW_OP_breg6
	.byte	136                             ## -248
	.byte	126                             ## 
	.byte	6                               ## DW_OP_deref
	.quad	0
	.quad	0
	.section	__DWARF,__debug_abbrev,regular,debug
Lsection_abbrev:
	.byte	1                               ## Abbreviation Code
	.byte	17                              ## DW_TAG_compile_unit
	.byte	1                               ## DW_CHILDREN_yes
	.byte	37                              ## DW_AT_producer
	.byte	14                              ## DW_FORM_strp
	.byte	19                              ## DW_AT_language
	.byte	5                               ## DW_FORM_data2
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.ascii	"\202|"                         ## DW_AT_LLVM_sysroot
	.byte	14                              ## DW_FORM_strp
	.ascii	"\357\177"                      ## DW_AT_APPLE_sdk
	.byte	14                              ## DW_FORM_strp
	.byte	16                              ## DW_AT_stmt_list
	.byte	23                              ## DW_FORM_sec_offset
	.byte	27                              ## DW_AT_comp_dir
	.byte	14                              ## DW_FORM_strp
	.byte	17                              ## DW_AT_low_pc
	.byte	1                               ## DW_FORM_addr
	.byte	18                              ## DW_AT_high_pc
	.byte	6                               ## DW_FORM_data4
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	2                               ## Abbreviation Code
	.byte	4                               ## DW_TAG_enumeration_type
	.byte	1                               ## DW_CHILDREN_yes
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.byte	11                              ## DW_AT_byte_size
	.byte	11                              ## DW_FORM_data1
	.byte	58                              ## DW_AT_decl_file
	.byte	11                              ## DW_FORM_data1
	.byte	59                              ## DW_AT_decl_line
	.byte	11                              ## DW_FORM_data1
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	3                               ## Abbreviation Code
	.byte	40                              ## DW_TAG_enumerator
	.byte	0                               ## DW_CHILDREN_no
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.byte	28                              ## DW_AT_const_value
	.byte	15                              ## DW_FORM_udata
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	4                               ## Abbreviation Code
	.byte	36                              ## DW_TAG_base_type
	.byte	0                               ## DW_CHILDREN_no
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.byte	62                              ## DW_AT_encoding
	.byte	11                              ## DW_FORM_data1
	.byte	11                              ## DW_AT_byte_size
	.byte	11                              ## DW_FORM_data1
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	5                               ## Abbreviation Code
	.byte	15                              ## DW_TAG_pointer_type
	.byte	0                               ## DW_CHILDREN_no
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	6                               ## Abbreviation Code
	.byte	22                              ## DW_TAG_typedef
	.byte	0                               ## DW_CHILDREN_no
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.byte	58                              ## DW_AT_decl_file
	.byte	11                              ## DW_FORM_data1
	.byte	59                              ## DW_AT_decl_line
	.byte	11                              ## DW_FORM_data1
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	7                               ## Abbreviation Code
	.byte	46                              ## DW_TAG_subprogram
	.byte	1                               ## DW_CHILDREN_yes
	.byte	17                              ## DW_AT_low_pc
	.byte	1                               ## DW_FORM_addr
	.byte	18                              ## DW_AT_high_pc
	.byte	6                               ## DW_FORM_data4
	.byte	64                              ## DW_AT_frame_base
	.byte	24                              ## DW_FORM_exprloc
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.byte	58                              ## DW_AT_decl_file
	.byte	11                              ## DW_FORM_data1
	.byte	59                              ## DW_AT_decl_line
	.byte	11                              ## DW_FORM_data1
	.byte	39                              ## DW_AT_prototyped
	.byte	25                              ## DW_FORM_flag_present
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	63                              ## DW_AT_external
	.byte	25                              ## DW_FORM_flag_present
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	8                               ## Abbreviation Code
	.byte	5                               ## DW_TAG_formal_parameter
	.byte	0                               ## DW_CHILDREN_no
	.byte	2                               ## DW_AT_location
	.byte	24                              ## DW_FORM_exprloc
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.byte	58                              ## DW_AT_decl_file
	.byte	11                              ## DW_FORM_data1
	.byte	59                              ## DW_AT_decl_line
	.byte	11                              ## DW_FORM_data1
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	9                               ## Abbreviation Code
	.byte	52                              ## DW_TAG_variable
	.byte	0                               ## DW_CHILDREN_no
	.byte	2                               ## DW_AT_location
	.byte	24                              ## DW_FORM_exprloc
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.byte	58                              ## DW_AT_decl_file
	.byte	11                              ## DW_FORM_data1
	.byte	59                              ## DW_AT_decl_line
	.byte	11                              ## DW_FORM_data1
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	10                              ## Abbreviation Code
	.byte	46                              ## DW_TAG_subprogram
	.byte	1                               ## DW_CHILDREN_yes
	.byte	17                              ## DW_AT_low_pc
	.byte	1                               ## DW_FORM_addr
	.byte	18                              ## DW_AT_high_pc
	.byte	6                               ## DW_FORM_data4
	.byte	64                              ## DW_AT_frame_base
	.byte	24                              ## DW_FORM_exprloc
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.byte	58                              ## DW_AT_decl_file
	.byte	11                              ## DW_FORM_data1
	.byte	59                              ## DW_AT_decl_line
	.byte	11                              ## DW_FORM_data1
	.byte	39                              ## DW_AT_prototyped
	.byte	25                              ## DW_FORM_flag_present
	.byte	63                              ## DW_AT_external
	.byte	25                              ## DW_FORM_flag_present
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	11                              ## Abbreviation Code
	.byte	52                              ## DW_TAG_variable
	.byte	0                               ## DW_CHILDREN_no
	.byte	2                               ## DW_AT_location
	.byte	24                              ## DW_FORM_exprloc
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	52                              ## DW_AT_artificial
	.byte	25                              ## DW_FORM_flag_present
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	12                              ## Abbreviation Code
	.byte	52                              ## DW_TAG_variable
	.byte	0                               ## DW_CHILDREN_no
	.byte	2                               ## DW_AT_location
	.byte	23                              ## DW_FORM_sec_offset
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.byte	58                              ## DW_AT_decl_file
	.byte	11                              ## DW_FORM_data1
	.byte	59                              ## DW_AT_decl_line
	.byte	11                              ## DW_FORM_data1
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	13                              ## Abbreviation Code
	.byte	11                              ## DW_TAG_lexical_block
	.byte	1                               ## DW_CHILDREN_yes
	.byte	17                              ## DW_AT_low_pc
	.byte	1                               ## DW_FORM_addr
	.byte	18                              ## DW_AT_high_pc
	.byte	6                               ## DW_FORM_data4
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	14                              ## Abbreviation Code
	.byte	52                              ## DW_TAG_variable
	.byte	0                               ## DW_CHILDREN_no
	.byte	2                               ## DW_AT_location
	.byte	24                              ## DW_FORM_exprloc
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.byte	58                              ## DW_AT_decl_file
	.byte	11                              ## DW_FORM_data1
	.byte	59                              ## DW_AT_decl_line
	.byte	5                               ## DW_FORM_data2
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	15                              ## Abbreviation Code
	.byte	46                              ## DW_TAG_subprogram
	.byte	1                               ## DW_CHILDREN_yes
	.byte	17                              ## DW_AT_low_pc
	.byte	1                               ## DW_FORM_addr
	.byte	18                              ## DW_AT_high_pc
	.byte	6                               ## DW_FORM_data4
	.byte	64                              ## DW_AT_frame_base
	.byte	24                              ## DW_FORM_exprloc
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.byte	58                              ## DW_AT_decl_file
	.byte	11                              ## DW_FORM_data1
	.byte	59                              ## DW_AT_decl_line
	.byte	5                               ## DW_FORM_data2
	.byte	39                              ## DW_AT_prototyped
	.byte	25                              ## DW_FORM_flag_present
	.byte	63                              ## DW_AT_external
	.byte	25                              ## DW_FORM_flag_present
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	16                              ## Abbreviation Code
	.byte	5                               ## DW_TAG_formal_parameter
	.byte	0                               ## DW_CHILDREN_no
	.byte	2                               ## DW_AT_location
	.byte	24                              ## DW_FORM_exprloc
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.byte	58                              ## DW_AT_decl_file
	.byte	11                              ## DW_FORM_data1
	.byte	59                              ## DW_AT_decl_line
	.byte	5                               ## DW_FORM_data2
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	17                              ## Abbreviation Code
	.byte	46                              ## DW_TAG_subprogram
	.byte	1                               ## DW_CHILDREN_yes
	.byte	17                              ## DW_AT_low_pc
	.byte	1                               ## DW_FORM_addr
	.byte	18                              ## DW_AT_high_pc
	.byte	6                               ## DW_FORM_data4
	.byte	64                              ## DW_AT_frame_base
	.byte	24                              ## DW_FORM_exprloc
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.byte	58                              ## DW_AT_decl_file
	.byte	11                              ## DW_FORM_data1
	.byte	59                              ## DW_AT_decl_line
	.byte	5                               ## DW_FORM_data2
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	63                              ## DW_AT_external
	.byte	25                              ## DW_FORM_flag_present
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	18                              ## Abbreviation Code
	.byte	15                              ## DW_TAG_pointer_type
	.byte	0                               ## DW_CHILDREN_no
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	19                              ## Abbreviation Code
	.byte	19                              ## DW_TAG_structure_type
	.byte	1                               ## DW_CHILDREN_yes
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.byte	11                              ## DW_AT_byte_size
	.byte	11                              ## DW_FORM_data1
	.byte	58                              ## DW_AT_decl_file
	.byte	11                              ## DW_FORM_data1
	.byte	59                              ## DW_AT_decl_line
	.byte	11                              ## DW_FORM_data1
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	20                              ## Abbreviation Code
	.byte	13                              ## DW_TAG_member
	.byte	0                               ## DW_CHILDREN_no
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	58                              ## DW_AT_decl_file
	.byte	11                              ## DW_FORM_data1
	.byte	59                              ## DW_AT_decl_line
	.byte	11                              ## DW_FORM_data1
	.byte	56                              ## DW_AT_data_member_location
	.byte	11                              ## DW_FORM_data1
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	21                              ## Abbreviation Code
	.byte	1                               ## DW_TAG_array_type
	.byte	1                               ## DW_CHILDREN_yes
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	22                              ## Abbreviation Code
	.byte	33                              ## DW_TAG_subrange_type
	.byte	0                               ## DW_CHILDREN_no
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	55                              ## DW_AT_count
	.byte	11                              ## DW_FORM_data1
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	23                              ## Abbreviation Code
	.byte	36                              ## DW_TAG_base_type
	.byte	0                               ## DW_CHILDREN_no
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.byte	11                              ## DW_AT_byte_size
	.byte	11                              ## DW_FORM_data1
	.byte	62                              ## DW_AT_encoding
	.byte	11                              ## DW_FORM_data1
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	24                              ## Abbreviation Code
	.byte	38                              ## DW_TAG_const_type
	.byte	0                               ## DW_CHILDREN_no
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	25                              ## Abbreviation Code
	.byte	33                              ## DW_TAG_subrange_type
	.byte	0                               ## DW_CHILDREN_no
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	55                              ## DW_AT_count
	.byte	19                              ## DW_FORM_ref4
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	26                              ## Abbreviation Code
	.byte	21                              ## DW_TAG_subroutine_type
	.byte	1                               ## DW_CHILDREN_yes
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	39                              ## DW_AT_prototyped
	.byte	25                              ## DW_FORM_flag_present
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	27                              ## Abbreviation Code
	.byte	5                               ## DW_TAG_formal_parameter
	.byte	0                               ## DW_CHILDREN_no
	.byte	73                              ## DW_AT_type
	.byte	19                              ## DW_FORM_ref4
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	28                              ## Abbreviation Code
	.byte	19                              ## DW_TAG_structure_type
	.byte	0                               ## DW_CHILDREN_no
	.byte	3                               ## DW_AT_name
	.byte	14                              ## DW_FORM_strp
	.byte	60                              ## DW_AT_declaration
	.byte	25                              ## DW_FORM_flag_present
	.byte	0                               ## EOM(1)
	.byte	0                               ## EOM(2)
	.byte	0                               ## EOM(3)
	.section	__DWARF,__debug_info,regular,debug
Lsection_info:
Lcu_begin0:
.set Lset34, Ldebug_info_end0-Ldebug_info_start0 ## Length of Unit
	.long	Lset34
Ldebug_info_start0:
	.short	4                               ## DWARF version number
.set Lset35, Lsection_abbrev-Lsection_abbrev ## Offset Into Abbrev. Section
	.long	Lset35
	.byte	8                               ## Address Size (in bytes)
	.byte	1                               ## Abbrev [1] 0xb:0xae3 DW_TAG_compile_unit
	.long	0                               ## DW_AT_producer
	.short	12                              ## DW_AT_language
	.long	48                              ## DW_AT_name
	.long	57                              ## DW_AT_LLVM_sysroot
	.long	109                             ## DW_AT_APPLE_sdk
.set Lset36, Lline_table_start0-Lsection_line ## DW_AT_stmt_list
	.long	Lset36
	.long	120                             ## DW_AT_comp_dir
	.quad	Lfunc_begin0                    ## DW_AT_low_pc
.set Lset37, Lfunc_end4-Lfunc_begin0    ## DW_AT_high_pc
	.long	Lset37
	.byte	2                               ## Abbrev [2] 0x32:0x1f DW_TAG_enumeration_type
	.long	81                              ## DW_AT_type
	.long	143                             ## DW_AT_name
	.byte	4                               ## DW_AT_byte_size
	.byte	1                               ## DW_AT_decl_file
	.byte	42                              ## DW_AT_decl_line
	.byte	3                               ## Abbrev [3] 0x3e:0x6 DW_TAG_enumerator
	.long	172                             ## DW_AT_name
	.byte	0                               ## DW_AT_const_value
	.byte	3                               ## Abbrev [3] 0x44:0x6 DW_TAG_enumerator
	.long	180                             ## DW_AT_name
	.byte	1                               ## DW_AT_const_value
	.byte	3                               ## Abbrev [3] 0x4a:0x6 DW_TAG_enumerator
	.long	187                             ## DW_AT_name
	.byte	2                               ## DW_AT_const_value
	.byte	0                               ## End Of Children Mark
	.byte	4                               ## Abbrev [4] 0x51:0x7 DW_TAG_base_type
	.long	159                             ## DW_AT_name
	.byte	7                               ## DW_AT_encoding
	.byte	4                               ## DW_AT_byte_size
	.byte	5                               ## Abbrev [5] 0x58:0x1 DW_TAG_pointer_type
	.byte	6                               ## Abbrev [6] 0x59:0xb DW_TAG_typedef
	.long	100                             ## DW_AT_type
	.long	193                             ## DW_AT_name
	.byte	2                               ## DW_AT_decl_file
	.byte	30                              ## DW_AT_decl_line
	.byte	4                               ## Abbrev [4] 0x64:0x7 DW_TAG_base_type
	.long	201                             ## DW_AT_name
	.byte	5                               ## DW_AT_encoding
	.byte	4                               ## DW_AT_byte_size
	.byte	7                               ## Abbrev [7] 0x6b:0xa6 DW_TAG_subprogram
	.quad	Lfunc_begin0                    ## DW_AT_low_pc
.set Lset38, Lfunc_end0-Lfunc_begin0    ## DW_AT_high_pc
	.long	Lset38
	.byte	1                               ## DW_AT_frame_base
	.byte	86
	.long	205                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	7                               ## DW_AT_decl_line
                                        ## DW_AT_prototyped
	.long	100                             ## DW_AT_type
                                        ## DW_AT_external
	.byte	8                               ## Abbrev [8] 0x84:0xe DW_TAG_formal_parameter
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	120
	.long	412                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	7                               ## DW_AT_decl_line
	.long	2149                            ## DW_AT_type
	.byte	8                               ## Abbrev [8] 0x92:0xe DW_TAG_formal_parameter
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	112
	.long	423                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	7                               ## DW_AT_decl_line
	.long	2149                            ## DW_AT_type
	.byte	8                               ## Abbrev [8] 0xa0:0xe DW_TAG_formal_parameter
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	104
	.long	437                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	7                               ## DW_AT_decl_line
	.long	2149                            ## DW_AT_type
	.byte	8                               ## Abbrev [8] 0xae:0xe DW_TAG_formal_parameter
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	96
	.long	444                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	7                               ## DW_AT_decl_line
	.long	2154                            ## DW_AT_type
	.byte	8                               ## Abbrev [8] 0xbc:0xe DW_TAG_formal_parameter
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	88
	.long	451                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	7                               ## DW_AT_decl_line
	.long	2103                            ## DW_AT_type
	.byte	8                               ## Abbrev [8] 0xca:0xe DW_TAG_formal_parameter
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	84
	.long	459                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	7                               ## DW_AT_decl_line
	.long	89                              ## DW_AT_type
	.byte	9                               ## Abbrev [9] 0xd8:0xe DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	80
	.long	473                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	9                               ## DW_AT_decl_line
	.long	89                              ## DW_AT_type
	.byte	9                               ## Abbrev [9] 0xe6:0xe DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	76
	.long	492                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	9                               ## DW_AT_decl_line
	.long	89                              ## DW_AT_type
	.byte	9                               ## Abbrev [9] 0xf4:0xe DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	72
	.long	325                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	9                               ## DW_AT_decl_line
	.long	89                              ## DW_AT_type
	.byte	9                               ## Abbrev [9] 0x102:0xe DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	68
	.long	503                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	70                              ## DW_AT_decl_line
	.long	89                              ## DW_AT_type
	.byte	0                               ## End Of Children Mark
	.byte	10                              ## Abbrev [10] 0x111:0x220 DW_TAG_subprogram
	.quad	Lfunc_begin1                    ## DW_AT_low_pc
.set Lset39, Lfunc_end1-Lfunc_begin1    ## DW_AT_high_pc
	.long	Lset39
	.byte	1                               ## DW_AT_frame_base
	.byte	86
	.long	215                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	104                             ## DW_AT_decl_line
                                        ## DW_AT_prototyped
                                        ## DW_AT_external
	.byte	8                               ## Abbrev [8] 0x126:0xe DW_TAG_formal_parameter
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	112
	.long	518                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	104                             ## DW_AT_decl_line
	.long	2154                            ## DW_AT_type
	.byte	8                               ## Abbrev [8] 0x134:0xe DW_TAG_formal_parameter
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	108
	.long	529                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	104                             ## DW_AT_decl_line
	.long	89                              ## DW_AT_type
	.byte	8                               ## Abbrev [8] 0x142:0xe DW_TAG_formal_parameter
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	96
	.long	291                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	104                             ## DW_AT_decl_line
	.long	1981                            ## DW_AT_type
	.byte	9                               ## Abbrev [9] 0x150:0xe DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	92
	.long	325                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	108                             ## DW_AT_decl_line
	.long	89                              ## DW_AT_type
	.byte	9                               ## Abbrev [9] 0x15e:0xe DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	80
	.long	540                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	114                             ## DW_AT_decl_line
	.long	2154                            ## DW_AT_type
	.byte	9                               ## Abbrev [9] 0x16c:0xe DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	72
	.long	555                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	115                             ## DW_AT_decl_line
	.long	2154                            ## DW_AT_type
	.byte	9                               ## Abbrev [9] 0x17a:0xe DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	64
	.long	400                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	116                             ## DW_AT_decl_line
	.long	2142                            ## DW_AT_type
	.byte	9                               ## Abbrev [9] 0x188:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\276\177"
	.long	559                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	119                             ## DW_AT_decl_line
	.long	2166                            ## DW_AT_type
	.byte	9                               ## Abbrev [9] 0x197:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.long	585                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	121                             ## DW_AT_decl_line
	.long	2154                            ## DW_AT_type
	.byte	11                              ## Abbrev [11] 0x1a6:0xd DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\240\177"
	.long	596                             ## DW_AT_name
	.long	2130                            ## DW_AT_type
                                        ## DW_AT_artificial
	.byte	11                              ## Abbrev [11] 0x1b3:0xd DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\230\177"
	.long	608                             ## DW_AT_name
	.long	2130                            ## DW_AT_type
                                        ## DW_AT_artificial
	.byte	9                               ## Abbrev [9] 0x1c0:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\225\177"
	.long	620                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	137                             ## DW_AT_decl_line
	.long	2185                            ## DW_AT_type
	.byte	9                               ## Abbrev [9] 0x1cf:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\220\177"
	.long	626                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	139                             ## DW_AT_decl_line
	.long	89                              ## DW_AT_type
	.byte	9                               ## Abbrev [9] 0x1de:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\210\177"
	.long	634                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	140                             ## DW_AT_decl_line
	.long	2154                            ## DW_AT_type
	.byte	9                               ## Abbrev [9] 0x1ed:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\204\177"
	.long	319                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	141                             ## DW_AT_decl_line
	.long	89                              ## DW_AT_type
	.byte	9                               ## Abbrev [9] 0x1fc:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\340~"
	.long	659                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	177                             ## DW_AT_decl_line
	.long	89                              ## DW_AT_type
	.byte	9                               ## Abbrev [9] 0x20b:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\320~"
	.long	672                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	181                             ## DW_AT_decl_line
	.long	2103                            ## DW_AT_type
	.byte	9                               ## Abbrev [9] 0x21a:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\314~"
	.long	681                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	182                             ## DW_AT_decl_line
	.long	89                              ## DW_AT_type
	.byte	9                               ## Abbrev [9] 0x229:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\270~"
	.long	296                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	192                             ## DW_AT_decl_line
	.long	2030                            ## DW_AT_type
	.byte	12                              ## Abbrev [12] 0x238:0xf DW_TAG_variable
.set Lset40, Ldebug_loc0-Lsection_debug_loc ## DW_AT_location
	.long	Lset40
	.long	685                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	134                             ## DW_AT_decl_line
	.long	2202                            ## DW_AT_type
	.byte	12                              ## Abbrev [12] 0x247:0xf DW_TAG_variable
.set Lset41, Ldebug_loc1-Lsection_debug_loc ## DW_AT_location
	.long	Lset41
	.long	691                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	135                             ## DW_AT_decl_line
	.long	2217                            ## DW_AT_type
	.byte	13                              ## Abbrev [13] 0x256:0x49 DW_TAG_lexical_block
	.quad	Ltmp85                          ## DW_AT_low_pc
.set Lset42, Ltmp104-Ltmp85             ## DW_AT_high_pc
	.long	Lset42
	.byte	9                               ## Abbrev [9] 0x263:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\370~"
	.long	643                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	151                             ## DW_AT_decl_line
	.long	2154                            ## DW_AT_type
	.byte	9                               ## Abbrev [9] 0x272:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\360~"
	.long	555                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	153                             ## DW_AT_decl_line
	.long	2154                            ## DW_AT_type
	.byte	13                              ## Abbrev [13] 0x281:0x1d DW_TAG_lexical_block
	.quad	Ltmp100                         ## DW_AT_low_pc
.set Lset43, Ltmp101-Ltmp100            ## DW_AT_high_pc
	.long	Lset43
	.byte	9                               ## Abbrev [9] 0x28e:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\350~"
	.long	648                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	160                             ## DW_AT_decl_line
	.long	2154                            ## DW_AT_type
	.byte	0                               ## End Of Children Mark
	.byte	0                               ## End Of Children Mark
	.byte	13                              ## Abbrev [13] 0x29f:0x1d DW_TAG_lexical_block
	.quad	Ltmp105                         ## DW_AT_low_pc
.set Lset44, Ltmp112-Ltmp105            ## DW_AT_high_pc
	.long	Lset44
	.byte	9                               ## Abbrev [9] 0x2ac:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\344~"
	.long	657                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	171                             ## DW_AT_decl_line
	.long	100                             ## DW_AT_type
	.byte	0                               ## End Of Children Mark
	.byte	13                              ## Abbrev [13] 0x2bc:0x1d DW_TAG_lexical_block
	.quad	Ltmp113                         ## DW_AT_low_pc
.set Lset45, Ltmp119-Ltmp113            ## DW_AT_high_pc
	.long	Lset45
	.byte	9                               ## Abbrev [9] 0x2c9:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\334~"
	.long	657                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	178                             ## DW_AT_decl_line
	.long	100                             ## DW_AT_type
	.byte	0                               ## End Of Children Mark
	.byte	13                              ## Abbrev [13] 0x2d9:0x3a DW_TAG_lexical_block
	.quad	Ltmp120                         ## DW_AT_low_pc
.set Lset46, Ltmp133-Ltmp120            ## DW_AT_high_pc
	.long	Lset46
	.byte	9                               ## Abbrev [9] 0x2e6:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\310~"
	.long	657                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	183                             ## DW_AT_decl_line
	.long	89                              ## DW_AT_type
	.byte	13                              ## Abbrev [13] 0x2f5:0x1d DW_TAG_lexical_block
	.quad	Ltmp123                         ## DW_AT_low_pc
.set Lset47, Ltmp131-Ltmp123            ## DW_AT_high_pc
	.long	Lset47
	.byte	9                               ## Abbrev [9] 0x302:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\304~"
	.long	683                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	184                             ## DW_AT_decl_line
	.long	89                              ## DW_AT_type
	.byte	0                               ## End Of Children Mark
	.byte	0                               ## End Of Children Mark
	.byte	13                              ## Abbrev [13] 0x313:0x1d DW_TAG_lexical_block
	.quad	Ltmp134                         ## DW_AT_low_pc
.set Lset48, Ltmp139-Ltmp134            ## DW_AT_high_pc
	.long	Lset48
	.byte	9                               ## Abbrev [9] 0x320:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\264~"
	.long	657                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	198                             ## DW_AT_decl_line
	.long	100                             ## DW_AT_type
	.byte	0                               ## End Of Children Mark
	.byte	0                               ## End Of Children Mark
	.byte	7                               ## Abbrev [7] 0x331:0x280 DW_TAG_subprogram
	.quad	Lfunc_begin2                    ## DW_AT_low_pc
.set Lset49, Lfunc_end2-Lfunc_begin2    ## DW_AT_high_pc
	.long	Lset49
	.byte	1                               ## DW_AT_frame_base
	.byte	86
	.long	235                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	203                             ## DW_AT_decl_line
                                        ## DW_AT_prototyped
	.long	1976                            ## DW_AT_type
                                        ## DW_AT_external
	.byte	8                               ## Abbrev [8] 0x34a:0xe DW_TAG_formal_parameter
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	112
	.long	697                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	203                             ## DW_AT_decl_line
	.long	2154                            ## DW_AT_type
	.byte	8                               ## Abbrev [8] 0x358:0xe DW_TAG_formal_parameter
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	104
	.long	701                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	203                             ## DW_AT_decl_line
	.long	2103                            ## DW_AT_type
	.byte	8                               ## Abbrev [8] 0x366:0xe DW_TAG_formal_parameter
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	103
	.long	716                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	203                             ## DW_AT_decl_line
	.long	2232                            ## DW_AT_type
	.byte	9                               ## Abbrev [9] 0x374:0xe DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	100
	.long	728                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	204                             ## DW_AT_decl_line
	.long	2185                            ## DW_AT_type
	.byte	9                               ## Abbrev [9] 0x382:0xe DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	97
	.long	733                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	205                             ## DW_AT_decl_line
	.long	2185                            ## DW_AT_type
	.byte	9                               ## Abbrev [9] 0x390:0xe DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	88
	.long	739                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	206                             ## DW_AT_decl_line
	.long	2154                            ## DW_AT_type
	.byte	9                               ## Abbrev [9] 0x39e:0xe DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	80
	.long	747                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	208                             ## DW_AT_decl_line
	.long	2154                            ## DW_AT_type
	.byte	9                               ## Abbrev [9] 0x3ac:0xe DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	76
	.long	760                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	209                             ## DW_AT_decl_line
	.long	89                              ## DW_AT_type
	.byte	11                              ## Abbrev [11] 0x3ba:0xd DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.long	596                             ## DW_AT_name
	.long	2130                            ## DW_AT_type
                                        ## DW_AT_artificial
	.byte	9                               ## Abbrev [9] 0x3c7:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.long	775                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	223                             ## DW_AT_decl_line
	.long	89                              ## DW_AT_type
	.byte	9                               ## Abbrev [9] 0x3d6:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.long	793                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	225                             ## DW_AT_decl_line
	.long	2149                            ## DW_AT_type
	.byte	11                              ## Abbrev [11] 0x3e5:0xd DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\220\177"
	.long	608                             ## DW_AT_name
	.long	2130                            ## DW_AT_type
                                        ## DW_AT_artificial
	.byte	11                              ## Abbrev [11] 0x3f2:0xd DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\210\177"
	.long	820                             ## DW_AT_name
	.long	2130                            ## DW_AT_type
                                        ## DW_AT_artificial
	.byte	9                               ## Abbrev [9] 0x3ff:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\204\177"
	.long	529                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	242                             ## DW_AT_decl_line
	.long	89                              ## DW_AT_type
	.byte	9                               ## Abbrev [9] 0x40e:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\200\177"
	.long	626                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	242                             ## DW_AT_decl_line
	.long	89                              ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x41d:0x10 DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\354~"
	.long	832                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	260                             ## DW_AT_decl_line
	.long	89                              ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x42d:0x10 DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\340~"
	.long	685                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	262                             ## DW_AT_decl_line
	.long	1976                            ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x43d:0x10 DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\324~"
	.long	847                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	278                             ## DW_AT_decl_line
	.long	89                              ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x44d:0x10 DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\310~"
	.long	851                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	279                             ## DW_AT_decl_line
	.long	1976                            ## DW_AT_type
	.byte	12                              ## Abbrev [12] 0x45d:0xf DW_TAG_variable
.set Lset50, Ldebug_loc2-Lsection_debug_loc ## DW_AT_location
	.long	Lset50
	.long	870                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	216                             ## DW_AT_decl_line
	.long	2239                            ## DW_AT_type
	.byte	12                              ## Abbrev [12] 0x46c:0xf DW_TAG_variable
.set Lset51, Ldebug_loc3-Lsection_debug_loc ## DW_AT_location
	.long	Lset51
	.long	880                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	240                             ## DW_AT_decl_line
	.long	2254                            ## DW_AT_type
	.byte	12                              ## Abbrev [12] 0x47b:0xf DW_TAG_variable
.set Lset52, Ldebug_loc4-Lsection_debug_loc ## DW_AT_location
	.long	Lset52
	.long	892                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	241                             ## DW_AT_decl_line
	.long	2269                            ## DW_AT_type
	.byte	13                              ## Abbrev [13] 0x48a:0x1d DW_TAG_lexical_block
	.quad	Ltmp146                         ## DW_AT_low_pc
.set Lset53, Ltmp152-Ltmp146            ## DW_AT_high_pc
	.long	Lset53
	.byte	9                               ## Abbrev [9] 0x497:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\264\177"
	.long	657                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	219                             ## DW_AT_decl_line
	.long	100                             ## DW_AT_type
	.byte	0                               ## End Of Children Mark
	.byte	13                              ## Abbrev [13] 0x4a7:0x1d DW_TAG_lexical_block
	.quad	Ltmp153                         ## DW_AT_low_pc
.set Lset54, Ltmp159-Ltmp153            ## DW_AT_high_pc
	.long	Lset54
	.byte	9                               ## Abbrev [9] 0x4b4:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\244\177"
	.long	657                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	226                             ## DW_AT_decl_line
	.long	100                             ## DW_AT_type
	.byte	0                               ## End Of Children Mark
	.byte	13                              ## Abbrev [13] 0x4c4:0x3a DW_TAG_lexical_block
	.quad	Ltmp159                         ## DW_AT_low_pc
.set Lset55, Ltmp173-Ltmp159            ## DW_AT_high_pc
	.long	Lset55
	.byte	9                               ## Abbrev [9] 0x4d1:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\240\177"
	.long	657                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	231                             ## DW_AT_decl_line
	.long	100                             ## DW_AT_type
	.byte	13                              ## Abbrev [13] 0x4e0:0x1d DW_TAG_lexical_block
	.quad	Ltmp163                         ## DW_AT_low_pc
.set Lset56, Ltmp172-Ltmp163            ## DW_AT_high_pc
	.long	Lset56
	.byte	9                               ## Abbrev [9] 0x4ed:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\230\177"
	.long	807                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	232                             ## DW_AT_decl_line
	.long	2154                            ## DW_AT_type
	.byte	0                               ## End Of Children Mark
	.byte	0                               ## End Of Children Mark
	.byte	13                              ## Abbrev [13] 0x4fe:0x3a DW_TAG_lexical_block
	.quad	Ltmp178                         ## DW_AT_low_pc
.set Lset57, Ltmp195-Ltmp178            ## DW_AT_high_pc
	.long	Lset57
	.byte	9                               ## Abbrev [9] 0x50b:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\374~"
	.long	657                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	244                             ## DW_AT_decl_line
	.long	100                             ## DW_AT_type
	.byte	13                              ## Abbrev [13] 0x51a:0x1d DW_TAG_lexical_block
	.quad	Ltmp182                         ## DW_AT_low_pc
.set Lset58, Ltmp194-Ltmp182            ## DW_AT_high_pc
	.long	Lset58
	.byte	9                               ## Abbrev [9] 0x527:0xf DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\360~"
	.long	807                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.byte	246                             ## DW_AT_decl_line
	.long	2154                            ## DW_AT_type
	.byte	0                               ## End Of Children Mark
	.byte	0                               ## End Of Children Mark
	.byte	13                              ## Abbrev [13] 0x538:0x1e DW_TAG_lexical_block
	.quad	Ltmp196                         ## DW_AT_low_pc
.set Lset59, Ltmp207-Ltmp196            ## DW_AT_high_pc
	.long	Lset59
	.byte	14                              ## Abbrev [14] 0x545:0x10 DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\334~"
	.long	657                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	263                             ## DW_AT_decl_line
	.long	100                             ## DW_AT_type
	.byte	0                               ## End Of Children Mark
	.byte	13                              ## Abbrev [13] 0x556:0x1e DW_TAG_lexical_block
	.quad	Ltmp208                         ## DW_AT_low_pc
.set Lset60, Ltmp213-Ltmp208            ## DW_AT_high_pc
	.long	Lset60
	.byte	14                              ## Abbrev [14] 0x563:0x10 DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\330~"
	.long	657                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	273                             ## DW_AT_decl_line
	.long	100                             ## DW_AT_type
	.byte	0                               ## End Of Children Mark
	.byte	13                              ## Abbrev [13] 0x574:0x3c DW_TAG_lexical_block
	.quad	Ltmp214                         ## DW_AT_low_pc
.set Lset61, Ltmp228-Ltmp214            ## DW_AT_high_pc
	.long	Lset61
	.byte	14                              ## Abbrev [14] 0x581:0x10 DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\304~"
	.long	657                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	280                             ## DW_AT_decl_line
	.long	100                             ## DW_AT_type
	.byte	13                              ## Abbrev [13] 0x591:0x1e DW_TAG_lexical_block
	.quad	Ltmp221                         ## DW_AT_low_pc
.set Lset62, Ltmp226-Ltmp221            ## DW_AT_high_pc
	.long	Lset62
	.byte	14                              ## Abbrev [14] 0x59e:0x10 DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\270~"
	.long	681                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	288                             ## DW_AT_decl_line
	.long	2108                            ## DW_AT_type
	.byte	0                               ## End Of Children Mark
	.byte	0                               ## End Of Children Mark
	.byte	0                               ## End Of Children Mark
	.byte	15                              ## Abbrev [15] 0x5b1:0x118 DW_TAG_subprogram
	.quad	Lfunc_begin3                    ## DW_AT_low_pc
.set Lset63, Lfunc_end3-Lfunc_begin3    ## DW_AT_high_pc
	.long	Lset63
	.byte	1                               ## DW_AT_frame_base
	.byte	86
	.long	263                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	299                             ## DW_AT_decl_line
                                        ## DW_AT_prototyped
                                        ## DW_AT_external
	.byte	16                              ## Abbrev [16] 0x5c7:0xf DW_TAG_formal_parameter
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	120
	.long	909                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	299                             ## DW_AT_decl_line
	.long	2154                            ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x5d6:0xf DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	118
	.long	920                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	300                             ## DW_AT_decl_line
	.long	2284                            ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x5e5:0xf DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	104
	.long	697                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	301                             ## DW_AT_decl_line
	.long	2154                            ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x5f4:0xf DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	96
	.long	926                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	302                             ## DW_AT_decl_line
	.long	2154                            ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x603:0xf DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	95
	.long	930                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	306                             ## DW_AT_decl_line
	.long	2159                            ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x612:0xf DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	88
	.long	935                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	308                             ## DW_AT_decl_line
	.long	2296                            ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x621:0xf DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	80
	.long	948                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	317                             ## DW_AT_decl_line
	.long	2103                            ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x630:0xf DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	72
	.long	958                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	318                             ## DW_AT_decl_line
	.long	2103                            ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x63f:0xf DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	64
	.long	968                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	319                             ## DW_AT_decl_line
	.long	1976                            ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x64e:0x10 DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.long	976                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	320                             ## DW_AT_decl_line
	.long	1976                            ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x65e:0x10 DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.long	984                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	321                             ## DW_AT_decl_line
	.long	1976                            ## DW_AT_type
	.byte	13                              ## Abbrev [13] 0x66e:0x1e DW_TAG_lexical_block
	.quad	Ltmp235                         ## DW_AT_low_pc
.set Lset64, Ltmp240-Ltmp235            ## DW_AT_high_pc
	.long	Lset64
	.byte	14                              ## Abbrev [14] 0x67b:0x10 DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\254\177"
	.long	657                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	331                             ## DW_AT_decl_line
	.long	89                              ## DW_AT_type
	.byte	0                               ## End Of Children Mark
	.byte	13                              ## Abbrev [13] 0x68c:0x1e DW_TAG_lexical_block
	.quad	Ltmp240                         ## DW_AT_low_pc
.set Lset65, Ltmp245-Ltmp240            ## DW_AT_high_pc
	.long	Lset65
	.byte	14                              ## Abbrev [14] 0x699:0x10 DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.long	657                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	335                             ## DW_AT_decl_line
	.long	89                              ## DW_AT_type
	.byte	0                               ## End Of Children Mark
	.byte	13                              ## Abbrev [13] 0x6aa:0x1e DW_TAG_lexical_block
	.quad	Ltmp245                         ## DW_AT_low_pc
.set Lset66, Ltmp250-Ltmp245            ## DW_AT_high_pc
	.long	Lset66
	.byte	14                              ## Abbrev [14] 0x6b7:0x10 DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\244\177"
	.long	657                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	340                             ## DW_AT_decl_line
	.long	89                              ## DW_AT_type
	.byte	0                               ## End Of Children Mark
	.byte	0                               ## End Of Children Mark
	.byte	17                              ## Abbrev [17] 0x6c9:0xef DW_TAG_subprogram
	.quad	Lfunc_begin4                    ## DW_AT_low_pc
.set Lset67, Lfunc_end4-Lfunc_begin4    ## DW_AT_high_pc
	.long	Lset67
	.byte	1                               ## DW_AT_frame_base
	.byte	86
	.long	281                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	349                             ## DW_AT_decl_line
	.long	100                             ## DW_AT_type
                                        ## DW_AT_external
	.byte	14                              ## Abbrev [14] 0x6e3:0xf DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	112
	.long	994                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	350                             ## DW_AT_decl_line
	.long	2108                            ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x6f2:0xf DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	104
	.long	1014                            ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	350                             ## DW_AT_decl_line
	.long	2108                            ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x701:0xf DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	96
	.long	412                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	351                             ## DW_AT_decl_line
	.long	2149                            ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x710:0xf DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	88
	.long	1029                            ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	353                             ## DW_AT_decl_line
	.long	2307                            ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x71f:0xf DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	84
	.long	657                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	360                             ## DW_AT_decl_line
	.long	89                              ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x72e:0xf DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	80
	.long	459                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	372                             ## DW_AT_decl_line
	.long	89                              ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x73d:0xf DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	72
	.long	423                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	375                             ## DW_AT_decl_line
	.long	2149                            ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x74c:0xf DW_TAG_variable
	.byte	2                               ## DW_AT_location
	.byte	145
	.byte	64
	.long	437                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	376                             ## DW_AT_decl_line
	.long	2149                            ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x75b:0x10 DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.long	444                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	377                             ## DW_AT_decl_line
	.long	2154                            ## DW_AT_type
	.byte	14                              ## Abbrev [14] 0x76b:0x10 DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.long	451                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	384                             ## DW_AT_decl_line
	.long	2103                            ## DW_AT_type
	.byte	13                              ## Abbrev [13] 0x77b:0x1e DW_TAG_lexical_block
	.quad	Ltmp262                         ## DW_AT_low_pc
.set Lset68, Ltmp267-Ltmp262            ## DW_AT_high_pc
	.long	Lset68
	.byte	14                              ## Abbrev [14] 0x788:0x10 DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\264\177"
	.long	681                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	380                             ## DW_AT_decl_line
	.long	89                              ## DW_AT_type
	.byte	0                               ## End Of Children Mark
	.byte	13                              ## Abbrev [13] 0x799:0x1e DW_TAG_lexical_block
	.quad	Ltmp268                         ## DW_AT_low_pc
.set Lset69, Ltmp273-Ltmp268            ## DW_AT_high_pc
	.long	Lset69
	.byte	14                              ## Abbrev [14] 0x7a6:0x10 DW_TAG_variable
	.byte	3                               ## DW_AT_location
	.byte	145
	.ascii	"\244\177"
	.long	681                             ## DW_AT_name
	.byte	3                               ## DW_AT_decl_file
	.short	389                             ## DW_AT_decl_line
	.long	89                              ## DW_AT_type
	.byte	0                               ## End Of Children Mark
	.byte	0                               ## End Of Children Mark
	.byte	18                              ## Abbrev [18] 0x7b8:0x5 DW_TAG_pointer_type
	.long	1981                            ## DW_AT_type
	.byte	18                              ## Abbrev [18] 0x7bd:0x5 DW_TAG_pointer_type
	.long	1986                            ## DW_AT_type
	.byte	6                               ## Abbrev [6] 0x7c2:0xb DW_TAG_typedef
	.long	1997                            ## DW_AT_type
	.long	286                             ## DW_AT_name
	.byte	1                               ## DW_AT_decl_file
	.byte	27                              ## DW_AT_decl_line
	.byte	19                              ## Abbrev [19] 0x7cd:0x21 DW_TAG_structure_type
	.long	291                             ## DW_AT_name
	.byte	16                              ## DW_AT_byte_size
	.byte	1                               ## DW_AT_decl_file
	.byte	24                              ## DW_AT_decl_line
	.byte	20                              ## Abbrev [20] 0x7d5:0xc DW_TAG_member
	.long	296                             ## DW_AT_name
	.long	2030                            ## DW_AT_type
	.byte	1                               ## DW_AT_decl_file
	.byte	25                              ## DW_AT_decl_line
	.byte	0                               ## DW_AT_data_member_location
	.byte	20                              ## Abbrev [20] 0x7e1:0xc DW_TAG_member
	.long	400                             ## DW_AT_name
	.long	2142                            ## DW_AT_type
	.byte	1                               ## DW_AT_decl_file
	.byte	26                              ## DW_AT_decl_line
	.byte	8                               ## DW_AT_data_member_location
	.byte	0                               ## End Of Children Mark
	.byte	18                              ## Abbrev [18] 0x7ee:0x5 DW_TAG_pointer_type
	.long	2035                            ## DW_AT_type
	.byte	6                               ## Abbrev [6] 0x7f3:0xb DW_TAG_typedef
	.long	2046                            ## DW_AT_type
	.long	306                             ## DW_AT_name
	.byte	1                               ## DW_AT_decl_file
	.byte	15                              ## DW_AT_decl_line
	.byte	19                              ## Abbrev [19] 0x7fe:0x39 DW_TAG_structure_type
	.long	310                             ## DW_AT_name
	.byte	32                              ## DW_AT_byte_size
	.byte	1                               ## DW_AT_decl_file
	.byte	10                              ## DW_AT_decl_line
	.byte	20                              ## Abbrev [20] 0x806:0xc DW_TAG_member
	.long	319                             ## DW_AT_name
	.long	2103                            ## DW_AT_type
	.byte	1                               ## DW_AT_decl_file
	.byte	11                              ## DW_AT_decl_line
	.byte	0                               ## DW_AT_data_member_location
	.byte	20                              ## Abbrev [20] 0x812:0xc DW_TAG_member
	.long	325                             ## DW_AT_name
	.long	2108                            ## DW_AT_type
	.byte	1                               ## DW_AT_decl_file
	.byte	12                              ## DW_AT_decl_line
	.byte	8                               ## DW_AT_data_member_location
	.byte	20                              ## Abbrev [20] 0x81e:0xc DW_TAG_member
	.long	371                             ## DW_AT_name
	.long	2137                            ## DW_AT_type
	.byte	1                               ## DW_AT_decl_file
	.byte	13                              ## DW_AT_decl_line
	.byte	16                              ## DW_AT_data_member_location
	.byte	20                              ## Abbrev [20] 0x82a:0xc DW_TAG_member
	.long	389                             ## DW_AT_name
	.long	2137                            ## DW_AT_type
	.byte	1                               ## DW_AT_decl_file
	.byte	14                              ## DW_AT_decl_line
	.byte	24                              ## DW_AT_data_member_location
	.byte	0                               ## End Of Children Mark
	.byte	18                              ## Abbrev [18] 0x837:0x5 DW_TAG_pointer_type
	.long	89                              ## DW_AT_type
	.byte	6                               ## Abbrev [6] 0x83c:0xb DW_TAG_typedef
	.long	2119                            ## DW_AT_type
	.long	330                             ## DW_AT_name
	.byte	5                               ## DW_AT_decl_file
	.byte	31                              ## DW_AT_decl_line
	.byte	6                               ## Abbrev [6] 0x847:0xb DW_TAG_typedef
	.long	2130                            ## DW_AT_type
	.long	337                             ## DW_AT_name
	.byte	4                               ## DW_AT_decl_file
	.byte	94                              ## DW_AT_decl_line
	.byte	4                               ## Abbrev [4] 0x852:0x7 DW_TAG_base_type
	.long	353                             ## DW_AT_name
	.byte	7                               ## DW_AT_encoding
	.byte	8                               ## DW_AT_byte_size
	.byte	18                              ## Abbrev [18] 0x859:0x5 DW_TAG_pointer_type
	.long	2142                            ## DW_AT_type
	.byte	4                               ## Abbrev [4] 0x85e:0x7 DW_TAG_base_type
	.long	382                             ## DW_AT_name
	.byte	4                               ## DW_AT_encoding
	.byte	8                               ## DW_AT_byte_size
	.byte	18                              ## Abbrev [18] 0x865:0x5 DW_TAG_pointer_type
	.long	2154                            ## DW_AT_type
	.byte	18                              ## Abbrev [18] 0x86a:0x5 DW_TAG_pointer_type
	.long	2159                            ## DW_AT_type
	.byte	4                               ## Abbrev [4] 0x86f:0x7 DW_TAG_base_type
	.long	418                             ## DW_AT_name
	.byte	6                               ## DW_AT_encoding
	.byte	1                               ## DW_AT_byte_size
	.byte	21                              ## Abbrev [21] 0x876:0xc DW_TAG_array_type
	.long	2159                            ## DW_AT_type
	.byte	22                              ## Abbrev [22] 0x87b:0x6 DW_TAG_subrange_type
	.long	2178                            ## DW_AT_type
	.byte	2                               ## DW_AT_count
	.byte	0                               ## End Of Children Mark
	.byte	23                              ## Abbrev [23] 0x882:0x7 DW_TAG_base_type
	.long	565                             ## DW_AT_name
	.byte	8                               ## DW_AT_byte_size
	.byte	7                               ## DW_AT_encoding
	.byte	21                              ## Abbrev [21] 0x889:0xc DW_TAG_array_type
	.long	2197                            ## DW_AT_type
	.byte	22                              ## Abbrev [22] 0x88e:0x6 DW_TAG_subrange_type
	.long	2178                            ## DW_AT_type
	.byte	3                               ## DW_AT_count
	.byte	0                               ## End Of Children Mark
	.byte	24                              ## Abbrev [24] 0x895:0x5 DW_TAG_const_type
	.long	2159                            ## DW_AT_type
	.byte	21                              ## Abbrev [21] 0x89a:0xf DW_TAG_array_type
	.long	89                              ## DW_AT_type
	.byte	25                              ## Abbrev [25] 0x89f:0x9 DW_TAG_subrange_type
	.long	2178                            ## DW_AT_type
	.long	422                             ## DW_AT_count
	.byte	0                               ## End Of Children Mark
	.byte	21                              ## Abbrev [21] 0x8a9:0xf DW_TAG_array_type
	.long	89                              ## DW_AT_type
	.byte	25                              ## Abbrev [25] 0x8ae:0x9 DW_TAG_subrange_type
	.long	2178                            ## DW_AT_type
	.long	435                             ## DW_AT_count
	.byte	0                               ## End Of Children Mark
	.byte	4                               ## Abbrev [4] 0x8b8:0x7 DW_TAG_base_type
	.long	722                             ## DW_AT_name
	.byte	2                               ## DW_AT_encoding
	.byte	1                               ## DW_AT_byte_size
	.byte	21                              ## Abbrev [21] 0x8bf:0xf DW_TAG_array_type
	.long	2154                            ## DW_AT_type
	.byte	25                              ## Abbrev [25] 0x8c4:0x9 DW_TAG_subrange_type
	.long	2178                            ## DW_AT_type
	.long	954                             ## DW_AT_count
	.byte	0                               ## End Of Children Mark
	.byte	21                              ## Abbrev [21] 0x8ce:0xf DW_TAG_array_type
	.long	100                             ## DW_AT_type
	.byte	25                              ## Abbrev [25] 0x8d3:0x9 DW_TAG_subrange_type
	.long	2178                            ## DW_AT_type
	.long	997                             ## DW_AT_count
	.byte	0                               ## End Of Children Mark
	.byte	21                              ## Abbrev [21] 0x8dd:0xf DW_TAG_array_type
	.long	2154                            ## DW_AT_type
	.byte	25                              ## Abbrev [25] 0x8e2:0x9 DW_TAG_subrange_type
	.long	2178                            ## DW_AT_type
	.long	1010                            ## DW_AT_count
	.byte	0                               ## End Of Children Mark
	.byte	21                              ## Abbrev [21] 0x8ec:0xc DW_TAG_array_type
	.long	2197                            ## DW_AT_type
	.byte	22                              ## Abbrev [22] 0x8f1:0x6 DW_TAG_subrange_type
	.long	2178                            ## DW_AT_type
	.byte	2                               ## DW_AT_count
	.byte	0                               ## End Of Children Mark
	.byte	6                               ## Abbrev [6] 0x8f8:0xb DW_TAG_typedef
	.long	50                              ## DW_AT_type
	.long	941                             ## DW_AT_name
	.byte	1                               ## DW_AT_decl_file
	.byte	46                              ## DW_AT_decl_line
	.byte	18                              ## Abbrev [18] 0x903:0x5 DW_TAG_pointer_type
	.long	2312                            ## DW_AT_type
	.byte	6                               ## Abbrev [6] 0x908:0xb DW_TAG_typedef
	.long	2323                            ## DW_AT_type
	.long	1032                            ## DW_AT_name
	.byte	6                               ## DW_AT_decl_file
	.byte	157                             ## DW_AT_decl_line
	.byte	19                              ## Abbrev [19] 0x913:0xf9 DW_TAG_structure_type
	.long	1037                            ## DW_AT_name
	.byte	152                             ## DW_AT_byte_size
	.byte	6                               ## DW_AT_decl_file
	.byte	126                             ## DW_AT_decl_line
	.byte	20                              ## Abbrev [20] 0x91b:0xc DW_TAG_member
	.long	1045                            ## DW_AT_name
	.long	2572                            ## DW_AT_type
	.byte	6                               ## DW_AT_decl_file
	.byte	127                             ## DW_AT_decl_line
	.byte	0                               ## DW_AT_data_member_location
	.byte	20                              ## Abbrev [20] 0x927:0xc DW_TAG_member
	.long	1062                            ## DW_AT_name
	.long	100                             ## DW_AT_type
	.byte	6                               ## DW_AT_decl_file
	.byte	128                             ## DW_AT_decl_line
	.byte	8                               ## DW_AT_data_member_location
	.byte	20                              ## Abbrev [20] 0x933:0xc DW_TAG_member
	.long	1065                            ## DW_AT_name
	.long	100                             ## DW_AT_type
	.byte	6                               ## DW_AT_decl_file
	.byte	129                             ## DW_AT_decl_line
	.byte	12                              ## DW_AT_data_member_location
	.byte	20                              ## Abbrev [20] 0x93f:0xc DW_TAG_member
	.long	1068                            ## DW_AT_name
	.long	2584                            ## DW_AT_type
	.byte	6                               ## DW_AT_decl_file
	.byte	130                             ## DW_AT_decl_line
	.byte	16                              ## DW_AT_data_member_location
	.byte	20                              ## Abbrev [20] 0x94b:0xc DW_TAG_member
	.long	1081                            ## DW_AT_name
	.long	2584                            ## DW_AT_type
	.byte	6                               ## DW_AT_decl_file
	.byte	131                             ## DW_AT_decl_line
	.byte	18                              ## DW_AT_data_member_location
	.byte	20                              ## Abbrev [20] 0x957:0xc DW_TAG_member
	.long	1087                            ## DW_AT_name
	.long	2591                            ## DW_AT_type
	.byte	6                               ## DW_AT_decl_file
	.byte	132                             ## DW_AT_decl_line
	.byte	24                              ## DW_AT_data_member_location
	.byte	20                              ## Abbrev [20] 0x963:0xc DW_TAG_member
	.long	1110                            ## DW_AT_name
	.long	100                             ## DW_AT_type
	.byte	6                               ## DW_AT_decl_file
	.byte	133                             ## DW_AT_decl_line
	.byte	40                              ## DW_AT_data_member_location
	.byte	20                              ## Abbrev [20] 0x96f:0xc DW_TAG_member
	.long	1119                            ## DW_AT_name
	.long	88                              ## DW_AT_type
	.byte	6                               ## DW_AT_decl_file
	.byte	136                             ## DW_AT_decl_line
	.byte	48                              ## DW_AT_data_member_location
	.byte	20                              ## Abbrev [20] 0x97b:0xc DW_TAG_member
	.long	1127                            ## DW_AT_name
	.long	2624                            ## DW_AT_type
	.byte	6                               ## DW_AT_decl_file
	.byte	137                             ## DW_AT_decl_line
	.byte	56                              ## DW_AT_data_member_location
	.byte	20                              ## Abbrev [20] 0x987:0xc DW_TAG_member
	.long	1134                            ## DW_AT_name
	.long	2640                            ## DW_AT_type
	.byte	6                               ## DW_AT_decl_file
	.byte	138                             ## DW_AT_decl_line
	.byte	64                              ## DW_AT_data_member_location
	.byte	20                              ## Abbrev [20] 0x993:0xc DW_TAG_member
	.long	1140                            ## DW_AT_name
	.long	2666                            ## DW_AT_type
	.byte	6                               ## DW_AT_decl_file
	.byte	139                             ## DW_AT_decl_line
	.byte	72                              ## DW_AT_data_member_location
	.byte	20                              ## Abbrev [20] 0x99f:0xc DW_TAG_member
	.long	1192                            ## DW_AT_name
	.long	2732                            ## DW_AT_type
	.byte	6                               ## DW_AT_decl_file
	.byte	140                             ## DW_AT_decl_line
	.byte	80                              ## DW_AT_data_member_location
	.byte	20                              ## Abbrev [20] 0x9ab:0xc DW_TAG_member
	.long	1199                            ## DW_AT_name
	.long	2591                            ## DW_AT_type
	.byte	6                               ## DW_AT_decl_file
	.byte	143                             ## DW_AT_decl_line
	.byte	88                              ## DW_AT_data_member_location
	.byte	20                              ## Abbrev [20] 0x9b7:0xc DW_TAG_member
	.long	1203                            ## DW_AT_name
	.long	2763                            ## DW_AT_type
	.byte	6                               ## DW_AT_decl_file
	.byte	144                             ## DW_AT_decl_line
	.byte	104                             ## DW_AT_data_member_location
	.byte	20                              ## Abbrev [20] 0x9c3:0xc DW_TAG_member
	.long	1219                            ## DW_AT_name
	.long	100                             ## DW_AT_type
	.byte	6                               ## DW_AT_decl_file
	.byte	145                             ## DW_AT_decl_line
	.byte	112                             ## DW_AT_data_member_location
	.byte	20                              ## Abbrev [20] 0x9cf:0xc DW_TAG_member
	.long	1223                            ## DW_AT_name
	.long	2773                            ## DW_AT_type
	.byte	6                               ## DW_AT_decl_file
	.byte	148                             ## DW_AT_decl_line
	.byte	116                             ## DW_AT_data_member_location
	.byte	20                              ## Abbrev [20] 0x9db:0xc DW_TAG_member
	.long	1229                            ## DW_AT_name
	.long	2785                            ## DW_AT_type
	.byte	6                               ## DW_AT_decl_file
	.byte	149                             ## DW_AT_decl_line
	.byte	119                             ## DW_AT_data_member_location
	.byte	20                              ## Abbrev [20] 0x9e7:0xc DW_TAG_member
	.long	1235                            ## DW_AT_name
	.long	2591                            ## DW_AT_type
	.byte	6                               ## DW_AT_decl_file
	.byte	152                             ## DW_AT_decl_line
	.byte	120                             ## DW_AT_data_member_location
	.byte	20                              ## Abbrev [20] 0x9f3:0xc DW_TAG_member
	.long	1239                            ## DW_AT_name
	.long	100                             ## DW_AT_type
	.byte	6                               ## DW_AT_decl_file
	.byte	155                             ## DW_AT_decl_line
	.byte	136                             ## DW_AT_data_member_location
	.byte	20                              ## Abbrev [20] 0x9ff:0xc DW_TAG_member
	.long	1248                            ## DW_AT_name
	.long	2692                            ## DW_AT_type
	.byte	6                               ## DW_AT_decl_file
	.byte	156                             ## DW_AT_decl_line
	.byte	144                             ## DW_AT_data_member_location
	.byte	0                               ## End Of Children Mark
	.byte	18                              ## Abbrev [18] 0xa0c:0x5 DW_TAG_pointer_type
	.long	2577                            ## DW_AT_type
	.byte	4                               ## Abbrev [4] 0xa11:0x7 DW_TAG_base_type
	.long	1048                            ## DW_AT_name
	.byte	8                               ## DW_AT_encoding
	.byte	1                               ## DW_AT_byte_size
	.byte	4                               ## Abbrev [4] 0xa18:0x7 DW_TAG_base_type
	.long	1075                            ## DW_AT_name
	.byte	5                               ## DW_AT_encoding
	.byte	2                               ## DW_AT_byte_size
	.byte	19                              ## Abbrev [19] 0xa1f:0x21 DW_TAG_structure_type
	.long	1091                            ## DW_AT_name
	.byte	16                              ## DW_AT_byte_size
	.byte	6                               ## DW_AT_decl_file
	.byte	92                              ## DW_AT_decl_line
	.byte	20                              ## Abbrev [20] 0xa27:0xc DW_TAG_member
	.long	1098                            ## DW_AT_name
	.long	2572                            ## DW_AT_type
	.byte	6                               ## DW_AT_decl_file
	.byte	93                              ## DW_AT_decl_line
	.byte	0                               ## DW_AT_data_member_location
	.byte	20                              ## Abbrev [20] 0xa33:0xc DW_TAG_member
	.long	1104                            ## DW_AT_name
	.long	100                             ## DW_AT_type
	.byte	6                               ## DW_AT_decl_file
	.byte	94                              ## DW_AT_decl_line
	.byte	8                               ## DW_AT_data_member_location
	.byte	0                               ## End Of Children Mark
	.byte	18                              ## Abbrev [18] 0xa40:0x5 DW_TAG_pointer_type
	.long	2629                            ## DW_AT_type
	.byte	26                              ## Abbrev [26] 0xa45:0xb DW_TAG_subroutine_type
	.long	100                             ## DW_AT_type
                                        ## DW_AT_prototyped
	.byte	27                              ## Abbrev [27] 0xa4a:0x5 DW_TAG_formal_parameter
	.long	88                              ## DW_AT_type
	.byte	0                               ## End Of Children Mark
	.byte	18                              ## Abbrev [18] 0xa50:0x5 DW_TAG_pointer_type
	.long	2645                            ## DW_AT_type
	.byte	26                              ## Abbrev [26] 0xa55:0x15 DW_TAG_subroutine_type
	.long	100                             ## DW_AT_type
                                        ## DW_AT_prototyped
	.byte	27                              ## Abbrev [27] 0xa5a:0x5 DW_TAG_formal_parameter
	.long	88                              ## DW_AT_type
	.byte	27                              ## Abbrev [27] 0xa5f:0x5 DW_TAG_formal_parameter
	.long	2154                            ## DW_AT_type
	.byte	27                              ## Abbrev [27] 0xa64:0x5 DW_TAG_formal_parameter
	.long	100                             ## DW_AT_type
	.byte	0                               ## End Of Children Mark
	.byte	18                              ## Abbrev [18] 0xa6a:0x5 DW_TAG_pointer_type
	.long	2671                            ## DW_AT_type
	.byte	26                              ## Abbrev [26] 0xa6f:0x15 DW_TAG_subroutine_type
	.long	2692                            ## DW_AT_type
                                        ## DW_AT_prototyped
	.byte	27                              ## Abbrev [27] 0xa74:0x5 DW_TAG_formal_parameter
	.long	88                              ## DW_AT_type
	.byte	27                              ## Abbrev [27] 0xa79:0x5 DW_TAG_formal_parameter
	.long	2692                            ## DW_AT_type
	.byte	27                              ## Abbrev [27] 0xa7e:0x5 DW_TAG_formal_parameter
	.long	100                             ## DW_AT_type
	.byte	0                               ## End Of Children Mark
	.byte	6                               ## Abbrev [6] 0xa84:0xb DW_TAG_typedef
	.long	2703                            ## DW_AT_type
	.long	1146                            ## DW_AT_name
	.byte	6                               ## DW_AT_decl_file
	.byte	81                              ## DW_AT_decl_line
	.byte	6                               ## Abbrev [6] 0xa8f:0xb DW_TAG_typedef
	.long	2714                            ## DW_AT_type
	.long	1153                            ## DW_AT_name
	.byte	7                               ## DW_AT_decl_file
	.byte	71                              ## DW_AT_decl_line
	.byte	6                               ## Abbrev [6] 0xa9a:0xb DW_TAG_typedef
	.long	2725                            ## DW_AT_type
	.long	1168                            ## DW_AT_name
	.byte	4                               ## DW_AT_decl_file
	.byte	48                              ## DW_AT_decl_line
	.byte	4                               ## Abbrev [4] 0xaa5:0x7 DW_TAG_base_type
	.long	1178                            ## DW_AT_name
	.byte	5                               ## DW_AT_encoding
	.byte	8                               ## DW_AT_byte_size
	.byte	18                              ## Abbrev [18] 0xaac:0x5 DW_TAG_pointer_type
	.long	2737                            ## DW_AT_type
	.byte	26                              ## Abbrev [26] 0xab1:0x15 DW_TAG_subroutine_type
	.long	100                             ## DW_AT_type
                                        ## DW_AT_prototyped
	.byte	27                              ## Abbrev [27] 0xab6:0x5 DW_TAG_formal_parameter
	.long	88                              ## DW_AT_type
	.byte	27                              ## Abbrev [27] 0xabb:0x5 DW_TAG_formal_parameter
	.long	2758                            ## DW_AT_type
	.byte	27                              ## Abbrev [27] 0xac0:0x5 DW_TAG_formal_parameter
	.long	100                             ## DW_AT_type
	.byte	0                               ## End Of Children Mark
	.byte	18                              ## Abbrev [18] 0xac6:0x5 DW_TAG_pointer_type
	.long	2197                            ## DW_AT_type
	.byte	18                              ## Abbrev [18] 0xacb:0x5 DW_TAG_pointer_type
	.long	2768                            ## DW_AT_type
	.byte	28                              ## Abbrev [28] 0xad0:0x5 DW_TAG_structure_type
	.long	1210                            ## DW_AT_name
                                        ## DW_AT_declaration
	.byte	21                              ## Abbrev [21] 0xad5:0xc DW_TAG_array_type
	.long	2577                            ## DW_AT_type
	.byte	22                              ## Abbrev [22] 0xada:0x6 DW_TAG_subrange_type
	.long	2178                            ## DW_AT_type
	.byte	3                               ## DW_AT_count
	.byte	0                               ## End Of Children Mark
	.byte	21                              ## Abbrev [21] 0xae1:0xc DW_TAG_array_type
	.long	2577                            ## DW_AT_type
	.byte	22                              ## Abbrev [22] 0xae6:0x6 DW_TAG_subrange_type
	.long	2178                            ## DW_AT_type
	.byte	1                               ## DW_AT_count
	.byte	0                               ## End Of Children Mark
	.byte	0                               ## End Of Children Mark
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"Apple clang version 13.0.0 (clang-1300.0.29.30)" ## string offset=0
	.asciz	"parser.c"                      ## string offset=48
	.asciz	"/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk" ## string offset=57
	.asciz	"MacOSX.sdk"                    ## string offset=109
	.asciz	"/Users/dk/Desktop/6679"        ## string offset=120
	.asciz	"constraintSense"               ## string offset=143
	.asciz	"unsigned int"                  ## string offset=159
	.asciz	"GREATER"                       ## string offset=172
	.asciz	"LESSER"                        ## string offset=180
	.asciz	"EQUAL"                         ## string offset=187
	.asciz	"int32_t"                       ## string offset=193
	.asciz	"int"                           ## string offset=201
	.asciz	"parseFile"                     ## string offset=205
	.asciz	"convertStringToTerm"           ## string offset=215
	.asciz	"processEachSideOfConstraint"   ## string offset=235
	.asciz	"processConstraint"             ## string offset=263
	.asciz	"main"                          ## string offset=281
	.asciz	"Term"                          ## string offset=286
	.asciz	"term"                          ## string offset=291
	.asciz	"variables"                     ## string offset=296
	.asciz	"Var"                           ## string offset=306
	.asciz	"variable"                      ## string offset=310
	.asciz	"index"                         ## string offset=319
	.asciz	"size"                          ## string offset=325
	.asciz	"size_t"                        ## string offset=330
	.asciz	"__darwin_size_t"               ## string offset=337
	.asciz	"long unsigned int"             ## string offset=353
	.asciz	"upperBound"                    ## string offset=371
	.asciz	"double"                        ## string offset=382
	.asciz	"lowerBound"                    ## string offset=389
	.asciz	"coefficient"                   ## string offset=400
	.asciz	"lines"                         ## string offset=412
	.asciz	"char"                          ## string offset=418
	.asciz	"combinedLines"                 ## string offset=423
	.asciz	"bounds"                        ## string offset=437
	.asciz	"binary"                        ## string offset=444
	.asciz	"details"                       ## string offset=451
	.asciz	"numberOfLines"                 ## string offset=459
	.asciz	"combinedLinesIndex"            ## string offset=473
	.asciz	"linesIndex"                    ## string offset=492
	.asciz	"numberOfBounds"                ## string offset=503
	.asciz	"termString"                    ## string offset=518
	.asciz	"multiplier"                    ## string offset=529
	.asciz	"termStringCopy"                ## string offset=540
	.asciz	"end"                           ## string offset=555
	.asciz	"space"                         ## string offset=559
	.asciz	"__ARRAY_SIZE_TYPE__"           ## string offset=565
	.asciz	"termTokens"                    ## string offset=585
	.asciz	"__vla_expr0"                   ## string offset=596
	.asciz	"__vla_expr1"                   ## string offset=608
	.asciz	"carat"                         ## string offset=620
	.asciz	"counter"                       ## string offset=626
	.asciz	"caratPos"                      ## string offset=634
	.asciz	"base"                          ## string offset=643
	.asciz	"exponent"                      ## string offset=648
	.asciz	"i"                             ## string offset=657
	.asciz	"degreeOfTerm"                  ## string offset=659
	.asciz	"varsList"                      ## string offset=672
	.asciz	"j"                             ## string offset=681
	.asciz	"k"                             ## string offset=683
	.asciz	"terms"                         ## string offset=685
	.asciz	"power"                         ## string offset=691
	.asciz	"lhs"                           ## string offset=697
	.asciz	"numberOfTokens"                ## string offset=701
	.asciz	"isLhs"                         ## string offset=716
	.asciz	"_Bool"                         ## string offset=722
	.asciz	"plus"                          ## string offset=728
	.asciz	"minus"                         ## string offset=733
	.asciz	"lhsCopy"                       ## string offset=739
	.asciz	"lhsSubtokens"                  ## string offset=747
	.asciz	"countSubtokens"                ## string offset=760
	.asciz	"countSubSubTokens"             ## string offset=775
	.asciz	"copySubTokens"                 ## string offset=793
	.asciz	"subsubTokens"                  ## string offset=807
	.asciz	"__vla_expr2"                   ## string offset=820
	.asciz	"countZeroTerms"                ## string offset=832
	.asciz	"pos"                           ## string offset=847
	.asciz	"termsWithoutZeroes"            ## string offset=851
	.asciz	"subTokens"                     ## string offset=870
	.asciz	"multipliers"                   ## string offset=880
	.asciz	"subsubTokensList"              ## string offset=892
	.asciz	"constraint"                    ## string offset=909
	.asciz	"delim"                         ## string offset=920
	.asciz	"rhs"                           ## string offset=926
	.asciz	"sign"                          ## string offset=930
	.asciz	"sense"                         ## string offset=935
	.asciz	"cSense"                        ## string offset=941
	.asciz	"lhsTokens"                     ## string offset=948
	.asciz	"rhsTokens"                     ## string offset=958
	.asciz	"lTokens"                       ## string offset=968
	.asciz	"rTokens"                       ## string offset=976
	.asciz	"allTokens"                     ## string offset=984
	.asciz	"MAX_NUMBER_OF_LINES"           ## string offset=994
	.asciz	"MAX_LINE_WIDTH"                ## string offset=1014
	.asciz	"fp"                            ## string offset=1029
	.asciz	"FILE"                          ## string offset=1032
	.asciz	"__sFILE"                       ## string offset=1037
	.asciz	"_p"                            ## string offset=1045
	.asciz	"unsigned char"                 ## string offset=1048
	.asciz	"_r"                            ## string offset=1062
	.asciz	"_w"                            ## string offset=1065
	.asciz	"_flags"                        ## string offset=1068
	.asciz	"short"                         ## string offset=1075
	.asciz	"_file"                         ## string offset=1081
	.asciz	"_bf"                           ## string offset=1087
	.asciz	"__sbuf"                        ## string offset=1091
	.asciz	"_base"                         ## string offset=1098
	.asciz	"_size"                         ## string offset=1104
	.asciz	"_lbfsize"                      ## string offset=1110
	.asciz	"_cookie"                       ## string offset=1119
	.asciz	"_close"                        ## string offset=1127
	.asciz	"_read"                         ## string offset=1134
	.asciz	"_seek"                         ## string offset=1140
	.asciz	"fpos_t"                        ## string offset=1146
	.asciz	"__darwin_off_t"                ## string offset=1153
	.asciz	"__int64_t"                     ## string offset=1168
	.asciz	"long long int"                 ## string offset=1178
	.asciz	"_write"                        ## string offset=1192
	.asciz	"_ub"                           ## string offset=1199
	.asciz	"_extra"                        ## string offset=1203
	.asciz	"__sFILEX"                      ## string offset=1210
	.asciz	"_ur"                           ## string offset=1219
	.asciz	"_ubuf"                         ## string offset=1223
	.asciz	"_nbuf"                         ## string offset=1229
	.asciz	"_lb"                           ## string offset=1235
	.asciz	"_blksize"                      ## string offset=1239
	.asciz	"_offset"                       ## string offset=1248
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712                      ## Header Magic
	.short	1                               ## Header Version
	.short	0                               ## Header Hash Function
	.long	5                               ## Header Bucket Count
	.long	5                               ## Header Hash Count
	.long	12                              ## Header Data Length
	.long	0                               ## HeaderData Die Offset Base
	.long	1                               ## HeaderData Atom Count
	.short	1                               ## DW_ATOM_die_offset
	.short	6                               ## DW_FORM_data4
	.long	-1                              ## Bucket 0
	.long	0                               ## Bucket 1
	.long	-1                              ## Bucket 2
	.long	1                               ## Bucket 3
	.long	-1                              ## Bucket 4
	.long	2090499946                      ## Hash in Bucket 1
	.long	2083592568                      ## Hash in Bucket 3
	.long	-1921682828                     ## Hash in Bucket 3
	.long	-931410688                      ## Hash in Bucket 3
	.long	-758699063                      ## Hash in Bucket 3
.set Lset70, LNames2-Lnames_begin       ## Offset in Bucket 1
	.long	Lset70
.set Lset71, LNames0-Lnames_begin       ## Offset in Bucket 3
	.long	Lset71
.set Lset72, LNames4-Lnames_begin       ## Offset in Bucket 3
	.long	Lset72
.set Lset73, LNames3-Lnames_begin       ## Offset in Bucket 3
	.long	Lset73
.set Lset74, LNames1-Lnames_begin       ## Offset in Bucket 3
	.long	Lset74
LNames2:
	.long	281                             ## main
	.long	1                               ## Num DIEs
	.long	1737
	.long	0
LNames0:
	.long	215                             ## convertStringToTerm
	.long	1                               ## Num DIEs
	.long	273
	.long	0
LNames4:
	.long	235                             ## processEachSideOfConstraint
	.long	1                               ## Num DIEs
	.long	817
	.long	0
LNames3:
	.long	205                             ## parseFile
	.long	1                               ## Num DIEs
	.long	107
	.long	0
LNames1:
	.long	263                             ## processConstraint
	.long	1                               ## Num DIEs
	.long	1457
	.long	0
	.section	__DWARF,__apple_objc,regular,debug
Lobjc_begin:
	.long	1212240712                      ## Header Magic
	.short	1                               ## Header Version
	.short	0                               ## Header Hash Function
	.long	1                               ## Header Bucket Count
	.long	0                               ## Header Hash Count
	.long	12                              ## Header Data Length
	.long	0                               ## HeaderData Die Offset Base
	.long	1                               ## HeaderData Atom Count
	.short	1                               ## DW_ATOM_die_offset
	.short	6                               ## DW_FORM_data4
	.long	-1                              ## Bucket 0
	.section	__DWARF,__apple_namespac,regular,debug
Lnamespac_begin:
	.long	1212240712                      ## Header Magic
	.short	1                               ## Header Version
	.short	0                               ## Header Hash Function
	.long	1                               ## Header Bucket Count
	.long	0                               ## Header Hash Count
	.long	12                              ## Header Data Length
	.long	0                               ## HeaderData Die Offset Base
	.long	1                               ## HeaderData Atom Count
	.short	1                               ## DW_ATOM_die_offset
	.short	6                               ## DW_FORM_data4
	.long	-1                              ## Bucket 0
	.section	__DWARF,__apple_types,regular,debug
Ltypes_begin:
	.long	1212240712                      ## Header Magic
	.short	1                               ## Header Version
	.short	0                               ## Header Hash Function
	.long	12                              ## Header Bucket Count
	.long	25                              ## Header Hash Count
	.long	20                              ## Header Data Length
	.long	0                               ## HeaderData Die Offset Base
	.long	3                               ## HeaderData Atom Count
	.short	1                               ## DW_ATOM_die_offset
	.short	6                               ## DW_FORM_data4
	.short	3                               ## DW_ATOM_die_tag
	.short	5                               ## DW_FORM_data2
	.short	4                               ## DW_ATOM_type_flags
	.short	11                              ## DW_FORM_data1
	.long	-1                              ## Bucket 0
	.long	0                               ## Bucket 1
	.long	-1                              ## Bucket 2
	.long	3                               ## Bucket 3
	.long	5                               ## Bucket 4
	.long	8                               ## Bucket 5
	.long	11                              ## Bucket 6
	.long	13                              ## Bucket 7
	.long	14                              ## Bucket 8
	.long	19                              ## Bucket 9
	.long	21                              ## Bucket 10
	.long	22                              ## Bucket 11
	.long	274395349                       ## Hash in Bucket 1
	.long	-282664779                      ## Hash in Bucket 1
	.long	-143589579                      ## Hash in Bucket 1
	.long	466678419                       ## Hash in Bucket 3
	.long	1950644907                      ## Hash in Bucket 3
	.long	-203929656                      ## Hash in Bucket 4
	.long	-113419488                      ## Hash in Bucket 4
	.long	-34160304                       ## Hash in Bucket 4
	.long	2089071269                      ## Hash in Bucket 5
	.long	-1304652851                     ## Hash in Bucket 5
	.long	-80380739                       ## Hash in Bucket 5
	.long	193473966                       ## Hash in Bucket 6
	.long	2055135702                      ## Hash in Bucket 6
	.long	-1637125269                     ## Hash in Bucket 7
	.long	193495088                       ## Hash in Bucket 8
	.long	249311216                       ## Hash in Bucket 8
	.long	-1622544152                     ## Hash in Bucket 8
	.long	-1267332080                     ## Hash in Bucket 8
	.long	-104093792                      ## Hash in Bucket 8
	.long	2089606173                      ## Hash in Bucket 9
	.long	2090756157                      ## Hash in Bucket 9
	.long	-186322362                      ## Hash in Bucket 10
	.long	2090147939                      ## Hash in Bucket 11
	.long	-594775205                      ## Hash in Bucket 11
	.long	-328142765                      ## Hash in Bucket 11
.set Lset75, Ltypes19-Ltypes_begin      ## Offset in Bucket 1
	.long	Lset75
.set Lset76, Ltypes9-Ltypes_begin       ## Offset in Bucket 1
	.long	Lset76
.set Lset77, Ltypes21-Ltypes_begin      ## Offset in Bucket 1
	.long	Lset77
.set Lset78, Ltypes7-Ltypes_begin       ## Offset in Bucket 3
	.long	Lset78
.set Lset79, Ltypes2-Ltypes_begin       ## Offset in Bucket 3
	.long	Lset79
.set Lset80, Ltypes16-Ltypes_begin      ## Offset in Bucket 4
	.long	Lset80
.set Lset81, Ltypes13-Ltypes_begin      ## Offset in Bucket 4
	.long	Lset81
.set Lset82, Ltypes10-Ltypes_begin      ## Offset in Bucket 4
	.long	Lset82
.set Lset83, Ltypes15-Ltypes_begin      ## Offset in Bucket 5
	.long	Lset83
.set Lset84, Ltypes3-Ltypes_begin       ## Offset in Bucket 5
	.long	Lset84
.set Lset85, Ltypes11-Ltypes_begin      ## Offset in Bucket 5
	.long	Lset85
.set Lset86, Ltypes4-Ltypes_begin       ## Offset in Bucket 6
	.long	Lset86
.set Lset87, Ltypes20-Ltypes_begin      ## Offset in Bucket 6
	.long	Lset87
.set Lset88, Ltypes17-Ltypes_begin      ## Offset in Bucket 7
	.long	Lset88
.set Lset89, Ltypes5-Ltypes_begin       ## Offset in Bucket 8
	.long	Lset89
.set Lset90, Ltypes6-Ltypes_begin       ## Offset in Bucket 8
	.long	Lset90
.set Lset91, Ltypes1-Ltypes_begin       ## Offset in Bucket 8
	.long	Lset91
.set Lset92, Ltypes18-Ltypes_begin      ## Offset in Bucket 8
	.long	Lset92
.set Lset93, Ltypes24-Ltypes_begin      ## Offset in Bucket 8
	.long	Lset93
.set Lset94, Ltypes12-Ltypes_begin      ## Offset in Bucket 9
	.long	Lset94
.set Lset95, Ltypes23-Ltypes_begin      ## Offset in Bucket 9
	.long	Lset95
.set Lset96, Ltypes0-Ltypes_begin       ## Offset in Bucket 10
	.long	Lset96
.set Lset97, Ltypes14-Ltypes_begin      ## Offset in Bucket 11
	.long	Lset97
.set Lset98, Ltypes22-Ltypes_begin      ## Offset in Bucket 11
	.long	Lset98
.set Lset99, Ltypes8-Ltypes_begin       ## Offset in Bucket 11
	.long	Lset99
Ltypes19:
	.long	1075                            ## short
	.long	1                               ## Num DIEs
	.long	2584
	.short	36
	.byte	0
	.long	0
Ltypes9:
	.long	337                             ## __darwin_size_t
	.long	1                               ## Num DIEs
	.long	2119
	.short	22
	.byte	0
	.long	0
Ltypes21:
	.long	1153                            ## __darwin_off_t
	.long	1                               ## Num DIEs
	.long	2703
	.short	22
	.byte	0
	.long	0
Ltypes7:
	.long	330                             ## size_t
	.long	1                               ## Num DIEs
	.long	2108
	.short	22
	.byte	0
	.long	0
Ltypes2:
	.long	1168                            ## __int64_t
	.long	1                               ## Num DIEs
	.long	2714
	.short	22
	.byte	0
	.long	0
Ltypes16:
	.long	143                             ## constraintSense
	.long	1                               ## Num DIEs
	.long	50
	.short	4
	.byte	0
	.long	0
Ltypes13:
	.long	382                             ## double
	.long	1                               ## Num DIEs
	.long	2142
	.short	36
	.byte	0
	.long	0
Ltypes10:
	.long	1146                            ## fpos_t
	.long	1                               ## Num DIEs
	.long	2692
	.short	22
	.byte	0
	.long	0
Ltypes15:
	.long	1032                            ## FILE
	.long	1                               ## Num DIEs
	.long	2312
	.short	22
	.byte	0
	.long	0
Ltypes3:
	.long	159                             ## unsigned int
	.long	1                               ## Num DIEs
	.long	81
	.short	36
	.byte	0
	.long	0
Ltypes11:
	.long	353                             ## long unsigned int
	.long	1                               ## Num DIEs
	.long	2130
	.short	36
	.byte	0
	.long	0
Ltypes4:
	.long	306                             ## Var
	.long	1                               ## Num DIEs
	.long	2035
	.short	22
	.byte	0
	.long	0
Ltypes20:
	.long	1037                            ## __sFILE
	.long	1                               ## Num DIEs
	.long	2323
	.short	19
	.byte	0
	.long	0
Ltypes17:
	.long	310                             ## variable
	.long	1                               ## Num DIEs
	.long	2046
	.short	19
	.byte	0
	.long	0
Ltypes5:
	.long	201                             ## int
	.long	1                               ## Num DIEs
	.long	100
	.short	36
	.byte	0
	.long	0
Ltypes6:
	.long	722                             ## _Bool
	.long	1                               ## Num DIEs
	.long	2232
	.short	36
	.byte	0
	.long	0
Ltypes1:
	.long	193                             ## int32_t
	.long	1                               ## Num DIEs
	.long	89
	.short	22
	.byte	0
	.long	0
Ltypes18:
	.long	1178                            ## long long int
	.long	1                               ## Num DIEs
	.long	2725
	.short	36
	.byte	0
	.long	0
Ltypes24:
	.long	1048                            ## unsigned char
	.long	1                               ## Num DIEs
	.long	2577
	.short	36
	.byte	0
	.long	0
Ltypes12:
	.long	286                             ## Term
	.long	1                               ## Num DIEs
	.long	1986
	.short	22
	.byte	0
	.long	0
Ltypes23:
	.long	291                             ## term
	.long	1                               ## Num DIEs
	.long	1997
	.short	19
	.byte	0
	.long	0
Ltypes0:
	.long	941                             ## cSense
	.long	1                               ## Num DIEs
	.long	2296
	.short	22
	.byte	0
	.long	0
Ltypes14:
	.long	418                             ## char
	.long	1                               ## Num DIEs
	.long	2159
	.short	36
	.byte	0
	.long	0
Ltypes22:
	.long	565                             ## __ARRAY_SIZE_TYPE__
	.long	1                               ## Num DIEs
	.long	2178
	.short	36
	.byte	0
	.long	0
Ltypes8:
	.long	1091                            ## __sbuf
	.long	1                               ## Num DIEs
	.long	2591
	.short	19
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
