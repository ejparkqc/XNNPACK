"""
Microkernel filenames lists for sse.

Auto-generated file. Do not edit!
  Generator: tools/update-microkernels.py
"""

PROD_SSE_MICROKERNEL_SRCS = [
    "src/f32-conv-hwc2chw/f32-conv-hwc2chw-3x3s2p1c3x4-sse-2x2.c",
    "src/f32-dwconv/gen/f32-dwconv-3p8c-minmax-sse.c",
    "src/f32-dwconv/gen/f32-dwconv-4p8c-minmax-sse.c",
    "src/f32-dwconv/gen/f32-dwconv-9p8c-minmax-sse.c",
    "src/f32-dwconv/gen/f32-dwconv-25p8c-minmax-sse.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-3x3p1-minmax-sse-2x4-acc2.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-3x3s2p1-minmax-sse-1x4-acc3.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-5x5p2-minmax-sse-4x4.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-5x5s2p2-minmax-sse-2x4.c",
    "src/f32-gemm/gen/f32-gemm-1x8-minmax-sse-load1.c",
    "src/f32-gemm/gen/f32-gemm-4x2c4-minmax-sse.c",
    "src/f32-gemm/gen/f32-gemm-4x8-minmax-sse-load1.c",
    "src/f32-ibilinear-chw/gen/f32-ibilinear-chw-sse-p8.c",
    "src/f32-ibilinear/gen/f32-ibilinear-sse-c8.c",
    "src/f32-igemm/gen/f32-igemm-1x8-minmax-sse-load1.c",
    "src/f32-igemm/gen/f32-igemm-4x2c4-minmax-sse.c",
    "src/f32-igemm/gen/f32-igemm-4x8-minmax-sse-load1.c",
    "src/f32-rdsum/gen/f32-rdsum-7p7x-minmax-sse-c16.c",
    "src/f32-rminmax/gen/f32-rmax-sse-u16-acc4.c",
    "src/f32-rminmax/gen/f32-rminmax-sse-u16-acc4.c",
    "src/f32-rsum/gen/f32-rsum-sse-u16-acc4.c",
    "src/f32-spmm/gen/f32-spmm-32x1-minmax-sse.c",
    "src/f32-vbinary/gen/f32-vadd-sse-u8.c",
    "src/f32-vbinary/gen/f32-vaddc-sse-u8.c",
    "src/f32-vbinary/gen/f32-vdiv-sse-u8.c",
    "src/f32-vbinary/gen/f32-vdivc-sse-u8.c",
    "src/f32-vbinary/gen/f32-vmax-sse-u8.c",
    "src/f32-vbinary/gen/f32-vmaxc-sse-u8.c",
    "src/f32-vbinary/gen/f32-vmin-sse-u8.c",
    "src/f32-vbinary/gen/f32-vminc-sse-u8.c",
    "src/f32-vbinary/gen/f32-vmul-sse-u8.c",
    "src/f32-vbinary/gen/f32-vmulc-sse-u8.c",
    "src/f32-vbinary/gen/f32-vrdivc-sse-u8.c",
    "src/f32-vbinary/gen/f32-vrsubc-sse-u8.c",
    "src/f32-vbinary/gen/f32-vsqrdiff-sse-u8.c",
    "src/f32-vbinary/gen/f32-vsqrdiffc-sse-u8.c",
    "src/f32-vbinary/gen/f32-vsub-sse-u8.c",
    "src/f32-vbinary/gen/f32-vsubc-sse-u8.c",
    "src/f32-vclamp/gen/f32-vclamp-sse-u8.c",
    "src/f32-vcmul/gen/f32-vcmul-sse-u8.c",
    "src/f32-vhswish/gen/f32-vhswish-sse-u8.c",
    "src/f32-vlrelu/gen/f32-vlrelu-sse-u8.c",
    "src/f32-vmulcaddc/gen/f32-vmulcaddc-c4-minmax-sse-2x.c",
    "src/f32-vrsqrt/gen/f32-vrsqrt-sse-rsqrt-u8.c",
    "src/f32-vsqrt/gen/f32-vsqrt-sse-rsqrt-u12.c",
    "src/x32-transposec/x32-transposec-4x4-sse.c",
]

