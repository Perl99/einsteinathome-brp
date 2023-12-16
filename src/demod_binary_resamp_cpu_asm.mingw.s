# demod_binary_resamp_cpu_asm compiled with gcc 13.1.0 with flags: -O3 -m64 -march=bdver1 -mtune=znver4 -mno-avx -fno-omit-frame-pointer -g0 -DNDEBUG
  .file "demod_binary_resamp_cpu_asm.c"
  .text
  .p2align 4
  .globl run_resampling
  .def run_resampling; .scl 2; .type 32; .endef
  .seh_proc run_resampling
run_resampling:
  pushq %rbp
  .seh_pushreg %rbp
  pushq %r15
  .seh_pushreg %r15
  pushq %r14
  .seh_pushreg %r14
  pushq %r13
  .seh_pushreg %r13
  pushq %r12
  .seh_pushreg %r12
  pushq %rdi
  .seh_pushreg %rdi
  pushq %rsi
  .seh_pushreg %rsi
  pushq %rbx
  .seh_pushreg %rbx
  subq $216, %rsp
  .seh_stackalloc 216
  leaq 80(%rsp), %rbp
  .seh_setframe %rbp, 80
  movaps %xmm6, 0(%rbp)
  .seh_savexmm %xmm6, 80
  movaps %xmm7, 16(%rbp)
  .seh_savexmm %xmm7, 96
  movaps %xmm8, 32(%rbp)
  .seh_savexmm %xmm8, 112
  movaps %xmm9, 48(%rbp)
  .seh_savexmm %xmm9, 128
  movaps %xmm10, 64(%rbp)
  .seh_savexmm %xmm10, 144
  movaps %xmm11, 80(%rbp)
  .seh_savexmm %xmm11, 160
  movaps %xmm12, 96(%rbp)
  .seh_savexmm %xmm12, 176
  movaps %xmm13, 112(%rbp)
  .seh_savexmm %xmm13, 192
  .seh_endprologue
  movq .refptr.del_t(%rip), %rax
  movq %rcx, %rdi
  movl 4(%r8), %ecx
  movq %rdx, %rsi
  movq %r8, %r14
  movq (%rax), %r15
  movl %ecx, -36(%rbp)
  testl %ecx, %ecx
  je .L21
  movss .LC2(%rip), %xmm12
  movss .LC3(%rip), %xmm6
  movss .LC4(%rip), %xmm11
  movl %ecx, %edx
  movss .LC5(%rip), %xmm7
  movss .LC6(%rip), %xmm10
  movss .LC7(%rip), %xmm9
  leaq (%r15,%rdx,4), %rax
  movq %rax, -24(%rbp)
  pxor %xmm13, %xmm13
  leaq -4(%rbp), %rax
  movq %r15, %rbx
  leaq sinSamples(%rip), %r13
  leaq cosSamples(%rip), %r12
  movaps %xmm13, %xmm8
  movq %rax, -32(%rbp)
  .p2align 4
  .p2align 3
.L5:
  movss 24(%r14), %xmm0
  movq -32(%rbp), %rdx
  mulss %xmm13, %xmm0
  mulss 16(%r14), %xmm0
  addss 20(%r14), %xmm0
  mulss %xmm12, %xmm0
  call modff
  comiss %xmm0, %xmm8
  jbe .L3
  addss %xmm6, %xmm0
.L3:
  movaps %xmm0, %xmm1
  addss %xmm6, %xmm13
  addq $4, %rbx
  mulss %xmm11, %xmm1
  addss %xmm7, %xmm1
  cvttss2sil %xmm1, %edx
  pxor %xmm1, %xmm1
  cvtsi2ssl %edx, %xmm1
  mulss %xmm10, %xmm1
  movslq %edx, %rdx
  movss 0(%r13,%rdx,4), %xmm2
  subss %xmm1, %xmm0
  movss (%r12,%rdx,4), %xmm1
  mulss %xmm9, %xmm0
  movaps %xmm0, %xmm3
  mulss %xmm0, %xmm1
  mulss %xmm7, %xmm3
  addss %xmm2, %xmm1
  mulss %xmm3, %xmm0
  mulss %xmm2, %xmm0
  subss %xmm0, %xmm1
  mulss 12(%r14), %xmm1
  movss 28(%r14), %xmm0
  mulss %xmm1, %xmm0
  subss 32(%r14), %xmm0
  movss %xmm0, -4(%rbx)
  cmpq %rbx, -24(%rbp)
  jne .L5
  movl -36(%rbp), %ebx
  pxor %xmm1, %xmm1
  leal -1(%rbx), %eax
  movq %rax, %rbx
  cvtsi2ssq %rax, %xmm1
  salq $2, %rax
