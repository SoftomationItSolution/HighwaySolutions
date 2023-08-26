using System;

namespace HighwaySoluations.Softomation.CommonLibrary.IL
{
    public class ShiftStatusIL : ShiftTiminingIL
    {
        Int64 shiftStatusId;
        Int16 plazaId;
        String plazaName;
        DateTime shiftDate;
        String shiftDateStamp;
        Boolean shiftStatus;
        public ShiftStatusIL()
        {
            shiftStatusId = 0;
            plazaId = 0;
            plazaName = string.Empty;
            shiftDate = DateTime.MinValue;
            shiftDateStamp = string.Empty;
            shiftStatus = true;
        }

        public Int64 ShiftStatusId
        {
            get
            {
                return shiftStatusId;
            }

            set
            {
                shiftStatusId = value;
            }
        }
        public Int16 PlazaId
        {
            get
            {
                return plazaId;
            }

            set
            {
                plazaId = value;
            }
        }
        public String PlazaName
        {
            get
            {
                return plazaName;
            }

            set
            {
                plazaName = value;
            }
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
        public String ShiftDateStamp
        {
            get
            {
                return shiftDateStamp;
            }

            set
            {
                shiftDateStamp = value;
            }
        }
        public Boolean ShiftStatus
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
    }
}
