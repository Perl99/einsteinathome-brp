# demod_binary_resamp_cpu_asm compiled with gcc 13.2.0 with flags: -O3 -m64 -march=znver1 -mtune=znver4 -g0 -DNDEBUG
        .file   "demod_binary_resamp_cpu_asm.c"
        .text
        .p2align 4
        .globl  run_resampling
        .type   run_resampling, @function
run_resampling:
        .cfi_startproc
        leaq    8(%rsp), %r10
        .cfi_def_cfa 10, 0
        andq    $-32, %rsp
        pushq   -8(%r10)
        pushq   %rbp
        movq    %rsp, %rbp
        .cfi_escape 0x10,0x6,0x2,0x76,0
        pushq   %r15
        pushq   %r14
        pushq   %r13
        pushq   %r12
        pushq   %r10
        .cfi_escape 0xf,0x3,0x76,0x58,0x6
        .cfi_escape 0x10,0xf,0x2,0x76,0x78
        .cfi_escape 0x10,0xe,0x2,0x76,0x70
        .cfi_escape 0x10,0xd,0x2,0x76,0x68
        .cfi_escape 0x10,0xc,0x2,0x76,0x60
        pushq   %rbx
        movq    %rdi, %r13
        subq    $64, %rsp
        .cfi_escape 0x10,0x3,0x2,0x76,0x50
        movl    4(%rdx), %eax
        movq    del_t(%rip), %r14
        movq    %rsi, %r12
        movq    %rdx, %r15
        movl    %eax, -84(%rbp)
        testl   %eax, %eax
        je      .L23
        vmovss  .LC3(%rip), %xmm7
        movl    %eax, %edx
        movq    %r14, %rbx
        vxorps  %xmm3, %xmm3, %xmm3
        leaq    (%r14,%rdx,4), %rax
        movq    %rax, -80(%rbp)
        vmovss  %xmm7, -68(%rbp)
        .p2align 4
        .p2align 3
.L5:
        vmulss  24(%r15), %xmm3, %xmm0
        vmovss  20(%r15), %xmm5
        leaq    -52(%rbp), %rdi
        vmovss  %xmm3, -72(%rbp)
        vfmadd132ss     16(%r15), %xmm5, %xmm0
        vmulss  .LC2(%rip), %xmm0, %xmm0
        call    modff
        vxorps  %xmm6, %xmm6, %xmm6
        vmovss  -72(%rbp), %xmm3
        vxorps  %xmm2, %xmm2, %xmm2
        vmovaps %xmm0, %xmm1
        vcomiss %xmm0, %xmm6
        jbe     .L3
        vaddss  -68(%rbp), %xmm0, %xmm1
.L3:
        vmovss  .LC4(%rip), %xmm0
        vfmadd213ss     .LC5(%rip), %xmm1, %xmm0
        vcvttss2sil     %xmm0, %edx
        vcvtsi2ssl      %edx, %xmm2, %xmm0
        vfnmadd132ss    .LC6(%rip), %xmm1, %xmm0
        vmulss  .LC7(%rip), %xmm0, %xmm0
        movslq  %edx, %rdx
        vmovss  32(%r15), %xmm7
        vmulss  .LC5(%rip), %xmm0, %xmm1
        vmovss  sinSamples(,%rdx,4), %xmm4
        vaddss  -68(%rbp), %xmm3, %xmm3
        addq    $4, %rbx
        vmulss  %xmm1, %xmm0, %xmm1
        vfmadd132ss     cosSamples(,%rdx,4), %xmm4, %xmm0
        vfnmadd132ss    %xmm4, %xmm0, %xmm1
        vmulss  12(%r15), %xmm1, %xmm1
        vfmsub132ss     28(%r15), %xmm7, %xmm1
        vmovss  %xmm1, -4(%rbx)
        cmpq    %rbx, -80(%rbp)
        jne     .L5
        movl    -84(%rbp), %ebx
        leal    -1(%rbx), %edx
        movq    %rdx, %rbx
        vcvtsi2ssq      %rdx, %xmm2, %xmm1
        salq    $2, %rdx
.L2:
        vsubss  (%r14,%rdx), %xmm1, %xmm0
        vcomiss %xmm1, %xmm0
        jb      .L8
        .p2align 4
        .p2align 3
