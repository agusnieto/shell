pragma Singleton
import QtQuick

QtObject {
    // bar
    readonly property int barHeight: 32
    readonly property int widgetGap: 20

    readonly property int widgetPadding: 12

    //widgets
    readonly property int maxTitleWidth: 200

    readonly property int trayIconSize: 16
    readonly property int traySpacing: 6

    readonly property int wsWidthActive: 24
    readonly property int wsWidthOccupied: 12
    readonly property int wsWidthEmpty: 8
    readonly property int wsHeight: 8
    readonly property int wsSpacing: 8

    // style
    readonly property int cornerRadius: 20
    readonly property int animSpeed: 200
}
