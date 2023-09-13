using System;
using System.Collections.Generic;


namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class ICDQueryExceptionIL
    {
        string messageId;
        string organizationId;
        DateTime transactionHeadDateTime;
        string apiVersion;
        string transactionId;
        string note;
        string transactionReferanceId;
        string transactionReferanceUrl;
        DateTime transactionDateTime;
        string transactionType;
        string organizationTransactionId;
        string responseMessageNumber;
        string responseTotalMessage;
        string responseResult;
        string responseCode;
        string responseTotalRequestCount;
        string successRequestCount;
        DateTime responseTime;
        string totalTagsInMessage;
        string totalTagsInResponse;
        List<QueryCheckTransactionStatus> checkTransactionStatusList;
        List<ReadQueryException> readQueryExceptionList;
        string filePath;
        string fileSaveLocation;
        string fileReadLocation;

        public ICDQueryExceptionIL()
        {
        }

        public String MessageId
        {
            get
            {
                return messageId;
            }

            set
            {
                messageId = value;
            }
        }
        public String OrganizationId
        {
            get
            {
                return organizationId;
            }

            set
            {
                organizationId = value;
            }
        }
        public String ApiVersion
        {
            get
            {
                return apiVersion;
            }

            set
            {
                apiVersion = value;
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
        public DateTime TransactionHeadDateTime
        {
            get
            {
                return transactionHeadDateTime;
            }

            set
            {
                transactionHeadDateTime = value;
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
        public DateTime TransactionDateTime
        {
            get
            {
                return transactionDateTime;
            }

            set
            {
                transactionDateTime = value;
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
        public String ResponseResult
        {
            get
            {
                return responseResult;
            }

            set
            {
                responseResult = value;
            }
        }
        public String ResponseCode
        {
            get
            {
                return responseCode;
            }

            set
            {
                responseCode = value;
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
        public DateTime ResponseTime
        {
            get
            {
                return responseTime;
            }

            set
            {
                responseTime = value;
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

        public String FilePath
        {
            get
            {
                return filePath;
            }

            set
            {
                filePath = value;
            }
        }

        public String FileSaveLocation
        {
            get
            {
                return fileSaveLocation;
            }

            set
            {
                fileSaveLocation = value;
            }
        }

        public String FileReadLocation
        {
            get
            {
                return fileReadLocation;
            }

            set
            {
                fileReadLocation = value;
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
