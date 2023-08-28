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
        Int64 laneTransactionCount;
        Decimal floatDeclare;
        Decimal midDeclare;
        Decimal endDeclare;
        Decimal systemDeclare;
        Decimal differenceAmount;
        public ShiftStatusIL()
        {
            shiftStatusId = 0;
            plazaId = 0;
            plazaName = string.Empty;
            shiftDate = DateTime.MinValue;
            shiftDateStamp = string.Empty;
            shiftStatus = true;
            laneTransactionCount = 0;
            floatDeclare = 0;
            midDeclare = 0;
            endDeclare = 0;
            systemDeclare = 0;
            differenceAmount = 0;
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
        public Int64 LaneTransactionCount
        {
            get
            {
                return laneTransactionCount;
            }

            set
            {
                laneTransactionCount = value;
            }
        }
        public Decimal FloatDeclare
        {
            get
            {
                return floatDeclare;
            }

            set
            {
                floatDeclare = value;
            }
        }
        public Decimal MidDeclare
        {
            get
            {
                return midDeclare;
            }

            set
            {
                midDeclare = value;
            }
        }
        public Decimal EndDeclare
        {
            get
            {
                return endDeclare;
            }

            set
            {
                endDeclare = value;
            }
        }
        public Decimal SystemDeclare
        {
            get
            {
                return systemDeclare;
            }

            set
            {
                systemDeclare = value;
            }
        }
        public Decimal DifferenceAmount
        {
            get
            {
                return differenceAmount;
            }

            set
            {
                differenceAmount = value;
            }
        }
    }
}
