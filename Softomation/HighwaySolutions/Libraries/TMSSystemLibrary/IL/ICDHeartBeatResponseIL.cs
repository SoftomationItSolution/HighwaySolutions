using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class ICDHeartBeatResponseIL: ICDCommonIL
    {
        string transactionId;
        string transactionOrganizationId;
        string transactionNote;
        string transactionReferenceId;
        string transactionReferenceURL;
        string transactionType;
        int transactionErrorCode;
       
        public ICDHeartBeatResponseIL()
        {
            transactionId=string.Empty;
            transactionOrganizationId = string.Empty;
            transactionNote = string.Empty;
            transactionReferenceId = string.Empty;
            transactionReferenceURL = string.Empty;
            transactionType = string.Empty;
            transactionErrorCode = 0;
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
    }
}
