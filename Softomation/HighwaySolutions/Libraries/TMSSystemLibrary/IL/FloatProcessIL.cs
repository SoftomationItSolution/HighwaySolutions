using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class FloatProcessIL : CommonIL
    {
        Int64 floatProcessId;
        Int16 plazaId;
        String plazaName;
        Int16 laneId;
        String laneNumber;
        Int16 shiftId;
        String shiftTimining;
        String shiftNumber;
        Int16 floatTransactionTypeId;
        String floatTransactionTypeName;
        DateTime transactionDate;
        String transactionDateStamp;
        Decimal transactionAmount;
        String receiptNumber;
        Int64 assignedBy;
        String assignedByLoginId;
        Int64 assignedTo;
        String assignedToLoginId;
        List<FloatProcessDenominationIL> floatProcessDenominationList;
        public FloatProcessIL()
        {
            floatProcessId = 0;
            plazaId = 0;
            plazaName = string.Empty;
            laneId = 0;
            laneNumber = string.Empty;
            shiftId = 0;
            shiftTimining=string.Empty;
            shiftNumber = string.Empty;
            floatTransactionTypeId = 0;
            floatTransactionTypeName = string.Empty;
            transactionDate = DateTime.MinValue;
            transactionDateStamp = string.Empty;
            transactionAmount = 0;
            receiptNumber = string.Empty;
            assignedBy = 0;
            assignedByLoginId = string.Empty;
            assignedTo = 0;
            assignedToLoginId = string.Empty;
            floatProcessDenominationList = new List<FloatProcessDenominationIL>();
        }

        public Int64 FloatProcessId
        {
            get
            {
                return floatProcessId;
            }

            set
            {
                floatProcessId = value;
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
        public String PlazaName
        {
            get
            {
                return plazaName;
            }

            set
            {
                plazaName = value;
            }
        }
        public Int16 LaneId
        {
            get
            {
                return laneId;
            }

            set
            {
                laneId = value;
            }
        }
        public String LaneNumber
        {
            get
            {
                return laneNumber;
            }

            set
            {
                laneNumber = value;
            }
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
        public String ShiftTimining
        {
            get
            {
                return shiftTimining;
            }

            set
            {
                shiftTimining = value;
            }
        }
        public String ShiftNumber
        {
            get
            {
                return shiftNumber;
            }

            set
            {
                shiftNumber = value;
            }
        }
        public Int16 FloatTransactionTypeId
        {
            get
            {
                return floatTransactionTypeId;
            }

            set
            {
                floatTransactionTypeId = value;
            }
        }
        public String FloatTransactionTypeName
        {
            get
            {
                return floatTransactionTypeName;
            }

            set
            {
                floatTransactionTypeName = value;
            }
        }
        public DateTime TransactionDate
        {
            get
            {
                return transactionDate;
            }

            set
            {
                transactionDate = value;
            }
        }
        public String TransactionDateStamp
        {
            get
            {
                return transactionDateStamp;
            }

            set
            {
                transactionDateStamp = value;
            }
        }
        public Decimal TransactionAmount
        {
            get
            {
                return transactionAmount;
            }

            set
            {
                transactionAmount = value;
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
        public Int64 AssignedBy
        {
            get
            {
                return assignedBy;
            }

            set
            {
                assignedBy = value;
            }
        }
        public String AssignedByLoginId
        {
            get
            {
                return assignedByLoginId;
            }

            set
            {
                assignedByLoginId = value;
            }
        }
        public Int64 AssignedTo
        {
            get
            {
                return assignedTo;
            }

            set
            {
                assignedTo = value;
            }
        }
        public String AssignedToLoginId
        {
            get
            {
                return assignedToLoginId;
            }

            set
            {
                assignedToLoginId = value;
            }
        }
        public List<FloatProcessDenominationIL> FloatProcessDenominationList
        {
            get
            {
                return floatProcessDenominationList;
            }

            set
            {
                floatProcessDenominationList = value;
            }
        }
    }
}
