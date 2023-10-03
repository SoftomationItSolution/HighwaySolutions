using System;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class ATCCReviewedEventIL : ATCCEventIL
    {
        DateTime reviewedEventDate;
        String reviewedEventDateStamp;
        Int16 reviewedVehicleClassId;
        String reviewedVehicleClassName;
        Int64 reviewedById;
        String reviewedByLoginId;
        DateTime reviewedDateTime;
        String reviewedRemark;
        public ATCCReviewedEventIL()
        {
            this.reviewedEventDate = DateTime.Now;
            this.reviewedEventDateStamp = string.Empty;
            this.reviewedVehicleClassId = 0;
            this.reviewedVehicleClassName = string.Empty;
            this.reviewedById = 0;
            this.reviewedByLoginId = string.Empty;
            this.reviewedDateTime = DateTime.MinValue;
            this.reviewedRemark = string.Empty;
        }

        public DateTime ReviewedEventDate
        {
            get
            {
                return reviewedEventDate;
            }
            set
            {
                reviewedEventDate = value;
            }
        }

        public String ReviewedEventDateStamp
        {
            get
            {
                return reviewedEventDateStamp;
            }
            set
            {
                reviewedEventDateStamp = value;
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
