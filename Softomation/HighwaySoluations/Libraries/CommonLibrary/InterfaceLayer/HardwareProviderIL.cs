using System;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class HardwareProviderIL : CommonIL
    {
        String providerName;
        public HardwareProviderIL()
        {
            this.providerName = string.Empty;
        }
        public String ProviderName
        {
            get
            {
                return providerName;
            }

            set
            {
                providerName = value;
            }
        }
    }
}
