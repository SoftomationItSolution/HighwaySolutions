using System;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class ICDCommonIL
    {
        string messageId;
        string organizationId;
        string apiVersion;
        string responseCode;
        string responseResult;
        DateTime transactionHeadDateTime;
        DateTime transactionDateTime;
        DateTime responseTime;
        string filePath;
        string fileSaveLocation;
        string readFileLocation;

        public ICDCommonIL()
        {
            messageId=string.Empty;
            organizationId = string.Empty;
            apiVersion = string.Empty;
            responseCode = string.Empty;
            responseResult = string.Empty;
            transactionHeadDateTime = DateTime.Now;
            transactionDateTime = DateTime.Now;
            responseTime = DateTime.Now;
            filePath = string.Empty;
            fileSaveLocation = string.Empty;
            readFileLocation = string.Empty;
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
        public String ReadFileLocation
        {
            get
            {
                return readFileLocation;
            }

            set
            {
                readFileLocation = value;
            }
        }
    }
}
