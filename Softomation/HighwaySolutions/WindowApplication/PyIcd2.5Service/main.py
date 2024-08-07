# Example usage
from utils.api_request_send import ApiRequestSend
from flask import Flask, request, jsonify
from utils.xml_response_parser import XMLResponseParser

app = Flask(__name__)

@app.route('/violation_audit_details', methods=['POST'])
def violation_audit_details():
    xml_data = request.data.decode('utf-8')
    parser = XMLResponseParser(xml_data)
    result = parser.parse_violation_audit_details()
    return jsonify(result)

@app.route('/req_pay', methods=['POST'])
def req_pay():
    xml_data = request.data.decode('utf-8')
    parser = XMLResponseParser(xml_data)
    result = parser.parse_req_pay()
    return jsonify(result)

@app.route('/plaza_details', methods=['POST'])
def plaza_details():
    xml_data = request.data.decode('utf-8')
    parser = XMLResponseParser(xml_data)
    result = parser.parse_plaza_details()
    return jsonify(result)

@app.route('/tag_details', methods=['POST'])
def tag_details():
    xml_data = request.data.decode('utf-8')
    parser = XMLResponseParser(xml_data)
    result = parser.parse_tag_details()
    return jsonify(result)

@app.route('/sync_time', methods=['POST'])
def sync_time():
    xml_data = request.data.decode('utf-8')
    parser = XMLResponseParser(xml_data)
    result = parser.parse_sync_time()
    return jsonify(result)

@app.route('/toll_plaza_heart_beat', methods=['POST'])
def toll_plaza_heart_beat():
    xml_data = request.data.decode('utf-8')
    parser = XMLResponseParser(xml_data)
    result = parser.parse_toll_plaza_heart_beat()
    return jsonify(result)

@app.route('/check_transaction_status', methods=['POST'])
def check_transaction_status():
    xml_data = request.data.decode('utf-8')
    parser = XMLResponseParser(xml_data)
    result = parser.parse_check_transaction_status()
    return jsonify(result)

@app.route('/get_exception', methods=['POST'])
def get_exception():
    xml_data = request.data.decode('utf-8')
    parser = XMLResponseParser(xml_data)
    result = parser.parse_get_exception()
    return jsonify(result)

@app.route('/query_exception_list', methods=['POST'])
def query_exception_list():
    xml_data = request.data.decode('utf-8')
    parser = XMLResponseParser(xml_data)
    result = parser.parse_query_exception_list()
    return jsonify(result)

@app.route('/set_pass_scheme', methods=['POST'])
def set_pass_scheme():
    xml_data = request.data.decode('utf-8')
    parser = XMLResponseParser(xml_data)
    result = parser.parse_set_pass_scheme()
    return jsonify(result)

@app.route('/participants_list', methods=['POST'])
def participants_list():
    xml_data = request.data.decode('utf-8')
    parser = XMLResponseParser(xml_data)
    result = parser.parse_list_participants()
    return jsonify(result)

if __name__ == '__main__':
    app.run(debug=True)
    api_client = ApiRequestSend(base_url="https://api.yourendpoint.com")
    response = api_client.violation_audit_details()
    print(response)