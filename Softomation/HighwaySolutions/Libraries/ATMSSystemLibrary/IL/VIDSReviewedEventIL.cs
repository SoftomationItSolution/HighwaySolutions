using System;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class VIDSReviewedEventIL : VIDSEventIL
    {
        Boolean isChallanRequired;
        Boolean reviewedStatus;
        Int16 reviewedEventTypeId;
        String reviewedEventTypeName;
        String reviewedPlateNumber;
        Int16 reviewedVehicleClassId;
        String reviewedVehicleClassName;
        Int64 reviewedById;
        String reviewedByLoginId;
        DateTime reviewedDateTime;
        String reviewedRemark;
        public VIDSReviewedEventIL()
        {
            isChallanRequired = false;
            reviewedStatus = false;
            reviewedEventTypeId = 0;
            reviewedEventTypeName = string.Empty;
            reviewedPlateNumber = string.Empty;
            reviewedVehicleClassId = 0;
            reviewedVehicleClassName = string.Empty;
            reviewedById = 0;
            reviewedByLoginId = string.Empty;
            reviewedDateTime = DateTime.MinValue;
            reviewedRemark = string.Empty;
        }
        public Boolean IsChallanRequired
        {
            get
            {
                return isChallanRequired;
            }

            set
            {
                isChallanRequired = value;
            }
        }
        public Boolean ReviewedStatus
        {
            get
            {
                return reviewedStatus;
            }

            set
            {
                reviewedStatus = value;
            }
        }

        public Int16 ReviewedEventTypeId
        {
            get
            {
                return reviewedEventTypeId;
            }

            set
            {
                reviewedEventTypeId = value;
            }
        }

        public String ReviewedEventTypeName
        {
            get
            {
                return reviewedEventTypeName;
            }

            set
            {
                reviewedEventTypeName = value;
            }
        }

        public String ReviewedPlateNumber
        {
            get
            {
                return reviewedPlateNumber;
            }

            set
            {
                reviewedPlateNumber = value;
            }
        }

        public Int16 ReviewedVehicleClassId
        {
            get
            {
                return reviewedVehicleClassId;
            }

            set
            {
                reviewedVehicleClassId = value;
            }
        }

        public String ReviewedVehicleClassName
        {
            get
            {
                return reviewedVehicleClassName;
            }

            set
            {
                reviewedVehicleClassName = value;
            }
        }

        public Int64 ReviewedById
        {
            get
            {
                return reviewedById;
            }

            set
            {
                reviewedById = value;
            }
        }

        public String ReviewedByLoginId
        {
            get
            {
                return reviewedByLoginId;
            }

            set
            {
                reviewedByLoginId = value;
            }
        }

        public DateTime ReviewedDateTime
        {
            get
            {
                return reviewedDateTime;
            }

            set
            {
                reviewedDateTime = value;
            }
        }

        public String ReviewedRemark
        {
            get
            {
                return reviewedRemark;
            }

            set
            {
                reviewedRemark = value;
            }
        }
    }
}
