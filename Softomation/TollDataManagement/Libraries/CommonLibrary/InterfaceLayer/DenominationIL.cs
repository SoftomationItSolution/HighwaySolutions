using System;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class DenominationIL : CommonIL
    {
        Int16 baseValue;
        Int16 moneyCount;
        Int16 orderBy;

        public DenominationIL()
        {
            this.baseValue = 0;
            this.moneyCount = 0;
            this.orderBy = 0;
        }

        public Int16 BaseValue
        {
            get
            {
                return baseValue;
            }

            set
            {
                baseValue = value;
            }
        }

        public Int16 MoneyCount
        {
            get
            {
                return moneyCount;
            }

            set
            {
                moneyCount = value;
            }
        }

        public Int16 OrderBy
        {
            get
            {
                return orderBy;
            }

            set
            {
                orderBy = value;
            }
        }
    }
}
