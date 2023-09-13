using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class ICDTransactionStatusResponseIL : ICDCommonIL
    {
        string transactionMessageId;
        DateTime transactionApiCallDatetime;
        string transactionApiVersion;
        string transactionId;
        string transactionOrganizationId;
        string transactionNote;
        string transactionReferenceId;
        string transactionReferenceURL;
        string transactionType;
        string organizationTransactionId;
        string transactionPlazaId;
        DateTime transactionResponseTime;
        string transactionResult;
        string transactionResponseCode;
        string transactionTotalRequestCount;
        string transactionSuccessRequestCount;
        string cchTransactionId;
        string transactionLaneId;
        string transactionResultSecond;
        string transactionRequestedErrorCode;
        DateTime transactionSettlementDate;
        DateTime transactionReaderDateTime;
        string transactionFilePath;
        List<CheckTransactionStatus> transactionList;
        public ICDTransactionStatusResponseIL()
        {
            transactionMessageId = string.Empty;
        }
        public String TransactionMessageId
        {
            get
            {
                return transactionMessageId;
            }

            set
            {
                transactionMessageId = value;
            }
        }
        public DateTime TransactionApiCallDatetime
        {
            get
            {
                return transactionApiCallDatetime;
            }

            set
            {
                transactionApiCallDatetime = value;
            }
        }
        public String TransactionApiVersion
        {
            get
            {
                return transactionApiVersion;
            }

            set
            {
                transactionApiVersion = value;
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
        public String OrganizationTransactionId
        {
            get
            {
                return organizationTransactionId;
            }

            set
            {
                organizationTransactionId = value;
            }
        }
        public String TransactionPlazaId
        {
            get
            {
                return transactionPlazaId;
            }

            set
            {
                transactionPlazaId = value;
            }
        }
        public DateTime TransactionResponseTime
        {
            get
            {
                return transactionResponseTime;
            }

            set
            {
                transactionResponseTime = value;
            }
        }
        public String TransactionResult
        {
            get
            {
                return transactionResult;
            }

            set
            {
                transactionResult = value;
            }
        }
        public String TransactionResponseCode
        {
            get
            {
                return transactionResponseCode;
            }

            set
            {
                transactionResponseCode = value;
            }
        }
        public String TransactionTotalRequestCount
        {
            get
            {
                return transactionTotalRequestCount;
            }

            set
            {
                transactionTotalRequestCount = value;
            }
        }
        public String TransactionSuccessRequestCount
        {
            get
            {
                return transactionSuccessRequestCount;
            }

            set
            {
                transactionSuccessRequestCount = value;
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
        public String TransactionLaneId
        {
            get
            {
                return transactionLaneId;
            }

            set
            {
                transactionLaneId = value;
            }
        }
        public String TransactionResultSecond
        {
            get
            {
                return transactionResultSecond;
            }

            set
            {
                transactionResultSecond = value;
            }
        }
        public String TransactionRequestedErrorCode
        {
            get
            {
                return transactionRequestedErrorCode;
            }

            set
            {
                transactionRequestedErrorCode = value;
            }
        }
        public DateTime TransactionSettlementDate
        {
            get
            {
                return transactionSettlementDate;
            }

            set
            {
                transactionSettlementDate = value;
            }
        }
        public DateTime TransactionReaderDateTime
        {
            get
            {
                return transactionReaderDateTime;
            }

            set
            {
                transactionReaderDateTime = value;
            }
        }
        public String TransactionFilePath
        {
            get
            {
                return transactionFilePath;
            }

            set
            {
                transactionFilePath = value;
            }
        }
        public List<CheckTransactionStatus> TransactionList
        {
            get
            {
                return transactionList;
            }

            set
            {
                transactionList = value;
            }
        }
    }

    public class CheckTransactionStatus
    {
        string transactionStatus;
        string transactionReaderTime;
        string transactionType;
        string transactionFare;
        string transactionFareType;
        string transactionVehicleClass;
        string transactionRegistrationNumber;
        string transactionReceivedTime;
        string transactionErrorCode;

        public CheckTransactionStatus()
        {
        }

        public String TransactionStatus
        {
            get
            {
                return transactionStatus;
            }

            set
            {
                transactionStatus = value;
            }
        }

        public String TransactionReaderTime
        {
            get
            {
                return transactionReaderTime;
            }

            set
            {
                transactionReaderTime = value;
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

        public String TransactionFare
        {
            get
            {
                return transactionFare;
            }

            set
            {
                transactionFare = value;
            }
        }

        public String TransactionFareType
        {
            get
            {
                return transactionFareType;
            }

            set
            {
                transactionFareType = value;
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

        public String TransactionRegistrationNumber
        {
            get
            {
                return transactionRegistrationNumber;
            }

            set
            {
                transactionRegistrationNumber = value;
            }
        }

        public String TransactionErrorCode
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

        public String TransactionReceivedTime
        {
            get
            {
                return transactionReceivedTime;
            }

            set
            {
                transactionReceivedTime = value;
            }
        }
    }
}
