import requests
def exemptTypeImport(api_base_url,db):
    try:
        headers = {'User-Agent': 'MyApp/1.0'}
        api_url=api_base_url+'Softomation/FTH-TMS-RSD/ExemptTypeDetails'
        response = requests.get(api_url, headers=headers, verify=False)
        if response.status_code == 200:
            data = response.json()
            data=data["ResponseData"]
            for d in data:
                params=[d['ExemptTypeId'],d['ExemptTypeName'],d['DataStatus'],d['CreatedDate'],d['CreatedBy'],
                    d['ModifiedDate'],d['ModifiedBy']]
                resultData=db.execute_procedure('USP_ExemptTypeMasterInsertUpdate', params)
                print(resultData)
        else:
            print(f"Error: {response.status_code} - {response.text}")
    except Exception as e:
        print(f"Error fetching or storing data: {e}")