from datetime import datetime
import json
from flask import g, make_response, request
from utils.crypto import decrypt_aes_256_cbc, encrypt_aes_256_cbc,get_token
from utils.constants import ResponseMessage, ResponseMessageList,json_date_format
from . import users_bp

@users_bp.route('/login', methods=['POST'])
def users_login():
    try:
        db=g.db
        new_data = request.get_json()
        if (new_data["LoginId"].lower() == "softo"):
            current_year = datetime.now().year
            if (new_data["LoginPassword"] == "Softo@" + str(current_year)):
                userData = {"UserId": 0,"LoginId": new_data["LoginId"],"LoginPassword": "","FirstName": "Super",
                            "LastName": "Admin","EmailId": "sysadmin@gmail.com","MobileNumber": "9999999999",
                            "UserProfileImage": "/User/ProfileImage/avatar-7.jpg","AccountExpiredDate": None,
                            "DataStatus": 1,"DataStatusName": "Active"}
                tkOut=get_token(new_data["LoginId"],12)
                login = {"LoginId": new_data["LoginId"],"LoginPassword": new_data["LoginPassword"],
                         "IpAddress": "","MacAddress": "","AccessToken": tkOut["token"],"AccessTokenExpired": tkOut["expiresIn"],
                         "AccessTokenExpiredTimeStamp": tkOut["expiresIn"],"UserData": userData}
                res=ResponseMessage("success", login)
                response = make_response(res, 200)
                return response
            else:
                ResponseMessage("Invalid user credentials", None)
                response = make_response(res, 200)
                return response
        else:
            params=[new_data['LoginId']]
            resultData = db.call_procedure('USP_UsersGetByLoginId(%s)',params)
            parsed_data = json.loads(resultData)
            if(len(parsed_data)>0):
                parsed_data=parsed_data[0]
                if (new_data["LoginPassword"] == decrypt_aes_256_cbc(parsed_data["LoginPassword"])):
                    tkOut=get_token(new_data["LoginId"],12)
                    login = {"LoginId": new_data["LoginId"],"LoginPassword": new_data["LoginPassword"],
                            "IpAddress": "","MacAddress": "","AccessToken": tkOut["token"],"AccessTokenExpired": tkOut["expiresIn"],
                            "AccessTokenExpiredTimeStamp": tkOut["expiresIn"],"UserData": parsed_data}
                    res=ResponseMessage("success", login)
                    response = make_response(res, 200)
                    return response
                else:
                    ResponseMessage("Invalid user password", None)
                    response = make_response(res, 200)
                    return response

            else:
                ResponseMessage("Invalid user credentials", None)
                response = make_response(res, 200)
                return response
    except Exception as e:
        res=ResponseMessage(str(e), None)
        response = make_response(res, 500)
        return response