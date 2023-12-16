# demod_binary_resamp_cpu_asm compiled with gcc 13.2.0 with flags: -O3 -m64 -march=bdver1 -mtune=znver4 -mno-avx -fno-omit-frame-pointer -g0 -DNDEBUG
  .file "demod_binary_resamp_cpu_asm.c"
  .text
  .p2align 4
  .globl run_resampling
  .type run_resampling, @function
run_resampling:
  .cfi_startproc
  pushq %rbp
  .cfi_def_cfa_offset 16
  .cfi_offset 6, -16
  movq %rsp, %rbp
  .cfi_def_cfa_register 6
  pushq %r15
  pushq %r14
  pushq %r13
  pushq %r12
  pushq %rbx
  .cfi_offset 15, -24
  .cfi_offset 14, -32
  .cfi_offset 13, -40
  .cfi_offset 12, -48
  .cfi_offset 3, -56
  movq %rdi, %r13
  movq %rsi, %r12
  subq $56, %rsp
  movl 4(%rdx), %eax
  movq del_t(%rip), %r14
  movq %rdx, %r15
  movl %eax, -84(%rbp)
  testl %eax, %eax
  je .L21
  movss .LC3(%rip), %xmm6
  movl %eax, %ecx
  movq %r14, %rbx
  pxor %xmm2, %xmm2
  leaq (%r14,%rcx,4), %rax
  movq %rax, -80(%rbp)
  movss %xmm6, -68(%rbp)
  .p2align 4
  .p2align 3
.L5:
  movaps %xmm2, %xmm0
  mulss 24(%r15), %xmm0
  leaq -52(%rbp), %rdi
  movss %xmm2, -72(%rbp)
  mulss 16(%r15), %xmm0
  addss 20(%r15), %xmm0
  mulss .LC2(%rip), %xmm0
  call modff
  pxor %xmm5, %xmm5
  movss -72(%rbp), %xmm2
  comiss %xmm0, %xmm5
  jbe .L3
  addss -68(%rbp), %xmm0
.L3:
  movss .LC4(%rip), %xmm1
  movss .LC5(%rip), %xmm4
  addss -68(%rbp), %xmm2
  addq $4, %rbx
  mulss %xmm0, %xmm1
  addss .LC5(%rip), %xmm1
  cvttss2sil %xmm1, %ecx
  pxor %xmm1, %xmm1
  cvtsi2ssl %ecx, %xmm1
  mulss .LC6(%rip), %xmm1
  movslq %ecx, %rcx
  movss sinSamples(,%rcx,4), %xmm3
  subss %xmm1, %xmm0
  mulss .LC7(%rip), %xmm0
  movss cosSamples(,%rcx,4), %xmm1
  mulss %xmm0, %xmm4
  mulss %xmm0, %xmm1
  mulss %xmm4, %xmm0
  addss %xmm3, %xmm1
  mulss %xmm3, %xmm0
  subss %xmm0, %xmm1
  mulss 12(%r15), %xmm1
  movss 28(%r15), %xmm0
  mulss %xmm1, %xmm0
  subss 32(%r15), %xmm0
  movss %xmm0, -4(%rbx)
  cmpq %rbx, -80(%rbp)
  jne .L5
  movl -84(%rbp), %ebx
  pxor %xmm1, %xmm1
  leal -1(%rbx), %eax
  movq %rax, %rbx
  cvtsi2ssq %rax, %xmm1
  salq $2, %rax
.L2:
  movaps %xmm1, %xmm0
  subss (%r14,%rax), %xmm0
  comiss %xmm1, %xmm0
  jb .L8
  .p2align 4
  .p2align 3
.L10:
  leal -1(%rbx), %eax
  pxor %xmm0, %xmm0
  cvtsi2ssq %rax, %xmm0
  subss (%r14,%rax,4), %xmm0
  movq %rax, %rbx
  comiss %xmm1, %xmm0
  jnb .L10
.L8:
  testl %ebx, %ebx
  je .L22
  movss .LC3(%rip), %xmm7
  movl %ebx, %esi
  pxor %xmm2, %xmm2
  xorl %eax, %eax
  salq $2, %rsi
  movsd .LC8(%rip), %xmm3
  movaps %xmm2, %xmm1
  movss %xmm7, -68(%rbp)
  .p2align 4
  .p2align 3
.L14:
  movaps %xmm1, %xmm0
  subss (%r14,%rax), %xmm0
  addss -68(%rbp), %xmm1
  cvtss2sd %xmm0, %xmm0
  addsd %xmm3, %xmm0
  cvttsd2sil %xmm0, %ecx
  movslq %ecx, %rcx
  movss 0(%r13,%rcx,4), %xmm0
  movss %xmm0, (%r12,%rax)
  addq $4, %rax
  addss %xmm0, %xmm2
  cmpq %rax, %rsi
  jne .L14
.L13:
  movl (%r15), %ecx
  divss %xmm1, %xmm2
  cmpl %ecx, %ebx
  jnb .L24
  movl %ecx, %esi
  subl %ebx, %esi
  leal -1(%rsi), %eax
  cmpl $2, %eax
  jbe .L16
  movl %esi, %edx
  movl %ebx, %eax
  movaps %xmm2, %xmm0
  shrl $2, %edx
  shufps $0, %xmm0, %xmm0
  salq $4, %rdx
  leaq (%r12,%rax,4), %rax
  leaq (%rdx,%rax), %rdi
  andl $16, %edx
  je .L17
  movups %xmm0, (%rax)
  addq $16, %rax
  cmpq %rdi, %rax
  je .L38
  .p2align 4
  .p2align 3
.L17:
  movups %xmm0, (%rax)
  addq $32, %rax
  movups %xmm0, -16(%rax)
  cmpq %rdi, %rax
  jne .L17
.L38:
  movl %esi, %eax
  andl $-4, %eax
  addl %eax, %ebx
  andl $3, %esi
  je .L24
.L16:
  movl %ebx, %eax
  movss %xmm2, (%r12,%rax,4)
  leal 1(%rbx), %eax
  cmpl %ecx, %eax
  jnb .L24
  addl $2, %ebx
  movss %xmm2, (%r12,%rax,4)
  cmpl %ecx, %ebx
  jnb .L24
  movss %xmm2, (%r12,%rbx,4)
.L24:
  addq $56, %rsp
  xorl %eax, %eax
  popq %rbx
  popq %r12
  popq %r13
  popq %r14
  popq %r15
  popq %rbp
  .cfi_remember_state
  .cfi_def_cfa 7, 8
  ret
  .p2align 4
  .p2align 3
.L22:
  .cfi_restore_state
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
  .cfi_endproc
  .size run_resampling, .-run_resampling
  .globl cosSamples
  .data
  .align 32
  .type cosSamples, @object
  .size cosSamples, 260
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
  .type sinSamples, @object
  .size sinSamples, 260
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
  .section .rodata.cst4,"aM",@progbits,4
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
  .section .rodata.cst8,"aM",@progbits,8
  .align 8
.LC8:
  .long 0
  .long 1071644672
  .ident "GCC: (Compiler-Explorer-Build-gcc--binutils-2.40) 13.2.0"
  .section .note.GNU-stack,"",@progbits
