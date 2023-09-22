using System;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class ICDCommonIL
    {
        DateTime requestDateTime;
        String messageId;
        String organizationId;
        String apiVersion;
        String icdTransactionId;
        Int32 responseCode;
        String responseResult;
        DateTime transactionHeadDateTime;
        DateTime transactionDateTime;
        DateTime responseDateTime;
        String filePath;
        String fileSaveLocation;
        String fileReadLocation;
        Int32 errorCode;
        Boolean messageType;
        Int16 requestStatusId;
        String requestStatusName;
        Boolean isResponseSuccess;
        Boolean isSignatureRequired;
        Boolean isResponseProcessError;

        public ICDCommonIL()
        {
            requestDateTime = DateTime.Now;
            messageId =string.Empty;
            organizationId = string.Empty;
            apiVersion = string.Empty;
            icdTransactionId = string.Empty;
            responseCode = 0;
            responseResult = string.Empty;
            transactionHeadDateTime = DateTime.Now;
            transactionDateTime = DateTime.Now;
            responseDateTime = DateTime.Now;
            filePath = string.Empty;
            fileSaveLocation = string.Empty;
            fileReadLocation = string.Empty;
            errorCode = 0;
            messageType = false;
            requestStatusId = 0;
            requestStatusName = string.Empty;
            isResponseSuccess = false;
            isSignatureRequired = true;
            isResponseProcessError = false;
        }
        public DateTime RequestDateTime
        {
            get
            {
                return requestDateTime;
            }

            set
            {
                requestDateTime = value;
            }
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
        public String ICDTransactionId
        {
            get
            {
                return icdTransactionId;
            }

            set
            {
                icdTransactionId = value;
            }
        }
        public int ResponseCode
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
        public DateTime ResponseDateTime
        {
            get
            {
                return responseDateTime;
            }

            set
            {
                responseDateTime = value;
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
        public Int32 ErrorCode
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
        public Boolean MessageType
        {
            get
            {
                return messageType;
            }

            set
            {
                messageType = value;
            }
        }
        public Int16 RequestStatusId
        {
            get
            {
                return requestStatusId;
            }

            set
            {
                requestStatusId = value;
            }
        }
        public String RequestStatusName
        {
            get
            {
                return requestStatusName;
            }

            set
            {
                requestStatusName = value;
            }
        }
        public Boolean IsResponseSuccess
        {
            get
            {
                return isResponseSuccess;
            }

            set
            {
                isResponseSuccess = value;
            }
        }

        public Boolean IsSignatureRequired
        {
            get
            {
                return isSignatureRequired;
            }

            set
            {
                isSignatureRequired = value;
            }
        }
        public Boolean IsResponseProcessError
        {
            get
            {
                return isResponseProcessError;
            }

            set
            {
                isResponseProcessError = value;
            }
        }
    }
}
