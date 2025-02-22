import requests
def fasTagVehicleClassImport(api_base_url,db):
    try:
        headers = {'User-Agent': 'MyApp/1.0'}
        api_url=api_base_url+'Softomation/FTH-TMS-RSD/FasTagVehicleClassDetails'
        response = requests.get(api_url, headers=headers, verify=False)
        if response.status_code == 200:
            data = response.json()
            data=data["ResponseData"]
            for d in data:
                #print(d)
                params=[d['FasTagVehicleClassId'],d['FasTagVehicleClassName'],d['FasTagVehicleClassDescription'],
                        d['PermissibleWeight'],d['AxcelCount'],d['VehicleHeight'],d['VehicleLength'],d['FasTagVehicleClassColor'],
                        d['DataStatus'],d['CreatedDate'],d['CreatedBy'],d['ModifiedDate'],d['ModifiedBy']]
                resultData=db.execute_procedure('USP_FasTagVehicleClassInsertUpdate', params)
                print(resultData)
        else:
            print(f"Error: {response.status_code} - {response.text}")
    except Exception as e:
        print(f"Error fetching or storing data: {e}")


def systemVehicleClassImport(api_base_url,db):
    try:
        headers = {'User-Agent': 'MyApp/1.0'}
        api_url=api_base_url+'Softomation/FTH-TMS-RSD/SystemVehicleClassDetails'
        response = requests.get(api_url, headers=headers, verify=False)
        if response.status_code == 200:
            data = response.json()
            data=data["ResponseData"]
            for d in data:
                params=[d['SystemVehicleClassId'],d['SystemVehicleClassName'],d['SystemVehicleClassDescription'],
                        d['SystemSubClassIds'],d['PermissibleWeight'],
                        d['DataStatus'],d['CreatedDate'],d['CreatedBy'],d['ModifiedDate'],d['ModifiedBy']]
                resultData=db.execute_procedure('USP_SystemVehicleClassInsertUpdate', params)
                print(resultData)
        else:
            print(f"Error: {response.status_code} - {response.text}")
    except Exception as e:
        print(f"Error fetching or storing data: {e}")


def systemVehicleSubClassImport(api_base_url,db):
    try:
        headers = {'User-Agent': 'MyApp/1.0'}
        api_url=api_base_url+'Softomation/FTH-TMS-RSD/SystemVehicleSubClassDetails'
        response = requests.get(api_url, headers=headers, verify=False)
        if response.status_code == 200:
            data = response.json()
            data=data["ResponseData"]
            for d in data:
                params=[d['SystemVehicleClassId'],d['SystemSubClassId'],
                        d['DataStatus'],d['CreatedDate'],d['CreatedBy'],d['ModifiedDate'],d['ModifiedBy']]
                resultData=db.execute_procedure('USP_SystemVehicleSubClassInsertUpdate', params)
                print(resultData)
        else:
            print(f"Error: {response.status_code} - {response.text}")
    except Exception as e:
        print(f"Error fetching or storing data: {e}")