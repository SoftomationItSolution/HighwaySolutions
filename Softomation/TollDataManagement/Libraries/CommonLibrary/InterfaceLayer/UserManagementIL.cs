using System;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class UserManagementIL : RoleManagementIL
    {
        String loginId;
        String clientName;
        String loginPassword;
        String firstName;
        String lastName;
        String emailId;
        String mobileNumber;
        Int32 roleId;
        Int16 userType;
        String userTypeName;
        String sessionId;
        Nullable<DateTime> accountExpiredDate;
        public UserManagementIL()
        {
            this.loginId = string.Empty;
            this.clientName = string.Empty;
            this.loginPassword = string.Empty;
            this.firstName = string.Empty;
            this.lastName = string.Empty;
            this.emailId = string.Empty;
            this.mobileNumber = string.Empty;
            this.roleId = 0;
            this.userType = 0;
            this.userTypeName = string.Empty;
            this.sessionId = string.Empty;
            this.accountExpiredDate = null;
        }
        public String LoginId
        {
            get => loginId; set => loginId = value;
        }
        public String LoginPassword
        {
            get => loginPassword; set => loginPassword = value;
        }
        public String FirstName
        {
            get => firstName; set => firstName = value;
        }
        public String LastName
        {
            get => lastName; set => lastName = value;
        }
        public String EmailId
        {
            get => emailId; set => emailId = value;
        }
        public String MobileNumber
        {
            get => mobileNumber; set => mobileNumber = value;
        }
        public Int32 RoleId
        {
            get => roleId; set => roleId = value;
        }
        public Int16 UserType
        {
            get => userType; set => userType = value;
        }
        public String UserTypeName
        {
            get => userTypeName; set => userTypeName = value;
        }
        public Nullable<DateTime> AccountExpiredDate
        {
            get => accountExpiredDate; set => accountExpiredDate = value;
        }
        public String SessionId
        {
            get
            {
                return sessionId;
            }

            set
            {
                sessionId = value;
            }
        }
    }
}