.L2:
  movaps %xmm1, %xmm0
  subss (%r15,%rax), %xmm0
  comiss %xmm1, %xmm0
  jb .L8
  .p2align 4
  .p2align 3
.L10:
  leal -1(%rbx), %eax
  pxor %xmm0, %xmm0
  cvtsi2ssq %rax, %xmm0
  subss (%r15,%rax,4), %xmm0
  movq %rax, %rbx
  comiss %xmm1, %xmm0
  jnb .L10
.L8:
  testl %ebx, %ebx
  je .L22
  movss .LC3(%rip), %xmm6
  movl %ebx, %r9d
  pxor %xmm2, %xmm2
  xorl %eax, %eax
  salq $2, %r9
  movsd .LC8(%rip), %xmm3
  movaps %xmm2, %xmm1
  .p2align 4
  .p2align 3
.L14:
  movaps %xmm1, %xmm0
  subss (%r15,%rax), %xmm0
  addss %xmm6, %xmm1
  cvtss2sd %xmm0, %xmm0
  addsd %xmm3, %xmm0
  cvttsd2sil %xmm0, %edx
  movslq %edx, %rdx
  movss (%rdi,%rdx,4), %xmm0
  movss %xmm0, (%rsi,%rax)
  addq $4, %rax
  addss %xmm0, %xmm2
  cmpq %rax, %r9
  jne .L14
.L13:
  movl (%r14), %ecx
  divss %xmm1, %xmm2
  cmpl %ecx, %ebx
  jnb .L24
  movl %ecx, %r8d
  subl %ebx, %r8d
  leal -1(%r8), %eax
  cmpl $2, %eax
  jbe .L16
  movl %r8d, %edx
  movl %ebx, %eax
  movaps %xmm2, %xmm0
  shrl $2, %edx
  shufps $0, %xmm0, %xmm0
  salq $4, %rdx
  leaq (%rsi,%rax,4), %rax
  leaq (%rdx,%rax), %r9
  andl $16, %edx
  je .L17
  movups %xmm0, (%rax)
  addq $16, %rax
  cmpq %r9, %rax
  je .L38
  .p2align 4
  .p2align 3
.L17:
  movups %xmm0, (%rax)
  addq $32, %rax
  movups %xmm0, -16(%rax)
  cmpq %r9, %rax
  jne .L17
.L38:
  movl %r8d, %eax
  andl $-4, %eax
  addl %eax, %ebx
  andl $3, %r8d
  je .L24
.L16:
  movl %ebx, %eax
  movss %xmm2, (%rsi,%rax,4)
  leal 1(%rbx), %eax
  cmpl %ecx, %eax
  jnb .L24
  addl $2, %ebx
  movss %xmm2, (%rsi,%rax,4)
  cmpl %ecx, %ebx
  jnb .L24
  movss %xmm2, (%rsi,%rbx,4)
.L24:
  movaps 0(%rbp), %xmm6
  movaps 16(%rbp), %xmm7
  movaps 32(%rbp), %xmm8
  xorl %eax, %eax
  movaps 48(%rbp), %xmm9
  movaps 64(%rbp), %xmm10
  movaps 80(%rbp), %xmm11
  movaps 96(%rbp), %xmm12
  movaps 112(%rbp), %xmm13
  addq $216, %rsp
  popq %rbx
  popq %rsi
  popq %rdi
  popq %r12
  popq %r13
  popq %r14
  popq %r15
  popq %rbp
  ret
  .p2align 4
  .p2align 3
