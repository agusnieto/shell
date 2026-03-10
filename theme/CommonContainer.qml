import QtQuick
import "../theme"

Rectangle {
    id: shell
    
    default property alias content: container.data
    
    color: Colors.surface
    radius: height / 2
    
    implicitHeight: Config.barHeight - 12
    
    implicitWidth: container.width + (Config.widgetPadding * 2)
    
    Row {
        id: container
        anchors.verticalCenter: parent.verticalCenter
        x: Config.widgetPadding
        spacing: 8
    }

    Behavior on implicitWidth {
        NumberAnimation { duration: Config.animSpeed; easing.type: Easing.OutCubic }
    }
}
