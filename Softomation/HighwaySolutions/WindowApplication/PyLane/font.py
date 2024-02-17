from PySide6.QtCore import Qt
from PySide6.QtGui import QFontDatabase
from PySide6.QtCore import QSize
from PySide6.QtWidgets import QApplication, QLabel, QPushButton
from PySide6.QtGui import QIcon, QFont, QPixmap,QPainter

def main():
    app = QApplication([])

    # Register Material Icons font
    font_id = QFontDatabase.addApplicationFont("assets/font/MaterialIcons-Regular.ttf")
    font_family = QFontDatabase.applicationFontFamilies(font_id)[0]
    material_font = app.font()
    material_font.setFamily(font_family)

    label = QLabel("\ue88a", alignment=Qt.AlignCenter)  # Use unicode for the icon
    #label.setFont(material_font)
    font = QFont()  # Create a new QFont object
    font.setFamily(material_font.family())  # Set the font family
    font.setPointSize(50)  # Change the font size as needed to resize the icon
    label.setFont(font)
    label.setStyleSheet("color: red; border: none;")
   
    label.adjustSize()  # Adjust the size to apply the style sheet
    size = label.size()
    print("Label size:", size.width(), "x", size.height())
    
    label.show()


    
    

    app.exec()

if __name__ == "__main__":
    main()
