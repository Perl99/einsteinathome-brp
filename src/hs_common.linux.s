# hs_common compiled with gcc 13.2.0 with flags: -O3 -m64 -march=znver1 -mtune=znver4 -g0 -DNDEBUG
        .file   "hs_common.c"
        .text
        .p2align 4
        .globl  harmonic_summing
        .type   harmonic_summing, @function
harmonic_summing:
        .cfi_startproc
        pushq   %rbp
        .cfi_def_cfa_offset 16
        .cfi_offset 6, -16
        vmovd   %ecx, %xmm0
        movq    %rdx, %rax
        movl    $8, %edx
        movq    %rsp, %rbp
        .cfi_def_cfa_register 6
        pushq   %r15
        pushq   %r14
        pushq   %r13
        pushq   %r12
        pushq   %rbx
        vpbroadcastd    %xmm0, %ymm0
        vmovd   %edx, %xmm6
        vpbroadcastd    %xmm6, %ymm6
        vpmulld .LC1(%rip), %ymm0, %ymm1
        vpmulld .LC3(%rip), %ymm0, %ymm0
        andq    $-32, %rsp
        .cfi_offset 15, -24
        .cfi_offset 14, -32
        .cfi_offset 13, -40
        .cfi_offset 12, -48
        .cfi_offset 3, -56
        movq    %rsi, -72(%rsp)
        movl    %r9d, -76(%rsp)
        vpaddd  %ymm6, %ymm1, %ymm1
        vpaddd  %ymm6, %ymm0, %ymm0
        cmpl    %r9d, %ecx
        jnb     .L2
        movl    %ecx, %edx
        movl    %ecx, %esi
        vpextrd $3, %xmm1, %r11d
        vmovdqa %xmm0, %xmm7
        leaq    (%rax,%rdx,4), %r15
        leal    (%r11,%r11), %edx
        vextracti128    $0x1, %ymm1, %xmm6
        movq    %rdi, %r14
        vpextrd $2, %xmm6, %ecx
        vpextrd $1, %xmm1, %edi
        subl    %edx, %ecx
        subl    %esi, %edi
        vmovd   %xmm0, -28(%rsp)
        movl    $-1, %r12d
        vextracti128    $0x1, %ymm0, %xmm0
        movl    $-1, %r10d
        vmovd   %xmm6, -32(%rsp)
        movl    %ecx, -80(%rsp)
        movl    $-1, -4(%rsp)
        movl    $-1, -8(%rsp)
        vmovd   %xmm0, -24(%rsp)
        movl    %edi, -84(%rsp)
        vpextrd $2, %xmm1, -20(%rsp)
        vpextrd $2, %xmm0, -16(%rsp)
        vpextrd $2, %xmm7, -12(%rsp)
        vpextrd $3, %xmm0, -48(%rsp)
        vpextrd $1, %xmm0, -44(%rsp)
        vpextrd $3, %xmm7, -40(%rsp)
        vpextrd $1, %xmm7, -36(%rsp)
        vpextrd $3, %xmm6, -52(%rsp)
        vpextrd $1, %xmm6, -56(%rsp)
        jmp     .L32
        .p2align 4
        .p2align 3
.L62:
        movq    16(%rbp), %rdi
        vmaxss  %xmm3, %xmm0, %xmm3
        vcomiss 4(%rdi), %xmm3
        jbe     .L56
        movq    8(%r14), %rdi
        movq    -72(%rsp), %rbx
        vmovss  %xmm3, (%rdi,%r9)
        movq    8(%rbx), %r9
        movl    %ecx, %edi
        sarl    $10, %edi
        movslq  %edi, %rdi
        movl    $1, (%r9,%rdi,4)
.L5:
        movl    -32(%rsp), %edi
        movl    -24(%rsp), %r9d
        shrl    $4, %edi
        shrl    $4, %r9d
        movl    %edi, %r10d
        vmovss  (%rax,%r9,4), %xmm1
        vaddss  (%rax,%r10,4), %xmm1, %xmm1
        leaq    0(,%r10,4), %rbx
        vaddss  %xmm0, %xmm1, %xmm1
        cmpl    %r12d, %edi
        je      .L11
        vxorps  %xmm4, %xmm4, %xmm4
