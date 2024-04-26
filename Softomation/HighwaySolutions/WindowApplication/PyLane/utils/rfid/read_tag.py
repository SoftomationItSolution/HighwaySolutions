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
                readUserData = ReadExtendedArea_Model(EReadBank.UserData, 0, 32, '00000000')#02100009010103000020020006
                readExtendedAreaList = [readTID,readUserData]
                print('Set Extended Read Result:TID & UserId')
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
        self.last_epc=''
        i=0
        tagDetails={"ReaderName":"","EPC":"","TID":"","UserData":"","Class":'00',"Plate":"XXXXXXXXXX"}
        while True:
            readList = []
            reader.read(100, readList)
            for tag in readList:
                if self.last_epc !=tag._EPC:
                    self.last_epc=tag._EPC
                    tagDetails["ReaderName"]=tag._ReaderName
                    tagDetails["EPC"]=tag._EPC
                    if hasattr(tag, '_TID'):
                        tagDetails["TID"]=tag._TID
                    else:
                        tagDetails["TID"]=""
                    # if hasattr(tag, '_UserData'):
                    #     tagDetails["UserData"]=bytes.fromhex(tag._UserData).decode('utf-8')
                    #     #tagDetails["Class"]= "00" if tagDetails["UserData"][:2]=="XX" else tagDetails["UserData"][:2]
                    #     #tagDetails["Plate"]=tagDetails["UserData"][2:]
                    # # else:
                    # #     tagDetails["UserData"]=""
                    # #     tagDetails["Class"]="00"
                    # #     tagDetails["Plate"]="XXXXXXXXXX"
                    print(tagDetails)
            i=i+1
def get_cs(con_type, ip_address, port):
    connection_string=f"{con_type}:{ip_address}:{port}"
    return connection_string

if __name__ == '__main__':
    
    # status= check_ping("192.168.1.116")
    # print(status)
    # if status is not False:
    #     print("here")
    s = Text()
    #con_str=get_cs("TCP", "192.168.10.85", 9090)
    con_str=get_cs("TCP", "192.168.10.19", 9090)
    s.main(con_str)
    # hex_string = "585858585858585858585858"
    # decoded_string = bytes.fromhex(hex_string).decode('utf-8')
    # print(len(decoded_string))

