using System;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class ShiftTiminingIL: CommonIL
    {
        Int16 shiftId;
        String shiftNumber;
        String startTimmng;
        String endTimming;

        public ShiftTiminingIL()
        {
            shiftId = 0;
            shiftNumber = string.Empty;
            startTimmng = string.Empty;
            endTimming = string.Empty;
        }

        public Int16 ShiftId
        {
            get
            {
                return shiftId;
            }

            set
            {
                shiftId = value;
            }
        }
        public String ShiftNumber
        {
            get
            {
                return shiftNumber;
            }

            set
            {
                shiftNumber = value;
            }
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
