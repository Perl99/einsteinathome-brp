# hs_common compiled with MinGW gcc 13.1.0 with flags: -O3 -m64 -march=znver1 -mtune=znver4 -g0 -DNDEBUG
        .file   "hs_common.c"
        .text
        .p2align 4
        .globl  harmonic_summing
        .def    harmonic_summing;       .scl  2;  .type       32;   .endef
        .seh_proc       harmonic_summing
harmonic_summing:
        pushq   %rbp
        .seh_pushreg    %rbp
        pushq   %r15
        .seh_pushreg    %r15
        pushq   %r14
        .seh_pushreg    %r14
        pushq   %r13
        .seh_pushreg    %r13
        pushq   %r12
        .seh_pushreg    %r12
        pushq   %rdi
        .seh_pushreg    %rdi
        pushq   %rsi
        .seh_pushreg    %rsi
        pushq   %rbx
        .seh_pushreg    %rbx
        subq    $120, %rsp
        .seh_stackalloc 120
        leaq    80(%rsp), %rbp
        .seh_setframe   %rbp, 80
        vmovaps %xmm6, 0(%rbp)
        .seh_savexmm    %xmm6, 80
        vmovaps %xmm7, 16(%rbp)
        .seh_savexmm    %xmm7, 96
        .seh_endprologue
        vmovd   %r9d, %xmm0
        movl    $8, %eax
        movq    %rcx, %r14
        movl    144(%rbp), %ebx
        vpbroadcastd    %xmm0, %ymm0
        vpmulld .LC1(%rip), %ymm0, %ymm1
        vpmulld .LC3(%rip), %ymm0, %ymm0
        vmovd   %eax, %xmm6
        vpbroadcastd    %xmm6, %ymm6
        movl    %r9d, %ecx
        movq    %rdx, 120(%rbp)
        vpaddd  %ymm6, %ymm1, %ymm1
        vpaddd  %ymm6, %ymm0, %ymm0
        cmpl    152(%rbp), %r9d
        jnb     .L2
        movl    %ecx, %eax
        vpextrd $3, %xmm1, %esi
        vmovdqa %xmm0, %xmm7
        vextracti128    $0x1, %ymm1, %xmm6
        leaq    (%r8,%rax,4), %r15
        leal    (%rsi,%rsi), %eax
        vpextrd $1, %xmm1, %r9d
        vpextrd $2, %xmm6, %edx
        subl    %ecx, %r9d
        subl    %eax, %edx
        vmovd   %xmm0, -28(%rbp)
        movl    $-1, %r12d
        vextracti128    $0x1, %ymm0, %xmm0
        vmovd   %xmm6, -32(%rbp)
        movl    $-1, %r11d
        movl    %edx, -68(%rbp)
        vmovd   %xmm0, -24(%rbp)
        movl    $-1, -4(%rbp)
        movl    $-1, -8(%rbp)
        movl    %r9d, -72(%rbp)
        vpextrd $2, %xmm1, -20(%rbp)
        vpextrd $2, %xmm0, -16(%rbp)
        vpextrd $2, %xmm7, -12(%rbp)
        vpextrd $3, %xmm0, -48(%rbp)
        vpextrd $1, %xmm0, -44(%rbp)
        vpextrd $3, %xmm7, -40(%rbp)
        vpextrd $1, %xmm7, -36(%rbp)
        vpextrd $3, %xmm6, -52(%rbp)
        vpextrd $1, %xmm6, -56(%rbp)
        jmp     .L32
        .p2align 4
        .p2align 3
.L61:
        movq    160(%rbp), %rdi
        vmaxss  %xmm3, %xmm0, %xmm3
        vcomiss 4(%rdi), %xmm3
        jbe     .L56
        movq    8(%r14), %r9
        movq    120(%rbp), %rdi
        vmovss  %xmm3, (%r9,%r10)
        movq    8(%rdi), %r10
        movl    %edx, %r9d
        sarl    $10, %r9d
        movslq  %r9d, %r9
        movl    $1, (%r10,%r9,4)