.L11:
        cmpl    %r8d, %edi
        jnb     .L36
        movq    16(%rbp), %r9
        vmaxss  %xmm4, %xmm1, %xmm4
        vcomiss 8(%r9), %xmm4
        jbe     .L57
        movq    16(%r14), %r9
        vmovss  %xmm4, (%r9,%rbx)
        movq    -72(%rsp), %rbx
        movl    %edi, %r9d
        sarl    $10, %r9d
        movslq  %r9d, %r9
        movq    16(%rbx), %r10
        movl    $1, (%r10,%r9,4)
.L12:
        movl    -20(%rsp), %r9d
        movl    -12(%rsp), %r10d
        shrl    $4, %edx
        shrl    $4, %r9d
        movl    %r9d, %r12d
        leaq    0(,%r12,4), %rbx
        movq    %rbx, -64(%rsp)
        movl    -16(%rsp), %ebx
        shrl    $4, %r10d
        shrl    $4, %ebx
        vmovss  (%rax,%rbx,4), %xmm0
        vaddss  (%rax,%r10,4), %xmm0, %xmm0
        vaddss  (%rax,%rdx,4), %xmm0, %xmm0
        movl    -8(%rsp), %edx
        vaddss  (%rax,%r12,4), %xmm0, %xmm0
        vaddss  %xmm1, %xmm0, %xmm0
        cmpl    %edx, %r9d
        je      .L18
        vxorps  %xmm5, %xmm5, %xmm5
.L18:
        cmpl    %r8d, %r9d
        jnb     .L38
        movq    16(%rbp), %rdx
        vmaxss  %xmm5, %xmm0, %xmm5
        vcomiss 12(%rdx), %xmm5
        jbe     .L58
        movq    24(%r14), %rdx
        movq    -64(%rsp), %rbx
        vmovss  %xmm5, (%rdx,%rbx)
        movq    -72(%rsp), %rbx
        movl    %r9d, %edx
        sarl    $10, %edx
        movslq  %edx, %rdx
        movq    24(%rbx), %r10
        movl    $1, (%r10,%rdx,4)
.L19:
        movl    %r13d, %edx
        shrl    $4, %edx
        cmpl    %edx, -4(%rsp)
        je      .L25
        vxorps  %xmm2, %xmm2, %xmm2
.L25:
        cmpl    %r8d, %edx
        jnb     .L40
        movl    -48(%rsp), %ebx
        movl    -44(%rsp), %r10d
        movl    %edx, %r12d
        leaq    0(,%r12,4), %r13
        shrl    $4, %ebx
        shrl    $4, %r10d
        vmovss  (%rax,%rbx,4), %xmm1
        vaddss  (%rax,%r10,4), %xmm1, %xmm1
        movl    -40(%rsp), %r10d
        movq    16(%rbp), %rbx
        shrl    $4, %r10d
        vaddss  (%rax,%r10,4), %xmm1, %xmm1
        movl    -36(%rsp), %r10d
        shrl    $4, %r10d
        vaddss  (%rax,%r10,4), %xmm1, %xmm1
        movl    -52(%rsp), %r10d
        shrl    $4, %r10d
        vaddss  (%rax,%r10,4), %xmm1, %xmm1
        movl    -56(%rsp), %r10d
        shrl    $4, %r10d
        vaddss  (%rax,%r10,4), %xmm1, %xmm1
        movl    %r11d, %r10d
        shrl    $4, %r10d
        vaddss  (%rax,%r10,4), %xmm1, %xmm1
        vaddss  (%rax,%r12,4), %xmm1, %xmm1
        vaddss  %xmm0, %xmm1, %xmm0
        vmaxss  %xmm2, %xmm0, %xmm2
        vcomiss 16(%rbx), %xmm2
        jbe     .L59
        movq    -72(%rsp), %rbx
        movq    32(%r14), %r10
        movq    32(%rbx), %rbx
        vmovss  %xmm2, (%r10,%r13)
        movl    %edx, %r10d
        sarl    $10, %r10d
        movslq  %r10d, %r10
        movl    $1, (%rbx,%r10,4)
