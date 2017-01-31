include_directories(${CMAKE_SOURCE_DIR}/micropython/lib/netutils)
include_directories(${CMAKE_SOURCE_DIR}/micropython/lib/mp-readline)
include_directories(${CMAKE_SOURCE_DIR}/micropython/lib/timeutils)

set(utils_SOURCE
        ${CMAKE_SOURCE_DIR}/micropython/lib/libc/string0.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/fatfs/ff.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/fatfs/option/ccsbcs.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/mp-readline/readline.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/netutils/netutils.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/timeutils/timeutils.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/utils/pyexec.c
        ${CMAKE_SOURCE_DIR}/micropython/lib/utils/pyhelp.c)
add_library(utils ${utils_SOURCE})