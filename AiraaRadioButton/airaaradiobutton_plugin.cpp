#include "airaaradiobutton_plugin.h"



#include <qqml.h>

void AiraaRadioButtonPlugin::registerTypes(const char *uri)
{
    // @uri com.mycompany.qmlcomponents
    qmlRegisterType(QUrl("qrc:/AiraaRadioButton.qml"),uri, 1, 0, "AiraaRadioButton");
}

