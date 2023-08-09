using System;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class TransactionTypeIL : CommonIL
    {
        String transactionTypeName;
        Int16 reveiwedRequired;

        public TransactionTypeIL()
        {
            transactionTypeName = string.Empty;
            this.reveiwedRequired = 0;
        }

        public String TransactionTypeName
        {
            get
            {
                return transactionTypeName;
            }

            set
            {
                transactionTypeName = value;
            }
        }

        public Int16 ReveiwedRequired
        {
            get
            {
                return reveiwedRequired;
            }

            set
            {
                reveiwedRequired = value;
            }
        }
    }
}
