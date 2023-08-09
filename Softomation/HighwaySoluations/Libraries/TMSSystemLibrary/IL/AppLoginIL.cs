using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class AppLoginIL
    {
        String loginId;
        String loginPassword;
        String ipAddress;
        String macAddress;
        String accessToken;
        DateTime accessTokenExpired;
        string accessTokenExpiredTimeStamp;
        UserManagementIL userData;
        public AppLoginIL()
        {
            loginId = string.Empty;
            loginPassword = string.Empty;
            ipAddress = string.Empty;
            macAddress = string.Empty;
            accessToken = string.Empty;
            accessTokenExpired = DateTime.MinValue;
            this.accessTokenExpiredTimeStamp = string.Empty;
            userData = new UserManagementIL();
        }

        public string LoginId
        {
            get => loginId; set => loginId = value;
        }
        public string LoginPassword
        {
            get => loginPassword; set => loginPassword = value;
        }
        public string IpAddress
        {
            get => ipAddress; set => ipAddress = value;
        }
        public string MacAddress
        {
            get => macAddress; set => macAddress = value;
        }
        public string AccessToken
        {
            get => accessToken; set => accessToken = value;
        }
        public DateTime AccessTokenExpired
        {
            get => accessTokenExpired; set => accessTokenExpired = value;
        }
        public UserManagementIL UserData
        {
            get => userData; set => userData = value;
        }
        public string AccessTokenExpiredTimeStamp
        {
            get => accessTokenExpiredTimeStamp; set => accessTokenExpiredTimeStamp = value;
        }
    }
}
