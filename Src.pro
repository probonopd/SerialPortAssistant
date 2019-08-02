#-------------------------------------------------
#
# Project created by QtCreator 2017-02-17T10:38:47
#
#-------------------------------------------------

QT       += core gui serialport network xml

versionAtMost(QT_VERSION, 5.6) : error("Qt version must greater 5.6")
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = SerialPortAssistant
TEMPLATE = app

isEmpty(DESTDIR): DESTDIR = $$OUT_PWD/bin

CONFIG(debug, debug|release) {
    DEFINES += _DEBUG
}

win32{
    CONFIG(debug, debug|release) {
        TARGET_PATH=$${OUT_PWD}/Debug
    } else {
        TARGET_PATH=$${OUT_PWD}/Release
    }
}else{
    TARGET_PATH=$$OUT_PWD
}

isEmpty(PREFIX) : !isEmpty(INSTALL_ROOT) : PREFIX=$$INSTALL_ROOT
isEmpty(PREFIX) {
    android {
       PREFIX = /.
    } else {
        PREFIX = $$OUT_PWD/install
    }
}

isEmpty(BUILD_VERSION) {
    isEmpty(GIT) : GIT=$$(GIT)
    isEmpty(GIT) : GIT=git
    isEmpty(GIT_DESCRIBE) {
        GIT_DESCRIBE = $$system(cd $$system_path($$PWD) && $$GIT describe --tags)
        isEmpty(BUILD_VERSION) {
            BUILD_VERSION = $$GIT_DESCRIBE
        }
    }
    isEmpty(BUILD_VERSION) {
        BUILD_VERSION = $$system(cd $$system_path($$PWD) && $$GIT rev-parse --short HEAD)
    }
    
    isEmpty(BUILD_VERSION){
        warning("Built without git, please add BUILD_VERSION to DEFINES or add git path to environment variable GIT or qmake parameter GIT")
    }
}
isEmpty(BUILD_VERSION){
    BUILD_VERSION="v0.4.2"
}
message("BUILD_VERSION:$$BUILD_VERSION")

DEFINES += BUILD_VERSION=\"\\\"$$quote($$BUILD_VERSION)\\\"\"
VERSION=$$replace(BUILD_VERSION, v,)
win32{
    VERSION=$$split(VERSION, -)
    VERSION=$$first(VERSION)
}

other.files = License.md Authors.md Authors_zh_CN.md \
    ChangeLog.md ChangeLog_zh_CN.md
win32: other.files *= AppIcon.ico
other.path = $$PREFIX
other.CONFIG += directory no_check_exist
target.path = $$PREFIX/bin
INSTALLS += target other 

install_win.files = Install/Install.nsi
install_win.path = $$OUT_PWD
install_win.CONFIG += directory no_check_exist 
win32:  INSTALLS += install_win

install_unix.files = Install/install.sh
install_unix.path = $$PREFIX
install_unix.CONFIG += directory no_check_exist 
unix: !android: INSTALLS += install_unix

!android : !macx : unix {
    # install icons
    icon128.target = icon128
    icon128.files = Resource/png/SerialPortAssistant.png
    icon128.path = $${PREFIX}/share/pixmaps
    icon128.CONFIG = directory no_check_exist

    DESKTOP_FILE.target = DESKTOP_FILE
    DESKTOP_FILE.files = $$PWD/debian/SerialPortAssistant.desktop
    DESKTOP_FILE.path = $$system_path($${PREFIX})/share/applications
    DESKTOP_FILE.CONFIG += directory no_check_exist
    INSTALLS += DESKTOP_FILE icon128
}

SOURCES +=\
    $$PWD/MainWindow.cpp \
    $$PWD/Main.cpp \
    $$PWD/Global/Log.cpp \
    $$PWD/Global/Global.cpp \
    $$PWD/Common/Tool.cpp 
    
HEADERS += $$PWD/MainWindow.h \
    $$PWD/Global/Log.h \
    $$PWD/Global/Global.h \
    $$PWD/Common/Tool.h 

FORMS += $$PWD/MainWindow.ui

OTHER_FILES += \
    Authors.md \
    Authors_zh_CN.md \
    License.md \
    README*.md \
    ChangeLog.md \
    ChangeLog_zh_CN.md \
    appveyor.yml \
    ci/* \
    Install/* \
    .travis.yml \
    tag.sh \
    debian/* \
    Update/* \
    build_debpackage.sh

RC_FILE = AppIcon.rc

RESOURCES += \
    Resource/Resource.qrc

win32 : equals(QMAKE_HOST.os, Windows){
    INSTALL_TARGET = $$system_path($${PREFIX}/bin/$$(TARGET))

    Deployment_qtlib.path = $$system_path($${PREFIX}/bin)
    Deployment_qtlib.commands = "$$system_path($$[QT_INSTALL_BINS]/windeployqt)" \
                    --compiler-runtime \
                    --verbose 7 \
                    "$${INSTALL_TARGET}"
    INSTALLS += Deployment_qtlib
}
win32 {
    msvc {
        QMAKE_CXXFLAGS += /wd"4819"  
        QMAKE_CXXFLAGS += "/utf-8"
        #QMAKE_LFLAGS += -ladvapi32
        CONFIG(debug, debug|release) {
            QMAKE_LFLAGS += /SUBSYSTEM:WINDOWS",5.01" /NODEFAULTLIB:libcmtd
        }else{
            QMAKE_LFLAGS += /SUBSYSTEM:WINDOWS",5.01" /NODEFAULTLIB:libcmt
        }
    } else {
        DEFINES += "_WIN32_WINNT=0x0501" #__USE_MINGW_ANSI_STDIO
    }
}

LIBS *= -L$$DESTDIR -lRabbitCommon
