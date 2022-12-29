#ifndef AIRAA_SWITCH_PLUGIN_H
#define AIRAA_SWITCH_PLUGIN_H

#include <QQmlExtensionPlugin>

class Airaa_SwitchPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    void registerTypes(const char *uri) override;
};

#endif // AIRAA_SWITCH_PLUGIN_H
