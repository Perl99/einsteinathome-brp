# hs_common compiled with MinGW gcc 13.1.0 with flags: -O3 -m64 -march=bdver1 -mtune=znver4 -mno-avx -fno-omit-frame-pointer
  .file "hs_common.c"
  .text
  .p2align 4
  .globl harmonic_summing
  .def harmonic_summing; .scl 2; .type 32; .endef
  .seh_proc harmonic_summing
harmonic_summing:
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
  subq $136, %rsp
  .seh_stackalloc 136
  leaq 80(%rsp), %rbp
  .seh_setframe %rbp, 80
  movaps %xmm6, 0(%rbp)
  .seh_savexmm %xmm6, 80
  movaps %xmm7, 16(%rbp)
  .seh_savexmm %xmm7, 96
  movaps %xmm8, 32(%rbp)
  .seh_savexmm %xmm8, 112
  .seh_endprologue
  movd %r9d, %xmm6
  movdqa .LC1(%rip), %xmm7
  movdqa .LC3(%rip), %xmm1
  movq %rcx, %r14
  pshufd $0, %xmm6, %xmm0
  movdqa .LC4(%rip), %xmm6
  movdqa .LC2(%rip), %xmm8
  movl 160(%rbp), %ebx
  movl %r9d, %ecx
  movq %rdx, 136(%rbp)
  pmulld %xmm0, %xmm7
  pmulld %xmm0, %xmm1
  pmulld %xmm0, %xmm6
  pmulld .LC5(%rip), %xmm0
  paddd %xmm8, %xmm7
  paddd %xmm8, %xmm1
  paddd %xmm8, %xmm6
  paddd %xmm8, %xmm0
  cmpl 168(%rbp), %r9d
  jnb .L2
  movl %ecx, %eax
  pextrd $3, %xmm7, %esi
  pextrd $1, %xmm7, %r9d
  pextrd $2, %xmm1, %edx
  leaq (%r8,%rax,4), %r15
  leal (%rsi,%rsi), %eax
  subl %ecx, %r9d
  movd %xmm6, -28(%rbp)
  subl %eax, %edx
  movd %xmm1, -32(%rbp)
  movl $-1, %r12d
  movl $-1, %r11d
  movd %xmm0, -24(%rbp)
  movl %edx, -68(%rbp)
  movl $-1, -4(%rbp)
  movl $-1, -8(%rbp)
  pextrd $2, %xmm7, -20(%rbp)
  movl %r9d, -72(%rbp)
  pextrd $2, %xmm0, -16(%rbp)
  pextrd $2, %xmm6, -12(%rbp)
  pextrd $3, %xmm0, -48(%rbp)
  pextrd $1, %xmm0, -44(%rbp)
  pextrd $3, %xmm6, -40(%rbp)
  pextrd $1, %xmm6, -36(%rbp)
  pextrd $3, %xmm1, -52(%rbp)
  pextrd $1, %xmm1, -56(%rbp)
  jmp .L32
  .p2align 4
  .p2align 3
.L61:
  movq 176(%rbp), %r10
  movaps %xmm0, %xmm7
  maxss %xmm3, %xmm7
  movaps %xmm7, %xmm3
  comiss 4(%r10), %xmm7
  jbe .L56
  movq 8(%r14), %r10
  movss %xmm7, (%r10,%rdi)
  movq 136(%rbp), %rdi
  movl %r9d, %r10d
  sarl $10, %r10d
  movslq %r10d, %r10
  movq 8(%rdi), %r11
  movl $1, (%r11,%r10,4)
.L5:
  movl -32(%rbp), %r10d
  movl -24(%rbp), %r11d
  shrl $4, %r10d
  shrl $4, %r11d
  movl %r10d, %edi
  movss (%r8,%r11,4), %xmm1
  addss (%r8,%rdi,4), %xmm1
  leaq 0(,%rdi,4), %r13
  addss %xmm0, %xmm1
  cmpl %r12d, %r10d
  je .L11
  pxor %xmm4, %xmm4
.L11:
  cmpl %ebx, %r10d
  jnb .L36
  movq 176(%rbp), %rdi
  movaps %xmm1, %xmm6
  maxss %xmm4, %xmm6
  movaps %xmm6, %xmm4
  comiss 8(%rdi), %xmm6
  jbe .L57
  movq 136(%rbp), %rdi
  movq 16(%r14), %r11
  movq 16(%rdi), %rdi
  movss %xmm6, (%r11,%r13)
  movl %r10d, %r11d
  sarl $10, %r11d
  movslq %r11d, %r11
  movl $1, (%rdi,%r11,4)
.L12:
  movl -20(%rbp), %r11d
  movl -16(%rbp), %r12d
  shrl $4, %eax
  shrl $4, %r11d
  movl %r11d, %r13d
  leaq 0(,%r13,4), %rdi
  movq %rdi, -64(%rbp)
  movl -12(%rbp), %edi
  shrl $4, %r12d
  movss (%r8,%r12,4), %xmm0
  shrl $4, %edi
  addss (%r8,%rdi,4), %xmm0
  addss (%r8,%rax,4), %xmm0
  movl -8(%rbp), %eax
  addss (%r8,%r13,4), %xmm0
  addss %xmm1, %xmm0
  cmpl %eax, %r11d
  je .L18
  pxor %xmm5, %xmm5
