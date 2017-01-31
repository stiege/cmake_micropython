include(ExternalProject)

ExternalProject_Add(gtest
        PREFIX ${CMAKE_SOURCE_DIR}/gtest
        DOWNLOAD_COMMAND ""
        SOURCE_DIR ${CMAKE_SOURCE_DIR}/gtest
        CMAKE_ARGS "-DCMAKE_BUILD_TYPE=Release" "-DCMAKE_INSTALL_PREFIX=${CMAKE_SOURCE_DIR}/gtest"
        BUILD_COMMAND ${EXTERNAL_PROJECT_MAKE_COMMAND}
        INSTALL_DIR ${CMAKE_SOURCE_DIR}/gtest)

add_dependencies(deps gtest)
ExternalProject_Get_Property(gtest INSTALL_DIR)

set(GTEST_INCLUDE_DIRS ${INSTALL_DIR}/include)
set(GTEST_LIBRARY ${INSTALL_DIR}/lib/libgtest.a)
set(GTEST_MAIN_LIBRARY ${INSTALL_DIR}/lib/libgtest_main.a)
set(GTEST_BOTH_LIBRARIES ${GTEST_LIBRARY} ${GTEST_MAIN_LIBRARY})

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-conversion-null")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread")

set_target_properties(gtest PROPERTIES EXCLUDE_FROM_ALL TRUE)
include_directories(${GTEST_INCLUDE_DIRS})

set(ALL_TESTS "")

function(add_gtest TARGET_NAME)
    set(TEST_EXEC ${TARGET_NAME}_test)

    # Build the test executable.
    add_executable(${TEST_EXEC} ${ARGN})
    target_link_libraries(${TEST_EXEC} ${GTEST_BOTH_LIBRARIES})

    # This adds the "make test" target.
    add_custom_target(${TARGET_NAME}
            COMMAND ${TEST_EXEC}
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
            COMMENT "Running tests.")
    LIST(APPEND ALL_TESTS ${TEST_EXEC})
    add_test(NAME ${TEST_EXEC} COMMAND ${TEST_EXEC})
endfunction()