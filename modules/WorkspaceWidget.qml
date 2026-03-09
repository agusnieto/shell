import QtQuick
import QtQuick.Layouts
import "../services"
import "../theme"

Row {
  spacing: Config.wsSpacing
  
  Repeater {
    model: 10
    delegate: Rectangle {
      id: pill
      readonly property int wsId: index + 1
      readonly property var wsData: Hypr.workspaces.values.find(w => w.id === wsId)
      readonly property bool isActive: Hypr.activeWorkspace && Hypr.activeWorkspace.id === wsId
      readonly property bool isOccupied: wsData ? (wsData.lastIpcObject.windows > 0) : false

      implicitWidth: isActive ? Config.wsWidthActive : (isOccupied ? Config.wsWidthOccupied : Config.wsWidthEmpty)
      implicitHeight: Config.wsHeight
      radius: 4

      color: isActive ? Colors.cyan : (isOccupied ? Colors.white : Colors.gray)
      opacity: isActive ? 1.0 : (isOccupied ? 0.7 : 0.3)

      Behavior on implicitWidth { NumberAnimation { duration: Config.animSpeed; easing.type: Easing.OutCubic } }
      Behavior on color { ColorAnimation { duration: Config.animSpeed } }

      MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: Hypr.dispatch("workspace " + wsId)
      }
    }
  }
}
