using System;
namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class ShiftManagementIL : CommonIL
    {
        string startTimmng;
        string endTimming;
        public ShiftManagementIL()
        {
            this.startTimmng = string.Empty;
            this.endTimming = string.Empty;
        }

        public String StartTimmng
        {
            get
            {
                return startTimmng;
            }

            set
            {
                startTimmng = value;
            }
        }

        public String EndTimming
        {
            get
            {
                return endTimming;
            }

            set
            {
                endTimming = value;
            }
        }

    }

   
}
