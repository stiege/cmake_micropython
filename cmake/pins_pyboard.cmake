set(stmhal_dir ${CMAKE_SOURCE_DIR}/micropython/stmhal)
set(pins_pyboard_SOURCE ${stmhal_dir}/build-PYBV11/pins_PYBV11.c)
set(micropython_make_output build-PYBV11/pins_PYBV11.c build-PYBV11/genhdr/qstrdefs.generated.h)

add_custom_command(
        OUTPUT ${pins_pyboard_SOURCE}
        COMMAND +make -C ${stmhal_dir} BOARD=PYBV11 build-PYBV11/pins_PYBV11.c)

add_custom_command(
        OUTPUT ${stmhal_dir}/build-PYBV11/genhdr/qstrdefs.generated.h
        COMMAND +make -C ${stmhal_dir} BOARD=PYBV11 build-PYBV11/genhdr/qstrdefs.generated.h)

add_custom_target(generated_qstrings
        DEPENDS ${stmhal_dir}/build-PYBV11/genhdr/qstrdefs.generated.h)

add_library(pins_pyboard ${pins_pyboard_SOURCE})
add_dependencies(pins_pyboard generated_qstrings)

include_directories(${stmhal_dir}/boards/PYBV11)
include_directories(${stmhal_dir}/build-PYBV11)
