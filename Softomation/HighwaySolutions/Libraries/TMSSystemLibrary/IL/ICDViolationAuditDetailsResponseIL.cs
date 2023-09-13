using System;


namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class ICDViolationAuditDetailsResponseIL:ICDCommonIL
    {
        string transactionDetails;
        string imageReviewResult;
        string plazaId;
        DateTime readerReadTime;
        DateTime transactionTime;
        string trasactionId;
        string laneId;
        string avc;
        string mvc;
        string auditedVC;
        string violationAmount;
        string processedAmount;
        DateTime processedDate;
        bool isVilatonFileSuccess = false;
        public ICDViolationAuditDetailsResponseIL()
        {

        }
        public String TransactionDetails
        {
            get
            {
                return transactionDetails;
            }

            set
            {
                transactionDetails = value;
            }
        }
        public String ImageReviewResult
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
        public String PlazaId
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
        public DateTime TransactionTime
        {
            get
            {
                return transactionTime;
            }

            set
            {
                transactionTime = value;
            }
        }
        public String TrasactionId
        {
            get
            {
                return trasactionId;
            }

            set
            {
                trasactionId = value;
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
        public String Avc
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
        public String Mvc
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
        public String ViolationAmount
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
        public String ProcessedAmount
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
        public Boolean IsVilatonFileSuccess
        {
            get
            {
                return isVilatonFileSuccess;
            }

            set
            {
                isVilatonFileSuccess = value;
            }
        }
    }
}
