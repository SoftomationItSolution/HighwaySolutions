using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Softomation.ATMSSystemLibrary.IL
{
    public class UserManagementIL : RoleManagementIL
    {
        String loginId;
        String loginPassword;
        String firstName;
        String lastName;
        String emailId;
        String mobileNumber;
        Int32 roleId;
        Int16 userTypeId;
        String userTypeName;
        String sessionId;
        Nullable<DateTime> accountExpiredDate;
        public UserManagementIL()
        {
            this.loginId = string.Empty;
            this.loginPassword = string.Empty;
            this.firstName = string.Empty;
            this.lastName = string.Empty;
            this.emailId = string.Empty;
            this.mobileNumber = string.Empty;
            this.roleId = 0;
            this.userTypeId = 0;
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
        public Int16 UserTypeId
        {
            get => userTypeId; set => userTypeId = value;
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
