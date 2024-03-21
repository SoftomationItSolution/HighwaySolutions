import pywinusb.hid as hid

def list_usb_devices():
    # Find all HID devices
    all_devices = hid.HidDeviceFilter().get_devices()

    if all_devices:
        print("USB Devices:")
        for device in all_devices:
            print(f"  Vendor ID: {hex(device.vendor_id)}, Product ID: {hex(device.product_id)}")
            print(f"  Description: {device.product_name}")
            print(f"  Serial Number: {device.serial_number}")
            print("")

if __name__ == '__main__':
    list_usb_devices()