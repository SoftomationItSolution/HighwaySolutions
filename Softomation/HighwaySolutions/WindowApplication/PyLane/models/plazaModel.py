import requests
def plazaImport(api_base_url,db,DefaultPlazaId):
    try:
        headers = {'User-Agent': 'MyApp/1.0'}
        api_url=api_base_url+'Softomation/FTH-TMS-RSD/PlazaDetails?PlazaId='+str(DefaultPlazaId)
        response = requests.get(api_url, headers=headers, verify=False)
        if response.status_code == 200:
            data = response.json()
            d=data["ResponseData"]
            params=[d['PlazaId'],d['SystemIntegratorId'],d['PlazaName'],
                    d['PlazaTypeId'],d['PlazaServerIpAddress'],d['ChainageNumber'],
                    d['Latitude'],d['Longitude'],d['PlazaZoneId'],
                    d['DataStatus'],d['CreatedDate'],d['CreatedBy'],d['ModifiedDate'],d['ModifiedBy']]
            resultData=db.execute_procedure('USP_PlazaInsertUpdate', params)
            print(resultData)
        else:
            print(f"Error: {response.status_code} - {response.text}")
    except Exception as e:
        print(f"Error fetching or storing data: {e}")