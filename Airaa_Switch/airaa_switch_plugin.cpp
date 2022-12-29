#include "airaa_switch_plugin.h"

//#include "myitem.h"

#include <qqml.h>

void Airaa_SwitchPlugin::registerTypes(const char *uri)
{
    // @uri com.mycompany.qmlcomponents
    //qmlRegisterType<MyItem>(uri, 1, 0, "MyItem");
    qmlRegisterType(QUrl("qrc:/Airaa_Switch.qml"),uri, 1, 0, "Airaa_Switch");

}