.L10:
        leal    -1(%rbx), %edx
        vcvtsi2ssq      %rdx, %xmm2, %xmm0
        vsubss  (%r14,%rdx,4), %xmm0, %xmm0
        movq    %rdx, %rbx
        vcomiss %xmm1, %xmm0
        jnb     .L10
.L8:
        testl   %ebx, %ebx
        je      .L24
        vmovss  .LC3(%rip), %xmm4
        movl    %ebx, %esi
        vxorps  %xmm2, %xmm2, %xmm2
        xorl    %edx, %edx
        salq    $2, %rsi
        vmovsd  .LC8(%rip), %xmm3
        vmovaps %xmm2, %xmm1
        vmovss  %xmm4, -68(%rbp)
        .p2align 4
        .p2align 3
.L14:
        vsubss  (%r14,%rdx), %xmm1, %xmm0
        vaddss  -68(%rbp), %xmm1, %xmm1
        vcvtss2sd       %xmm0, %xmm0, %xmm0
        vaddsd  %xmm3, %xmm0, %xmm0
        vcvttsd2sil     %xmm0, %ecx
        movslq  %ecx, %rcx
        vmovss  0(%r13,%rcx,4), %xmm0
        vmovss  %xmm0, (%r12,%rdx)
        addq    $4, %rdx
        vaddss  %xmm0, %xmm2, %xmm2
        cmpq    %rdx, %rsi
        jne     .L14
.L13:
        movl    (%r15), %esi
        vdivss  %xmm1, %xmm2, %xmm2
        cmpl    %esi, %ebx
        jnb     .L27
        movl    %esi, %edx
        subl    %ebx, %edx
        leal    -1(%rdx), %eax
        cmpl    $6, %eax
        jbe     .L25
        movl    %edx, %ecx
        movl    %ebx, %eax
        vbroadcastss    %xmm2, %ymm0
        shrl    $3, %ecx
        salq    $5, %rcx
        leaq    (%r12,%rax,4), %rax
        leaq    (%rcx,%rax), %rdi
        andl    $32, %ecx
        je      .L17
        vmovups %ymm0, (%rax)
        addq    $32, %rax
        cmpq    %rax, %rdi
        je      .L44
        .p2align 4
        .p2align 3
.L17:
        vmovups %ymm0, (%rax)
        addq    $64, %rax
        vmovups %ymm0, -32(%rax)
        cmpq    %rax, %rdi
        jne     .L17
.L44:
        movl    %edx, %eax
        andl    $-8, %eax
        leal    (%rbx,%rax), %ecx
        testb   $7, %dl
        je      .L48
        vzeroupper
.L16:
        subl    %eax, %edx
        leal    -1(%rdx), %edi
        cmpl    $2, %edi
        jbe     .L21
        movl    %ebx, %ebx
        vshufps $0, %xmm2, %xmm2, %xmm0
        addq    %rbx, %rax
        vmovups %xmm0, (%r12,%rax,4)
        movl    %edx, %eax
        andl    $-4, %eax
        addl    %eax, %ecx
        andl    $3, %edx
        je      .L27
.L21:
        movl    %ecx, %eax
        vmovss  %xmm2, (%r12,%rax,4)
        leal    1(%rcx), %eax
        cmpl    %esi, %eax
        jnb     .L27
        addl    $2, %ecx
        vmovss  %xmm2, (%r12,%rax,4)
        cmpl    %esi, %ecx
        jnb     .L27
        vmovss  %xmm2, (%r12,%rcx,4)
.L27:
        addq    $64, %rsp
        xorl    %eax, %eax
        popq    %rbx
        popq    %r10
        .cfi_remember_state
        .cfi_def_cfa 10, 0
        popq    %r12
        popq    %r13
        popq    %r14
        popq    %r15
        popq    %rbp
        leaq    -8(%r10), %rsp
        .cfi_def_cfa 7, 8
        ret
        .p2align 4
        .p2align 3
.L24:
        .cfi_restore_state
        vxorps  %xmm2, %xmm2, %xmm2
        vmovaps %xmm2, %xmm1
        jmp     .L13
        .p2align 4
        .p2align 3
.L23:
        vmovss  .LC1(%rip), %xmm1
        movabsq $17179869180, %rdx
        movl    $-1, %ebx
        vxorps  %xmm2, %xmm2, %xmm2
        jmp     .L2
        .p2align 4
        .p2align 3
