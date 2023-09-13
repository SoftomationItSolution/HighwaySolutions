using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class ICDCashDetailResponseIL:ICDCommonIL
    {
        string headVersion;
        string tagName;
        string tagClass;
        string tagClassSecond;
        string tagClassThird;
        string tollCollectorClass;
        string tollCollectorClassSecond;
        string tollCollectorClassThird;
        string permissibleWeight;
        string permissibleWeightSecond;
        string permissibleWeightThird;
        string applicablePenalty;
        string applicablePenaltySecond;
        string applicablePenaltyThird;
        string transactionId;
        string transactionTxnId;
        string note;
        string transactionOrganizationId;
        string transactionType;
        string transactionReferenceId;
        string transactionReferenceURL;
        string transactionLibility;
        string cchTransactionId;
        string entryTransactionId;
        string entryTransactionTxnId;
        DateTime entryTransactionTime;
        DateTime entryReaderReadDateTime;
        string entryTransactionType;
        string responseId;
        string responseFareType;
        string plazaId;
        string tid;
        string tagId;
        string vehicleClassId;
        string vehicleDetailId;
        string vehicleDetailsId;
        string vehicleDetailsName;
        string vehicleDetailsNameSecond;
        string vehicleDetailsNameThird;
        bool isCommercialVehicle;
        bool isCommercialVehicleSecond;
        bool isCommercialVehicleThird;
        string vehicleClass;
        string vehicleClassSecond;
        string vehicleClassThird;
        string vehicleNumber;
        string vehicleNumberSecond;
        string vehicleNumberThird;
        string vehicleDetails_Id;
        string vehicleDetails_IdSecond;
        string vehicleDetails_IdThird;
        bool isResponseFileSuccess;
        string refTollfare;
        string refApprovalNum;
        string refErrCode;
        string refSettCurrency;
        string refRespId;
        public ICDCashDetailResponseIL()
        {
            headVersion = string.Empty;
            tagName = string.Empty;
            tagClass = string.Empty;
            tagClassSecond = string.Empty;
            tagClassThird = string.Empty;
            tollCollectorClass = string.Empty;
            tollCollectorClassSecond = string.Empty;
            tollCollectorClassThird = string.Empty;
            permissibleWeight = string.Empty;
            permissibleWeightSecond = string.Empty;
            permissibleWeightThird = string.Empty;
            applicablePenalty = string.Empty;
            applicablePenaltySecond = string.Empty;
            applicablePenaltyThird = string.Empty;
            transactionId = string.Empty;
            transactionTxnId = string.Empty;
            note = string.Empty;
            transactionOrganizationId = string.Empty;
            transactionType = string.Empty;
            transactionReferenceId = string.Empty;
            transactionReferenceURL = string.Empty;
            transactionLibility = string.Empty;
            cchTransactionId = string.Empty;
            entryTransactionId = string.Empty;
            entryTransactionTxnId = string.Empty;
            entryTransactionTime = DateTime.Now;
            entryReaderReadDateTime = DateTime.Now;
            entryTransactionType = string.Empty;
            responseId = string.Empty;
            responseFareType = string.Empty;
            plazaId = string.Empty;
            tid = string.Empty;
            tagId = string.Empty;
            vehicleClassId = string.Empty;
            vehicleDetailId = string.Empty;
            vehicleDetailsId = string.Empty;
            vehicleDetailsName = string.Empty;
            vehicleDetailsNameSecond = string.Empty;
            vehicleDetailsNameThird = string.Empty;
            isCommercialVehicle = false;
            isCommercialVehicleSecond = false;
            isCommercialVehicleThird = false;
            vehicleClass = string.Empty;
            vehicleClassSecond = string.Empty;
            vehicleClassThird = string.Empty;
            vehicleNumber = string.Empty;
            vehicleNumberSecond = string.Empty;
            vehicleNumberThird = string.Empty;
            vehicleDetails_Id = string.Empty;
            vehicleDetails_IdSecond = string.Empty;
            vehicleDetails_IdThird = string.Empty;
            isResponseFileSuccess = false;
            refTollfare = string.Empty;
            refApprovalNum = string.Empty;
            refErrCode = string.Empty;
            refSettCurrency = string.Empty;
            refRespId = string.Empty;
        }
        public String HeadVersion
        {
            get
            {
                return headVersion;
            }

            set
            {
                headVersion = value;
            }
        }
        public String TagName
        {
            get
            {
                return tagName;
            }

            set
            {
                tagName = value;
            }
        }
        public String TagClass
        {
            get
            {
                return tagClass;
            }

            set
            {
                tagClass = value;
            }
        }
        public String PermissibleWeight
        {
            get
            {
                return permissibleWeight;
            }

            set
            {
                permissibleWeight = value;
            }
        }
        public String ApplicablePenalty
        {
            get
            {
                return applicablePenalty;
            }

            set
            {
                applicablePenalty = value;
            }
        }
        public String TollCollectorClassSecond
        {
            get
            {
                return tollCollectorClassSecond;
            }

            set
            {
                tollCollectorClassSecond = value;
            }
        }
        public String TagClassSecond
        {
            get
            {
                return tagClassSecond;
            }

            set
            {
                tagClassSecond = value;
            }
        }
        public String PermissibleWeightSecond
        {
            get
            {
                return permissibleWeightSecond;
            }

            set
            {
                permissibleWeightSecond = value;
            }
        }
        public String ApplicablePenaltySecond
        {
            get
            {
                return applicablePenaltySecond;
            }

            set
            {
                applicablePenaltySecond = value;
            }
        }
        public String TagClassThird
        {
            get
            {
                return tagClassThird;
            }

            set
            {
                tagClassThird = value;
            }
        }

        public String TollCollectorClass
        {
            get
            {
                return tollCollectorClass;
            }

            set
            {
                tollCollectorClass = value;
            }
        }

        public String TollCollectorClassThird
        {
            get
            {
                return tollCollectorClassThird;
            }

            set
            {
                tollCollectorClassThird = value;
            }
        }

        public String PermissibleWeightThird
        {
            get
            {
                return permissibleWeightThird;
            }

            set
            {
                permissibleWeightThird = value;
            }
        }

        public String ApplicablePenaltyThird
        {
            get
            {
                return applicablePenaltyThird;
            }

            set
            {
                applicablePenaltyThird = value;
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

        public String TransactionTxnId
        {
            get
            {
                return transactionTxnId;
            }

            set
            {
                transactionTxnId = value;
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

        public String TransactionLibility
        {
            get
            {
                return transactionLibility;
            }

            set
            {
                transactionLibility = value;
            }
        }

        public String CCHTransactionId
        {
            get
            {
                return cchTransactionId;
            }

            set
            {
                cchTransactionId = value;
            }
        }

        public String EntryTransactionId
        {
            get
            {
                return entryTransactionId;
            }

            set
            {
                entryTransactionId = value;
            }
        }

        public DateTime EntryTransactionTime
        {
            get
            {
                return entryTransactionTime;
            }

            set
            {
                entryTransactionTime = value;
            }
        }

        public DateTime EntryReaderReadDateTime
        {
            get
            {
                return entryReaderReadDateTime;
            }

            set
            {
                entryReaderReadDateTime = value;
            }
        }

        public String EntryTransactionType
        {
            get
            {
                return entryTransactionType;
            }

            set
            {
                entryTransactionType = value;
            }
        }

        public String EntryTransactionTxnId
        {
            get
            {
                return entryTransactionTxnId;
            }

            set
            {
                entryTransactionTxnId = value;
            }
        }

        public String ResponseId
        {
            get
            {
                return responseId;
            }

            set
            {
                responseId = value;
            }
        }

        public String ResponseFareType
        {
            get
            {
                return responseFareType;
            }

            set
            {
                responseFareType = value;
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

        public String VehicleClassId
        {
            get
            {
                return vehicleClassId;
            }

            set
            {
                vehicleClassId = value;
            }
        }

        public String VehicleDetailId
        {
            get
            {
                return vehicleDetailId;
            }

            set
            {
                vehicleDetailId = value;
            }
        }

        public String VehicleDetailsId
        {
            get
            {
                return vehicleDetailsId;
            }

            set
            {
                vehicleDetailsId = value;
            }
        }

        public String VehicleDetailsName
        {
            get
            {
                return vehicleDetailsName;
            }

            set
            {
                vehicleDetailsName = value;
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

        public String VehicleNumber
        {
            get
            {
                return vehicleNumber;
            }

            set
            {
                vehicleNumber = value;
            }
        }

        public String VehicleDetailsNameSecond
        {
            get
            {
                return vehicleDetailsNameSecond;
            }

            set
            {
                vehicleDetailsNameSecond = value;
            }
        }

        public String VehicleDetailsNameThird
        {
            get
            {
                return vehicleDetailsNameThird;
            }

            set
            {
                vehicleDetailsNameThird = value;
            }
        }

        public Boolean IsCommercialVehicleSecond
        {
            get
            {
                return isCommercialVehicleSecond;
            }

            set
            {
                isCommercialVehicleSecond = value;
            }
        }

        public Boolean IsCommercialVehicleThird
        {
            get
            {
                return isCommercialVehicleThird;
            }

            set
            {
                isCommercialVehicleThird = value;
            }
        }

        public String VehicleClassSecond
        {
            get
            {
                return vehicleClassSecond;
            }

            set
            {
                vehicleClassSecond = value;
            }
        }

        public String VehicleClassThird
        {
            get
            {
                return vehicleClassThird;
            }

            set
            {
                vehicleClassThird = value;
            }
        }

        public String VehicleNumberSecond
        {
            get
            {
                return vehicleNumberSecond;
            }

            set
            {
                vehicleNumberSecond = value;
            }
        }

        public String VehicleNumberThird
        {
            get
            {
                return vehicleNumberThird;
            }

            set
            {
                vehicleNumberThird = value;
            }
        }

        public String VehicleDetails_Id
        {
            get
            {
                return vehicleDetails_Id;
            }

            set
            {
                vehicleDetails_Id = value;
            }
        }

        public String VehicleDetails_IdSecond
        {
            get
            {
                return vehicleDetails_IdSecond;
            }

            set
            {
                vehicleDetails_IdSecond = value;
            }
        }

        public String VehicleDetails_IdThird
        {
            get
            {
                return vehicleDetails_IdThird;
            }

            set
            {
                vehicleDetails_IdThird = value;
            }
        }

        public Boolean IsResponseFileSuccess
        {
            get
            {
                return isResponseFileSuccess;
            }

            set
            {
                isResponseFileSuccess = value;
            }
        }

        public String RefTollfare
        {
            get
            {
                return refTollfare;
            }

            set
            {
                refTollfare = value;
            }
        }

        public String RefApprovalNum
        {
            get
            {
                return refApprovalNum;
            }

            set
            {
                refApprovalNum = value;
            }
        }

        public String RefErrCode
        {
            get
            {
                return refErrCode;
            }

            set
            {
                refErrCode = value;
            }
        }

        public String RefSettCurrency
        {
            get
            {
                return refSettCurrency;
            }

            set
            {
                refSettCurrency = value;
            }
        }

        public String RefRespId
        {
            get
            {
                return refRespId;
            }

            set
            {
                refRespId = value;
            }
        }
    }
}
