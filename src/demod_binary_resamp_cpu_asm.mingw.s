# demod_binary_resamp_cpu_asm compiled with gcc 13.1.0 with flags: -O3 -m64 -march=znver1 -mtune=znver4 -g0 -DNDEBUG
        .file   "demod_binary_resamp_cpu_asm.c"
        .text
        .p2align 4
        .globl  run_resampling
        .def    run_resampling; .scl      2;  .type       32;   .endef
        .seh_proc       run_resampling
run_resampling:
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
        subq    $232, %rsp
        .seh_stackalloc 232
        leaq    80(%rsp), %rbp
        .seh_setframe   %rbp, 80
        vmovaps %xmm6, 0(%rbp)
        .seh_savexmm    %xmm6, 80
        vmovaps %xmm7, 16(%rbp)
        .seh_savexmm    %xmm7, 96
        vmovaps %xmm8, 32(%rbp)
        .seh_savexmm    %xmm8, 112
        vmovaps %xmm9, 48(%rbp)
        .seh_savexmm    %xmm9, 128
        vmovaps %xmm10, 64(%rbp)
        .seh_savexmm    %xmm10, 144
        vmovaps %xmm11, 80(%rbp)
        .seh_savexmm    %xmm11, 160
        vmovaps %xmm12, 96(%rbp)
        .seh_savexmm    %xmm12, 176
        vmovaps %xmm13, 112(%rbp)
        .seh_savexmm    %xmm13, 192
        vmovaps %xmm14, 128(%rbp)
        .seh_savexmm    %xmm14, 208
        .seh_endprologue
        vxorps  %xmm14, %xmm14, %xmm14
        movq    .refptr.del_t(%rip), %rax
        movq    %rcx, %rdi
        movl    4(%r8), %ecx
        movq    %rdx, %rsi
        movq    %r8, %r14
        movq    (%rax), %r15
        movl    %ecx, -36(%rbp)
        testl   %ecx, %ecx
        je      .L23
        vmovss  .LC2(%rip), %xmm12
        vmovss  .LC3(%rip), %xmm6
        vmovss  .LC4(%rip), %xmm11
        movl    %ecx, %edx
        vmovss  .LC5(%rip), %xmm7
        vmovss  .LC6(%rip), %xmm10
        vmovss  .LC7(%rip), %xmm9
        leaq    (%r15,%rdx,4), %rax
        movq    %rax, -24(%rbp)
        vxorps  %xmm13, %xmm13, %xmm13
        leaq    -4(%rbp), %rax
        movq    %r15, %rbx
        leaq    sinSamples(%rip), %r13
        leaq    cosSamples(%rip), %r12
        vmovaps %xmm13, %xmm8
        movq    %rax, -32(%rbp)
        .p2align 4
        .p2align 3
.L5:
        movq    -32(%rbp), %rdx
        vmulss  24(%r14), %xmm13, %xmm0
        vmovss  20(%r14), %xmm4
        vfmadd132ss     16(%r14), %xmm4, %xmm0
        vmulss  %xmm12, %xmm0, %xmm0
        call    modff
        vmovaps %xmm0, %xmm1
        vcomiss %xmm0, %xmm8
        jbe     .L3
        vaddss  %xmm6, %xmm0, %xmm1
.L3:
        vmovaps %xmm1, %xmm0
        vmovss  32(%r14), %xmm5
        vaddss  %xmm6, %xmm13, %xmm13
        addq    $4, %rbx
        vfmadd132ss     %xmm11, %xmm7, %xmm0
        vcvttss2sil     %xmm0, %edx
        vcvtsi2ssl      %edx, %xmm14, %xmm0
        vfnmadd132ss    %xmm10, %xmm1, %xmm0
        movslq  %edx, %rdx
        vmovss  0(%r13,%rdx,4), %xmm2
        vmulss  %xmm9, %xmm0, %xmm0
        vmulss  %xmm7, %xmm0, %xmm1
        vmulss  %xmm1, %xmm0, %xmm1
        vfmadd132ss     (%r12,%rdx,4), %xmm2, %xmm0
        vfnmadd132ss    %xmm2, %xmm0, %xmm1
        vmulss  12(%r14), %xmm1, %xmm1
        vfmsub132ss     28(%r14), %xmm5, %xmm1
        vmovss  %xmm1, -4(%rbx)
        cmpq    %rbx, -24(%rbp)
        jne     .L5
        movl    -36(%rbp), %ebx
        leal    -1(%rbx), %eax
        movq    %rax, %rbx
        vcvtsi2ssq      %rax, %xmm14, %xmm1
        salq    $2, %rax
.L2:
        vsubss  (%r15,%rax), %xmm1, %xmm0
        vcomiss %xmm1, %xmm0
        jb      .L8
        .p2align 4
        .p2align 3
.L10:
        leal    -1(%rbx), %eax
        vcvtsi2ssq      %rax, %xmm14, %xmm0
        vsubss  (%r15,%rax,4), %xmm0, %xmm0
        movq    %rax, %rbx
        vcomiss %xmm1, %xmm0
        jnb     .L10
