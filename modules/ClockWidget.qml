import QtQuick
import "../services"
import "../theme"

Text {
  text: Time.time
  font.family: Fonts.name
  font.pixelSize: Fonts.size
  color: Colors.white 
}
