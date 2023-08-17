using System;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class TransactionTypeIL : CommonIL
    {
        Int16 transactionTypeId;
        String transactionTypeName;
        Boolean reveiwedRequired;

        public TransactionTypeIL()
        {
            this.transactionTypeId = 0;
            this.transactionTypeName = string.Empty;
            this.reveiwedRequired = false;
        }
        public short TransactionTypeId
        {
            get => transactionTypeId; set => transactionTypeId = value;
        }
        public string TransactionTypeName
        {
            get => transactionTypeName; set => transactionTypeName = value;
        }
        public bool ReviewRequired
        {
            get => reveiwedRequired; set => reveiwedRequired = value;
        }
    }
}
