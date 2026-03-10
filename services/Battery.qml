pragma Singleton

import Quickshell
import Quickshell.Services.UPower
import QtQuick

Singleton {
    id: root

    readonly property var device: UPower.displayDevice

    property int percentage: Math.round(device.percentage * 100)
    property bool charging: device.state === UPowerDeviceState.Charging

    property bool pluggedIn: device.state === UPowerDeviceState.FullyCharged || 
    device.state === UPowerDeviceState.PendingCharge
}
