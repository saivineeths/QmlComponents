#ifndef AIRAABUTTON_PLUGIN_H
#define AIRAABUTTON_PLUGIN_H

#include <QQmlExtensionPlugin>

class AiraaButtonPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    void registerTypes(const char *uri) override;
};

#endif // AIRAABUTTON_PLUGIN_H
