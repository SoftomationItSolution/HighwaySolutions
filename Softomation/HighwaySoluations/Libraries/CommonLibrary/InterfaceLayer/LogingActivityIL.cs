using System;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class LogingActivityIL
    {
        Int64 entryId;
        Int16 plazaId;
        Int16 shiftId;
        DateTime shiftDate;
        Int16 laneNumber;
        String loginId;
        Int16 loginStatus;
        Int64 laneTransId;
        DateTime createdDate;
        public LogingActivityIL()
        {
            this.entryId = 0;
            this.plazaId = 0;
            this.shiftId = 0;
            this.laneNumber = 0;
            this.loginId = string.Empty;
            this.loginStatus = 0;
            this.laneTransId = 0;
            this.createdDate = DateTime.Now;
            this.shiftDate = DateTime.Now;
        }

        public Int64 EntryId
        {
            get
            {
                return entryId;
            }

            set
            {
                entryId = value;
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
        public Int16 LaneNumber
        {
            get
            {
                return laneNumber;
            }

            set
            {
                laneNumber = value;
            }
        }
        public String LoginId
        {
            get
            {
                return loginId;
            }

            set
            {
                loginId = value;
            }
        }
        public Int16 LoginStatus
        {
            get
            {
                return loginStatus;
            }

            set
            {
                loginStatus = value;
            }
        }
        public Int64 LaneTransId
        {
            get
            {
                return laneTransId;
            }

            set
            {
                laneTransId = value;
            }
        }
        public DateTime CreatedDate
        {
            get
            {
                return createdDate;
            }

            set
            {
                createdDate = value;
            }
        }

        
    }
}
