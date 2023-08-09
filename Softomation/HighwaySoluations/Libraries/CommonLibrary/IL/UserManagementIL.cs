using System;

namespace HighwaySoluations.Softomation.CommonLibrary.IL
{
    public class UserManagementIL : RoleManagementIL
    {
        Int64 userId;
        String loginId;
        String loginPassword;
        String firstName;
        String lastName;
        String emailId;
        String mobileNumber;
        Int16 userTypeId;
        String userTypeName;
        String userProfileImage;
        Nullable<DateTime> accountExpiredDate;
        public UserManagementIL()
        {
            this.userId = 0;
            this.loginId = string.Empty;
            this.loginPassword = string.Empty;
            this.firstName = string.Empty;
            this.lastName = string.Empty;
            this.emailId = string.Empty;
            this.mobileNumber = string.Empty;
            this.userTypeId = 0;
            this.userTypeName = string.Empty;
            this.userProfileImage = string.Empty;
            this.accountExpiredDate = null;
        }
        public Int64 UserId
        {
            get => userId; set => userId = value;
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

        public Int16 UserTypeId
        {
            get => userTypeId; set => userTypeId = value;
        }
        public String UserTypeName
        {
            get => userTypeName; set => userTypeName = value;
        }
        public String UserProfileImage
        {
            get => userProfileImage; set => userProfileImage = value;
        }
        public Nullable<DateTime> AccountExpiredDate
        {
            get => accountExpiredDate; set => accountExpiredDate = value;
        }

    }
}
