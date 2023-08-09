using System;


namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class ShiftDetailsIL : ShiftManagementIL
    {
        DateTime shiftDate;
        Int16 shiftId;
        Int16 shiftStatus;
        String shiftStatusName;
        public ShiftDetailsIL()
        {
            this.shiftDate = DateTime.Now;
            this.shiftId = 0;
            this.shiftStatus = 1;
            this.shiftStatusName = "Open";
        }

        public DateTime ShiftDate
        {
            get
            {
                return shiftDate;
            }

            set
            {
                shiftDate = value;
            }
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

        public Int16 ShiftStatus
        {
            get
            {
                return shiftStatus;
            }

            set
            {
                shiftStatus = value;
            }
        }

        public String ShiftStatusName
        {
            get
            {
                return shiftStatusName;
            }

            set
            {
                shiftStatusName = value;
            }
        }
    }
}