.L48:
        vzeroupper
        jmp     .L27
.L25:
        movl    %ebx, %ecx
        xorl    %eax, %eax
        jmp     .L16
        .cfi_endproc
        .size   run_resampling, .-run_resampling
        .globl  cosSamples
        .data
        .align 32
        .type   cosSamples, @object
        .size   cosSamples, 260
cosSamples:
        .long   1065353216
        .long   1065272434
        .long   1065030842
        .long   1064630789
        .long   1064076134
        .long   1063372179
        .long   1062525752
        .long   1061544956
        .long   1060439287
        .long   1059219348
        .long   1057896918
        .long   1056004851
        .long   1053028103
        .long   1049927740
        .long   1044891052
        .long   1036565795
        .long   0
        .long   -1110917853
        .long   -1102592596
        .long   -1097555908
        .long   -1094455545
        .long   -1091478797
        .long   -1089586730
        .long   -1088264300
        .long   -1087044361
        .long   -1085938692
        .long   -1084957896
        .long   -1084111469
        .long   -1083407514
        .long   -1082852859
        .long   -1082452806
        .long   -1082211214
        .long   -1082130432
        .long   -1082211214
        .long   -1082452806
        .long   -1082852859
        .long   -1083407514
        .long   -1084111469
        .long   -1084957896
        .long   -1085938675
        .long   -1087044361
        .long   -1088264300
        .long   -1089586730
        .long   -1091478797
        .long   -1094455512
        .long   -1097555908
        .long   -1102592596
        .long   -1110917853
        .long   0
        .long   1036565795
        .long   1044891052
        .long   1049927740
        .long   1053028103
        .long   1056004851
        .long   1057896918
        .long   1059219348
        .long   1060439287
        .long   1061544956
        .long   1062525752
        .long   1063372179
        .long   1064076118
        .long   1064630789
        .long   1065030842
        .long   1065272434
        .long   1065353216
        .globl  sinSamples
        .align 32
        .type   sinSamples, @object
        .size   sinSamples, 260
sinSamples:
        .long   0
        .long   1036565795
        .long   1044891052
        .long   1049927740
        .long   1053028103
        .long   1056004851
        .long   1057896918
        .long   1059219348
        .long   1060439287
        .long   1061544956
        .long   1062525752
        .long   1063372179
        .long   1064076134
        .long   1064630789
        .long   1065030842
        .long   1065272434
        .long   1065353216
        .long   1065272434
        .long   1065030842
        .long   1064630789
        .long   1064076134
        .long   1063372179
        .long   1062525752
        .long   1061544956
        .long   1060439287
        .long   1059219348
        .long   1057896918
        .long   1056004851
        .long   1053028103
        .long   1049927740
        .long   1044891119
        .long   1036565795
        .long   0
        .long   -1110917853
        .long   -1102592596
        .long   -1097555941
        .long   -1094455545
        .long   -1091478797
        .long   -1089586730
        .long   -1088264300
        .long   -1087044361
        .long   -1085938692
        .long   -1084957913
        .long   -1084111469
        .long   -1083407514
        .long   -1082852859
        .long   -1082452806
        .long   -1082211214
        .long   -1082130432
        .long   -1082211214
        .long   -1082452806
        .long   -1082852859
        .long   -1083407514
        .long   -1084111469
        .long   -1084957896
        .long   -1085938675
        .long   -1087044361
        .long   -1088264283
        .long   -1089586730
        .long   -1091478797
        .long   -1094455512
        .long   -1097555908
        .long   -1102592529
        .long   -1110917853
        .long   -2147483648
        .section        .rodata.cst4,"aM",@progbits,4
        .align 4
.LC1:
        .long   1333788672
        .align 4
.LC2:
        .long   1042479492
        .align 4
.LC3:
        .long   1065353216
        .align 4
.LC4:
        .long   1115684864
        .align 4
.LC5:
        .long   1056964608
        .align 4
.LC6:
        .long   1015021568
        .align 4
.LC7:
        .long   1086918618
        .section        .rodata.cst8,"aM",@progbits,8
        .align 8
.LC8:
        .long   0
        .long   1071644672
        .ident  "GCC: (Compiler-Explorer-Build-gcc--binutils-2.40) 13.2.0"
        .section        .note.GNU-stack,"",@progbits