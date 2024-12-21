from flask import Flask, request, jsonify

app = Flask(__name__)

# Sample POST API endpoint
@app.route('/Softomation/FastTrackHighway-lane/FasTag', methods=['POST'])
def submit_data():
    # Check if the request contains JSON data
    if request.is_json:
        # Parse the JSON data
        data = request.get_json()
        EPCId=data["epc"]
        TID=data["tagId"]
        UserData=data["laneId"]
        print(TID)
        print(EPCId)
        print(UserData)
        # For demonstration, return the received data as a JSON response
        return jsonify({
            "message": "Data received successfully"
        }), 200
    else:
        # If the request is not JSON, return an error message
        return jsonify({"error": "Request must be in JSON format"}), 400

if __name__ == '__main__':
    #app.run(debug=True)
    app.run(debug=True,host="0.0.0.0", port=5002)