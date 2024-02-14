import time
from com.rfid.Reader import *
from com.rfid.enumeration import *
from com.rfid.interface import *
from com.rfid.models import *
#from check_ping import check_ping

class ReaderInstance:
    _instance = None
    def __new__(cls, connection_string):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
            cls._instance.reader = Reader()
            if cls._instance.reader.initReader(connection_string):
                print(cls._instance.reader)
                readerAntPlan = ReaderWorkingAntSet_Model([1])
                print('Setting up the working antenna result:', cls._instance.reader.paramSet(EReaderEnum.WO_RFIDWorkingAnt, readerAntPlan))
                readTID = ReadExtendedArea_Model(EReadBank.TID, 0, 6, "")
                readExtendedAreaList = [readTID]
                print('Set Extended Read Result:TID')
                print(cls._instance.reader.paramSet(EReaderEnum.WO_RFIDReadExtended, readExtendedAreaList))
                setReaderBuzzer = ReaderBuzzer_Model()
                setReaderBuzzer.buzzerControl = EBuzzerControl.ReaderControl
                if cls._instance.reader.paramSet(EReaderEnum.RW_ReaderBuzzerSwitch, setReaderBuzzer) == EReaderResult.RT_OK:
                    print('Set the reader buzzer tone successfully!\n --------')
                else:
                    print('Set the reader buzzer tone failed!')
            else:
                print("Failed to create connection!")
        return cls._instance
    def get_reader_instance(self):
        return self.reader

class Text:
    def main(self, connection_string):
        reader_ = ReaderInstance(connection_string)
        reader = reader_.get_reader_instance()
        for i in range(100):
            readList = []
            reader.read(500, readList)
            for tag in readList:
                print("ReaderName:", tag._ReaderName)
                print("EPC:", tag._EPC)
                if hasattr(tag, '_TID'):
                    print("TID:", tag._TID)
                else:
                    print("TID information not available")
            reader.stop()
            print(i)
            #time.sleep(0.5)
def get_cs(con_type, ip_address, port):
    connection_string=f"{con_type}:{ip_address}:{port}"
    return connection_string

if __name__ == '__main__':
    
    # status= check_ping("192.168.1.116")
    # print(status)
    # if status is not False:
    #     print("here")
    s = Text()
    con_str=get_cs("TCP", "192.168.1.116", 9090)
    s.main(con_str)
