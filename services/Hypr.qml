pragma Singleton

import Quickshell
import Quickshell.Hyprland
import QtQuick

Singleton {
  id: root

  readonly property var workspaces: Hyprland.workspaces
  readonly property var activeWorkspace: Hyprland.focusedWorkspace

  function dispatch(command) {
    Hyprland.dispatch(command);
  }

  Connections {
    target: Hyprland
    function onRawEvent(event) {
      if (["workspace", "focusedmon", "openwindow", "closewindow"].includes(event.name)) {
        Hyprland.refreshWorkspaces();
      }
    }
  }
}
