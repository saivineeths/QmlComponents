#include "airaabutton_plugin.h"
#include <qqml.h>

void AiraaButtonPlugin::registerTypes(const char *uri)
{
    // @uri com.mycompany.qmlcomponents
   // qmlRegisterType<MyItem>(uri, 1, 0, "MyItem");
    qmlRegisterType(QUrl("qrc:/ButtonBase.qml"),uri, 1, 0, "ButtonBase");
    qmlRegisterType(QUrl("qrc:/IconButton.qml"),uri, 1, 0, "IconButton");
    qmlRegisterType(QUrl("qrc:/TextButton.qml"),uri, 1, 0, "TextButton");
    qmlRegisterType(QUrl("qrc:/TextIcon.qml"),uri, 1, 0, "TextIcon");
}

