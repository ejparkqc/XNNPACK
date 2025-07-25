// Copyright 2025 Google LLC
//
// This source code is licensed under the BSD-style license found in the
// LICENSE file in the root directory of this source tree.

#include "src/xnnpack/assembly.h"
.SIGN_MASK:
      .quad   -9187201950435737472  # 0x8080808080808080

BEGIN_FUNCTION xnn_qs8_qc8w_gemm_minmax_fp32_ukernel_6x16c4__asm_amd64_avx512vnni

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

      movsx         eax, word ptr [r13]
      vpbroadcastd zmm31, eax

      vpbroadcastb xmm0, byte ptr [r13 + 2]

      movsx         eax, word ptr [r13 + 4]
      vpbroadcastd  zmm1, eax
      vpsubd        zmm1, zmm1, zmm31
      vcvtdq2ps     zmm1, zmm1


      # Load c pointer.
      mov r10, [rsp + 72]
      # Load cm_stride.
      mov r11, [rsp + 80]

      add rdx, 3
      and rdx, -4

      # Align the stack pointer.
      mov r13, rsp
      sub rsp, 64
      and rsp, 0xFFFFFFFFFFFFFFC0
      # Store the old stack pointer containing the return address
      mov [rsp], r13

      # Allocate some space on the stack.
      sub rsp, 512
      # Write rsi (a pointer) to the stack as we need the register.
      mov [rsp + 16], rcx
      # Write r10 (c pointer) to the stack as we need the register.
      mov [rsp + 24], r10

      # Clamp a & c pointers if mr <= 1
      mov rax, rcx
      add rax, r8
      mov r13, r10
      add r13, r11
      cmp rdi, 1
      cmovle rax, rcx
      cmovle r13, r10

      mov [rsp + 32], rax
      mov [rsp + 40], r13

      # Clamp a & c pointers if mr <= 2
      mov rcx, rax
      add rcx, r8
      mov r10, r13
      add r10, r11
      cmp rdi, 2
      cmovle rcx, rax
      cmovle r10, r13

      mov [rsp + 48], rcx
      mov [rsp + 56], r10

      # Clamp a & c pointers if mr <= 3
      mov rax, rcx
      add rax, r8
      mov r13, r10
      add r13, r11
      cmp rdi, 3
      cmovle rax, rcx
      cmovle r13, r10

      mov [rsp + 64], rax
      mov [rsp + 72], r13

      # Clamp a & c pointers if mr <= 4
      mov rcx, rax
      add rcx, r8
      mov r10, r13
      add r10, r11
      cmp rdi, 4
      cmovle rcx, rax
      cmovle r10, r13

      mov [rsp + 80], rcx
      mov [rsp + 88], r10

      # Clamp a & c pointers if mr <= 5
      mov rax, rcx
      add rax, r8
      mov r13, r10
      add r13, r11
      cmp rdi, 5
      cmovle rax, rcx
      cmovle r13, r10

      mov [rsp + 96], rax
      mov [rsp + 104], r13

      # Load 0x80 for xoring the weights
      vbroadcastsd  zmm13, qword ptr [rip + .SIGN_MASK]


.Louter_loop:
      # Initialize k counter.
      mov r11, 0
      # Read a pointers from stack into GP registers.
      mov rcx, [rsp + 16]
      mov rax, [rsp + 32]
      mov r15, [rsp + 48]
      mov r14, [rsp + 64]
      mov r12, [rsp + 80]
      mov r10, [rsp + 96]

      # Initialize accumulators with bias
      vmovaps zmm5, [r9 + 0]
      vmovaps zmm12, [r9 + 0]
      vmovaps zmm14, [r9 + 0]
      vmovaps zmm15, [r9 + 0]
      vmovaps zmm16, [r9 + 0]
      vmovaps zmm17, [r9 + 0]
      add r9, 64

.Linner_loop:
      vmovaps  zmm6, [r9 + 0]
      add r9, 64
      vpxord zmm2, zmm13, dword ptr [rcx + r11]{1to16}
      vpdpbusd  zmm5, zmm2, zmm6
      vpxord zmm2, zmm13, dword ptr [rax + r11]{1to16}
      vpdpbusd  zmm12, zmm2, zmm6
      vpxord zmm2, zmm13, dword ptr [r15 + r11]{1to16}
      vpdpbusd  zmm14, zmm2, zmm6
      vpxord zmm2, zmm13, dword ptr [r14 + r11]{1to16}
      vpdpbusd  zmm15, zmm2, zmm6
      vpxord zmm2, zmm13, dword ptr [r12 + r11]{1to16}
      vpdpbusd  zmm16, zmm2, zmm6
      vpxord zmm2, zmm13, dword ptr [r10 + r11]{1to16}
      vpdpbusd  zmm17, zmm2, zmm6

      add r11, 4
      cmp rdx, r11
      jne .Linner_loop

