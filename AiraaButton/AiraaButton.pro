TEMPLATE = lib
TARGET = AiraaButton
QT += qml quick
CONFIG += plugin c++11

TARGET = $$qtLibraryTarget($$TARGET)
uri = com.mycompany.qmlcomponents

# Input
SOURCES += \
        airaabutton_plugin.cpp

HEADERS += \
        airaabutton_plugin.h

DISTFILES = qmldir

!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    copy_qmldir.target = $$OUT_PWD/qmldir
    copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
    copy_qmldir.commands = $(COPY_FILE) "$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)" "$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)"
    QMAKE_EXTRA_TARGETS += copy_qmldir
    PRE_TARGETDEPS += $$copy_qmldir.target
}

qmldir.files = qmldir
unix {
    installPath = $$[QT_INSTALL_QML]/$$replace(uri, \., /)
    qmldir.path = $$installPath
    target.path = $$installPath
    INSTALLS += target qmldir
}

RESOURCES += \
    airaaButton.qrc

DESTDIR = $$PWD/../../builds/$${BUILD_NAME}/$${TARGET}
OBJECTS_DIR = $${DESTDIR}/../.objects
MOC_DIR = $${DESTDIR}/../.moc
RCC_DIR = $${DESTDIR}/../.rcc
UI_DIR = $${DESTDIR}/../.ui

# Copy the qmldir file to the same folder as the plugin binary
cpqmldir.files = qmldir
cpqmldir.path = $$DESTDIR
COPIES += cpqmldir

#Custom Target to run commands to create the documentation file

myqhpTarget.target = AiraaButton.qhp
myqhpTarget.commands = C:/Qt/6.3.2/mingw_64/bin/qdoc $$PWD/../../QmlComponents/$${TARGET}/qdoc/AiraaButton.qdocconf -outputdir $$DESTDIR/doc/
myqhpTarget.depends = $$PWD/../../QmlComponents/$${TARGET}/qdoc/AiraaButton.qdocconf

myqchTarget.target = AiraaButton.qch
myqchTarget.commands = qhelpgenerator $$DESTDIR/doc/AiraaButton.qhp -o $$DESTDIR/doc/AiraaButton.qch
myqchTarget.depends = myqhpTarget

QMAKE_EXTRA_TARGETS += myqhpTarget myqchTarget
PRE_TARGETDEPS += AiraaButton.qhp AiraaButton.qch
