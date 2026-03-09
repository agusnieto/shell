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
            implicitHeight: Config.barHeight
            
            color: Colors.background

            RowLayout {
                anchors.fill: parent
                spacing: Config.widgetGap

                Item { Layout.fillWidth: true }

                WorkspaceWidget {}
                
                ActiveWindow {
                    Layout.maximumWidth: 150
                }
                
                ClockWidget {}

                Item { Layout.fillWidth: true }
            }
        }
    }
}
