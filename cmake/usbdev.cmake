include_directories(${CMAKE_SOURCE_DIR}/micropython/stmhal/usbdev/class/inc)
include_directories(${CMAKE_SOURCE_DIR}/micropython/stmhal/usbdev/core/inc)

set(usbdev_SOURCE
        ${CMAKE_SOURCE_DIR}/micropython/stmhal/usbdev/core/src/usbd_core.c
        ${CMAKE_SOURCE_DIR}/micropython/stmhal/usbdev/core/src/usbd_ctlreq.c
        ${CMAKE_SOURCE_DIR}/micropython/stmhal/usbdev/core/src/usbd_ioreq.c
        ${CMAKE_SOURCE_DIR}/micropython/stmhal/usbdev/class/src/usbd_cdc_msc_hid.c
        ${CMAKE_SOURCE_DIR}/micropython/stmhal/usbdev/class/src/usbd_msc_bot.c
        ${CMAKE_SOURCE_DIR}/micropython/stmhal/usbdev/class/src/usbd_msc_scsi.c
        ${CMAKE_SOURCE_DIR}/micropython/stmhal/usbdev/class/src/usbd_msc_data.c)
add_library(usbdev ${usbdev_SOURCE})