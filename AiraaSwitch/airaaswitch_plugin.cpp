#include "AiraaSwitch_plugin.h"

//#include "myitem.h"

#include <qqml.h>

void AiraaSwitchPlugin::registerTypes(const char *uri)
{
    // @uri com.mycompany.qmlcomponents
    //qmlRegisterType<MyItem>(uri, 1, 0, "MyItem");
    qmlRegisterType(QUrl("qrc:/AiraaSwitch.qml"),uri, 1, 0, "AiraaSwitch");

}

