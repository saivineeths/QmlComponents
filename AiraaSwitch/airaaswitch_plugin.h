#ifndef AiraaSwitch_PLUGIN_H
#define AiraaSwitch_PLUGIN_H

#include <QQmlExtensionPlugin>

class AiraaSwitchPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    void registerTypes(const char *uri) override;
};

#endif // AiraaSwitch_PLUGIN_H
