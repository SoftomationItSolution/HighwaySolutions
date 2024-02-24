# # import usb.core
# # import usb.util

# # # Vendor ID and Product ID of the printer
# # VENDOR_ID = 0x154F
# # PRODUCT_ID = 0x154F

# # # Find the printer device
# # device = usb.core.find(idVendor=VENDOR_ID, idProduct=PRODUCT_ID)

# # if device is None:
# #     raise ValueError("Printer not found.")

# # # Set configuration
# # device.set_configuration()

# # # Endpoint for output
# # endpoint = device[0][(0, 0)][0]

# # # Data to print
# # data_to_print = b"Hello, Printer!\n"  # Replace with your desired data to print

# # # Send data to the printer
# # endpoint.write(data_to_print)

# # # Release the interface
# # usb.util.release_interface(device, 0)

# # # Disable the device
# # device.reset()

# import win32print

# # def get_printer_port(printer_name):
# #     # Open the printer
# #     printer_handle = win32print.OpenPrinter(printer_name)
    
# #     # Get the printer info
# #     printer_info = win32print.GetPrinter(printer_handle, 2)
    
# #     # Extract and return port name
# #     port_name = printer_info['pPortName']
    
# #     # Close the printer handle
# #     win32print.ClosePrinter(printer_handle)
    
# #     return port_name


# # Get all available printers
# all_printers = win32print.EnumPrinters(win32print.PRINTER_ENUM_LOCAL, None, 1)
# for printer in all_printers:
#     port_name=get_printer_port(printer[1])
#     print(port_name)
# # Filter USB printers
# #usb_printers = [printer for printer in all_printers if "USB" in printer[2]]

# # Print the list of USB printers
# # for printer in usb_printers:
# #     print("Printer Name:", printer[2])
# #     print("Printer Port:", printer[3])
# #     print()