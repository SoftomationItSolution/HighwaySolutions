using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class ICDNotificationResponseIL : ICDCommonIL
    {
        string transactionType;
        string transactionReferenceId;
        string transactionReferenceURL;
        string transactionOrganizationId;
        string notifyResult;
        string notifyPlazaId;
        DateTime notifyDateTime;
        string notifyNPCIErrCode;
        string tagId;
        string tid;
        string transactionNote;
        string transactionId;
        bool isNotificationFileSuccess;
        string vehicleRegistrationNumber;
        string transactionVehicleClass;
        bool isCommercialVehicle;
        string fareType;
        Decimal tollfare;

        public ICDNotificationResponseIL()
        {
            transactionType = string.Empty;
            transactionReferenceId = string.Empty;
            transactionReferenceURL = string.Empty;
            transactionOrganizationId = string.Empty;
            notifyResult = string.Empty;
            notifyPlazaId = string.Empty;
            notifyDateTime = DateTime.Now;
            notifyNPCIErrCode = string.Empty;
            tagId = string.Empty;
            tid = string.Empty;
            transactionNote = string.Empty;
            transactionId = string.Empty;
            isNotificationFileSuccess = false;
            vehicleRegistrationNumber = string.Empty;
            transactionVehicleClass = string.Empty;
            isCommercialVehicle = false;
            fareType = string.Empty;
            tollfare = 0;
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
        public String NotifyResult
        {
            get
            {
                return notifyResult;
            }

            set
            {
                notifyResult = value;
            }
        }
        public String NotifyPlazaId
        {
            get
            {
                return notifyPlazaId;
            }

            set
            {
                notifyPlazaId = value;
            }
        }
        public String NotifyNPCIErrCode
        {
            get
            {
                return notifyNPCIErrCode;
            }

            set
            {
                notifyNPCIErrCode = value;
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
        public Boolean IsNotificationFileSuccess
        {
            get
            {
                return isNotificationFileSuccess;
            }

            set
            {
                isNotificationFileSuccess = value;
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
        public DateTime NotifyDateTime
        {
            get
            {
                return notifyDateTime;
            }

            set
            {
                notifyDateTime = value;
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
        public String FareType
        {
            get
            {
                return fareType;
            }

            set
            {
                fareType = value;
            }
        }
        public Decimal Tollfare
        {
            get
            {
                return tollfare;
            }

            set
            {
                tollfare = value;
            }
        }
    }
}
