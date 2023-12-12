# hs_common compiled with gcc 13.2.0 with flags: -O3 -m64 -march=bdver1 -mtune=znver4 -mno-avx -fno-omit-frame-pointer
  .file "hs_common.c"
  .text
  .p2align 4
  .globl harmonic_summing
  .type harmonic_summing, @function
harmonic_summing:
  .cfi_startproc
  pushq %rbp
  .cfi_def_cfa_offset 16
  .cfi_offset 6, -16
  movd %ecx, %xmm6
  movq %rsp, %rbp
  .cfi_def_cfa_register 6
  pushq %r15
  pushq %r14
  pushq %r13
  pushq %r12
  pushq %rbx
  pshufd $0, %xmm6, %xmm0
  .cfi_offset 15, -24
  .cfi_offset 14, -32
  .cfi_offset 13, -40
  .cfi_offset 12, -48
  .cfi_offset 3, -56
  movq %rsi, -120(%rbp)
  movl %r9d, -124(%rbp)
  movdqa .LC1(%rip), %xmm7
  movdqa .LC3(%rip), %xmm1
  movdqa .LC4(%rip), %xmm6
  movdqa .LC2(%rip), %xmm8
  pmulld %xmm0, %xmm7
  pmulld %xmm0, %xmm1
  pmulld %xmm0, %xmm6
  pmulld .LC5(%rip), %xmm0
  paddd %xmm8, %xmm7
  paddd %xmm8, %xmm1
  paddd %xmm8, %xmm6
  paddd %xmm8, %xmm0
  cmpl %r9d, %ecx
  jnb .L2
  movq %rdx, %rax
  movl %ecx, %edx
  movl %ecx, %esi
  pextrd $3, %xmm7, %r11d
  leaq (%rax,%rdx,4), %r15
  leal (%r11,%r11), %edx
  movq %rdi, %r14
  pextrd $2, %xmm1, %ecx
  pextrd $1, %xmm7, %edi
  subl %edx, %ecx
  subl %esi, %edi
  movd %xmm6, -76(%rbp)
  movd %xmm1, -80(%rbp)
  movl $-1, %r12d
  movl $-1, %r10d
  movl %ecx, -128(%rbp)
  movd %xmm0, -72(%rbp)
  movl $-1, -52(%rbp)
  movl $-1, -56(%rbp)
  movl %edi, -132(%rbp)
  pextrd $2, %xmm7, -68(%rbp)
  pextrd $2, %xmm0, -64(%rbp)
  pextrd $2, %xmm6, -60(%rbp)
  pextrd $3, %xmm0, -96(%rbp)
  pextrd $1, %xmm0, -92(%rbp)
  pextrd $3, %xmm6, -88(%rbp)
  pextrd $1, %xmm6, -84(%rbp)
  pextrd $3, %xmm1, -100(%rbp)
  pextrd $1, %xmm1, -104(%rbp)
  jmp .L32
  .p2align 4
  .p2align 3
.L62:
  movq 16(%rbp), %r9
  movaps %xmm0, %xmm7
  maxss %xmm3, %xmm7
  movaps %xmm7, %xmm3
  comiss 4(%r9), %xmm7
  jbe .L56
  movq 8(%r14), %r9
  movss %xmm7, (%r9,%rbx)
  movq -120(%rbp), %rbx
  movl %edi, %r9d
  sarl $10, %r9d
  movslq %r9d, %r9
  movq 8(%rbx), %r10
  movl $1, (%r10,%r9,4)
.L5:
  movl -80(%rbp), %r9d
  movl -72(%rbp), %r10d
  shrl $4, %r9d
  shrl $4, %r10d
  movl %r9d, %ebx
  movss (%rax,%r10,4), %xmm1
  addss (%rax,%rbx,4), %xmm1
  leaq 0(,%rbx,4), %r13
  addss %xmm0, %xmm1
  cmpl %r12d, %r9d
  je .L11
  pxor %xmm4, %xmm4
