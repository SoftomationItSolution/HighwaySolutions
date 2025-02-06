import time
from sdks.rfid.mantra_rfid_reader_test import MantraRfidReaderTest

equipment={"IpAddress":"192.168.1.116","PortNumber":9090}
rfid_thread = MantraRfidReaderTest(equipment)
rfid_thread.daemon=True
rfid_thread.start()
while True:
        try:
            time.sleep(0.1)
        except KeyboardInterrupt:
            print('closed While')
           