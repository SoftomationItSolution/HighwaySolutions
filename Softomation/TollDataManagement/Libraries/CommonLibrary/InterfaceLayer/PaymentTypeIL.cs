using System;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class PaymentTypeIL : CommonIL
    {
        String paymentTypeName;

        public PaymentTypeIL()
        {
            paymentTypeName = string.Empty;
        }

        public String PaymentTypeName
        {
            get
            {
                return paymentTypeName;
            }

            set
            {
                paymentTypeName = value;
            }
        }

        
    }
}
