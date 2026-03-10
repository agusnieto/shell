import QtQuick
import "../services"
import "../theme"

Text {
    text: Battery.percentage + "% " + (Battery.charging ? "Connected" : "Discharging")
  font.family: Fonts.name
  font.pixelSize: Fonts.size
  font.bold: true
  color: Colors.white 
}
