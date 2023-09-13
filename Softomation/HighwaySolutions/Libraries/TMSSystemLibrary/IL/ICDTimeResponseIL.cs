using System;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class ICDTimeResponseIL
    {
        string messageId;
        string organizationId;
        DateTime transactionDateTime;
        string apiVersion;
        string responseCode;
        string responseResult;
        DateTime responseTime;
        DateTime serverDateTime;
        string filePath;
        string fileSaveLocation;
        string fileReadLocation;

        public ICDTimeResponseIL()
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

        public DateTime ServerDateTime
        {
            get
            {
                return serverDateTime;
            }

            set
            {
                serverDateTime = value;
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
}
