using System;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class ICDViolationAuditDetailsRequestIL : ICDCommonIL
    {
        Int64 violationAuditId;
        Int64 auditTransactionId;
        DateTime auditDateTime;
        Int16 avcClassId;
        Int16 avcNumberAxcel;
        Double vehicleHeight;
        Double vehicleLength;
        Boolean doubleWheelDetected;
        Int64 plazaId;
        String laneId;
        DateTime readerReadTime;
        String icdTrasactionId;
        String imageFirstName;
        String imageFirstPath;
        String imageSecondName;
        String imageSecondPath;
        String imageAVCFirstName;
        String imageAVCFirstPath;
        String imageAVCSecondName;
        String imageAVCSecondPath;
        String avc;
        String mvc;
        String auditedVC;
        Decimal violationAmount;
        Decimal processedAmount;
        DateTime processedDate;
        Boolean imageReviewResult;
        Boolean isImagesSended;

        public ICDViolationAuditDetailsRequestIL()
        {
            violationAuditId = 0;
            auditTransactionId = 0;
            auditDateTime = DateTime.Now;
            avcClassId = 0;
            avcNumberAxcel = 0;
            vehicleHeight = 0;
            vehicleLength = 0;
            doubleWheelDetected = false;
            plazaId = 0;
            laneId = string.Empty;
            readerReadTime = DateTime.Now;
            icdTrasactionId = string.Empty;
            imageFirstName = string.Empty;
            imageFirstPath = string.Empty;
            imageSecondName = string.Empty;
            imageSecondPath = string.Empty;
            imageAVCFirstName = string.Empty;
            imageAVCFirstPath = string.Empty;
            imageAVCSecondName = string.Empty;
            imageAVCSecondPath = string.Empty;
            avc= string.Empty;;
            mvc = string.Empty; ;
            auditedVC = string.Empty; ;
            violationAmount=0;
            processedAmount=0;
            processedDate=DateTime.Now;
            imageReviewResult = false;
            isImagesSended = false;
        }
        public Int64 ViolationAuditId
        {
            get
            {
                return violationAuditId;
            }

            set
            {
                violationAuditId = value;
            }
        }
        public Int64 AuditTransactionId
        {
            get
            {
                return auditTransactionId;
            }

            set
            {
                violationAuditId = value;
            }
        }
        public DateTime AuditDateTime
        {
            get
            {
                return auditDateTime;
            }

            set
            {
                auditDateTime = value;
            }
        }
        public Int16 AVCClassId
        {
            get
            {
                return avcClassId;
            }
            set
            {
                avcClassId = value;
            }
        }
        public Int16 AVCNumberAxcel
        {
            get
            {
                return avcNumberAxcel;
            }
            set
            {
                avcNumberAxcel = value;
            }
        }
        public Double VehicleHeight
        {
            get
            {
                return vehicleHeight;
            }
            set
            {
                vehicleHeight = value;
            }
        }
        public Double VehicleLength
        {
            get
            {
                return vehicleLength;
            }
            set
            {
                vehicleLength = value;
            }
        }
        public Boolean DoubleWheelDetected
        {
            get
            {
                return doubleWheelDetected;
            }
            set
            {
                doubleWheelDetected = value;
            }
        }
        public Int64 PlazaId
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
        public String LaneId
        {
            get
            {
                return laneId;
            }

            set
            {
                laneId = value;
            }
        }
        public DateTime ReaderReadTime
        {
            get
            {
                return readerReadTime;
            }

            set
            {
                readerReadTime = value;
            }
        }
        public String ICDTrasactionId
        {
            get
            {
                return icdTrasactionId;
            }

            set
            {
                icdTrasactionId = value;
            }
        }
        public String ImageFirstName
        {
            get
            {
                return imageFirstName;
            }

            set
            {
                imageFirstName = value;
            }
        }
        public String ImageFirstPath
        {
            get
            {
                return imageFirstPath;
            }

            set
            {
                imageFirstPath = value;
            }
        }
        public String ImageSecondName
        {
            get
            {
                return imageSecondName;
            }

            set
            {
                imageSecondName = value;
            }
        }
        public String ImageSecondPath
        {
            get
            {
                return imageSecondPath;
            }

            set
            {
                imageSecondPath = value;
            }
        }
        public String ImageAVCFirstName
        {
            get
            {
                return imageAVCFirstName;
            }

            set
            {
                imageAVCFirstName = value;
            }
        }
        public String ImageAVCFirstPath
        {
            get
            {
                return imageAVCFirstPath;
            }

            set
            {
                imageAVCFirstPath = value;
            }
        }
        public String ImageAVCSecondName
        {
            get
            {
                return imageAVCSecondName;
            }

            set
            {
                imageAVCSecondName = value;
            }
        }
        public String ImageAVCSecondPath
        {
            get
            {
                return imageAVCSecondPath;
            }

            set
            {
                imageAVCSecondPath = value;
            }
        }
        public String AVC
        {
            get
            {
                return avc;
            }

            set
            {
                avc = value;
            }
        }
        public String MVC
        {
            get
            {
                return mvc;
            }

            set
            {
                mvc = value;
            }
        }
        public String AuditedVC
        {
            get
            {
                return auditedVC;
            }

            set
            {
                auditedVC = value;
            }
        }
        public Decimal ViolationAmount
        {
            get
            {
                return violationAmount;
            }

            set
            {
                violationAmount = value;
            }
        }
        public Decimal ProcessedAmount
        {
            get
            {
                return processedAmount;
            }

            set
            {
                processedAmount = value;
            }
        }
        public DateTime ProcessedDate
        {
            get
            {
                return processedDate;
            }

            set
            {
                processedDate = value;
            }
        }
        public Boolean ImageReviewResult
        {
            get
            {
                return imageReviewResult;
            }

            set
            {
                imageReviewResult = value;
            }
        }
        public Boolean IsImagesSended
        {
            get
            {
                return isImagesSended;
            }

            set
            {
                isImagesSended = value;
            }
        }
    }
}