.L5:
        movl    -32(%rbp), %r9d
        movl    -24(%rbp), %r10d
        shrl    $4, %r9d
        shrl    $4, %r10d
        movl    %r9d, %r11d
        vmovss  (%r8,%r10,4), %xmm1
        vaddss  (%r8,%r11,4), %xmm1, %xmm1
        leaq    0(,%r11,4), %rdi
        vaddss  %xmm0, %xmm1, %xmm1
        cmpl    %r12d, %r9d
        je      .L11
        vxorps  %xmm4, %xmm4, %xmm4
.L11:
        cmpl    %ebx, %r9d
        jnb     .L36
        movq    160(%rbp), %r10
        vmaxss  %xmm4, %xmm1, %xmm4
        vcomiss 8(%r10), %xmm4
        jbe     .L57
        movq    16(%r14), %r10
        vmovss  %xmm4, (%r10,%rdi)
        movq    120(%rbp), %rdi
        movl    %r9d, %r10d
        sarl    $10, %r10d
        movslq  %r10d, %r10
        movq    16(%rdi), %r11
        movl    $1, (%r11,%r10,4)
.L12:
        movl    -20(%rbp), %r10d
        movl    -12(%rbp), %r11d
        shrl    $4, %eax
        shrl    $4, %r10d
        movl    %r10d, %r12d
        leaq    0(,%r12,4), %rdi
        movq    %rdi, -64(%rbp)
        movl    -16(%rbp), %edi
        shrl    $4, %r11d
        shrl    $4, %edi
        vmovss  (%r8,%rdi,4), %xmm0
        vaddss  (%r8,%r11,4), %xmm0, %xmm0
        vaddss  (%r8,%rax,4), %xmm0, %xmm0
        movl    -8(%rbp), %eax
        vaddss  (%r8,%r12,4), %xmm0, %xmm0
        vaddss  %xmm1, %xmm0, %xmm0
        cmpl    %eax, %r10d
        je      .L18
        vxorps  %xmm5, %xmm5, %xmm5
.L18:
        cmpl    %ebx, %r10d
        jnb     .L38
        movq    160(%rbp), %rax
        vmaxss  %xmm5, %xmm0, %xmm5
        vcomiss 12(%rax), %xmm5
        jbe     .L58
        movq    24(%r14), %rax
        movq    -64(%rbp), %rdi
        vmovss  %xmm5, (%rax,%rdi)
        movq    120(%rbp), %rdi
        movl    %r10d, %eax
        sarl    $10, %eax
        cltq
        movq    24(%rdi), %r11
        movl    $1, (%r11,%rax,4)
.L19:
        movl    %r13d, %eax
        shrl    $4, %eax
        cmpl    %eax, -4(%rbp)
        je      .L25
        vxorps  %xmm2, %xmm2, %xmm2
.L25:
        cmpl    %ebx, %eax
        jnb     .L40
        movl    -48(%rbp), %edi
        movl    -44(%rbp), %r11d
        movl    %eax, %r12d
        leaq    0(,%r12,4), %r13
        shrl    $4, %edi
        shrl    $4, %r11d
        vmovss  (%r8,%rdi,4), %xmm1
        vaddss  (%r8,%r11,4), %xmm1, %xmm1
        movl    -40(%rbp), %r11d
        movq    160(%rbp), %rdi
        shrl    $4, %r11d
        vaddss  (%r8,%r11,4), %xmm1, %xmm1
        movl    -36(%rbp), %r11d
        shrl    $4, %r11d
        vaddss  (%r8,%r11,4), %xmm1, %xmm1
        movl    -52(%rbp), %r11d
        shrl    $4, %r11d
        vaddss  (%r8,%r11,4), %xmm1, %xmm1
        movl    -56(%rbp), %r11d
        shrl    $4, %r11d
        vaddss  (%r8,%r11,4), %xmm1, %xmm1
        movl    %esi, %r11d
        shrl    $4, %r11d
        vaddss  (%r8,%r11,4), %xmm1, %xmm1
        vaddss  (%r8,%r12,4), %xmm1, %xmm1
        vaddss  %xmm0, %xmm1, %xmm0
        vmaxss  %xmm2, %xmm0, %xmm2
        vcomiss 16(%rdi), %xmm2
        jbe     .L59
        movq    120(%rbp), %rdi
        movq    32(%r14), %r11
        movq    32(%rdi), %rdi
        vmovss  %xmm2, (%r11,%r13)
        movl    %eax, %r11d
        sarl    $10, %r11d
        movslq  %r11d, %r11
        movl    $1, (%rdi,%r11,4)
