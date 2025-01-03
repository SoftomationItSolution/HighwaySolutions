import requests


class SendRequest:
    @staticmethod
    def upload_request(xml_data, uri, timeout=3000, certificate_validation=0):
        try:
            session = requests.Session()
            session.headers.update({'Content-Type': 'application/xml'})
            if certificate_validation == 1:
                session.verify = False
            response = session.post(uri, data=xml_data, timeout=timeout)
            print(f"Rquest uri: {uri}")
            print(f"Rquest Content: {xml_data}")
            print(f"Response Status Code: {response.status_code}")
            print(f"Response Content: {response.text}")
            return response
        except requests.RequestException as ex:
            raise ex