using System;
using System.Collections.Generic;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class CashFlowConfigurationIL : CommonIL
    {
        Int16 shiftId;
        Int64 tcUserId;
        Int64 lastTransactionId;
        Decimal amountAlloted;
        Decimal amountCollection;
        Decimal depositedAmount;
        Decimal pendingAmount;
        Int16 shiftStatus;
        DateTime shiftDate;
        String startTimmng;
        String endTimming;
        String tcLoginId;
        String shiftStatusName;
        String receiptNumber;
        CashFlowDepositIL clearenceData;
        List<DenominationIL> denominationData;
        public CashFlowConfigurationIL()
        {
            this.shiftId = 0;
            this.tcUserId = 0;
            this.lastTransactionId = 0;
            this.amountAlloted = 0;
            this.amountCollection = 0;
            this.depositedAmount = 0;
            this.pendingAmount = 0;
            this.shiftStatus = 1;
            this.shiftDate = DateTime.Now;
            this.startTimmng = string.Empty;
            this.endTimming = string.Empty;
            this.tcLoginId = string.Empty;
            this.receiptNumber = string.Empty;
            this.shiftStatusName = "Open";
            this.denominationData = new List<DenominationIL>();
            this.clearenceData = new CashFlowDepositIL();
        }

        public Int16 ShiftId
        {
            get
            {
                return shiftId;
            }

            set
            {
                shiftId = value;
            }
        }
        public Int64 TCUserId
        {
            get
            {
                return tcUserId;
            }

            set
            {
                tcUserId = value;
            }
        }
        public Int64 LastTransactionId
        {
            get
            {
                return lastTransactionId;
            }

            set
            {
                lastTransactionId = value;
            }
        }
        public Decimal AmountAlloted
        {
            get
            {
                return amountAlloted;
            }

            set
            {
                amountAlloted = value;
            }
        }

        public Decimal AmountCollection
        {
            get
            {
                return amountCollection;
            }

            set
            {
                amountCollection = value;
            }
        }

        public Decimal DepositedAmount
        {
            get
            {
                return depositedAmount;
            }

            set
            {
                depositedAmount = value;
            }
        }

        public Decimal PendingAmount
        {
            get
            {
                return pendingAmount;
            }

            set
            {
                pendingAmount = value;
            }
        }

        public Int16 ShiftStatus
        {
            get
            {
                return shiftStatus;
            }

            set
            {
                shiftStatus = value;
            }
        }

        public String StartTimmng
        {
            get
            {
                return startTimmng;
            }

            set
            {
                startTimmng = value;
            }
        }

        public String EndTimming
        {
            get
            {
                return endTimming;
            }

            set
            {
                endTimming = value;
            }
        }

        public String TCLoginId
        {
            get
            {
                return tcLoginId;
            }

            set
            {
                tcLoginId = value;
            }
        }

        public String ShiftStatusName
        {
            get
            {
                return shiftStatusName;
            }

            set
            {
                shiftStatusName = value;
            }
        }
        public DateTime ShiftDate
        {
            get
            {
                return shiftDate;
            }

            set
            {
                shiftDate = value;
            }
        }

        public List<DenominationIL> DenominationData
        {
            get
            {
                return denominationData;
            }

            set
            {
                denominationData = value;
            }
        }

        public String ReceiptNumber
        {
            get
            {
                return receiptNumber;
            }

            set
            {
                receiptNumber = value;
            }
        }

        public CashFlowDepositIL ClearenceData
        {
            get
            {
                return clearenceData;
            }

            set
            {
                clearenceData = value;
            }
        }

       
    }

    
}