.L26:
        incl    %ecx
        addl    $3, %esi
        addq    $4, %r15
        addl    $2, -20(%rbp)
        addl    $4, -32(%rbp)
        addl    $7, -52(%rbp)
        addl    $8, -28(%rbp)
        addl    $9, -36(%rbp)
        addl    $10, -12(%rbp)
        addl    $11, -40(%rbp)
        addl    $12, -24(%rbp)
        addl    $13, -44(%rbp)
        addl    $14, -16(%rbp)
        addl    $15, -48(%rbp)
        addl    $5, -56(%rbp)
        cmpl    %ecx, 152(%rbp)
        je      .L2
        movl    %eax, -4(%rbp)
        movl    %r9d, %r12d
        movl    %edx, %r11d
        leal    (%rsi,%rsi), %eax
        movl    %r10d, -8(%rbp)
.L32:
        movl    -68(%rbp), %edx
        vmovss  (%r15), %xmm0
        addl    %edx, %eax
        movl    -72(%rbp), %edx
        leal    (%rdx,%rcx), %r13d
        movq    160(%rbp), %rdx
        vcomiss (%rdx), %xmm0
        jbe     .L3
        cmpl    %ebx, %ecx
        jnb     .L3
        movq    120(%rbp), %rdi
        movl    %ecx, %edx
        shrl    $10, %edx
        movq    (%rdi), %r9
        movl    $1, (%r9,%rdx,4)
.L3:
        movl    -28(%rbp), %edx
        shrl    $4, %edx
        movl    %edx, %r9d
        vaddss  (%r8,%r9,4), %xmm0, %xmm0
        leaq    0(,%r9,4), %r10
        cmpl    %r11d, %edx
        je      .L4
        vxorps  %xmm3, %xmm3, %xmm3
.L4:
        cmpl    %ebx, %edx
        jb      .L61
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
        cmpl    %r12d, %r9d
        je      .L12
        movq    16(%r14), %r10
        vmovss  %xmm4, (%r10,%rdi)
        jmp     .L12
        .p2align 4
        .p2align 3
.L59:
        cmpl    %eax, -4(%rbp)
        je      .L26
        movq    32(%r14), %r11
        vmovss  %xmm2, (%r11,%r13)
        jmp     .L26
        .p2align 4
        .p2align 3
.L56:
        cmpl    %r11d, %edx
        je      .L5
        movq    8(%r14), %r9
        vmovss  %xmm3, (%r9,%r10)
        jmp     .L5
        .p2align 4
        .p2align 3
.L58:
        movl    -8(%rbp), %eax
        cmpl    %eax, %r10d
        je      .L19
        movq    24(%r14), %rax
        movq    -64(%rbp), %rdi
        vmovss  %xmm5, (%rax,%rdi)
        jmp     .L19
.L2:
        xorl    %eax, %eax
        vzeroupper
        vmovaps 0(%rbp), %xmm6
        vmovaps 16(%rbp), %xmm7
        addq    $120, %rsp
        popq    %rbx
        popq    %rsi
        popq    %rdi
        popq    %r12
        popq    %r13
        popq    %r14
        popq    %r15
        popq    %rbp
        ret
        .seh_endproc
        .section .rdata,"dr"
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
        .ident  "GCC: (MinGW-W64 x86_64-ucrt-mcf-seh, built by Brecht Sanders) 13.1.0"