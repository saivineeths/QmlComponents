#include "airaacheckbox_plugin.h"


#include <qqml.h>

void AiraaCheckBoxPlugin::registerTypes(const char *uri)
{
    // @uri com.mycompany.qmlcomponents
    qmlRegisterType(QUrl("qrc:/AiraaCheckBox.qml"),uri, 1, 0, "AiraaCheckBox");
}

