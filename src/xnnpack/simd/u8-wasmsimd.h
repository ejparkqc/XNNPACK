// Copyright 2024 Google LLC
//
// This source code is licensed under the BSD-style license found in the
// LICENSE file in the root directory of this source tree.
//

#ifndef __XNNPACK_SRC_XNNPACK_SIMD_U8_WASMSIMD_H_
#define __XNNPACK_SRC_XNNPACK_SIMD_U8_WASMSIMD_H_

#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <wasm_simd128.h>

#include "xnnpack/common.h"

// SIMD vector type for u8 using wasm.
typedef v128_t xnn_simd_u8_t;
#define xnn_simd_size_u8 16
#define xnn_simd_log2_size_u8 0
#define xnn_simd_bytes_u8 (xnn_simd_size_u8 * sizeof(uint8_t))

#define XNN_SIMD_CONST_U8(var, val) \
  const xnn_simd_u8_t var = wasm_i8x16_splat(val);

// Arithmetic operations.

static XNN_INLINE xnn_simd_u8_t xnn_add_u8(xnn_simd_u8_t a, xnn_simd_u8_t b) {
  return wasm_i8x16_add(a, b);
}

static XNN_INLINE xnn_simd_u8_t xnn_max_u8(xnn_simd_u8_t a, xnn_simd_u8_t b) {
  return wasm_u8x16_max(a, b);
}

static XNN_INLINE xnn_simd_u8_t xnn_min_u8(xnn_simd_u8_t a, xnn_simd_u8_t b) {
  return wasm_u8x16_min(a, b);
}

static XNN_INLINE xnn_simd_u8_t xnn_xor_u8(xnn_simd_u8_t a, xnn_simd_u8_t b) {
  return wasm_v128_xor(a, b);
}

// Load/store operations.

static XNN_INLINE xnn_simd_u8_t xnn_loadu_u8(const uint8_t* ptr) {
  return wasm_v128_load(ptr);
}

static XNN_INLINE xnn_simd_u8_t xnn_load_u8(const uint8_t* ptr) {
  return wasm_v128_load(ptr);
}

static XNN_INLINE void xnn_storeu_u8(uint8_t* ptr, xnn_simd_u8_t v) {
  wasm_v128_store(ptr, v);
}

static XNN_INLINE void xnn_store_u8(float* ptr, xnn_simd_u8_t v) {
  wasm_v128_store(ptr, v);
}

static XNN_INLINE xnn_simd_u8_t xnn_set1_u8(uint8_t v) {
  return wasm_i8x16_splat(v);
}

static XNN_INLINE xnn_simd_u8_t xnn_set1_or_load_u8(const uint8_t* v) {
#if XNN_ARCH_X86
  return wasm_v128_load(v);
#else
  return wasm_i8x16_splat(*v);
#endif
}

// Tail load/store operations.

static XNN_INLINE xnn_simd_u8_t
xnn_load_tail_u8(const uint8_t* input, size_t num_elements) XNN_OOB_READS {
  assert(num_elements > 0);
  assert(num_elements < xnn_simd_size_u8);
  return wasm_v128_load(input);
}

static XNN_INLINE void xnn_store_tail_u8(uint8_t* output, xnn_simd_u8_t v,
                                         size_t num_elements) {
  assert(num_elements > 0);
  assert(num_elements < xnn_simd_size_u8);

  if (num_elements & 8) {
    wasm_v128_store64_lane(output, v, 0);
    v = wasm_v64x2_shuffle(v, v, 1, 1);
    output += 8;
  }
  if (num_elements & 4) {
    wasm_v128_store32_lane(output, v, 0);
    v = wasm_u64x2_shr(v, 32);
    output += 4;
  }
  if (num_elements & 2) {
    wasm_v128_store16_lane(output, v, 0);
    v = wasm_u32x4_shr(v, 16);
    output += 2;
  }
  if (num_elements & 1) {
    wasm_v128_store8_lane(output, v, 0);
    output += 1;
  }
}

#endif  // __XNNPACK_SRC_XNNPACK_SIMD_U8_WASMSIMD_H_
