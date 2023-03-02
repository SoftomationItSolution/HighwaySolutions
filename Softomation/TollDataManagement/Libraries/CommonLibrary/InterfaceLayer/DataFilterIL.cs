using System;
namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class DataFilterIL
    {
        Int16 plazaId;
        Int16 reviewType;
        DateTime shiftDate;
        Int16 shiftId;
        Int64 tcUserId;
        Int64 genratedBy;
        Int16 laneNumber;
        Int16 transactionTypeId;
        Int16 subCategoryId;
        String shift;
        String vehicleClass;
        String lane;
        String tranType;
        String laneUser;
        String exemptType;
        String paymentType;
        DateTime startDateTime;
        DateTime endDateTime;
        String queryFilter;
        String sessionId;
        String plateNumber;
       

        public DataFilterIL()
        {
            this.plazaId = 0;
            this.reviewType = 0;
            this.shiftDate = DateTime.Now;
            this.shiftId = 0;
            this.tcUserId = 0;
            this.genratedBy = 0;
            this.laneNumber = 0;
            this.transactionTypeId = 0;
            this.subCategoryId = 0;
            this.shift = string.Empty;
            this.vehicleClass = string.Empty;
            this.lane = string.Empty;
            this.tranType = string.Empty;
            this.laneUser = string.Empty;
            this.exemptType = string.Empty;
            this.paymentType = string.Empty;
            this.startDateTime = DateTime.Now;
            this.endDateTime = DateTime.Now;
            this.queryFilter = string.Empty;
            this.sessionId = string.Empty;
            this.plateNumber = string.Empty;
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
        public Int16 ReviewType
        {
            get
            {
                return reviewType;
            }

            set
            {
                reviewType = value;
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

        public Int64 TCUserId
        {
            get
            {
                return tcUserId;
            }

            set
            {
                tcUserId = value;
            }
        }

        public Int64 GenratedBy
        {
            get
            {
                return genratedBy;
            }

            set
            {
                genratedBy = value;
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

        public Int16 SubCategoryId
        {
            get
            {
                return subCategoryId;
            }

            set
            {
                subCategoryId = value;
            }
        }

        public String Shift
        {
            get
            {
                return shift;
            }

            set
            {
                shift = value;
            }
        }

        public String VehicleClass
        {
            get
            {
                return vehicleClass;
            }

            set
            {
                vehicleClass = value;
            }
        }

        public String Lane
        {
            get
            {
                return lane;
            }

            set
            {
                lane = value;
            }
        }

        public String TranType
        {
            get
            {
                return tranType;
            }

            set
            {
                tranType = value;
            }
        }

        public String LaneUser
        {
            get
            {
                return laneUser;
            }

            set
            {
                laneUser = value;
            }
        }

        public String ExemptType
        {
            get
            {
                return exemptType;
            }

            set
            {
                exemptType = value;
            }
        }

        public String PaymentType
        {
            get
            {
                return paymentType;
            }

            set
            {
                paymentType = value;
            }
        }

        public DateTime StartDateTime
        {
            get
            {
                return startDateTime;
            }

            set
            {
                startDateTime = value;
            }
        }

        public DateTime EndDateTime
        {
            get
            {
                return endDateTime;
            }

            set
            {
                endDateTime = value;
            }
        }

        public String QueryFilter
        {
            get
            {
                return queryFilter;
            }

            set
            {
                queryFilter = value;
            }
        }
        public String SessionId
        {
            get
            {
                return sessionId;
            }

            set
            {
                sessionId = value;
            }
        }

        public String PlateNumber
        {
            get
            {
                return plateNumber;
            }

            set
            {
                plateNumber = value;
            }
        }

        
    }
}
