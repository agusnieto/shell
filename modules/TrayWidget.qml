import QtQuick
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import "../theme"

Repeater {
    model: SystemTray.items
    delegate: MouseArea {
	id: trayItem
	required property var modelData
	implicitWidth: Config.trayIconSize
	implicitHeight: Config.trayIconSize
	acceptedButtons: Qt.LeftButton | Qt.RightButton
	onClicked: (event) => {
	    if (event.button === Qt.LeftButton) {
		modelData.activate();
	    } else if (event.button === Qt.RightButton) {
		modelData.secondaryActivate();
	    }
	}
	IconImage {
	    anchors.fill: parent
	    source: modelData.icon
	}
    }
} 
