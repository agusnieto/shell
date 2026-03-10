import Quickshell
import Quickshell.Wayland
import QtQuick
import "../theme"

Scope {
    Variants {
	model: Quickshell.screens

	PanelWindow {
	    required property var modelData
	    screen: modelData

	    anchors {
		top: true
		bottom: true
		left: true
		right: true
	    }

	    color: "transparent"
	    exclusionMode: ExclusionMode.Ignore 
	    WlrLayershell.layer: WlrLayer.Overlay

	    // click through region on the whole screen
	    mask: Region {} 

	    RoundCorner {
		anchors.top: parent.top
		anchors.topMargin: Config.barHeight
		anchors.left: parent.left
		implicitSize: Config.cornerRadius
		color: Colors.background
		corner: RoundCorner.CornerEnum.TopLeft
	    }

	    RoundCorner {
		anchors.top: parent.top
		anchors.topMargin: Config.barHeight
		anchors.right: parent.right
		implicitSize: Config.cornerRadius
		color: Colors.background
		corner: RoundCorner.CornerEnum.TopRight
	    }

	    RoundCorner {
		anchors.bottom: parent.bottom
		anchors.left: parent.left
		implicitSize: Config.cornerRadius
		color: Colors.background
		corner: RoundCorner.CornerEnum.BottomLeft
	    }

	    RoundCorner {
		anchors.bottom: parent.bottom
		anchors.right: parent.right
		implicitSize: Config.cornerRadius
		color: Colors.background
		corner: RoundCorner.CornerEnum.BottomRight
	    }
	}
    }
}