.L11:
  cmpl %r8d, %r9d
  jnb .L36
  movq 16(%rbp), %rbx
  movaps %xmm1, %xmm6
  maxss %xmm4, %xmm6
  movaps %xmm6, %xmm4
  comiss 8(%rbx), %xmm6
  jbe .L57
  movq -120(%rbp), %rbx
  movq 16(%r14), %r10
  movq 16(%rbx), %rbx
  movss %xmm6, (%r10,%r13)
  movl %r9d, %r10d
  sarl $10, %r10d
  movslq %r10d, %r10
  movl $1, (%rbx,%r10,4)
.L12:
  movl -68(%rbp), %r10d
  movl -64(%rbp), %r12d
  shrl $4, %edx
  shrl $4, %r10d
  movl %r10d, %r13d
  leaq 0(,%r13,4), %rbx
  movq %rbx, -112(%rbp)
  movl -60(%rbp), %ebx
  shrl $4, %r12d
  movss (%rax,%r12,4), %xmm0
  shrl $4, %ebx
  addss (%rax,%rbx,4), %xmm0
  addss (%rax,%rdx,4), %xmm0
  movl -56(%rbp), %edx
  addss (%rax,%r13,4), %xmm0
  addss %xmm1, %xmm0
  cmpl %edx, %r10d
  je .L18
  pxor %xmm5, %xmm5
.L18:
  cmpl %r8d, %r10d
  jnb .L38
  movq 16(%rbp), %rbx
  movaps %xmm0, %xmm7
  maxss %xmm5, %xmm7
  movaps %xmm7, %xmm5
  comiss 12(%rbx), %xmm7
  jbe .L58
  movq 24(%r14), %rdx
  movq -112(%rbp), %rbx
  movss %xmm7, (%rdx,%rbx)
  movq -120(%rbp), %rbx
  movl %r10d, %edx
  sarl $10, %edx
  movslq %edx, %rdx
  movq 24(%rbx), %rbx
  movl $1, (%rbx,%rdx,4)
.L19:
  shrl $4, %ecx
  cmpl %ecx, -52(%rbp)
  je .L25
  pxor %xmm2, %xmm2
.L25:
  cmpl %r8d, %ecx
  jnb .L40
  movl -96(%rbp), %ebx
  movl -92(%rbp), %edx
  movl %ecx, %r12d
  leaq 0(,%r12,4), %r13
  shrl $4, %ebx
  shrl $4, %edx
  movss (%rax,%rbx,4), %xmm1
  addss (%rax,%rdx,4), %xmm1
  movl -88(%rbp), %edx
  movq 16(%rbp), %rbx
  shrl $4, %edx
  addss (%rax,%rdx,4), %xmm1
  movl -84(%rbp), %edx
  shrl $4, %edx
  addss (%rax,%rdx,4), %xmm1
  movl -100(%rbp), %edx
  shrl $4, %edx
  addss (%rax,%rdx,4), %xmm1
  movl -104(%rbp), %edx
  shrl $4, %edx
  addss (%rax,%rdx,4), %xmm1
  movl %r11d, %edx
  shrl $4, %edx
  addss (%rax,%rdx,4), %xmm1
  addss (%rax,%r12,4), %xmm1
  addss %xmm1, %xmm0
  maxss %xmm2, %xmm0
  comiss 16(%rbx), %xmm0
  movaps %xmm0, %xmm2
  jbe .L59
  movq -120(%rbp), %rbx
  movq 32(%r14), %rdx
  movq 32(%rbx), %rbx
  movss %xmm0, (%rdx,%r13)
  movl %ecx, %edx
  sarl $10, %edx
  movslq %edx, %rdx
  movl $1, (%rbx,%rdx,4)
