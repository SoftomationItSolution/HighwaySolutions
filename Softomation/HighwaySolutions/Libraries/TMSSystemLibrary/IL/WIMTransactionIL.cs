using System;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class WIMTransactionIL : CommonIL
    {
        private Int32 wimSequenceNumber;
        private Int64 wimTransactionId;
        private Int64 laneTransactionId;
        private Decimal totalWeight;
        private Decimal staticWeight;
        private Decimal overloadWeight;
        private Int64 wimNumber;
        private Int16 wimClassId;
        private String wimClassName;
        private Boolean isOverWeight;
        private Decimal overweightPenalty;
        private Boolean isRefunded;
        private Decimal refundedAmount;
       

        public WIMTransactionIL()
        {
            this.wimSequenceNumber = 0;
            this.wimTransactionId = 0;
            this.laneTransactionId = 0;
            this.totalWeight = 0;
            this.staticWeight = 0;
            this.overloadWeight = 0;
            this.wimNumber = 0;
            this.wimClassId = 0;
            this.wimClassName = string.Empty;
            this.isOverWeight = false;
            this.overweightPenalty = 0;
            this.isRefunded = false;
            this.refundedAmount = 0;
        }
        public int WimSequenceNumber
        {
            get => wimSequenceNumber; set => wimSequenceNumber = value;
        }
        public long WimTransactionId
        {
            get => wimTransactionId; set => wimTransactionId = value;
        }
        public long LaneTransactionId
        {
            get => laneTransactionId; set => laneTransactionId = value;
        }
        public decimal TotalWeight
        {
            get => totalWeight; set => totalWeight = value;
        }
        public decimal StaticWeight
        {
            get => staticWeight; set => staticWeight = value;
        }
        public decimal OverloadWeight
        {
            get => overloadWeight; set => overloadWeight = value;
        }
        public long WimNumber
        {
            get => wimNumber; set => wimNumber = value;
        }
        public short WimClassId
        {
            get => wimClassId; set => wimClassId = value;
        }
        public string WimClassName
        {
            get => wimClassName; set => wimClassName = value;
        }
        public bool IsOverWeight
        {
            get => isOverWeight; set => isOverWeight = value;
        }
        public decimal OverweightPenalty
        {
            get => overweightPenalty; set => overweightPenalty = value;
        }
        public bool IsRefunded
        {
            get => isRefunded; set => isRefunded = value;
        }
        public decimal RefundedAmount
        {
            get => refundedAmount; set => refundedAmount = value;
        }
        
    }
}
