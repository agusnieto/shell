import QtQuick
import QtQuick.Layouts
import "../services"
import "../theme"

Row {
  spacing: 8
  
  Repeater {
    model: 10
    delegate: Rectangle {
      id: pill
      readonly property int wsId: index + 1
      readonly property var wsData: Hypr.workspaces.values.find(w => w.id === wsId)
      readonly property bool isActive: Hypr.activeWorkspace && Hypr.activeWorkspace.id === wsId
      readonly property bool isOccupied: wsData ? (wsData.lastIpcObject.windows > 0) : false

      implicitWidth: isActive ? 24 : (isOccupied ? 12 : 8)
      implicitHeight: 8
      radius: 4

      color: isActive ? Colors.cyan : (isOccupied ? Colors.white : Colors.gray)
      opacity: isActive ? 1.0 : (isOccupied ? 0.7 : 0.3)

      Behavior on implicitWidth { NumberAnimation { duration: 200; easing.type: Easing.OutCubic } }
      Behavior on color { ColorAnimation { duration: 200 } }

      MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: Hypr.dispatch("workspace " + wsId)
      }
    }
  }
}
