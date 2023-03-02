using System;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class PlazaTransactionReviewIL
    {
        Int64 entryId;
        Int64 plazaTransId;
        Int16 plazaId;
        String reveiwedPlateNumber;
        Int16 reveiwedClassCorrection;
        String reveiwedClassCorrectionName;
        Int16 reveiwedClassId;
        String reveiwedClassName;
        Int16 reveiwedTransactionType;
        String reveiwedTransactionTypeName;
        Decimal reveiwedTransactionAmount;
        Decimal transactionAmountDifference;
        Int64 reveiwedBy;
        String reveiwedLoginId;
        DateTime reveiwedDateTime;
        String reveiwedRemark;

        public PlazaTransactionReviewIL()
        {
            this.entryId = 0;
            this.plazaTransId = 0;
            this.plazaId = 0;
            this.reveiwedPlateNumber = string.Empty;
            this.reveiwedClassCorrection = 0;
            this.reveiwedClassCorrectionName = string.Empty;
            this.reveiwedClassId = 0;
            this.reveiwedClassName = string.Empty;
            this.reveiwedTransactionType = 0;
            this.reveiwedTransactionTypeName = string.Empty;
            this.reveiwedTransactionAmount = 0;
            this.transactionAmountDifference = 0;
            this.reveiwedBy = 0;
            this.reveiwedLoginId = string.Empty;
            this.reveiwedDateTime = DateTime.Now;
            this.reveiwedRemark = string.Empty;
        }
        public Int64 EntryId
        {
            get
            {
                return entryId;
            }

            set
            {
                entryId = value;
            }
        }
        public Int64 PlazaTransId
        {
            get
            {
                return plazaTransId;
            }

            set
            {
                plazaTransId = value;
            }
        }
        public Int16 PlazaId
        {
            get
            {
                return plazaId;
            }

            set
            {
                plazaId = value;
            }
        }
        public String ReveiwedPlateNumber
        {
            get
            {
                return reveiwedPlateNumber;
            }

            set
            {
                reveiwedPlateNumber = value;
            }
        }

        public Int16 ReveiwedClassCorrection
        {
            get
            {
                return reveiwedClassCorrection;
            }

            set
            {
                reveiwedClassCorrection = value;
            }
        }

        public String ReveiwedClassCorrectionName
        {
            get
            {
                return reveiwedClassCorrectionName;
            }

            set
            {
                reveiwedClassCorrectionName = value;
            }
        }

        public Int16 ReveiwedClassId
        {
            get
            {
                return reveiwedClassId;
            }

            set
            {
                reveiwedClassId = value;
            }
        }

        public String ReveiwedClassName
        {
            get
            {
                return reveiwedClassName;
            }

            set
            {
                reveiwedClassName = value;
            }
        }

        public Int16 ReveiwedTransactionType
        {
            get
            {
                return reveiwedTransactionType;
            }

            set
            {
                reveiwedTransactionType = value;
            }
        }

        public String ReveiwedTransactionTypeName
        {
            get
            {
                return reveiwedTransactionTypeName;
            }

            set
            {
                reveiwedTransactionTypeName = value;
            }
        }

        public Decimal ReveiwedTransactionAmount
        {
            get
            {
                return reveiwedTransactionAmount;
            }

            set
            {
                reveiwedTransactionAmount = value;
            }
        }

        public Decimal TransactionAmountDifference
        {
            get
            {
                return transactionAmountDifference;
            }

            set
            {
                transactionAmountDifference = value;
            }
        }

        public Int64 ReveiwedBy
        {
            get
            {
                return reveiwedBy;
            }

            set
            {
                reveiwedBy = value;
            }
        }

        public String ReveiwedLoginId
        {
            get
            {
                return reveiwedLoginId;
            }

            set
            {
                reveiwedLoginId = value;
            }
        }

        public DateTime ReveiwedDateTime
        {
            get
            {
                return reveiwedDateTime;
            }

            set
            {
                reveiwedDateTime = value;
            }
        }

        public String ReveiwedRemark
        {
            get
            {
                return reveiwedRemark;
            }

            set
            {
                reveiwedRemark = value;
            }
        }

       
    }
}
