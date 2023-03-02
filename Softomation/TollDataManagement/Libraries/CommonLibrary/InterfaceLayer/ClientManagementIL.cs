using System;
namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class ClientManagementIL : CommonIL
    {
        String clientName;
        String clientAddress;
        String mobileNumber;
        String emailId;

        public ClientManagementIL()
        {
            this.clientName = string.Empty;
            this.clientAddress = string.Empty;
            this.mobileNumber = string.Empty;
            this.emailId = string.Empty;
        }
        public String ClientName
        {
            get
            {
                return clientName;
            }

            set
            {
                clientName = value;
            }
        }

        public String ClientAddress
        {
            get
            {
                return clientAddress;
            }

            set
            {
                clientAddress = value;
            }
        }

        public String MobileNumber
        {
            get
            {
                return mobileNumber;
            }

            set
            {
                mobileNumber = value;
            }
        }

        public String EmailId
        {
            get
            {
                return emailId;
            }

            set
            {
                emailId = value;
            }
        }
    }
}
