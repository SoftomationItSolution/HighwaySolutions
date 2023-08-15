using System;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class SystemIntegratorIL : CommonIL
    {
        Int16 systemIntegratorId;
        String systemIntegratorName;
        String systemIntegratorAddress;
        String systemIntegratoMobileNumber;
        String systemIntegratoEmailId;
        String systemIntegratoLoginId;
        String systemIntegratoLoginPassword;

        public SystemIntegratorIL()
        {
            this.systemIntegratorId = 0;
            this.systemIntegratorName = string.Empty;
            this.systemIntegratorAddress = string.Empty;
            this.systemIntegratoMobileNumber = string.Empty;
            this.systemIntegratoEmailId = string.Empty;
            this.systemIntegratoLoginId = string.Empty;
            this.systemIntegratoLoginPassword = string.Empty;
        }

        public short SystemIntegratorId
        {
            get => systemIntegratorId; set => systemIntegratorId = value;
        }
        public string SystemIntegratorName
        {
            get => systemIntegratorName; set => systemIntegratorName = value;
        }
        public string SystemIntegratorAddress
        {
            get => systemIntegratorAddress; set => systemIntegratorAddress = value;
        }
        public string SystemIntegratorMobileNumber
        {
            get => systemIntegratoMobileNumber; set => systemIntegratoMobileNumber = value;
        }
        public string SystemIntegratorEmailId
        {
            get => systemIntegratoEmailId; set => systemIntegratoEmailId = value;
        }
        public string SystemIntegratorLoginId
        {
            get
            {
                return systemIntegratoLoginId;
            }

            set
            {
                systemIntegratoLoginId = value;
            }
        }
        public string SystemIntegratorLoginPassword
        {
            get
            {
                return systemIntegratoLoginPassword;
            }

            set
            {
                systemIntegratoLoginPassword = value;
            }
        }
    }
}
