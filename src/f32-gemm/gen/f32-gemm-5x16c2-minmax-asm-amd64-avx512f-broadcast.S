// Copyright 2025 Google LLC
//
// This source code is licensed under the BSD-style license found in the
// LICENSE file in the root directory of this source tree.

#include "src/xnnpack/assembly.h"
.PERMUTATION:
      .long   0
      .long   2
      .long   4
      .long   6
      .long   8
      .long   10
      .long   12
      .long   14
      .long   16
      .long   18
      .long   20
      .long   22
      .long   24
      .long   26
      .long   28
      .long   30

BEGIN_FUNCTION xnn_f32_gemm_minmax_ukernel_5x16c2__asm_amd64_avx512f_broadcast

      .intel_syntax noprefix
      # Free up GP registers.
      # Save register arguments for tail call to msan annotation helper.
      push rdi
      push rsi
      push rbx
      push rbp
      push r15
      push r14
      push r13
      push r12

      # load params to free up GP registers
      mov r13, [rsp + 96] # params
      vbroadcastss zmm0, dword ptr [r13]
      vbroadcastss zmm1, dword ptr [r13 + 4]

      # Load c pointer.
      mov r10, [rsp + 72]
      # Load cm_stride.
      mov r11, [rsp + 80]

      # Align the stack pointer.
      mov r13, rsp
      sub rsp, 64
      and rsp, 0xFFFFFFFFFFFFFFC0
      # Store the old stack pointer containing the return address
      mov [rsp], r13

      # Allocate some space on the stack.
      sub rsp, 192

      # Clamp a & c pointers if mr <= 1
      mov rax, rcx
      add rax, r8
      mov r13, r10
      add r13, r11
      cmp rdi, 1
      cmovle rax, rcx
      cmovle r13, r10

      # Clamp a & c pointers if mr <= 2
      mov r15, rax
      add r15, r8
      mov rbx, r13
      add rbx, r11
      cmp rdi, 2
      cmovle r15, rax
      cmovle rbx, r13

      # Clamp a & c pointers if mr <= 3
      mov r14, r15
      add r14, r8
      mov rbp, rbx
      add rbp, r11
      cmp rdi, 3
      cmovle r14, r15
      cmovle rbp, rbx

      # Clamp a & c pointers if mr <= 4
      mov r12, r14
      add r12, r8
      mov r8, rbp
      add r8, r11
      cmp rdi, 4
      cmovle r12, r14
      cmovle r8, rbp

      # Copy k and flip bit.
      mov r11, rdx
      and r11, 0x4
      and rdx, 0xFFFFFFFFFFFFFFFB
      mov [rsp + 104], r11
      mov r11, 0x5555
      kmovw k3, r11d

.Louter_loop:
      # Initialize k counter.
      mov r11, 0
      vmovaps  zmm7, [r9 + 0]
      # Interleave with zeros.
      vpmovzxdq zmm11, ymm7
      vextracti64x4 ymm7, zmm7, 1
      vpmovzxdq zmm16, ymm7
      vmovaps zmm12, zmm11
      vmovaps zmm13, zmm11
      vmovaps zmm14, zmm11
      vmovaps zmm15, zmm11
      vmovaps zmm17, zmm16
      vmovaps zmm18, zmm16
      vmovaps zmm19, zmm16
      vmovaps zmm20, zmm16
      add r9, 64

      # Are there at least 8 bytes?
      cmp rdx, 8
      js .Linner_loop_tail

.Linner_loop:
      vmovaps  zmm7, [r9 + 0]
      vmovaps  zmm8, [r9 + 64]
      add r9, 128
      vbroadcastsd zmm2, qword ptr [rcx + r11]
      vfmadd231ps  zmm11, zmm2, zmm7
      vfmadd231ps  zmm16, zmm2, zmm8
      vbroadcastsd zmm3, qword ptr [rax + r11]
      vfmadd231ps  zmm12, zmm3, zmm7
      vfmadd231ps  zmm17, zmm3, zmm8
      vbroadcastsd zmm4, qword ptr [r15 + r11]
      vfmadd231ps  zmm13, zmm4, zmm7
      vfmadd231ps  zmm18, zmm4, zmm8
      vbroadcastsd zmm5, qword ptr [r14 + r11]
      vfmadd231ps  zmm14, zmm5, zmm7
      vfmadd231ps  zmm19, zmm5, zmm8
      vbroadcastsd zmm6, qword ptr [r12 + r11]
      vfmadd231ps  zmm15, zmm6, zmm7
      vfmadd231ps  zmm20, zmm6, zmm8

      add r11, 8
      cmp rdx, r11
      jne .Linner_loop

      # Store nc_register.
      mov [rsp + 112], rsi
      # Load odd k bit.
      mov rsi, [rsp + 104]
      # Check if channels are odd.
      test rsi, rsi
      mov rsi, [rsp + 112]
      jz .Linner_loop_end

