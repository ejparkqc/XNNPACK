// clang-format off
// Auto-generated file. Do not edit!
//   Template: src/f32-vcopysign/copysign.c.in
//   Generator: tools/xngen
//
// Copyright 2024 Google LLC
//
// This source code is licensed under the BSD-style license found in the
// LICENSE file in the root directory of this source tree.

#include <assert.h>
#include <stddef.h>
#include <stdint.h>

#include "src/xnnpack/common.h"
#include "src/xnnpack/microparams.h"
#include "src/xnnpack/simd/f32-scalar.h"
#include "src/xnnpack/vunary.h"


void xnn_f32_vcopysign_ukernel__scalar_u1(
    size_t batch,
    const float* mag,
    const float* sign,
    float* output,
    const struct xnn_f32_default_params* unused_params)
{
  assert(batch != 0);
  assert(batch % sizeof(float) == 0);
  assert(mag != NULL);
  assert(sign != NULL);
  assert(output != NULL);
  assert(xnn_simd_size_f32 == 1);

  XNN_SIMD_CONST_F32(vsign_mask, -0.f);

  for (; batch >= xnn_simd_bytes_f32; batch -= xnn_simd_bytes_f32) {
    xnn_simd_f32_t vsign = xnn_loadu_f32(sign);
    sign += xnn_simd_size_f32;

    vsign = xnn_and_f32(vsign, vsign_mask);

    xnn_simd_f32_t vmag = xnn_abs_f32(xnn_loadu_f32(mag));
    mag += xnn_simd_size_f32;

    xnn_simd_f32_t vy = xnn_or_f32(vsign, vmag);

    xnn_storeu_f32(output, vy);
    output += xnn_simd_size_f32;
  }
}

void xnn_f32_vcopysign_ukernel__scalar_u2(
    size_t batch,
    const float* mag,
    const float* sign,
    float* output,
    const struct xnn_f32_default_params* unused_params)
{
  assert(batch != 0);
  assert(batch % sizeof(float) == 0);
  assert(mag != NULL);
  assert(sign != NULL);
  assert(output != NULL);
  assert(xnn_simd_size_f32 == 1);

  XNN_SIMD_CONST_F32(vsign_mask, -0.f);

  for (; batch >= 2 * sizeof(float); batch -= 2 * sizeof(float)) {
    xnn_simd_f32_t vsign_0 = xnn_loadu_f32(sign + 0 * xnn_simd_size_f32);
    xnn_simd_f32_t vsign_1 = xnn_loadu_f32(sign + 1 * xnn_simd_size_f32);
    sign += 2;

    vsign_0 = xnn_and_f32(vsign_0, vsign_mask);
    vsign_1 = xnn_and_f32(vsign_1, vsign_mask);

    xnn_simd_f32_t vmag_0 = xnn_abs_f32(xnn_loadu_f32(mag + 0 * xnn_simd_size_f32));
    xnn_simd_f32_t vmag_1 = xnn_abs_f32(xnn_loadu_f32(mag + 1 * xnn_simd_size_f32));
    mag += 2;

    xnn_simd_f32_t vy_0 = xnn_or_f32(vsign_0, vmag_0);
    xnn_simd_f32_t vy_1 = xnn_or_f32(vsign_1, vmag_1);

    xnn_storeu_f32(output + 0 * xnn_simd_size_f32, vy_0);
    xnn_storeu_f32(output + 1 * xnn_simd_size_f32, vy_1);
    output += 2;
  }
  for (; batch >= xnn_simd_bytes_f32; batch -= xnn_simd_bytes_f32) {
    xnn_simd_f32_t vsign = xnn_loadu_f32(sign);
    sign += xnn_simd_size_f32;

    vsign = xnn_and_f32(vsign, vsign_mask);

    xnn_simd_f32_t vmag = xnn_abs_f32(xnn_loadu_f32(mag));
    mag += xnn_simd_size_f32;

    xnn_simd_f32_t vy = xnn_or_f32(vsign, vmag);

    xnn_storeu_f32(output, vy);
    output += xnn_simd_size_f32;
  }
}

