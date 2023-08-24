using System;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class FloatTransactionsTypeIL : CommonIL
    {
        Int16 floatTransactionsTypeId;
        String floatTransactionsTypeName;
        public FloatTransactionsTypeIL()
        {
            floatTransactionsTypeId = 0;
            floatTransactionsTypeName = string.Empty;
        }

        public Int16 FloatTransactionsTypeId
        {
            get
            {
                return floatTransactionsTypeId;
            }

            set
            {
                floatTransactionsTypeId = value;
            }
        }

        public String FloatTransactionsTypeName
        {
            get
            {
                return floatTransactionsTypeName;
            }

            set
            {
                floatTransactionsTypeName = value;
            }
        }
    }
}
