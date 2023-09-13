using System;


namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class ICDTagDetailsResponseIL : ICDCommonIL
    {
        int totalRequestCount;
        int successRequestCount;
        string transactionId;
        string transactionOrganizationId;
        string transactionNote;
        string transactionReferenceId;
        string transactionReferenceURL;
        string transactionType;
        int transactionErrorCode;
        string tagId;
        string vehicleRegistrationNumber;
        string tid;
        string transactionVehicleClass;
        string tagStatus;
        int vehicleErrorCode;
        bool isCommercialVehicle;
        bool isTagRespoSuccess;
        public ICDTagDetailsResponseIL()
        {
        }
        public int TotalRequestCount
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
        public int SuccessRequestCount
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
        public String TransactionId
        {
            get
            {
                return transactionId;
            }

            set
            {
                transactionId = value;
            }
        }
        public String TransactionOrganizationId
        {
            get
            {
                return transactionOrganizationId;
            }

            set
            {
                transactionOrganizationId = value;
            }
        }
        public String TransactionNote
        {
            get
            {
                return transactionNote;
            }

            set
            {
                transactionNote = value;
            }
        }
        public String TransactionReferenceId
        {
            get
            {
                return transactionReferenceId;
            }

            set
            {
                transactionReferenceId = value;
            }
        }
        public String TransactionReferenceURL
        {
            get
            {
                return transactionReferenceURL;
            }

            set
            {
                transactionReferenceURL = value;
            }
        }
        public String TransactionType
        {
            get
            {
                return transactionType;
            }

            set
            {
                transactionType = value;
            }
        }
        public int TransactionErrorCode
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
        public String VehicleRegistrationNumber
        {
            get
            {
                return vehicleRegistrationNumber;
            }

            set
            {
                vehicleRegistrationNumber = value;
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
        public String TransactionVehicleClass
        {
            get
            {
                return transactionVehicleClass;
            }

            set
            {
                transactionVehicleClass = value;
            }
        }
        public String TagStatus
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
        public int VehicleErrorCode
        {
            get
            {
                return vehicleErrorCode;
            }

            set
            {
                vehicleErrorCode = value;
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
        public Boolean IsTagRespoSuccess
        {
            get
            {
                return isTagRespoSuccess;
            }

            set
            {
                isTagRespoSuccess = value;
            }
        }
    }
}