void xnn_f32_vcopysign_ukernel__scalar_u4(
    size_t batch,
    const float* mag,
    const float* sign,
    float* output,
    const struct xnn_f32_default_params* unused_params)
{
  assert(batch != 0);
  assert(batch % sizeof(float) == 0);
  assert(mag != NULL);
  assert(sign != NULL);
  assert(output != NULL);
  assert(xnn_simd_size_f32 == 1);

  XNN_SIMD_CONST_F32(vsign_mask, -0.f);

  for (; batch >= 4 * sizeof(float); batch -= 4 * sizeof(float)) {
    xnn_simd_f32_t vsign_0 = xnn_loadu_f32(sign + 0 * xnn_simd_size_f32);
    xnn_simd_f32_t vsign_1 = xnn_loadu_f32(sign + 1 * xnn_simd_size_f32);
    xnn_simd_f32_t vsign_2 = xnn_loadu_f32(sign + 2 * xnn_simd_size_f32);
    xnn_simd_f32_t vsign_3 = xnn_loadu_f32(sign + 3 * xnn_simd_size_f32);
    sign += 4;

    vsign_0 = xnn_and_f32(vsign_0, vsign_mask);
    vsign_1 = xnn_and_f32(vsign_1, vsign_mask);
    vsign_2 = xnn_and_f32(vsign_2, vsign_mask);
    vsign_3 = xnn_and_f32(vsign_3, vsign_mask);

    xnn_simd_f32_t vmag_0 = xnn_abs_f32(xnn_loadu_f32(mag + 0 * xnn_simd_size_f32));
    xnn_simd_f32_t vmag_1 = xnn_abs_f32(xnn_loadu_f32(mag + 1 * xnn_simd_size_f32));
    xnn_simd_f32_t vmag_2 = xnn_abs_f32(xnn_loadu_f32(mag + 2 * xnn_simd_size_f32));
    xnn_simd_f32_t vmag_3 = xnn_abs_f32(xnn_loadu_f32(mag + 3 * xnn_simd_size_f32));
    mag += 4;

    xnn_simd_f32_t vy_0 = xnn_or_f32(vsign_0, vmag_0);
    xnn_simd_f32_t vy_1 = xnn_or_f32(vsign_1, vmag_1);
    xnn_simd_f32_t vy_2 = xnn_or_f32(vsign_2, vmag_2);
    xnn_simd_f32_t vy_3 = xnn_or_f32(vsign_3, vmag_3);

    xnn_storeu_f32(output + 0 * xnn_simd_size_f32, vy_0);
    xnn_storeu_f32(output + 1 * xnn_simd_size_f32, vy_1);
    xnn_storeu_f32(output + 2 * xnn_simd_size_f32, vy_2);
    xnn_storeu_f32(output + 3 * xnn_simd_size_f32, vy_3);
    output += 4;
  }
  for (; batch >= xnn_simd_bytes_f32; batch -= xnn_simd_bytes_f32) {
    xnn_simd_f32_t vsign = xnn_loadu_f32(sign);
    sign += xnn_simd_size_f32;

    vsign = xnn_and_f32(vsign, vsign_mask);

    xnn_simd_f32_t vmag = xnn_abs_f32(xnn_loadu_f32(mag));
    mag += xnn_simd_size_f32;

    xnn_simd_f32_t vy = xnn_or_f32(vsign, vmag);

    xnn_storeu_f32(output, vy);
    output += xnn_simd_size_f32;
  }
}

