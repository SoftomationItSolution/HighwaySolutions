using System;
using System.Collections.Generic;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class CashFlowDepositIL : CommonIL
    {
        Int64 cashFlowId;
        Int64 clearanceUserId;
        Decimal depositedAmount;
        String receiptNumber;
        String clearanceLoginId;
        DateTime clearanceDate;
        List<DenominationIL> depositData;
        public CashFlowDepositIL()
        {
            this.cashFlowId = 0;
            this.clearanceUserId = 0;
            this.depositedAmount = 0;
            this.receiptNumber = string.Empty;
            this.clearanceLoginId = string.Empty;
            this.clearanceDate = DateTime.Now;
            this.depositData = new List<DenominationIL>();
        }

        public Int64 CashFlowId
        {
            get
            {
                return cashFlowId;
            }

            set
            {
                cashFlowId = value;
            }
        }

        public Int64 ClearanceUserId
        {
            get
            {
                return clearanceUserId;
            }

            set
            {
                clearanceUserId = value;
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

        public String ClearanceLoginId
        {
            get
            {
                return clearanceLoginId;
            }

            set
            {
                clearanceLoginId = value;
            }
        }

        public DateTime ClearanceDate
        {
            get
            {
                return clearanceDate;
            }

            set
            {
                clearanceDate = value;
            }
        }

        public List<DenominationIL> DepositData
        {
            get
            {
                return depositData;
            }

            set
            {
                depositData = value;
            }
        }
    }
}
