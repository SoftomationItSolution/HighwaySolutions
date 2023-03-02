using System;
using System.Collections.Generic;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class FareManagementIL : PlazaMappingIL
    {
        DateTime effectiveDate;
        DateTime lastEffectiveDate;
        List<FareDetailsIL> fareDetails;

        public FareManagementIL()
        {
            this.effectiveDate = DateTime.Now;
            this.fareDetails = new List<FareDetailsIL>();
        }

        public DateTime EffectiveDate
        {
            get
            {
                return effectiveDate;
            }

            set
            {
                effectiveDate = value;
            }
        }
        public DateTime LastEffectiveDate
        {
            get
            {
                return lastEffectiveDate;
            }

            set
            {
                lastEffectiveDate = value;
            }
        }
        public List<FareDetailsIL> FareDetails
        {
            get
            {
                return fareDetails;
            }

            set
            {
                fareDetails = value;
            }
        }
    }

    public class FareDetailsIL : FareManagementIL
    {
        string journey;
        Int16 classId;
        String className;
        Decimal tollFare;
        Decimal penaltyFare;
        Decimal overWeightFare;
        Decimal returnFare;
        DateTime transactionTimeStamp;
        public FareDetailsIL()
        {
            this.journey = string.Empty;
            this.classId = 0;
            this.className = string.Empty;
            this.tollFare = 0;
            this.penaltyFare = 0;
            this.overWeightFare = 0;
            this.returnFare = 0;
            this.transactionTimeStamp = DateTime.Now;
        }

        public String Journey
        {
            get
            {
                return journey;
            }

            set
            {
                journey = value;
            }
        }
        public Int16 ClassId
        {
            get
            {
                return classId;
            }

            set
            {
                classId = value;
            }
        }
        public String ClassName
        {
            get
            {
                return className;
            }

            set
            {
                className = value;
            }
        }
        public Decimal TollFare
        {
            get
            {
                return tollFare;
            }

            set
            {
                tollFare = value;
            }
        }

        public Decimal ReturnFare
        {
            get
            {
                return returnFare;
            }

            set
            {
                returnFare = value;
            }
        }
        public Decimal PenaltyFare
        {
            get
            {
                return penaltyFare;
            }

            set
            {
                penaltyFare = value;
            }
        }

        public Decimal OverWeightFare
        {
            get
            {
                return overWeightFare;
            }

            set
            {
                overWeightFare = value;
            }
        }

        public DateTime TransactionTimeStamp
        {
            get
            {
                return transactionTimeStamp;
            }

            set
            {
                transactionTimeStamp = value;
            }
        }
    }
}