.L26:
  incl %esi
  addl $3, %r11d
  addq $4, %r15
  addl $2, -68(%rbp)
  addl $4, -80(%rbp)
  addl $7, -100(%rbp)
  addl $8, -76(%rbp)
  addl $9, -84(%rbp)
  addl $10, -60(%rbp)
  addl $11, -88(%rbp)
  addl $12, -72(%rbp)
  addl $13, -92(%rbp)
  addl $14, -64(%rbp)
  addl $15, -96(%rbp)
  addl $5, -104(%rbp)
  cmpl %esi, -124(%rbp)
  je .L2
  movl %r10d, -56(%rbp)
  movl %r9d, %r12d
  movl %edi, %r10d
  leal (%r11,%r11), %edx
  movl %ecx, -52(%rbp)
.L32:
  movl -128(%rbp), %ecx
  movq 16(%rbp), %rdi
  movss (%r15), %xmm0
  addl %ecx, %edx
  movl -132(%rbp), %ecx
  addl %esi, %ecx
  comiss (%rdi), %xmm0
  jbe .L3
  cmpl %r8d, %esi
  jnb .L3
  movq -120(%rbp), %rbx
  movl %esi, %edi
  shrl $10, %edi
  movq (%rbx), %r9
  movl $1, (%r9,%rdi,4)
.L3:
  movl -76(%rbp), %edi
  shrl $4, %edi
  movl %edi, %r9d
  addss (%rax,%r9,4), %xmm0
  leaq 0(,%r9,4), %rbx
  cmpl %r10d, %edi
  je .L4
  pxor %xmm3, %xmm3
.L4:
  cmpl %r8d, %edi
  jb .L62
  movaps %xmm2, %xmm3
  jmp .L5
  .p2align 4
  .p2align 3
.L40:
  movaps %xmm5, %xmm2
  jmp .L26
  .p2align 4
  .p2align 3
.L36:
  movaps %xmm3, %xmm4
  jmp .L12
  .p2align 4
  .p2align 3
.L38:
  movaps %xmm4, %xmm5
  jmp .L19
  .p2align 4
  .p2align 3
.L57:
  cmpl %r12d, %r9d
  je .L12
  movq 16(%r14), %r10
  movss %xmm6, (%r10,%r13)
  jmp .L12
  .p2align 4
  .p2align 3
.L59:
  cmpl %ecx, -52(%rbp)
  je .L26
  movq 32(%r14), %rdx
  movss %xmm0, (%rdx,%r13)
  jmp .L26
  .p2align 4
  .p2align 3
.L56:
  cmpl %r10d, %edi
  je .L5
  movq 8(%r14), %r9
  movss %xmm7, (%r9,%rbx)
  jmp .L5
  .p2align 4
  .p2align 3
.L58:
  movl -56(%rbp), %ebx
  cmpl %ebx, %r10d
  je .L19
  movq 24(%r14), %rdx
  movq -112(%rbp), %rbx
  movss %xmm7, (%rdx,%rbx)
  jmp .L19
.L2:
  popq %rbx
  xorl %eax, %eax
  popq %r12
  popq %r13
  popq %r14
  popq %r15
  popq %rbp
  .cfi_def_cfa 7, 8
  ret
  .cfi_endproc
  .size harmonic_summing, .-harmonic_summing
  .section .rodata.cst16,"aM",@progbits,16
  .align 16
.LC1:
  .long 0
  .long 1
  .long 2
  .long 3
  .align 16
.LC2:
  .long 8
  .long 8
  .long 8
  .long 8
  .align 16
.LC3:
  .long 4
  .long 5
  .long 6
  .long 7
  .align 16
.LC4:
  .long 8
  .long 9
  .long 10
  .long 11
  .align 16
.LC5:
  .long 12
  .long 13
  .long 14
  .long 15
  .ident "GCC: (Compiler-Explorer-Build-gcc--binutils-2.40) 13.2.0"
  .section .note.GNU-stack,"",@progbits
