cmake_minimum_required(VERSION 2.8)
enable_testing()
enable_language(C)
enable_language(CXX)
enable_language(ASM)

option(CROSSCOMPILING "Cross-compile for Pyboard" OFF)

set(CMAKE_COMMON_FLAGS "-Wall -Wpointer-arith -Werror")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CMAKE_COMMON_FLAGS} -std=gnu99")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CMAKE_COMMON_FLAGS} -std=c++11")

add_custom_target(deps)
set_source_files_properties(deps SYMBOLIC)


# Testing

if(${CROSSCOMPILING})
    MESSAGE("### CROSSCOMPILING ###")
    function(add_gtest TARGET_NAME)
        MESSAGE("Skipping PC Test '${TARGET_NAME}'")
    endfunction()
else()
    MESSAGE("### NATIVE BUILD ###")
    include(${CMAKE_CURRENT_LIST_DIR}/cmake/gtest.cmake)
    add_dependencies(deps gtest)
endif()

# Module definitions

include(${CMAKE_CURRENT_LIST_DIR}/module/modules.cmake)

# Output definitions

if(${CROSSCOMPILING})
    include(${CMAKE_SOURCE_DIR}/cmake/pins_pyboard.cmake)
    include(${CMAKE_SOURCE_DIR}/cmake/micropython.cmake)
    include(${CMAKE_SOURCE_DIR}/cmake/stm32hal.cmake)
    include(${CMAKE_SOURCE_DIR}/cmake/usbdev.cmake)
    include(${CMAKE_SOURCE_DIR}/cmake/math.cmake)
    include(${CMAKE_SOURCE_DIR}/cmake/utils.cmake)

    target_link_libraries(usbdev pins_pyboard)
    target_link_libraries(utils micropython)
    target_link_libraries(micropython pins_pyboard utils usbdev math)

    add_dependencies(emit_native generated_qstrings)
    add_dependencies(math generated_qstrings)
    add_dependencies(usbdev stm32hal)
    add_dependencies(py_vm generated_qstrings)
    add_dependencies(stm32hal generated_qstrings)

    project(micropython-ARM NONE)
    set(ELF ${PROJECT_NAME}.elf)
    set(DFU ${PROJECT_NAME}.dfu)
    set(HEX ${PROJECT_NAME}.hex)
    set(MAP ${PROJECT_NAME}.map)
    set(BIN_0 ${PROJECT_NAME}0.bin)
    set(BIN_1 ${PROJECT_NAME}1.bin)
    set(FLASH_ADDR 0x08000000)
    set(TEXT_ADDR 0x08020000)
    set(DFU_UTIL ${CMAKE_SOURCE_DIR}/micropython/tools/dfu.py)
    set(PY_DFU ${CMAKE_SOURCE_DIR}/micropython/tools/pydfu.py)
    set(PY python)
    include(${CMAKE_SOURCE_DIR}/toolchain/arm-gcc.cmake)
    add_executable(${ELF}
            ${STARTUP_SCRIPT}
            ${stm32hal_SOURCE}
            ${stm32f4hal_SOURCE})
    add_dependencies(${ELF} generated_qstrings)
    set_source_files_properties(
            ${STARTUP_SCRIPT}
            PROPERTIES
            LANGUAGE C
            OBJECT_DEPENDS ${LINKER_SCRIPT}
            OBJECT_DEPENDS ${LINK_FILE_DIR}/common.ld)
    target_link_libraries(${ELF} micropython)
    add_custom_target(
            ${DFU} ALL
            COMMAND ${OBJCOPY} -O binary -j .isr_vector ${ELF} ${BIN_0}
            COMMAND ${OBJCOPY} -O binary -j .text -j .data ${ELF} ${BIN_1}
            COMMAND ${PY} ${DFU_UTIL} -b ${FLASH_ADDR}:${BIN_0} -b ${TEXT_ADDR}:${BIN_1} ${DFU}
            DEPENDS ${ELF})
    add_custom_command(
            TARGET ${ELF}
            POST_BUILD
            COMMAND ${OBJSIZE} ${ELF})
    add_custom_target(
            ${HEX} ALL
            COMMAND ${OBJCOPY} -O ihex ${ELF} ${HEX}
            DEPENDS ${ELF})
    add_custom_target(
            deploy
            COMMAND ${PY} ${PY_DFU} -u ${DFU}
            DEPENDS ${DFU})
    set_source_files_properties(deploy SYMBOLIC)
else()
    project(micropython-PC)
    # PC port unimplemented
endif()