.L18:
  cmpl %ebx, %r11d
  jnb .L38
  movq 176(%rbp), %rax
  movaps %xmm0, %xmm7
  maxss %xmm5, %xmm7
  movaps %xmm7, %xmm5
  comiss 12(%rax), %xmm7
  jbe .L58
  movq 24(%r14), %rax
  movq -64(%rbp), %rdi
  movss %xmm7, (%rax,%rdi)
  movq 136(%rbp), %rdi
  movl %r11d, %eax
  sarl $10, %eax
  cltq
  movq 24(%rdi), %rdi
  movl $1, (%rdi,%rax,4)
.L19:
  shrl $4, %edx
  cmpl %edx, -4(%rbp)
  je .L25
  pxor %xmm2, %xmm2
.L25:
  cmpl %ebx, %edx
  jnb .L40
  movl -48(%rbp), %edi
  movl -44(%rbp), %eax
  movl %edx, %r12d
  leaq 0(,%r12,4), %r13
  shrl $4, %eax
  shrl $4, %edi
  movss (%r8,%rdi,4), %xmm1
  addss (%r8,%rax,4), %xmm1
  movl -40(%rbp), %eax
  shrl $4, %eax
  addss (%r8,%rax,4), %xmm1
  movl -36(%rbp), %eax
  shrl $4, %eax
  addss (%r8,%rax,4), %xmm1
  movl -52(%rbp), %eax
  shrl $4, %eax
  addss (%r8,%rax,4), %xmm1
  movl -56(%rbp), %eax
  shrl $4, %eax
  addss (%r8,%rax,4), %xmm1
  movl %esi, %eax
  shrl $4, %eax
  addss (%r8,%rax,4), %xmm1
  movq 176(%rbp), %rax
  addss (%r8,%r12,4), %xmm1
  addss %xmm1, %xmm0
  maxss %xmm2, %xmm0
  comiss 16(%rax), %xmm0
  movaps %xmm0, %xmm2
  jbe .L59
  movq 136(%rbp), %rdi
  movq 32(%r14), %rax
  movq 32(%rdi), %rdi
  movss %xmm0, (%rax,%r13)
  movl %edx, %eax
  sarl $10, %eax
  cltq
  movl $1, (%rdi,%rax,4)
.L26:
  incl %ecx
  addl $3, %esi
  addq $4, %r15
  addl $2, -20(%rbp)
  addl $4, -32(%rbp)
  addl $7, -52(%rbp)
  addl $8, -28(%rbp)
  addl $9, -36(%rbp)
  addl $10, -12(%rbp)
  addl $11, -40(%rbp)
  addl $12, -24(%rbp)
  addl $13, -44(%rbp)
  addl $14, -16(%rbp)
  addl $15, -48(%rbp)
  addl $5, -56(%rbp)
  cmpl %ecx, 168(%rbp)
  je .L2
  movl %r11d, -8(%rbp)
  movl %r10d, %r12d
  movl %r9d, %r11d
  leal (%rsi,%rsi), %eax
  movl %edx, -4(%rbp)
.L32:
  movl -68(%rbp), %edx
  movq 176(%rbp), %rdi
  movss (%r15), %xmm0
  addl %edx, %eax
  movl -72(%rbp), %edx
  addl %ecx, %edx
  comiss (%rdi), %xmm0
  jbe .L3
  cmpl %ebx, %ecx
  jnb .L3
  movq 136(%rbp), %rdi
  movl %ecx, %r9d
  shrl $10, %r9d
  movq (%rdi), %r10
  movl $1, (%r10,%r9,4)
.L3:
  movl -28(%rbp), %r9d
  shrl $4, %r9d
  movl %r9d, %r10d
  addss (%r8,%r10,4), %xmm0
  leaq 0(,%r10,4), %rdi
  cmpl %r11d, %r9d
  je .L4
  pxor %xmm3, %xmm3
.L4:
  cmpl %ebx, %r9d
  jb .L61
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
  cmpl %r12d, %r10d
  je .L12
  movq 16(%r14), %r11
  movss %xmm6, (%r11,%r13)
  jmp .L12
  .p2align 4
  .p2align 3
.L59:
  cmpl %edx, -4(%rbp)
  je .L26
  movq 32(%r14), %rax
  movss %xmm0, (%rax,%r13)
  jmp .L26
  .p2align 4
  .p2align 3
.L56:
  cmpl %r11d, %r9d
  je .L5
  movq 8(%r14), %r10
  movss %xmm7, (%r10,%rdi)
  jmp .L5
  .p2align 4
  .p2align 3
.L58:
  movl -8(%rbp), %eax
  cmpl %eax, %r11d
  je .L19
  movq 24(%r14), %rax
  movq -64(%rbp), %rdi
  movss %xmm7, (%rax,%rdi)
  jmp .L19
.L2:
  movaps 0(%rbp), %xmm6
  movaps 16(%rbp), %xmm7
  movaps 32(%rbp), %xmm8
  xorl %eax, %eax
  addq $136, %rsp
  popq %rbx
  popq %rsi
  popq %rdi
  popq %r12
  popq %r13
  popq %r14
  popq %r15
  popq %rbp
  ret
  .seh_endproc
  .section .rdata,"dr"
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
  .ident "GCC: (MinGW-W64 x86_64-ucrt-mcf-seh, built by Brecht Sanders) 13.1.0"