.L8:
        testl   %ebx, %ebx
        je      .L24
        vmovss  .LC3(%rip), %xmm6
        movl    %ebx, %r9d
        vxorps  %xmm2, %xmm2, %xmm2
        xorl    %eax, %eax
        salq    $2, %r9
        vmovsd  .LC8(%rip), %xmm3
        vmovaps %xmm2, %xmm1
        .p2align 4
        .p2align 3
.L14:
        vsubss  (%r15,%rax), %xmm1, %xmm0
        vaddss  %xmm6, %xmm1, %xmm1
        vcvtss2sd       %xmm0, %xmm0, %xmm0
        vaddsd  %xmm3, %xmm0, %xmm0
        vcvttsd2sil     %xmm0, %edx
        movslq  %edx, %rdx
        vmovss  (%rdi,%rdx,4), %xmm0
        vmovss  %xmm0, (%rsi,%rax)
        addq    $4, %rax
        vaddss  %xmm0, %xmm2, %xmm2
        cmpq    %rax, %r9
        jne     .L14
.L13:
        movl    (%r14), %r8d
        vdivss  %xmm1, %xmm2, %xmm2
        cmpl    %r8d, %ebx
        jnb     .L27
        movl    %r8d, %edx
        subl    %ebx, %edx
        leal    -1(%rdx), %eax
        cmpl    $6, %eax
        jbe     .L25
        movl    %edx, %ecx
        movl    %ebx, %eax
        vbroadcastss    %xmm2, %ymm0
        shrl    $3, %ecx
        salq    $5, %rcx
        leaq    (%rsi,%rax,4), %rax
        leaq    (%rcx,%rax), %r9
        andl    $32, %ecx
        je      .L17
        vmovups %ymm0, (%rax)
        addq    $32, %rax
        cmpq    %rax, %r9
        je      .L44
        .p2align 4
        .p2align 3
.L17:
        vmovups %ymm0, (%rax)
        addq    $64, %rax
        vmovups %ymm0, -32(%rax)
        cmpq    %rax, %r9
        jne     .L17
.L44:
        movl    %edx, %eax
        andl    $-8, %eax
        leal    (%rbx,%rax), %ecx
        testb   $7, %dl
        je      .L47
        vzeroupper
.L16:
        subl    %eax, %edx
        leal    -1(%rdx), %r9d
        cmpl    $2, %r9d
        jbe     .L21
        movl    %ebx, %ebx
        vshufps $0, %xmm2, %xmm2, %xmm0
        addq    %rbx, %rax
        vmovups %xmm0, (%rsi,%rax,4)
        movl    %edx, %eax
        andl    $-4, %eax
        addl    %eax, %ecx
        andl    $3, %edx
        je      .L27
.L21:
        movl    %ecx, %eax
        vmovss  %xmm2, (%rsi,%rax,4)
        leal    1(%rcx), %eax
        cmpl    %r8d, %eax
        jnb     .L27
        addl    $2, %ecx
        vmovss  %xmm2, (%rsi,%rax,4)
        cmpl    %r8d, %ecx
        jnb     .L27
        vmovss  %xmm2, (%rsi,%rcx,4)
.L27:
        vmovaps 0(%rbp), %xmm6
        vmovaps 16(%rbp), %xmm7
        vmovaps 32(%rbp), %xmm8
        xorl    %eax, %eax
        vmovaps 48(%rbp), %xmm9
        vmovaps 64(%rbp), %xmm10
        vmovaps 80(%rbp), %xmm11
        vmovaps 96(%rbp), %xmm12
        vmovaps 112(%rbp), %xmm13
        vmovaps 128(%rbp), %xmm14
        addq    $232, %rsp
        popq    %rbx
        popq    %rsi
        popq    %rdi
        popq    %r12
        popq    %r13
        popq    %r14
        popq    %r15
        popq    %rbp
        ret
        .p2align 4
        .p2align 3
.L24:
        vxorps  %xmm2, %xmm2, %xmm2
        vmovaps %xmm2, %xmm1
        jmp     .L13
        .p2align 4
        .p2align 3
.L23:
        vmovss  .LC1(%rip), %xmm1
        movabsq $17179869180, %rax
        movl    $-1, %ebx
        jmp     .L2
        .p2align 4
        .p2align 3
.L47:
        vzeroupper
        jmp     .L27
.L25:
        movl    %ebx, %ecx
        xorl    %eax, %eax
        jmp     .L16
        .seh_endproc
        .globl  cosSamples
        .data
        .align 32
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
        .section .rdata,"dr"
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
        .align 8
.LC8:
        .long   0
        .long   1071644672
        .ident  "GCC: (MinGW-W64 x86_64-ucrt-mcf-seh, built by Brecht Sanders) 13.1.0"
        .def    modff;  .scl        2;      .type       32;   .endef
        .section        .rdata$.refptr.del_t, "dr"
        .globl  .refptr.del_t
        .linkonce       discard
.refptr.del_t:
        .quad   del_t