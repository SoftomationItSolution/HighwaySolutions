using System;


namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    [Serializable]
    public class LaneTransactionSerialIL
    {

        Int64 entryId;
        Int64 masterId;
        Int64 laneTransId;
        Int16 clientId;
        String clientName;
        Int16 plazaId;
        String plazaName;
        Int16 laneNumber;
        Int16 laneType;
        Int16 laneUsed;
        String laneTypeName;
        String laneUsedName;
        Int16 shiftId;
        Int64 tcUserId;
        String tcLoginId;
        String plateNumber;
        Int16 mappingClassId;
        String mappingClassName;
        Int16 avcClassId;
        String avcClassName;
        Int16 ihmclClassId;
        String ihmclClassName;
        Int16 transactionTypeId;
        String transactionTypeName;
        Int16 paymentTypeId;
        String paymentTypeName;
        Int16 exemptTypeId;
        String exemptTypeName;
        String referenceNumber;
        Decimal transactionAmount;
        DateTime transactionTimeStamp;
        String transactionDateTime;
        String transactionImage;
        String transactionVideo;
        Int64 referenceTransactionId;
        Int16 reveiwedRequired;
        Int16 reveiwedStatus;
        Int16 chargeable;
        Int16 journeyType;
        Int16 transactionStatus;
        Int16 confirmationStatus;
        Int16 overweight;
        Int16 penalty;
        Int16 towVehicle;

        public LaneTransactionSerialIL()
        {
            this.entryId = 0;
            this.masterId = 0;
            this.laneTransId = 0;
            this.clientId = 0;
            this.clientName = string.Empty;
            this.plazaId = 0;
            this.plazaName = string.Empty;
            this.laneNumber = 0;
            this.laneType = 0;
            this.laneTypeName = string.Empty;
            this.laneUsed = 2;
            this.laneUsedName = string.Empty;
            this.shiftId = 0;
            this.tcUserId = 0;
            this.tcLoginId = string.Empty;
            this.plateNumber = String.Empty;
            this.mappingClassId = 0;
            this.mappingClassName = string.Empty;
            this.avcClassId = 0;
            this.avcClassName = string.Empty;
            this.ihmclClassId = 0;
            this.ihmclClassName = string.Empty;
            this.transactionTypeId = 0;
            this.transactionTypeName = string.Empty;
            this.paymentTypeId = 0;
            this.paymentTypeName = string.Empty;
            this.exemptTypeId = 0;
            this.exemptTypeName = string.Empty;
            this.referenceNumber = String.Empty;
            this.transactionAmount = 0;
            this.transactionTimeStamp = DateTime.Now;
            this.transactionDateTime = string.Empty;
            this.transactionImage = String.Empty;
            this.transactionVideo = String.Empty;
            this.referenceTransactionId = 0;
            this.reveiwedRequired = 0;
            this.reveiwedStatus = 0;
            this.chargeable = 0;
            this.journeyType = 1;
            this.transactionStatus = 1;
            this.confirmationStatus = 0;
            this.overweight = 0;
            this.penalty = 0;
            this.towVehicle = 0;
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

        public Int64 MasterId
        {
            get
            {
                return masterId;
            }

            set
            {
                masterId = value;
            }
        }

        public Int64 LaneTransId
        {
            get
            {
                return laneTransId;
            }

            set
            {
                laneTransId = value;
            }
        }

        public Int16 ClientId
        {
            get
            {
                return clientId;
            }

            set
            {
                clientId = value;
            }
        }
        public String ClientName
        {
            get
            {
                return clientName;
            }

            set
            {
                clientName = value;
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
        public Int16 LaneNumber
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
        public Int16 LaneType
        {
            get
            {
                return laneType;
            }

            set
            {
                laneType = value;
            }
        }

        public String LaneTypeName
        {
            get
            {
                return laneTypeName;
            }

            set
            {
                laneTypeName = value;
            }
        }
        public Int16 LaneUsed
        {
            get
            {
                return laneUsed;
            }

            set
            {
                laneUsed = value;
            }
        }
        public String LaneUsedName
        {
            get
            {
                return laneUsedName;
            }

            set
            {
                laneUsedName = value;
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
        public String PlateNumber
        {
            get
            {
                return plateNumber;
            }

            set
            {
                plateNumber = value;
            }
        }
        public Int16 MappingClassId
        {
            get
            {
                return mappingClassId;
            }

            set
            {
                mappingClassId = value;
            }
        }
        public String MappingClassName
        {
            get
            {
                return mappingClassName;
            }

            set
            {
                mappingClassName = value;
            }
        }
        public Int16 AvcClassId
        {
            get
            {
                return avcClassId;
            }

            set
            {
                avcClassId = value;
            }
        }
        public String AvcClassName
        {
            get
            {
                return avcClassName;
            }

            set
            {
                avcClassName = value;
            }
        }
        public Int16 IhmclClassId
        {
            get
            {
                return ihmclClassId;
            }

            set
            {
                ihmclClassId = value;
            }
        }
        public String IhmclClassName
        {
            get
            {
                return ihmclClassName;
            }

            set
            {
                ihmclClassName = value;
            }
        }
        public Int16 TransactionTypeId
        {
            get
            {
                return transactionTypeId;
            }

            set
            {
                transactionTypeId = value;
            }
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
        public Int16 PaymentTypeId
        {
            get
            {
                return paymentTypeId;
            }

            set
            {
                paymentTypeId = value;
            }
        }
        public String PaymentTypeName
        {
            get
            {
                return paymentTypeName;
            }

            set
            {
                paymentTypeName = value;
            }
        }
        public Int16 ExemptTypeId
        {
            get
            {
                return exemptTypeId;
            }

            set
            {
                exemptTypeId = value;
            }
        }
        public String ExemptTypeName
        {
            get
            {
                return exemptTypeName;
            }

            set
            {
                exemptTypeName = value;
            }
        }
        public String ReferenceNumber
        {
            get
            {
                return referenceNumber;
            }

            set
            {
                referenceNumber = value;
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

        public String TransactionDateTime
        {
            get
            {
                return transactionDateTime;
            }

            set
            {
                transactionDateTime = value;
            }
        }

        public String TransactionImage
        {
            get
            {
                return transactionImage;
            }

            set
            {
                transactionImage = value;
            }
        }

        public String TransactionVideo
        {
            get
            {
                return transactionVideo;
            }

            set
            {
                transactionVideo = value;
            }
        }

        public Int64 ReferenceTransactionId
        {
            get
            {
                return referenceTransactionId;
            }

            set
            {
                referenceTransactionId = value;
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

        public Int16 ReveiwedStatus
        {
            get
            {
                return reveiwedStatus;
            }

            set
            {
                reveiwedStatus = value;
            }
        }

        public Int16 Chargeable
        {
            get
            {
                return chargeable;
            }

            set
            {
                chargeable = value;
            }
        }

        public Int16 JourneyType
        {
            get
            {
                return journeyType;
            }

            set
            {
                journeyType = value;
            }
        }
        public Int16 TransactionStatus
        {
            get
            {
                return transactionStatus;
            }

            set
            {
                transactionStatus = value;
            }
        }

        public Int16 ConfirmationStatus
        {
            get
            {
                return confirmationStatus;
            }

            set
            {
                confirmationStatus = value;
            }
        }

        public Int16 Overweight
        {
            get
            {
                return overweight;
            }

            set
            {
                overweight = value;
            }
        }

        public Int16 Penalty
        {
            get
            {
                return penalty;
            }

            set
            {
                penalty = value;
            }
        }
        public Int16 TowVehicle
        {
            get
            {
                return towVehicle;
            }

            set
            {
                towVehicle = value;
            }
        }

    }
}
