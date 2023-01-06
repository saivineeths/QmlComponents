#ifndef AIRAARADIOBUTTON_PLUGIN_H
#define AIRAARADIOBUTTON_PLUGIN_H

#include <QQmlExtensionPlugin>

class AiraaRadioButtonPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    void registerTypes(const char *uri) override;
};

#endif // AIRAARADIOBUTTON_PLUGIN_H
