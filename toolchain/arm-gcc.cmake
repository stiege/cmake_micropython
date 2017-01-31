include(CMakeForceCompiler)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(CMAKE_C_COMPILER ${COMPILER_PREFIX}arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER ${COMPILER_PREFIX}arm-none-eabi-g++)
set(CMAKE_ASM_COMPILER ${COMPILER_PREFIX}arm-none-eabi-g++)
set(CMAKE_AR ${COMPILER_PREFIX}arm-none-eabi-ar)
set(CMAKE_RANLIB ${COMPILER_PREFIX}arm-none-eabi-ranlib)

set(OBJSIZE ${COMPILER_PREFIX}arm-none-eabi-size)
set(OBJCOPY ${COMPILER_PREFIX}arm-none-eabi-objcopy)
set(OBJDUMP ${COMPILER_PREFIX}arm-none-eabi-objdump)
set(DEBUGGER ${COMPILER_PREFIX}arm-none-eabi-gdb)

set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")
set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "")
set(CMAKE_SHARED_LIBRARY_LINK_ASM_FLAGS "")

set(SHARED_LIBS OFF)
set(STATIC_LIBS ON)

set(STARTUP_SCRIPT ${CMAKE_SOURCE_DIR}/micropython/stmhal/startup_stm32.S)
set(LINKER_SCRIPT ${CMAKE_SOURCE_DIR}/toolchain/stm32f405.ld)
set(LINK_FILE_DIR ${CMAKE_SOURCE_DIR}/toolchain/)

set(CFLAGS_CORTEX_M "-mthumb -mabi=aapcs-linux -mfpu=fpv4-sp-d16 -mfloat-abi=hard -fsingle-precision-constant")
set(CFLAGS_CORTEX_M "${CFLAGS_CORTEX_M} -Wdouble-promotion")
set(CFLAGS_MCU_f4 "${CFLAGS_CORTEX_M} -mtune=cortex-m4 -mcpu=cortex-m4 -DMCU_SERIES_F4")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CFLAGS_MCU_f4} -nostdlib -fdata-sections -ffunction-sections")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DSTM32F405xx -DSTM32_HAL_H=\\\"stm32f4xx_hal.h\\\"")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Os -DNDEBUG")

set(CMAKE_EXE_LINKER_FLAGS "-L${LINK_FILE_DIR} -T${LINKER_SCRIPT}")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-Map=${MAP},--gc-sections,--cref,-nostdlib")

