using System;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class DenominationIL : CommonIL
    {
        Int16 denominationId;
        Int16 denominationValue;
        Int16 denominationCount;
        Int16 orderBy;

        public DenominationIL()
        {
            denominationId = 0;
            denominationValue = 0;
            denominationCount = 0;
            orderBy = 0;
        }

        public Int16 DenominationId
        {
            get
            {
                return denominationId;
            }

            set
            {
                denominationId = value;
            }
        }

        public Int16 DenominationValue
        {
            get
            {
                return denominationValue;
            }

            set
            {
                denominationValue = value;
            }
        }

        public Int16 DenominationCount
        {
            get
            {
                return denominationCount;
            }

            set
            {
                denominationCount = value;
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
