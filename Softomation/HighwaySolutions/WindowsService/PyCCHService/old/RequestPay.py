import time
from datetime import datetime
import requests
from Config import config_file, write_log, get_date_time
from Database import select_transactions

API_URL = f'https://{config_file()["host"]}/{config_file()["etc"]}/{config_file()["api"]}/{config_file()["ver"]}'
# API_URL = f'https://192.168.1.173:8010/receive_data'
headers = {'Content-Type': 'application/xml'}

transaction_data = select_transactions()
while True:
    if transaction_data:
        for txn in transaction_data:
            txn = list(txn)
            txn[1] = datetime.strptime(txn[1], "%Y-%m-%d %H:%M:%S.%f")
            txn[1] = txn[1].strftime("%Y-%m-%dT%H:%M:%S")

            Payload = f'''<etc:ReqPay xmlns:etc="http://npci.org/etc/schema/">
            <Head msgId="{txn[0]}" orgId="IRBL" 
            ts="{get_date_time()['CurrentDateTime_s']}" 
            ver="{config_file()['ver']}" />
            <Meta>
            </Meta>
            <Txn id="{txn[0]}" note="" orgTxnId="" refId="" refUrl="" 
            ts="{txn[1]}" 
            type="DEBIT">
            <EntryTxn 
            id="{txn[0]}" tsRead="{txn[1]}" 
            ts="{txn[1]}" type="DEBIT">
            </EntryTxn>
            </Txn> 
            <Plaza geoCode="11.00,11.00" id="1234" name="" subtype="State" type="Toll">
            <EntryPlaza geoCode="11" id="1234" name="" subtype="State" type="Toll"/>
            <Lane direction="N" id="a" readerId="12" Status="{txn[3]}" 
            Mode="{txn[4]}" 
            laneType="Hybrid" ExitGate="" Floor=""/>
            <EntryLane direction="N" id="a" readerId="12" Status="{txn[3]}" 
            Mode="{txn[4]}" 
            laneType="Hybrid" EntryGate="" Floor=""></EntryLane>
            <ReaderVerificationResult publicKeyCVV="" procRestrictionResult="ok" signAuth="VALID" 
            tagVerified="NETC TAG" ts="{txn[1]}" txnCounter="1234" 
            txnStatus="SUCCESS" 
            vehicleAuth="UNKNOWN" >
             <TagUserMemory>
             <Detail name="TagSignature" value="{txn[5]}" />
             <Detail name="TagVRN" value="{txn[7]}" />
             <Detail name="TagVC" value="{txn[8]}" />
             </TagUserMemory>
            </ReaderVerificationResult>
            </Plaza> 
            <Vehicle TID="{txn[6]}" 
            tagId="{txn[5]}" wim="" staticweight=""/>
            <VehicleDetails>
            <Detail name="AVC" value="{txn[8]}" /> 
            <Detail name="LPNumber" value="{txn[7]}" /> 
            </VehicleDetails>
            </Vehicle>
            <Payment>
            <Amount curr="INR" value="0" PriceMode="POINT" 
            IsOverWeightCharged="FALSE" PaymentMode="Tag">
            <OverwightAmount curr="INR" value="0" PaymentMode="Tag"/>
            </Amount>
            </Payment> 
            <Signature>Testing</Signature>
            </etc:ReqPay>'''

            try:
                Payload_Request = requests.post(API_URL, headers=headers, data=Payload)
                Payload_Request.raise_for_status()
                # write_log(f"Response: {txn['FastagTransactionId']} : {Payload_Request.text}", log_type="Services")
                # write_log(f"Request Payload: {Payload}", log_type="Services")
                if Payload_Request.status_code == 200:
                    write_log(f"Success - Response: {txn[0]} : {Payload_Request.text}",
                              log_type="RequestPaySuccess")
                    write_log(f"Request Payload: {Payload}", log_type="RequestPaySuccess")
                else:
                    write_log(f"Failed - Response: {txn[0]} : {Payload_Request.text}",
                              log_type="RequestPayFailed")
                    write_log(f"Request Payload: {Payload}", log_type="RequestPayFailed")
            except requests.exceptions.RequestException as e:
                write_log(f"Error sending data: {str(e)}", log_type="Services")
    else:
        print("No transactions found")
    time.sleep(1)
