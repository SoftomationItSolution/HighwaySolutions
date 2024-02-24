import requests
def laneImport(api_base_url,db):
    try:
        DefaultIpAddress='192.168.1.21'
        headers = {'User-Agent': 'MyApp/1.0'}
        api_url=api_base_url+'Softomation/FTH-TMS-RSD/LaneDetails?IpAddress='+DefaultIpAddress
        response = requests.get(api_url, headers=headers, verify=False)
        if response.status_code == 200:
            data = response.json()
            d=data["ResponseData"]
            params=[d['LaneId'],d['PlazaId'],d['LaneNumber'],d['LaneName'],d['LaneTypeId'],d['LanePositionId'],
                    d['LanePointId'],d['LaneDirectionId'],d['LaneStatusId'],d['LaneModeId'],d['LaneSystemIpAddress'],
                    d['DataStatus'],d['CreatedDate'],d['CreatedBy'],d['ModifiedDate'],d['ModifiedBy']]
            resultData=db.execute_procedure('USP_LaneInsertUpdate', params)
            print(resultData)
            return d['LaneId']
        else:
            print(f"Error: {response.status_code} - {response.text}")
            return 0
    except Exception as e:
        print(f"Error fetching or storing data: {e}")
        return 0