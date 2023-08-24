using System;


namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class FloatProcessDenominationIL : DenominationIL
    {
        Int64 floatProcessId;
        Decimal totalAmount;

        public FloatProcessDenominationIL()
        {
            floatProcessId = 0;
            totalAmount = 0;
        }

        public Int64 FloatProcessId
        {
            get
            {
                return floatProcessId;
            }

            set
            {
                floatProcessId = value;
            }
        }
        public Decimal TotalAmount
        {
            get
            {
                return totalAmount;
            }

            set
            {
                totalAmount = value;
            }
        }
    }
}
