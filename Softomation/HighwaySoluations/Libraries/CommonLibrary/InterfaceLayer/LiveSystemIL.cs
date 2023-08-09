using System;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class LiveSystemIL
    {
        Int16 laneNumber;
        DateTime shiftDate;
        Int16 shiftId;
        Decimal cpuUtilization;
        Decimal ramUtilization;
        Decimal storageAvilable;
        Int16 tCClassId;
        Int16 aVCClassId;
        Int16 transactionTypeId;
        Int64 operatorId;
        DateTime operatorLoginTime;
        Decimal operatorCollection;
        public LiveSystemIL()
        {
            this.laneNumber = 0;
            this.shiftDate = DateTime.Now;
            this.shiftId = 0;
            this.cpuUtilization = 0;
            this.ramUtilization = 0;
            this.storageAvilable = 0;
            this.tCClassId = 0;
            this.aVCClassId = 0;
            this.transactionTypeId = 0;
            this.operatorId = 0;
            this.operatorLoginTime = DateTime.Now;
            this.operatorCollection = 0;
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

        public Decimal CpuUtilization
        {
            get
            {
                return cpuUtilization;
            }

            set
            {
                cpuUtilization = value;
            }
        }

        public Decimal RamUtilization
        {
            get
            {
                return ramUtilization;
            }

            set
            {
                ramUtilization = value;
            }
        }

        public Decimal StorageAvilable
        {
            get
            {
                return storageAvilable;
            }

            set
            {
                storageAvilable = value;
            }
        }

        public Int16 TCClassId
        {
            get
            {
                return tCClassId;
            }

            set
            {
                tCClassId = value;
            }
        }

        public Int16 AVCClassId
        {
            get
            {
                return aVCClassId;
            }

            set
            {
                aVCClassId = value;
            }
        }

        public Int16 TransactionTypeId
        {
            get
            {
                return transactionTypeId;
            }

            set
            {
                transactionTypeId = value;
            }
        }

        public Int64 OperatorId
        {
            get
            {
                return operatorId;
            }

            set
            {
                operatorId = value;
            }
        }

        public DateTime OperatorLoginTime
        {
            get
            {
                return operatorLoginTime;
            }

            set
            {
                operatorLoginTime = value;
            }
        }

        public Decimal OperatorCollection
        {
            get
            {
                return operatorCollection;
            }

            set
            {
                operatorCollection = value;
            }
        }
    }
}
