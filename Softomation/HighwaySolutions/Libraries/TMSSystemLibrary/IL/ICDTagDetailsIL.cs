using System;


namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class ICDTagDetailsIL : ICDCommonIL
    {
        Int32 requestTagId;
        String note;
        String refId;
        String refUrl;
        String tagId;
        String vrn;
        String tid;
        Int32 successRequestCount;
        Int32 totalRequestCount;
        Int32 transactionErrorCode;
        String vehicleClass;
        Boolean tagStatus;
        Boolean isCommercialVehicle;
        Boolean isTagResponseSuccess;

        public ICDTagDetailsIL()
        {
            requestTagId = 0;
            note = string.Empty;
            refId = string.Empty;
            refUrl = string.Empty;
            tagId = string.Empty;
            vrn = string.Empty;
            tid = string.Empty;
            successRequestCount = 0;
            totalRequestCount = 0;
            transactionErrorCode = 0;
            vehicleClass = string.Empty;
            tagStatus = true;
            isCommercialVehicle = false;
            isTagResponseSuccess = false;
        }

        public Int32 RequestTagId
        {
            get
            {
                return requestTagId;
            }

            set
            {
                requestTagId = value;
            }
        }
        public String Note
        {
            get
            {
                return note;
            }

            set
            {
                note = value;
            }
        }
        public String RefId
        {
            get
            {
                return refId;
            }

            set
            {
                refId = value;
            }
        }
        public String RefUrl
        {
            get
            {
                return refUrl;
            }

            set
            {
                refUrl = value;
            }
        }
        public String TagId
        {
            get
            {
                return tagId;
            }

            set
            {
                tagId = value;
            }
        }
        public String VRN
        {
            get
            {
                return vrn;
            }

            set
            {
                vrn = value;
            }
        }
        public String TID
        {
            get
            {
                return tid;
            }

            set
            {
                tid = value;
            }
        }
        public Int32 SuccessRequestCount
        {
            get
            {
                return successRequestCount;
            }

            set
            {
                successRequestCount = value;
            }
        }
        public Int32 TotalRequestCount
        {
            get
            {
                return totalRequestCount;
            }

            set
            {
                totalRequestCount = value;
            }
        }
       
        public Int32 TransactionErrorCode
        {
            get
            {
                return transactionErrorCode;
            }

            set
            {
                transactionErrorCode = value;
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
        public Boolean TagStatus
        {
            get
            {
                return tagStatus;
            }

            set
            {
                tagStatus = value;
            }
        }
        public Boolean IsCommercialVehicle
        {
            get
            {
                return isCommercialVehicle;
            }

            set
            {
                isCommercialVehicle = value;
            }
        }
        public Boolean IsTagResponseSuccess
        {
            get
            {
                return isTagResponseSuccess;
            }

            set
            {
                isTagResponseSuccess = value;
            }
        }
    }
}
