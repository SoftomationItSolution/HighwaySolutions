using System;

namespace HighwaySoluations.Softomation.CommonLibrary.IL
{
    public class LogingActivityIL
    {
        String loginId;
        Int16 loginStatusId;
        Int16 userTypeId;
        DateTime loginDateTime;
        DateTime logoutDateTime;
        public LogingActivityIL()
        {
            this.loginId = string.Empty;
            this.loginStatusId = 0;
            this.userTypeId = 0;
            this.loginDateTime = DateTime.Now;
            this.logoutDateTime = DateTime.Now;
        }

        public string LoginId
        {
            get => loginId; set => loginId = value;
        }
        public short LoginStatusId
        {
            get => loginStatusId; set => loginStatusId = value;
        }
        public short UserTypeId
        {
            get => userTypeId; set => userTypeId = value;
        }
        public DateTime LoginDateTime
        {
            get => loginDateTime; set => loginDateTime = value;
        }
        public DateTime LogoutDateTime
        {
            get => logoutDateTime; set => logoutDateTime = value;
        }
    }
}
