import Quickshell
import QtQuick
import QtQuick.Layouts
import "../theme"

Scope {
    Variants {
        model: Quickshell.screens
        PanelWindow {
            required property var modelData
            screen: modelData
            anchors { top: true; left: true; right: true }
            implicitHeight: 32 + 12 // Bar Rectangle + Corner
            
            color: "transparent"

            // Bar body
            Rectangle {
                id: barBody
                width: parent.width
                height: 32
                color: Colors.background

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 12
                    anchors.rightMargin: 12
                    WorkspaceWidget {}
                    Item { Layout.fillWidth: true }
                    ClockWidget {}
                }
            }

            // Concave corners
            RoundCorner {
                anchors.top: barBody.bottom
                anchors.left: parent.left
                implicitSize: 12 // Curve radius
                color: Colors.background
                corner: RoundCorner.CornerEnum.TopLeft
            }

            RoundCorner {
                anchors.top: barBody.bottom
                anchors.right: parent.right
                implicitSize: 12
                color: Colors.background
                corner: RoundCorner.CornerEnum.TopRight
            }
        }
    }
}
