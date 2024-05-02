from escpos.printer import Usb

# Initialize the printer
p = Usb(0x0FE6, 0x811E)  # Vendor ID and Product ID of your printer

# Print text
p.text("Hello World\n")

# Print QR code
p.qr("You can read me from your smartphone")

# Cut the paper
p.cut()
