#
# SPDX-FileCopyrightText: Copyright 2024 Arm Limited and/or its affiliates <open-source-office@arm.com>
#
# SPDX-License-Identifier: Apache-2.0
#

# The Arm GNU Toolchain is available for download from Arm Developer.
# https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads

set(CMAKE_SYSTEM_NAME      Linux)
set(CMAKE_SYSTEM_PROCESSOR aarch64)
set(CMAKE_CROSSCOMPILING   TRUE)

set(CMAKE_C_COMPILER   aarch64-none-linux-gnu-gcc)
set(CMAKE_CXX_COMPILER aarch64-none-linux-gnu-g++)

# set(CMAKE_FIND_ROOT_PATH  /opt/arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/)
set (CMAKE_PREFIX_PATH /usr/lib/aarch64-linux-gnu/cmake/Qt5/Qt5Config.cmake)
set (QT_DIR /usr/lib/aarch64-linux-gnu/cmake/Qt5)
set (Qt5_DIR /usr/lib/aarch64-linux-gnu/cmake/Qt5)
# set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
# set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
# set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
