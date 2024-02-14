import requests
def systemSettingImport(api_base_url,db):
    try:
        headers = {'User-Agent': 'MyApp/1.0'}
        api_url=api_base_url+'Softomation/FTH-TMS-RSD/SystemSettingGet'
        response = requests.get(api_url, headers=headers, verify=False)
        if response.status_code == 200:
            data = response.json()
            d=data["ResponseData"]
            params=[d['DefaultPlazaId'],d['AllotmentDays'],d['IsAccessControl'],d['CashPenalty'],d['LoginAccess'],
                    d['ExemptAccess'],d['FleetAccess'],d['SubClassRequired'],d['OpeningBalance'],
                    d['DataStatus'],d['CreatedDate'],d['CreatedBy'],d['ModifiedDate'],d['ModifiedBy']]
            resultData=db.execute_procedure('USP_SystemSettingInsertUpdate', params)
            print(resultData)
        else:
            print(f"Error: {response.status_code} - {response.text}")
    except Exception as e:
        print(f"Error fetching or storing data: {e}")

def getSystemSettingGet(db):
    try:
        resultData=db.execute_procedure('USP_SystemSettingGet', None)
        if len(resultData)>0:
            return resultData[0]
        else:
            resultData
    except Exception as e:
        print(f"Error fetching or storing data: {e}")