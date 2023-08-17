using System;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class PaymentMethodTypeIL : TransactionTypeIL
    {
        Int16 paymentTypeId;
        String paymentTypeName;

        public PaymentMethodTypeIL()
        {
            this.paymentTypeId = 0;
            this.paymentTypeName = string.Empty;
        }
        public short PaymentTypeId
        {
            get => paymentTypeId; set => paymentTypeId = value;
        }
        public string PaymentTypeName
        {
            get => paymentTypeName; set => paymentTypeName = value;
        }
    }
}
