import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.SystemTray
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

		CommonContainer {
		    WorkspaceWidget {}
		}

		CommonContainer {
		    ActiveWindow {}
		}

		CommonContainer {
		    visible: trayItems.count > 0

		    Row {
			spacing: Config.traySpacing
			TrayWidget { 
			    id: trayItems
			}
		    }
		}

		CommonContainer {
		    ClockWidget {}
		}

		BatteryWidget {}

		Item { Layout.fillWidth: true }
	    }
	}
    }
} 