void xnn_f32_vcopysign_ukernel__scalar_u8(
    size_t batch,
    const float* mag,
    const float* sign,
    float* output,
    const struct xnn_f32_default_params* unused_params)
{
  assert(batch != 0);
  assert(batch % sizeof(float) == 0);
  assert(mag != NULL);
  assert(sign != NULL);
  assert(output != NULL);
  assert(xnn_simd_size_f32 == 1);

  XNN_SIMD_CONST_F32(vsign_mask, -0.f);

  for (; batch >= 8 * sizeof(float); batch -= 8 * sizeof(float)) {
    xnn_simd_f32_t vsign_0 = xnn_loadu_f32(sign + 0 * xnn_simd_size_f32);
    xnn_simd_f32_t vsign_1 = xnn_loadu_f32(sign + 1 * xnn_simd_size_f32);
    xnn_simd_f32_t vsign_2 = xnn_loadu_f32(sign + 2 * xnn_simd_size_f32);
    xnn_simd_f32_t vsign_3 = xnn_loadu_f32(sign + 3 * xnn_simd_size_f32);
    xnn_simd_f32_t vsign_4 = xnn_loadu_f32(sign + 4 * xnn_simd_size_f32);
    xnn_simd_f32_t vsign_5 = xnn_loadu_f32(sign + 5 * xnn_simd_size_f32);
    xnn_simd_f32_t vsign_6 = xnn_loadu_f32(sign + 6 * xnn_simd_size_f32);
    xnn_simd_f32_t vsign_7 = xnn_loadu_f32(sign + 7 * xnn_simd_size_f32);
    sign += 8;

    vsign_0 = xnn_and_f32(vsign_0, vsign_mask);
    vsign_1 = xnn_and_f32(vsign_1, vsign_mask);
    vsign_2 = xnn_and_f32(vsign_2, vsign_mask);
    vsign_3 = xnn_and_f32(vsign_3, vsign_mask);
    vsign_4 = xnn_and_f32(vsign_4, vsign_mask);
    vsign_5 = xnn_and_f32(vsign_5, vsign_mask);
    vsign_6 = xnn_and_f32(vsign_6, vsign_mask);
    vsign_7 = xnn_and_f32(vsign_7, vsign_mask);

    xnn_simd_f32_t vmag_0 = xnn_abs_f32(xnn_loadu_f32(mag + 0 * xnn_simd_size_f32));
    xnn_simd_f32_t vmag_1 = xnn_abs_f32(xnn_loadu_f32(mag + 1 * xnn_simd_size_f32));
    xnn_simd_f32_t vmag_2 = xnn_abs_f32(xnn_loadu_f32(mag + 2 * xnn_simd_size_f32));
    xnn_simd_f32_t vmag_3 = xnn_abs_f32(xnn_loadu_f32(mag + 3 * xnn_simd_size_f32));
    xnn_simd_f32_t vmag_4 = xnn_abs_f32(xnn_loadu_f32(mag + 4 * xnn_simd_size_f32));
    xnn_simd_f32_t vmag_5 = xnn_abs_f32(xnn_loadu_f32(mag + 5 * xnn_simd_size_f32));
    xnn_simd_f32_t vmag_6 = xnn_abs_f32(xnn_loadu_f32(mag + 6 * xnn_simd_size_f32));
    xnn_simd_f32_t vmag_7 = xnn_abs_f32(xnn_loadu_f32(mag + 7 * xnn_simd_size_f32));
    mag += 8;

    xnn_simd_f32_t vy_0 = xnn_or_f32(vsign_0, vmag_0);
    xnn_simd_f32_t vy_1 = xnn_or_f32(vsign_1, vmag_1);
    xnn_simd_f32_t vy_2 = xnn_or_f32(vsign_2, vmag_2);
    xnn_simd_f32_t vy_3 = xnn_or_f32(vsign_3, vmag_3);
    xnn_simd_f32_t vy_4 = xnn_or_f32(vsign_4, vmag_4);
    xnn_simd_f32_t vy_5 = xnn_or_f32(vsign_5, vmag_5);
    xnn_simd_f32_t vy_6 = xnn_or_f32(vsign_6, vmag_6);
    xnn_simd_f32_t vy_7 = xnn_or_f32(vsign_7, vmag_7);

    xnn_storeu_f32(output + 0 * xnn_simd_size_f32, vy_0);
    xnn_storeu_f32(output + 1 * xnn_simd_size_f32, vy_1);
    xnn_storeu_f32(output + 2 * xnn_simd_size_f32, vy_2);
    xnn_storeu_f32(output + 3 * xnn_simd_size_f32, vy_3);
    xnn_storeu_f32(output + 4 * xnn_simd_size_f32, vy_4);
    xnn_storeu_f32(output + 5 * xnn_simd_size_f32, vy_5);
    xnn_storeu_f32(output + 6 * xnn_simd_size_f32, vy_6);
    xnn_storeu_f32(output + 7 * xnn_simd_size_f32, vy_7);
    output += 8;
  }
  for (; batch >= xnn_simd_bytes_f32; batch -= xnn_simd_bytes_f32) {
    xnn_simd_f32_t vsign = xnn_loadu_f32(sign);
    sign += xnn_simd_size_f32;

    vsign = xnn_and_f32(vsign, vsign_mask);

    xnn_simd_f32_t vmag = xnn_abs_f32(xnn_loadu_f32(mag));
    mag += xnn_simd_size_f32;

    xnn_simd_f32_t vy = xnn_or_f32(vsign, vmag);

    xnn_storeu_f32(output, vy);
    output += xnn_simd_size_f32;
  }
}
