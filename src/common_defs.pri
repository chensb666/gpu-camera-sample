#DEFINES += SUPPORT_XIMEA
#DEFINES += SUPPORT_FLIR
#DEFINES += SUPPORT_IMPERX
DEFINES += SUPPORT_GENICAM

TARGET_ARCH=$${QT_ARCH}

contains(TARGET_ARCH, arm64 ) {
    BITS = 64
    PLATFORM = Arm64
} else {
    contains(TARGET_ARCH, x86_64) {
        BITS = 64
        win32: PLATFORM = x64
    } else {
        BITS = 32
        win32: PLATFORM = win32
    }
    unix: PLATFORM = Linux$$BITS
}

PROJECT_NAME = GPUCameraSample

DESTDIR = $$absolute_path($$PWD/../$${PROJECT_NAME}_$$PLATFORM)
CONFIG(debug, debug|release){
    DESTDIR = $$DESTDIR/debug
}else:CONFIG(release, debug|release){
    DESTDIR = $$DESTDIR/release
}
