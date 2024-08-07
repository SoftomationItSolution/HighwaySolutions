import requests
from utils.xml_request_generator import XMLRequestGenerator



class ApiRequestSend:
    def __init__(self, base_url):
        self.base_url = base_url

    def _send_request(self, endpoint, xml_data):
        headers = {
            'Content-Type': 'application/xml',
            'Accept': 'application/xml'
        }
        response = requests.post(f"{self.base_url}/{endpoint}", data=xml_data, headers=headers)
        return response.text

    def violation_audit_details(self):
        xml_data = XMLRequestGenerator.generate_violation_audit_details()
        return self._send_request('violation_audit_details', xml_data)

    def req_pay(self):
        xml_data = XMLRequestGenerator.generate_req_pay()
        return self._send_request('req_pay', xml_data)

    def request_plaza_details(self):
        xml_data = XMLRequestGenerator.generate_request_plaza_details()
        return self._send_request('request_plaza_details', xml_data)

    def request_tag_details(self):
        xml_data = XMLRequestGenerator.generate_request_tag_details()
        return self._send_request('request_tag_details', xml_data)

    def req_sync_time(self):
        xml_data = XMLRequestGenerator.generate_request_sync_time()
        return self._send_request('req_sync_time', xml_data)

    def toll_plaza_heartbeat(self):
        xml_data = XMLRequestGenerator.generate_toll_plaza_heartbeat()
        return self._send_request('toll_plaza_heartbeat', xml_data)

    def check_transaction_status(self):
        xml_data = XMLRequestGenerator.generate_check_transaction_status()
        return self._send_request('check_transaction_status', xml_data)

    def get_exception(self):
        xml_data = XMLRequestGenerator.generate_get_exception()
        return self._send_request('get_exception', xml_data)

    def query_exception_list(self):
        xml_data = XMLRequestGenerator.generate_query_exception_list()
        return self._send_request('query_exception_list', xml_data)

    def set_pass_scheme(self):
        xml_data = XMLRequestGenerator.generate_set_pass_scheme()
        return self._send_request('set_pass_scheme', xml_data)

    def list_participants(self):
        xml_data = XMLRequestGenerator.generate_list_participants()
        return self._send_request('list_participants', xml_data)