.L26:
        incl    %esi
        addl    $3, %r11d
        addq    $4, %r15
        addl    $2, -20(%rsp)
        addl    $4, -32(%rsp)
        addl    $7, -52(%rsp)
        addl    $8, -28(%rsp)
        addl    $9, -36(%rsp)
        addl    $10, -12(%rsp)
        addl    $11, -40(%rsp)
        addl    $12, -24(%rsp)
        addl    $13, -44(%rsp)
        addl    $14, -16(%rsp)
        addl    $15, -48(%rsp)
        addl    $5, -56(%rsp)
        cmpl    %esi, -76(%rsp)
        je      .L2
        movl    %edx, -4(%rsp)
        movl    %edi, %r12d
        movl    %ecx, %r10d
        leal    (%r11,%r11), %edx
        movl    %r9d, -8(%rsp)
.L32:
        movl    -80(%rsp), %ecx
        vmovss  (%r15), %xmm0
        addl    %ecx, %edx
        movl    -84(%rsp), %ecx
        leal    (%rcx,%rsi), %r13d
        movq    16(%rbp), %rcx
        vcomiss (%rcx), %xmm0
        jbe     .L3
        cmpl    %r8d, %esi
        jnb     .L3
        movq    -72(%rsp), %rdi
        movl    %esi, %ecx
        shrl    $10, %ecx
        movq    (%rdi), %rdi
        movl    $1, (%rdi,%rcx,4)
.L3:
        movl    -28(%rsp), %ecx
        shrl    $4, %ecx
        movl    %ecx, %edi
        vaddss  (%rax,%rdi,4), %xmm0, %xmm0
        leaq    0(,%rdi,4), %r9
        cmpl    %r10d, %ecx
        je      .L4
        vxorps  %xmm3, %xmm3, %xmm3
.L4:
        cmpl    %r8d, %ecx
        jb      .L62
        vmovaps %xmm2, %xmm3
        jmp     .L5
        .p2align 4
        .p2align 3
.L40:
        vmovaps %xmm5, %xmm2
        jmp     .L26
        .p2align 4
        .p2align 3
.L36:
        vmovaps %xmm3, %xmm4
        jmp     .L12
        .p2align 4
        .p2align 3
.L38:
        vmovaps %xmm4, %xmm5
        jmp     .L19
        .p2align 4
        .p2align 3
.L57:
        cmpl    %r12d, %edi
        je      .L12
        movq    16(%r14), %r9
        vmovss  %xmm4, (%r9,%rbx)
        jmp     .L12
        .p2align 4
        .p2align 3
.L59:
        cmpl    %edx, -4(%rsp)
        je      .L26
        movq    32(%r14), %r10
        vmovss  %xmm2, (%r10,%r13)
        jmp     .L26
        .p2align 4
        .p2align 3
.L56:
        cmpl    %r10d, %ecx
        je      .L5
        movq    8(%r14), %rdi
        vmovss  %xmm3, (%rdi,%r9)
        jmp     .L5
        .p2align 4
        .p2align 3
.L58:
        movl    -8(%rsp), %edx
        cmpl    %edx, %r9d
        je      .L19
        movq    24(%r14), %rdx
        movq    -64(%rsp), %rbx
        vmovss  %xmm5, (%rdx,%rbx)
        jmp     .L19
.L2:
        xorl    %eax, %eax
        vzeroupper
        leaq    -40(%rbp), %rsp
        popq    %rbx
        popq    %r12
        popq    %r13
        popq    %r14
        popq    %r15
        popq    %rbp
        .cfi_def_cfa 7, 8
        ret
        .cfi_endproc
        .size   harmonic_summing, .-harmonic_summing
        .section        .rodata.cst32,"aM",@progbits,32
        .align 32
.LC1:
        .long   0
        .long   1
        .long   2
        .long   3
        .long   4
        .long   5
        .long   6
        .long   7
        .align 32
.LC3:
        .long   8
        .long   9
        .long   10
        .long   11
        .long   12
        .long   13
        .long   14
        .long   15
        .ident  "GCC: (Compiler-Explorer-Build-gcc--binutils-2.40) 13.2.0"
        .section        .note.GNU-stack,"",@progbits