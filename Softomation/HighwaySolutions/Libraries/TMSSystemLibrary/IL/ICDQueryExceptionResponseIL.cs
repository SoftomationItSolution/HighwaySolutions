using System;
using System.Collections.Generic;


namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class ICDQueryExceptionResponseIL:ICDCommonIL
    {
        string note;
        string transactionReferanceId;
        string transactionReferanceUrl;
        string transactionType;
        string organizationTransactionId;
        string responseMessageNumber;
        string responseTotalMessage;
        string responseTotalRequestCount;
        string successRequestCount;
        string totalTagsInMessage;
        string totalTagsInResponse;
        string transactionId;
        List<QueryCheckTransactionStatus> checkTransactionStatusList;
        List<ReadQueryException> readQueryExceptionList;

        public ICDQueryExceptionResponseIL()
        {
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
        public String TransactionReferanceId
        {
            get
            {
                return transactionReferanceId;
            }

            set
            {
                transactionReferanceId = value;
            }
        }
        public String TransactionReferanceUrl
        {
            get
            {
                return transactionReferanceUrl;
            }

            set
            {
                transactionReferanceUrl = value;
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
        public String ResponseMessageNumber
        {
            get
            {
                return responseMessageNumber;
            }

            set
            {
                responseMessageNumber = value;
            }
        }
        public String ResponseTotalMessage
        {
            get
            {
                return responseTotalMessage;
            }

            set
            {
                responseTotalMessage = value;
            }
        }
        public String ResponseTotalRequestCount
        {
            get
            {
                return responseTotalRequestCount;
            }

            set
            {
                responseTotalRequestCount = value;
            }
        }
        public String SuccessRequestCount
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
        public String TotalTagsInMessage
        {
            get
            {
                return totalTagsInMessage;
            }

            set
            {
                totalTagsInMessage = value;
            }
        }
        public String TotalTagsInResponse
        {
            get
            {
                return totalTagsInResponse;
            }

            set
            {
                totalTagsInResponse = value;
            }
        }
        public List<QueryCheckTransactionStatus> CheckTransactionStatusList
        {
            get
            {
                return checkTransactionStatusList;
            }

            set
            {
                checkTransactionStatusList = value;
            }
        }
        public List<ReadQueryException> ReadQueryExceptionList
        {
            get
            {
                return readQueryExceptionList;
            }

            set
            {
                readQueryExceptionList = value;
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
    }

    public class QueryCheckTransactionStatus
    {
        string tagId;
        string operation;
        string updatedTime;
        int exceptionId;

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
        public String Operation
        {
            get
            {
                return operation;
            }

            set
            {
                operation = value;
            }
        }
        public String UpdatedTime
        {
            get
            {
                return updatedTime;
            }

            set
            {
                updatedTime = value;
            }
        }
        public Int32 ExceptionId
        {
            get
            {
                return exceptionId;
            }

            set
            {
                exceptionId = value;
            }
        }
    }
    public class ReadQueryException
    {
        string description;
        string errorCode;
        string exceptionCode;
        string priority;
        string result;
        string totalTag;
        int exceptionId;

        public String Description
        {
            get
            {
                return description;
            }

            set
            {
                description = value;
            }
        }
        public String ErrorCode
        {
            get
            {
                return errorCode;
            }

            set
            {
                errorCode = value;
            }
        }
        public String ExceptionCode
        {
            get
            {
                return exceptionCode;
            }

            set
            {
                exceptionCode = value;
            }
        }
        public String Priority
        {
            get
            {
                return priority;
            }

            set
            {
                priority = value;
            }
        }
        public String Result
        {
            get
            {
                return result;
            }

            set
            {
                result = value;
            }
        }
        public String TotalTag
        {
            get
            {
                return totalTag;
            }

            set
            {
                totalTag = value;
            }
        }
        public Int32 ExceptionId
        {
            get
            {
                return exceptionId;
            }

            set
            {
                exceptionId = value;
            }
        }
    }
}