NON_PROD_SSE_MICROKERNEL_SRCS = [
    "src/f32-conv-hwc2chw/f32-conv-hwc2chw-3x3s2p1c3x4-sse-1x1.c",
    "src/f32-dwconv/gen/f32-dwconv-3p4c-minmax-sse-acc2.c",
    "src/f32-dwconv/gen/f32-dwconv-3p4c-minmax-sse.c",
    "src/f32-dwconv/gen/f32-dwconv-3p8c-minmax-sse-acc2.c",
    "src/f32-dwconv/gen/f32-dwconv-4p4c-minmax-sse-acc2.c",
    "src/f32-dwconv/gen/f32-dwconv-4p4c-minmax-sse.c",
    "src/f32-dwconv/gen/f32-dwconv-4p8c-minmax-sse-acc2.c",
    "src/f32-dwconv/gen/f32-dwconv-5f5m5l4c4s4r-minmax-sse-acc2.c",
    "src/f32-dwconv/gen/f32-dwconv-5f5m5l4c4s4r-minmax-sse.c",
    "src/f32-dwconv/gen/f32-dwconv-5f5m5l8c4s4r-minmax-sse-acc2.c",
    "src/f32-dwconv/gen/f32-dwconv-5f5m5l8c4s4r-minmax-sse.c",
    "src/f32-dwconv/gen/f32-dwconv-5f5m5l16c4s4r-minmax-sse-acc2.c",
    "src/f32-dwconv/gen/f32-dwconv-5f5m5l16c4s4r-minmax-sse.c",
    "src/f32-dwconv/gen/f32-dwconv-6f6m7l4c4s4r-minmax-sse-acc2.c",
    "src/f32-dwconv/gen/f32-dwconv-6f6m7l4c4s4r-minmax-sse.c",
    "src/f32-dwconv/gen/f32-dwconv-6f6m7l8c4s4r-minmax-sse-acc2.c",
    "src/f32-dwconv/gen/f32-dwconv-6f6m7l8c4s4r-minmax-sse.c",
    "src/f32-dwconv/gen/f32-dwconv-6f6m7l16c4s4r-minmax-sse-acc2.c",
    "src/f32-dwconv/gen/f32-dwconv-6f6m7l16c4s4r-minmax-sse.c",
    "src/f32-dwconv/gen/f32-dwconv-8f8m9l4c4s4r-minmax-sse-acc2.c",
    "src/f32-dwconv/gen/f32-dwconv-8f8m9l4c4s4r-minmax-sse.c",
    "src/f32-dwconv/gen/f32-dwconv-8f8m9l8c4s4r-minmax-sse-acc2.c",
    "src/f32-dwconv/gen/f32-dwconv-8f8m9l8c4s4r-minmax-sse.c",
    "src/f32-dwconv/gen/f32-dwconv-8f8m9l16c4s4r-minmax-sse-acc2.c",
    "src/f32-dwconv/gen/f32-dwconv-8f8m9l16c4s4r-minmax-sse.c",
    "src/f32-dwconv/gen/f32-dwconv-9p4c-minmax-sse-acc2.c",
    "src/f32-dwconv/gen/f32-dwconv-9p4c-minmax-sse.c",
    "src/f32-dwconv/gen/f32-dwconv-9p8c-minmax-sse-acc2.c",
    "src/f32-dwconv/gen/f32-dwconv-25p4c-minmax-sse-acc2.c",
    "src/f32-dwconv/gen/f32-dwconv-25p4c-minmax-sse.c",
    "src/f32-dwconv/gen/f32-dwconv-25p8c-minmax-sse-acc2.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-3x3p1-minmax-sse-1x4-acc2.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-3x3p1-minmax-sse-1x4-acc3.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-3x3p1-minmax-sse-1x4-acc4.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-3x3p1-minmax-sse-1x4.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-3x3p1-minmax-sse-2x4.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-3x3p1-minmax-sse-3x4.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-3x3p1-minmax-sse-4x4.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-3x3p1-minmax-sse-5x4.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-3x3p1-minmax-sse-6x4.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-3x3s2p1-minmax-sse-1x4-acc2.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-3x3s2p1-minmax-sse-1x4-acc4.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-3x3s2p1-minmax-sse-1x4.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-3x3s2p1-minmax-sse-2x4-acc2.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-3x3s2p1-minmax-sse-2x4.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-3x3s2p1-minmax-sse-3x4.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-3x3s2p1-minmax-sse-4x4.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-5x5p2-minmax-sse-1x4-acc2.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-5x5p2-minmax-sse-1x4-acc3.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-5x5p2-minmax-sse-1x4-acc4.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-5x5p2-minmax-sse-1x4-acc5.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-5x5p2-minmax-sse-1x4.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-5x5p2-minmax-sse-2x4-acc2.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-5x5p2-minmax-sse-2x4-acc3.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-5x5p2-minmax-sse-2x4.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-5x5p2-minmax-sse-3x4-acc2.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-5x5p2-minmax-sse-3x4.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-5x5p2-minmax-sse-4x4-acc2.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-5x5p2-minmax-sse-5x4.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-5x5s2p2-minmax-sse-1x4-acc2.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-5x5s2p2-minmax-sse-1x4-acc3.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-5x5s2p2-minmax-sse-1x4-acc4.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-5x5s2p2-minmax-sse-1x4-acc5.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-5x5s2p2-minmax-sse-1x4.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-5x5s2p2-minmax-sse-2x4-acc2.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-5x5s2p2-minmax-sse-2x4-acc3.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-5x5s2p2-minmax-sse-3x4-acc2.c",
    "src/f32-dwconv2d-chw/gen/f32-dwconv2d-chw-5x5s2p2-minmax-sse-3x4.c",
    "src/f32-gemm/gen/f32-gemm-1x8-minmax-sse-dup.c",
    "src/f32-gemm/gen/f32-gemm-1x8s4-minmax-sse.c",
    "src/f32-gemm/gen/f32-gemm-3x8-minmax-sse-dup.c",
    "src/f32-gemm/gen/f32-gemm-3x8-minmax-sse-load1.c",
    "src/f32-gemm/gen/f32-gemm-3x8s4-minmax-sse.c",
    "src/f32-gemm/gen/f32-gemm-4x8-minmax-sse-dup.c",
    "src/f32-gemm/gen/f32-gemm-4x8s4-minmax-sse.c",
    "src/f32-gemm/gen/f32-gemm-5x8-minmax-sse-dup.c",
    "src/f32-gemm/gen/f32-gemm-5x8-minmax-sse-load1.c",
    "src/f32-gemm/gen/f32-gemm-5x8s4-minmax-sse.c",
    "src/f32-gemm/gen/f32-gemm-6x2c4-minmax-sse.c",
    "src/f32-gemm/gen/f32-gemm-6x8-minmax-sse-dup.c",
    "src/f32-gemm/gen/f32-gemm-6x8-minmax-sse-load1.c",
    "src/f32-gemm/gen/f32-gemm-6x8s4-minmax-sse.c",
    "src/f32-gemminc/gen/f32-gemminc-1x8-minmax-sse-dup.c",
    "src/f32-gemminc/gen/f32-gemminc-1x8-minmax-sse-load1.c",
    "src/f32-gemminc/gen/f32-gemminc-1x8s4-minmax-sse.c",
    "src/f32-gemminc/gen/f32-gemminc-3x8-minmax-sse-dup.c",
    "src/f32-gemminc/gen/f32-gemminc-3x8-minmax-sse-load1.c",
    "src/f32-gemminc/gen/f32-gemminc-3x8s4-minmax-sse.c",
    "src/f32-gemminc/gen/f32-gemminc-4x8-minmax-sse-dup.c",
    "src/f32-gemminc/gen/f32-gemminc-4x8-minmax-sse-load1.c",
    "src/f32-gemminc/gen/f32-gemminc-4x8s4-minmax-sse.c",
    "src/f32-gemminc/gen/f32-gemminc-5x8-minmax-sse-dup.c",
    "src/f32-gemminc/gen/f32-gemminc-5x8-minmax-sse-load1.c",
    "src/f32-gemminc/gen/f32-gemminc-5x8s4-minmax-sse.c",
    "src/f32-gemminc/gen/f32-gemminc-6x8-minmax-sse-dup.c",
    "src/f32-gemminc/gen/f32-gemminc-6x8-minmax-sse-load1.c",
    "src/f32-gemminc/gen/f32-gemminc-6x8s4-minmax-sse.c",
    "src/f32-ibilinear-chw/gen/f32-ibilinear-chw-sse-p4.c",
    "src/f32-ibilinear/gen/f32-ibilinear-sse-c4.c",
    "src/f32-igemm/gen/f32-igemm-1x8-minmax-sse-dup.c",
    "src/f32-igemm/gen/f32-igemm-1x8s4-minmax-sse.c",
    "src/f32-igemm/gen/f32-igemm-3x8-minmax-sse-dup.c",
    "src/f32-igemm/gen/f32-igemm-3x8-minmax-sse-load1.c",
    "src/f32-igemm/gen/f32-igemm-3x8s4-minmax-sse.c",
    "src/f32-igemm/gen/f32-igemm-4x8-minmax-sse-dup.c",
    "src/f32-igemm/gen/f32-igemm-4x8s4-minmax-sse.c",
    "src/f32-igemm/gen/f32-igemm-5x8-minmax-sse-dup.c",
    "src/f32-igemm/gen/f32-igemm-5x8-minmax-sse-load1.c",
    "src/f32-igemm/gen/f32-igemm-5x8s4-minmax-sse.c",
    "src/f32-igemm/gen/f32-igemm-6x2c4-minmax-sse.c",
    "src/f32-igemm/gen/f32-igemm-6x8-minmax-sse-dup.c",
    "src/f32-igemm/gen/f32-igemm-6x8-minmax-sse-load1.c",
    "src/f32-igemm/gen/f32-igemm-6x8s4-minmax-sse.c",
    "src/f32-ppmm/gen/f32-ppmm-4x8-minmax-sse.c",
    "src/f32-rdsum/gen/f32-rdsum-7p7x-minmax-sse-c32.c",
    "src/f32-rdsum/gen/f32-rdsum-7p7x-minmax-sse-c64.c",
    "src/f32-rminmax/gen/f32-rmax-sse-u4.c",
    "src/f32-rminmax/gen/f32-rmax-sse-u8-acc2.c",
    "src/f32-rminmax/gen/f32-rmax-sse-u12-acc3.c",
    "src/f32-rminmax/gen/f32-rmax-sse-u16-acc2.c",
    "src/f32-rminmax/gen/f32-rmin-sse-u4.c",
    "src/f32-rminmax/gen/f32-rmin-sse-u8-acc2.c",
    "src/f32-rminmax/gen/f32-rmin-sse-u12-acc3.c",
    "src/f32-rminmax/gen/f32-rmin-sse-u16-acc2.c",
    "src/f32-rminmax/gen/f32-rmin-sse-u16-acc4.c",
    "src/f32-rminmax/gen/f32-rminmax-sse-u4.c",
    "src/f32-rminmax/gen/f32-rminmax-sse-u8-acc2.c",
    "src/f32-rminmax/gen/f32-rminmax-sse-u12-acc3.c",
    "src/f32-rminmax/gen/f32-rminmax-sse-u16-acc2.c",
    "src/f32-rsum/gen/f32-rsum-sse-u4.c",
    "src/f32-rsum/gen/f32-rsum-sse-u8-acc2.c",
    "src/f32-rsum/gen/f32-rsum-sse-u12-acc3.c",
    "src/f32-rsum/gen/f32-rsum-sse-u16-acc2.c",
    "src/f32-spmm/gen/f32-spmm-4x1-minmax-sse.c",
    "src/f32-spmm/gen/f32-spmm-8x1-minmax-sse.c",
    "src/f32-spmm/gen/f32-spmm-16x1-minmax-sse.c",
    "src/f32-vbinary/gen/f32-vadd-sse-u4.c",
    "src/f32-vbinary/gen/f32-vaddc-sse-u4.c",
    "src/f32-vbinary/gen/f32-vdiv-sse-u4.c",
    "src/f32-vbinary/gen/f32-vdivc-sse-u4.c",
    "src/f32-vbinary/gen/f32-vmax-sse-u4.c",
    "src/f32-vbinary/gen/f32-vmaxc-sse-u4.c",
    "src/f32-vbinary/gen/f32-vmin-sse-u4.c",
    "src/f32-vbinary/gen/f32-vminc-sse-u4.c",
    "src/f32-vbinary/gen/f32-vmul-sse-u4.c",
    "src/f32-vbinary/gen/f32-vmulc-sse-u4.c",
    "src/f32-vbinary/gen/f32-vrdivc-sse-u4.c",
    "src/f32-vbinary/gen/f32-vrsubc-sse-u4.c",
    "src/f32-vbinary/gen/f32-vsqrdiff-sse-u4.c",
    "src/f32-vbinary/gen/f32-vsqrdiffc-sse-u4.c",
    "src/f32-vbinary/gen/f32-vsub-sse-u4.c",
    "src/f32-vbinary/gen/f32-vsubc-sse-u4.c",
    "src/f32-vclamp/gen/f32-vclamp-sse-u4.c",
    "src/f32-vcmul/gen/f32-vcmul-sse-u4.c",
    "src/f32-vcmul/gen/f32-vcmul-sse-u12.c",
    "src/f32-vcmul/gen/f32-vcmul-sse-u16.c",
    "src/f32-vhswish/gen/f32-vhswish-sse-u4.c",
    "src/f32-vlrelu/gen/f32-vlrelu-sse-u4.c",
    "src/f32-vmulcaddc/gen/f32-vmulcaddc-c8-minmax-sse-2x.c",
    "src/f32-vrelu/gen/f32-vrelu-sse-u4.c",
    "src/f32-vrelu/gen/f32-vrelu-sse-u8.c",
    "src/f32-vrsqrt/gen/f32-vrsqrt-sse-rsqrt-u4.c",
    "src/f32-vrsqrt/gen/f32-vrsqrt-sse-rsqrt-u16.c",
    "src/f32-vsqrt/gen/f32-vsqrt-sse-rsqrt-u4.c",
    "src/f32-vsqrt/gen/f32-vsqrt-sse-rsqrt-u8.c",
    "src/f32-vsqrt/gen/f32-vsqrt-sse-sqrt-u4.c",
    "src/f32-vsqrt/gen/f32-vsqrt-sse-sqrt-u8.c",
    "src/f32-vsqrt/gen/f32-vsqrt-sse-sqrt-u16.c",
    "src/x32-packx/x32-packx-4x-sse.c",
]

ALL_SSE_MICROKERNEL_SRCS = PROD_SSE_MICROKERNEL_SRCS + NON_PROD_SSE_MICROKERNEL_SRCS
