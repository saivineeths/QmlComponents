#ifndef AIRAACHECKBOX_PLUGIN_H
#define AIRAACHECKBOX_PLUGIN_H

#include <QQmlExtensionPlugin>

class AiraaCheckBoxPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    void registerTypes(const char *uri) override;
};

#endif // AIRAACHECKBOX_PLUGIN_H
