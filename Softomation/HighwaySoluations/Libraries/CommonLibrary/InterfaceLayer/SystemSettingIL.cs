using System;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class SystemSettingIL : CommonIL
    {
        Int16 loginAccess;
        Int16 exemptAccess;
        Int16 allotmentDays;

        public SystemSettingIL()
        {
            this.loginAccess = 1;
            this.exemptAccess = 1;
            this.allotmentDays = 4;
        }

        public Int16 LoginAccess
        {
            get
            {
                return loginAccess;
            }

            set
            {
                loginAccess = value;
            }
        }

        public Int16 ExemptAccess
        {
            get
            {
                return exemptAccess;
            }

            set
            {
                exemptAccess = value;
            }
        }

        public Int16 AllotmentDays
        {
            get
            {
                return allotmentDays;
            }

            set
            {
                allotmentDays = value;
            }
        }
    }
}
