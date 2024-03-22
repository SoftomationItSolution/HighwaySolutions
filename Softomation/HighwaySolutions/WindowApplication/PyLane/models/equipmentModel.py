import requests
def equipmentTypeImport(api_base_url,db):
    try:
        headers = {'User-Agent': 'MyApp/1.0'}
        api_url=api_base_url+'Softomation/FTH-TMS-RSD/EquipmentTypeDetails'
        response = requests.get(api_url, headers=headers, verify=False)
        if response.status_code == 200:
            data = response.json()
            data=data["ResponseData"]
            for d in data:
                params=[d['EquipmentTypeId'],d['EquipmentTypeName'],d['EquipmentCategoryTypeId'],
                        d['EquipmentConnectionTypeId'],d['EquipmentIconName'],d['EquipmentLevel'],d['EquipmentOrder'],
                        d['DataStatus'],d['CreatedDate'],d['CreatedBy'],d['ModifiedDate'],d['ModifiedBy']]
                resultData=db.execute_procedure('USP_EquipmentTypeMasterInsertUpdate', params)
                print(resultData)
        else:
            print(f"Error: {response.status_code} - {response.text}")
    except Exception as e:
        print(f"Error fetching or storing data: {e}")


def protocolTypeImport(api_base_url,db):
    try:
        headers = {'User-Agent': 'MyApp/1.0'}
        api_url=api_base_url+'Softomation/FTH-TMS-RSD/ProtocolTypeMasterGetAll'
        response = requests.get(api_url, headers=headers, verify=False)
        if response.status_code == 200:
            data = response.json()
            data=data["ResponseData"]
            for d in data:
                params=[d['ProtocolTypeId'],d['ProtocolTypeName'],
                        d['DataStatus'],d['CreatedDate'],d['CreatedBy'],d['ModifiedDate'],d['ModifiedBy']]
                resultData=db.execute_procedure('USP_ProtocolTypeMasterInsertUpdate', params)
                print(resultData)
        else:
            print(f"Error: {response.status_code} - {response.text}")
    except Exception as e:
        print(f"Error fetching or storing data: {e}")


def equipmentDetailsImport(api_base_url,db,LaneId):
    try:
        headers = {'User-Agent': 'MyApp/1.0'}
        api_url=api_base_url+'Softomation/FTH-TMS-RSD/EquipmentDetails?LaneId='+str(LaneId)
        response = requests.get(api_url, headers=headers, verify=False)
        if response.status_code == 200:
            data = response.json()
            data=data["ResponseData"]
            for d in data:
                params=[d['EquipmentId'],d['PlazaId'],d['LaneId'],d['EquipmentTypeId'],d['EquipmentName'],
                        d['ProtocolTypeId'],d['IpAddress'], d['PortNumber'],d['LoginId'],
                         d['LoginPassword'],d['ManufactureId'], d['MacAddress'],d['ModelNumber'],
                         d['SerialNumber'],d['ManufacturerDate'], d['PurchageDate'],d['WarrantyExpireDate'],
                        d['DataStatus'],d['CreatedDate'],d['CreatedBy'],d['ModifiedDate'],d['ModifiedBy']]
                resultData=db.execute_procedure('USP_EquipmentDetailsInsertUpdate', params)
                print(resultData)
        else:
            print(f"Error: {response.status_code} - {response.text}")
    except Exception as e:
        print(f"Error fetching or storing data: {e}")