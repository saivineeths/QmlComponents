TEMPLATE = lib
TARGET = AiraaRadioButton
QT += qml quick
CONFIG += plugin c++11

TARGET = $$qtLibraryTarget($$TARGET)
uri = com.mycompany.qmlcomponents

# Input
SOURCES += \
        airaaradiobutton_plugin.cpp

HEADERS += \
        airaaradiobutton_plugin.h

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
    AiraaRadio.qrc


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

qhpTarget.target = $${TARGET}.qhp
qhpTarget.commands = $$[QT_INSTALL_QML]/../bin/qdoc $$PWD/qdoc/$${TARGET}.qdocconf -outputdir $$DESTDIR/doc/
qhpTarget.depends = $$PWD/qdoc/$${TARGET}.qdocconf

qchTarget.target = $${TARGET}.qch
qchTarget.commands = qhelpgenerator $$DESTDIR/doc/$${TARGET}.qhp -o $$DESTDIR/doc/$${TARGET}.qch
qchTarget.depends = qhpTarget

QMAKE_EXTRA_TARGETS += qhpTarget qchTarget
PRE_TARGETDEPS += $${TARGET}.qhp $${TARGET}.qch
