using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class VSDSReviewedEventIL
    {
        Boolean isChallanRequired;
        Boolean reviewedStatus;
        Int16 reviewedVehicleClassId;
        String reviewedVehicleClassName;
        String reviewedPlateNumber;
        Boolean isReviewedPlateVisible;
        Boolean isReviewedFaultyPlate;
        Boolean isReviewedStandardPlate;
        Boolean isReviewedWrongDirection;
        Boolean isReviewedRequired;
        Int64 reviewedById;
        String reviewedByLoginId;
        DateTime reviewedDateTime;
        String reviewedRemark;
        //ChallanTypeId
        //ChallanStatusId
        //ChallanRemark

        public VSDSReviewedEventIL()
        {
            isChallanRequired = false;
            reviewedStatus = false;
            reviewedVehicleClassId = 0;
            reviewedVehicleClassName = string.Empty;
            reviewedPlateNumber = string.Empty;
            isReviewedPlateVisible = false;
            isReviewedFaultyPlate = false;
            isReviewedStandardPlate = false;
            isReviewedWrongDirection = false;
            isReviewedRequired = false;
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
        public Boolean IsReviewedPlateVisible
        {
            get
            {
                return isReviewedPlateVisible;
            }

            set
            {
                isReviewedPlateVisible = value;
            }
        }
        public Boolean IsReviewedFaultyPlate
        {
            get
            {
                return isReviewedFaultyPlate;
            }

            set
            {
                isReviewedFaultyPlate = value;
            }
        }
        public Boolean IsReviewedStandardPlate
        {
            get
            {
                return isReviewedStandardPlate;
            }

            set
            {
                isReviewedStandardPlate = value;
            }
        }
        public Boolean IsReviewedWrongDirection
        {
            get
            {
                return isReviewedWrongDirection;
            }

            set
            {
                isReviewedWrongDirection = value;
            }
        }
        public Boolean IsReviewedRequired
        {
            get
            {
                return isReviewedRequired;
            }

            set
            {
                isReviewedRequired = value;
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
