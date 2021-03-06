set(math_SOURCE
        ${CMAKE_SOURCE_DIR}/micropython/lib/libm/math.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/libm/thumb_vfp_sqrtf.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/libm/asinfacosf.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/libm/atanf.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/libm/atan2f.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/libm/fmodf.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/libm/roundf.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/libm/log1pf.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/libm/acoshf.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/libm/asinhf.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/libm/atanhf.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/libm/kf_rem_pio2.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/libm/kf_sin.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/libm/kf_cos.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/libm/kf_tan.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/libm/ef_rem_pio2.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/libm/erf_lgamma.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/libm/sf_sin.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/libm/sf_cos.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/libm/sf_tan.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/libm/sf_frexp.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/libm/sf_modf.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/libm/sf_ldexp.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/libm/sf_erf.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/libm/wf_lgamma.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/libm/wf_tgamma.c)
add_library(math ${math_SOURCE})