.Linner_loop_end:

      # Convert from int32 to float.
      vcvtdq2ps zmm5, zmm5
      vcvtdq2ps zmm12, zmm12
      vcvtdq2ps zmm14, zmm14
      vcvtdq2ps zmm15, zmm15
      vcvtdq2ps zmm16, zmm16
      vcvtdq2ps zmm17, zmm17
      vmovaps zmm10, [r9 + 0]
      add r9, 64
      vmulps zmm5, zmm5, zmm10
      vmulps zmm12, zmm12, zmm10
      vmulps zmm14, zmm14, zmm10
      vmulps zmm15, zmm15, zmm10
      vmulps zmm16, zmm16, zmm10
      vmulps zmm17, zmm17, zmm10
      vminps zmm5, zmm5, zmm1
      vminps zmm12, zmm12, zmm1
      vminps zmm14, zmm14, zmm1
      vminps zmm15, zmm15, zmm1
      vminps zmm16, zmm16, zmm1
      vminps zmm17, zmm17, zmm1
      vcvtps2dq zmm5, zmm5
      vcvtps2dq zmm12, zmm12
      vcvtps2dq zmm14, zmm14
      vcvtps2dq zmm15, zmm15
      vcvtps2dq zmm16, zmm16
      vcvtps2dq zmm17, zmm17
      vpaddd zmm5, zmm5, zmm31
      vpaddd zmm12, zmm12, zmm31
      vpaddd zmm14, zmm14, zmm31
      vpaddd zmm15, zmm15, zmm31
      vpaddd zmm16, zmm16, zmm31
      vpaddd zmm17, zmm17, zmm31
      vpmovsdb xmm5, zmm5
      vpmovsdb xmm12, zmm12
      vpmovsdb xmm14, zmm14
      vpmovsdb xmm15, zmm15
      vpmovsdb xmm16, zmm16
      vpmovsdb xmm17, zmm17
      vpmaxsb xmm5, xmm5, xmm0
      vpmaxsb xmm12, xmm12, xmm0
      vpmaxsb xmm14, xmm14, xmm0
      vpmaxsb xmm15, xmm15, xmm0
      vpmaxsb xmm16, xmm16, xmm0
      vpmaxsb xmm17, xmm17, xmm0

      # Pop output pointers from the stack.
      mov rcx, [rsp + 24]
      mov rax, [rsp + 40]
      mov r15, [rsp + 56]
      mov r14, [rsp + 72]
      mov r12, [rsp + 88]
      mov r10, [rsp + 104]

      # Check whether full or partial store.
      cmp rsi, 16
      jl .Ltail

      vmovups  [rcx], xmm5
      vmovups  [rax], xmm12
      vmovups  [r15], xmm14
      vmovups  [r14], xmm15
      vmovups  [r12], xmm16
      vmovups  [r10], xmm17
      add rcx, 16
      add rax, 16
      add r15, 16
      add r14, 16
      add r12, 16
      add r10, 16

      # Write output pointers to the stack.
      mov [rsp + 24], rcx
      mov [rsp + 40], rax
      mov [rsp + 56], r15
      mov [rsp + 72], r14
      mov [rsp + 88], r12
      mov [rsp + 104], r10

      sub rsi, 16
      jne .Louter_loop
      jmp .Lreturn

.Ltail:
      mov r11, -1
      shlx r11, r11, rsi
      not r11
      kmovw k1, r11d
      vmovdqu8  xmmword ptr [rcx]{k1}, xmm5
      vmovdqu8  xmmword ptr [rax]{k1}, xmm12
      vmovdqu8  xmmword ptr [r15]{k1}, xmm14
      vmovdqu8  xmmword ptr [r14]{k1}, xmm15
      vmovdqu8  xmmword ptr [r12]{k1}, xmm16
      vmovdqu8  xmmword ptr [r10]{k1}, xmm17

.Lreturn:
      add rsp, 512
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
END_FUNCTION xnn_qs8_qc8w_gemm_minmax_fp32_ukernel_6x16c4__asm_amd64_avx512vnni

      #if XNN_HAS_FEATURE(dataflow_sanitizer)
BEGIN_FUNCTION xnn_qs8_qc8w_gemm_minmax_fp32_ukernel_6x16c4__asm_amd64_avx512vnni.dfsan
      .intel_syntax noprefix
      # We could implement this by calling a function that implements the dfsan instrumentation.
      # For now, just break, so if someone tries to use this, they'll know where the problem is.
      int 3
      ret
END_FUNCTION xnn_qs8_qc8w_gemm_minmax_fp32_ukernel_6x16c4__asm_amd64_avx512vnni.dfsan
      #endif

      #ifdef __ELF__
      .section .note.GNU-stack, "", @progbits
      #endif  // __ELF__