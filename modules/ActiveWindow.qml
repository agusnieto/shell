import QtQuick
import "../services"
import "../theme"

Text {
    id: activeWinText

    text: {
        const win = Hypr.activeWindow;
        if (!win) return "Desktop";

        return (win.title && win.title !== "") ? win.title : (win.appId || "Window");
    }

    font.family: Fonts.name
    font.pixelSize: Fonts.size
    color: Colors.white
    elide: Text.ElideRight

    Behavior on text {
        SequentialAnimation {
            ParallelAnimation {
                NumberAnimation { target: activeWinText; property: "opacity"; to: 0; duration: Config.animSpeed / 3 }
                NumberAnimation { target: activeWinText; property: "font.letterSpacing"; to: 5; duration: Config.animSpeed / 3 }
            }

            PropertyAction { }

            ParallelAnimation {
                NumberAnimation { target: activeWinText; property: "opacity"; to: 1; duration: Config.animSpeed }
                NumberAnimation { target: activeWinText; property: "font.letterSpacing"; to: 0; duration: Config.animSpeed; easing.type: Easing.OutCubic }
            }
        }
    }
}
