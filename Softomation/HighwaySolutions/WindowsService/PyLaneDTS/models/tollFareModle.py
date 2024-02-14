import requests
from utils.constants import JsonDateFormat
from datetime import datetime,date, timedelta
def SaveTollFare(data,db):
    params=[data['TollFareId'],data['EffectedFrom'],data['DataStatus'],data['CreatedDate'],data['CreatedBy'],data['ModifiedDate'],data['ModifiedBy']]
    resultData=db.execute_procedure('USP_TollFareMasterInsertUpdate', params)
    if resultData[0]['AlertMessage'] != 'Cannot update toll fare. EffectedFrom must be greater than the current date;':
        for d in data['TollFareConfigurations']:
            params=[d['TollFareId'],d['JourneyId'],d['SystemVehicleClassId'],d['SubVehicleClassId'],d['TollFare'],d['ReturnFare'],
                d['FasTagPenalty'],d['OverweightPenalty']]
            resultData1=db.execute_procedure('USP_TollFareConfigurationInsertUpdate', params)
            print(resultData1)
    print(resultData)


def tollFareImport(api_base_url,db):
    try:
        date=JsonDateFormat()
        headers = {'User-Agent': 'MyApp/1.0'}
        api_url=api_base_url+'Softomation/FTH-TMS-RSD/TollFareGetByEffectedFrom?EffectedFrom='+date
        response = requests.get(api_url, headers=headers, verify=False)
        if response.status_code == 200:
            data = response.json()
            data=data["ResponseData"]
            SaveTollFare(data,db)
        else:
            print(f"Error: {response.status_code} - {response.text}")
    except Exception as e:
        print(f"Error fetching or storing data: {e}")


def tollFareFutureImport(api_base_url,db):
    try:
        current_date = date.today()
        new_date = current_date + timedelta(days=1)
        new_date=JsonDateFormat(new_date)
        headers = {'User-Agent': 'MyApp/1.0'}
        api_url=api_base_url+'Softomation/FTH-TMS-RSD/TollFareGetByEffectedFrom?EffectedFrom='+new_date
        response = requests.get(api_url, headers=headers, verify=False)
        if response.status_code == 200:
            data = response.json()
            data=data["ResponseData"]
            date_string = data['EffectedFrom']
            converted_date = datetime.strptime(date_string, "%Y-%m-%dT%H:%M:%S.%fZ").date()
            current_date = datetime.utcnow().date()
            if converted_date > current_date:
                SaveTollFare(data,db)
            else:
                print("No toll fare dound for future date.")
        else:
            print(f"Error: {response.status_code} - {response.text}")
    except Exception as e:
        print(f"Error fetching or storing data: {e}")