.Linner_loop_tail:
      vmovaps  zmm7, [r9 + 0]
      vmovaps  zmm8, [r9 + 64]
      add r9, 128
      vbroadcastsd zmm2, qword ptr [rcx + r11]
      vfmadd231ps  zmm11{k3}, zmm2, zmm7
      vfmadd231ps  zmm16{k3}, zmm2, zmm8
      vbroadcastsd zmm3, qword ptr [rax + r11]
      vfmadd231ps  zmm12{k3}, zmm3, zmm7
      vfmadd231ps  zmm17{k3}, zmm3, zmm8
      vbroadcastsd zmm4, qword ptr [r15 + r11]
      vfmadd231ps  zmm13{k3}, zmm4, zmm7
      vfmadd231ps  zmm18{k3}, zmm4, zmm8
      vbroadcastsd zmm5, qword ptr [r14 + r11]
      vfmadd231ps  zmm14{k3}, zmm5, zmm7
      vfmadd231ps  zmm19{k3}, zmm5, zmm8
      vbroadcastsd zmm6, qword ptr [r12 + r11]
      vfmadd231ps  zmm15{k3}, zmm6, zmm7
      vfmadd231ps  zmm20{k3}, zmm6, zmm8

.Linner_loop_end:
      vpsrlq zmm7, zmm11, 32
      vaddps zmm11, zmm11, zmm7
      vpsrlq zmm7, zmm12, 32
      vaddps zmm12, zmm12, zmm7
      vpsrlq zmm7, zmm13, 32
      vaddps zmm13, zmm13, zmm7
      vpsrlq zmm7, zmm14, 32
      vaddps zmm14, zmm14, zmm7
      vpsrlq zmm7, zmm15, 32
      vaddps zmm15, zmm15, zmm7
      vpsrlq zmm7, zmm16, 32
      vaddps zmm16, zmm16, zmm7
      vpsrlq zmm7, zmm17, 32
      vaddps zmm17, zmm17, zmm7
      vpsrlq zmm7, zmm18, 32
      vaddps zmm18, zmm18, zmm7
      vpsrlq zmm7, zmm19, 32
      vaddps zmm19, zmm19, zmm7
      vpsrlq zmm7, zmm20, 32
      vaddps zmm20, zmm20, zmm7
      vmovups zmm7, zmmword ptr [rip + .PERMUTATION]
      vpermt2ps zmm11, zmm7, zmm16
      vpermt2ps zmm12, zmm7, zmm17
      vpermt2ps zmm13, zmm7, zmm18
      vpermt2ps zmm14, zmm7, zmm19
      vpermt2ps zmm15, zmm7, zmm20
      # Min/max clamping.
      vminps  zmm11, zmm1, zmm11
      vminps  zmm12, zmm1, zmm12
      vminps  zmm13, zmm1, zmm13
      vminps  zmm14, zmm1, zmm14
      vminps  zmm15, zmm1, zmm15
      vmaxps  zmm11, zmm0, zmm11
      vmaxps  zmm12, zmm0, zmm12
      vmaxps  zmm13, zmm0, zmm13
      vmaxps  zmm14, zmm0, zmm14
      vmaxps  zmm15, zmm0, zmm15

      # Check whether full or partial store.
      cmp rsi, 16
      jl .Ltail

      vmovups  [r10], zmm11
      vmovups  [r13], zmm12
      vmovups  [rbx], zmm13
      vmovups  [rbp], zmm14
      vmovups  [r8], zmm15
      add r10, 64
      add r13, 64
      add rbx, 64
      add rbp, 64
      add r8, 64

      sub rsi, 16
      jne .Louter_loop
      jmp .Lreturn

.Ltail:
      mov r11, -1
      shlx r11, r11, rsi
      not r11
      kmovw k1, r11d
      vmovups  zmmword ptr [r10]{k1}, zmm11
      vmovups  zmmword ptr [r13]{k1}, zmm12
      vmovups  zmmword ptr [rbx]{k1}, zmm13
      vmovups  zmmword ptr [rbp]{k1}, zmm14
      vmovups  zmmword ptr [r8]{k1}, zmm15

.Lreturn:
      add rsp, 192
      mov r13, [rsp]
      mov rsp, r13
      # Restore the callee saved registers.
      pop r12
      pop r13
      pop r14
      pop r15
      pop rbp
      pop rbx
      pop rsi
      pop rdi
      #if XNN_HAS_FEATURE(memory_sanitizer)
      jmp xnn_gemm_ukernel_msan_sizeof_c_4
      #else
      ret
      #endif
END_FUNCTION xnn_f32_gemm_minmax_ukernel_5x16c2__asm_amd64_avx512f_broadcast

      #if XNN_HAS_FEATURE(dataflow_sanitizer)
BEGIN_FUNCTION xnn_f32_gemm_minmax_ukernel_5x16c2__asm_amd64_avx512f_broadcast.dfsan
      .intel_syntax noprefix
      # We could implement this by calling a function that implements the dfsan instrumentation.
      # For now, just break, so if someone tries to use this, they'll know where the problem is.
      int 3
      ret
END_FUNCTION xnn_f32_gemm_minmax_ukernel_5x16c2__asm_amd64_avx512f_broadcast.dfsan
      #endif

      #ifdef __ELF__
      .section .note.GNU-stack, "", @progbits
      #endif  // __ELF__