pragma Singleton

import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland
import QtQuick

Singleton {
    id: root

    readonly property var workspaces: Hyprland.workspaces
    readonly property var activeWorkspace: Hyprland.focusedWorkspace
    
    readonly property var activeWindow: ToplevelManager.activeToplevel

    function dispatch(command) {
        Hyprland.dispatch(command);
    }

    Connections {
        target: Hyprland
        function onRawEvent(event) {
            if (["workspace", "focusedmon", "openwindow", "closewindow", "activewindow"].includes(event.name)) {
                Hyprland.refreshWorkspaces();
            }
        }
    }
}