.L22:
  pxor %xmm2, %xmm2
  movaps %xmm2, %xmm1
  jmp .L13
  .p2align 4
  .p2align 3
.L21:
  movss .LC1(%rip), %xmm1
  movabsq $17179869180, %rax
  movl $-1, %ebx
  jmp .L2
  .seh_endproc
  .globl cosSamples
  .data
  .align 32
cosSamples:
  .long 1065353216
  .long 1065272434
  .long 1065030842
  .long 1064630789
  .long 1064076134
  .long 1063372179
  .long 1062525752
  .long 1061544956
  .long 1060439287
  .long 1059219348
  .long 1057896918
  .long 1056004851
  .long 1053028103
  .long 1049927740
  .long 1044891052
  .long 1036565795
  .long 0
  .long -1110917853
  .long -1102592596
  .long -1097555908
  .long -1094455545
  .long -1091478797
  .long -1089586730
  .long -1088264300
  .long -1087044361
  .long -1085938692
  .long -1084957896
  .long -1084111469
  .long -1083407514
  .long -1082852859
  .long -1082452806
  .long -1082211214
  .long -1082130432
  .long -1082211214
  .long -1082452806
  .long -1082852859
  .long -1083407514
  .long -1084111469
  .long -1084957896
  .long -1085938675
  .long -1087044361
  .long -1088264300
  .long -1089586730
  .long -1091478797
  .long -1094455512
  .long -1097555908
  .long -1102592596
  .long -1110917853
  .long 0
  .long 1036565795
  .long 1044891052
  .long 1049927740
  .long 1053028103
  .long 1056004851
  .long 1057896918
  .long 1059219348
  .long 1060439287
  .long 1061544956
  .long 1062525752
  .long 1063372179
  .long 1064076118
  .long 1064630789
  .long 1065030842
  .long 1065272434
  .long 1065353216
  .globl sinSamples
  .align 32
sinSamples:
  .long 0
  .long 1036565795
  .long 1044891052
  .long 1049927740
  .long 1053028103
  .long 1056004851
  .long 1057896918
  .long 1059219348
  .long 1060439287
  .long 1061544956
  .long 1062525752
  .long 1063372179
  .long 1064076134
  .long 1064630789
  .long 1065030842
  .long 1065272434
  .long 1065353216
  .long 1065272434
  .long 1065030842
  .long 1064630789
  .long 1064076134
  .long 1063372179
  .long 1062525752
  .long 1061544956
  .long 1060439287
  .long 1059219348
  .long 1057896918
  .long 1056004851
  .long 1053028103
  .long 1049927740
  .long 1044891119
  .long 1036565795
  .long 0
  .long -1110917853
  .long -1102592596
  .long -1097555941
  .long -1094455545
  .long -1091478797
  .long -1089586730
  .long -1088264300
  .long -1087044361
  .long -1085938692
  .long -1084957913
  .long -1084111469
  .long -1083407514
  .long -1082852859
  .long -1082452806
  .long -1082211214
  .long -1082130432
  .long -1082211214
  .long -1082452806
  .long -1082852859
  .long -1083407514
  .long -1084111469
  .long -1084957896
  .long -1085938675
  .long -1087044361
  .long -1088264283
  .long -1089586730
  .long -1091478797
  .long -1094455512
  .long -1097555908
  .long -1102592529
  .long -1110917853
  .long -2147483648
  .section .rdata,"dr"
  .align 4
.LC1:
  .long 1333788672
  .align 4
.LC2:
  .long 1042479492
  .align 4
.LC3:
  .long 1065353216
  .align 4
.LC4:
  .long 1115684864
  .align 4
.LC5:
  .long 1056964608
  .align 4
.LC6:
  .long 1015021568
  .align 4
.LC7:
  .long 1086918618
  .align 8
.LC8:
  .long 0
  .long 1071644672
  .ident "GCC: (MinGW-W64 x86_64-ucrt-mcf-seh, built by Brecht Sanders) 13.1.0"
  .def modff; .scl 2; .type 32; .endef
  .section .rdata$.refptr.del_t, "dr"
  .globl .refptr.del_t
  .linkonce discard
.refptr.del_t:
  .quad del_t
