using System;


namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class LaneTransactionIL
    {
        Int64 masterTransactionId;
        Int64 plazaTransactionId;
        Int64 laneTransactionId;
        String transactionNumber;
        Int16 systemIntegratorId;
        String systemIntegratorName;
        Int16 journeyId;
        String journeyName;
        Int16 plazaId;
        String plazaName;
        Int16 laneId;
        String laneNumber;
        Int16 laneTypeId;
        String laneTypeName;
        Boolean laneStatusId;
        Int16 laneDirectionId;
        String laneDirectionName;
        Int16 shiftId;
        String shiftNumber;
        String plateNumber;
        Int16 vehicleClassId;
        String vehicleClassName;
        Int16 vehicleSubClassId;
        String vehicleSubClassName;
        Int16 vehicleAvcClassId;
        String vehicleAvcClassName;
        Int16 transactionTypeId;
        String transactionTypeName;
        Int16 paymentTypeId;
        String paymentTypeName;
        Int16 exemptTypeId;
        String exemptTypeName;
        Int16 exemptSubTypeId;
        String exemptSubTypeName;
        String smartCardNumber;
        String receiptNumber;
        Int16 tagClassId;
        String tagClassName;
        String tagPlateNumber;
        String tagId;
        String tagEpc;
        DateTime tagReadDateTime;
        String tagReadDateTimeStamp;
        Int16 tagReadBy;
        Decimal permissibleVehicleWeight;
        Decimal actualVehicleWeight;
        Decimal overWeightAmount;
        Decimal tagPenaltyAmount;
        Decimal transactionAmount;
        DateTime transactionDateTime;
        String transactionDateTimeStamp;
        String transactionFrontImage;
        String transactionBackImage;
        String transactionAvcImage;
        String transactionVideo;
        String exemptionProofImage;
        Int16 destinationPlazaId;
        String destinationPlazaName;
        Int64 userId;
        String loginId;
        Boolean returnJourney;
        Boolean excessJourney;
        Boolean barrierAutoClose;
        Boolean towVehicle;
        Boolean fleetTranscation;
        Int16 fleetCount;
        Boolean transactionStatus;
        Boolean reveiwedRequired;
        Boolean reveiwedStatus;
        DateTime receivedDateTime;
        

        public LaneTransactionIL()
        {
            this.masterTransactionId = 0;
            this.plazaTransactionId = 0;
            this.laneTransactionId = 0;
            this.transactionNumber = string.Empty;
            this.systemIntegratorId = 0;
            this.systemIntegratorName = string.Empty;
            this.journeyId = 0;
            this.journeyName = string.Empty;
            this.plazaId = 0;
            this.plazaName = string.Empty;
            this.laneId = 0;
            this.laneNumber = string.Empty;
            this.laneTypeId = 0;
            this.laneTypeName = string.Empty;
            this.laneStatusId = false;
            this.laneDirectionId = 0;
            this.laneDirectionName = string.Empty;
            this.shiftId = 0;
            this.shiftNumber = string.Empty;
            this.plateNumber = string.Empty;
            this.vehicleClassId = 0;
            this.vehicleClassName = string.Empty;
            this.vehicleSubClassId = 0;
            this.vehicleSubClassName = string.Empty;
            this.vehicleAvcClassId = 0;
            this.vehicleAvcClassName = string.Empty;
            this.transactionTypeId = 0;
            this.transactionTypeName = string.Empty;
            this.paymentTypeId = 0;
            this.paymentTypeName = string.Empty;
            this.exemptTypeId = 0;
            this.exemptTypeName = string.Empty;
            this.exemptSubTypeId = 0;
            this.exemptSubTypeName = string.Empty;
            this.smartCardNumber = string.Empty;
            this.receiptNumber = string.Empty;
            this.tagClassId = 0;
            this.tagClassName = string.Empty;
            this.tagPlateNumber = string.Empty;
            this.tagId = string.Empty;
            this.tagEpc = string.Empty;
            this.tagReadDateTime = DateTime.Now;
            this.tagReadDateTimeStamp = string.Empty;
            this.tagReadBy = 0;
            this.permissibleVehicleWeight = 0;
            this.actualVehicleWeight = 0;
            this.overWeightAmount = 0;
            this.tagPenaltyAmount = 0;
            this.transactionAmount = 0;
            this.transactionDateTime = DateTime.MinValue;
            this.transactionDateTimeStamp = string.Empty;
            this.transactionFrontImage = string.Empty;
            this.transactionBackImage = string.Empty;
            this.transactionAvcImage = string.Empty;
            this.transactionVideo = string.Empty;
            this.exemptionProofImage = string.Empty;
            this.destinationPlazaId = 0;
            this.destinationPlazaName = string.Empty;
            this.userId = 0;
            this.loginId = string.Empty;
            this.returnJourney = false;
            this.excessJourney = false;
            this.barrierAutoClose = false;
            this.towVehicle = false;
            this.fleetTranscation = false;
            this.fleetCount = 0;
            this.transactionStatus = false;
            this.reveiwedRequired = false;
            this.reveiwedStatus = false;
            this.receivedDateTime = DateTime.MinValue;
        }
        public long MasterTransactionId
        {
            get => masterTransactionId; set => masterTransactionId = value;
        }
        public long PlazaTransactionId
        {
            get => plazaTransactionId; set => plazaTransactionId = value;
        }
        public long LaneTransactionId
        {
            get => laneTransactionId; set => laneTransactionId = value;
        }
        public string TransactionNumber
        {
            get => transactionNumber; set => transactionNumber = value;
        }
        public short SystemIntegratorId
        {
            get => systemIntegratorId; set => systemIntegratorId = value;
        }
        public string SystemIntegratorName
        {
            get => systemIntegratorName; set => systemIntegratorName = value;
        }
        public short JourneyId
        {
            get => journeyId; set => journeyId = value;
        }
        public string JourneyName
        {
            get => journeyName; set => journeyName = value;
        }
        public short PlazaId
        {
            get => plazaId; set => plazaId = value;
        }
        public string PlazaName
        {
            get => plazaName; set => plazaName = value;
        }
        public short LaneId
        {
            get => laneId; set => laneId = value;
        }
        public string LaneNumber
        {
            get => laneNumber; set => laneNumber = value;
        }
        public short LaneTypeId
        {
            get => laneTypeId; set => laneTypeId = value;
        }
        public string LaneTypeName
        {
            get => laneTypeName; set => laneTypeName = value;
        }
        public bool LaneStatusId
        {
            get => laneStatusId; set => laneStatusId = value;
        }
        public short LaneDirectionId
        {
            get => laneDirectionId; set => laneDirectionId = value;
        }
        public string LaneDirectionName
        {
            get => laneDirectionName; set => laneDirectionName = value;
        }
        public short ShiftId
        {
            get => shiftId; set => shiftId = value;
        }
        public string ShiftNumber
        {
            get => shiftNumber; set => shiftNumber = value;
        }
        public string PlateNumber
        {
            get => plateNumber; set => plateNumber = value;
        }
        public short VehicleClassId
        {
            get => vehicleClassId; set => vehicleClassId = value;
        }
        
        public string VehicleClassName
        {
            get => vehicleClassName; set => vehicleClassName = value;
        }

        public short VehicleSubClassId
        {
            get => vehicleSubClassId; set => vehicleSubClassId = value;
        }
        public string VehicleSubClassName
        {
            get => vehicleSubClassName; set => vehicleSubClassName = value;
        }
        public short VehicleAvcClassId
        {
            get => vehicleAvcClassId; set => vehicleAvcClassId = value;
        }
        public string VehicleAvcClassName
        {
            get => vehicleAvcClassName; set => vehicleAvcClassName = value;
        }
        public short TransactionTypeId
        {
            get => transactionTypeId; set => transactionTypeId = value;
        }
        public string TransactionTypeName
        {
            get => transactionTypeName; set => transactionTypeName = value;
        }
        public short PaymentTypeId
        {
            get => paymentTypeId; set => paymentTypeId = value;
        }
        public string PaymentTypeName
        {
            get => paymentTypeName; set => paymentTypeName = value;
        }
        public short ExemptTypeId
        {
            get => exemptTypeId; set => exemptTypeId = value;
        }
        public string ExemptTypeName
        {
            get => exemptTypeName; set => exemptTypeName = value;
        }
        public short ExemptSubTypeId
        {
            get => exemptSubTypeId; set => exemptSubTypeId = value;
        }
        public string ExemptSubTypeName
        {
            get => exemptSubTypeName; set => exemptSubTypeName = value;
        }
        public string SmartCardNumber
        {
            get => smartCardNumber; set => smartCardNumber = value;
        }
        public short TagClassId
        {
            get => tagClassId; set => tagClassId = value;
        }
        public string TagClassName
        {
            get => tagClassName; set => tagClassName = value;
        }
        public string TagPlateNumber
        {
            get => tagPlateNumber; set => tagPlateNumber = value;
        }
        public string TagId
        {
            get => tagId; set => tagId = value;
        }
        public string TagEPC
        {
            get => tagEpc; set => tagEpc = value;
        }
        public DateTime TagReadDateTime
        {
            get => tagReadDateTime; set => tagReadDateTime = value;
        }
        public string TagReadDateTimeStamp
        {
            get => tagReadDateTimeStamp; set => tagReadDateTimeStamp = value;
        }
        public short TagReadBy
        {
            get => tagReadBy; set => tagReadBy = value;
        }
        public decimal PermissibleVehicleWeight
        {
            get => permissibleVehicleWeight; set => permissibleVehicleWeight = value;
        }
        public decimal ActualVehicleWeight
        {
            get => actualVehicleWeight; set => actualVehicleWeight = value;
        }
        public decimal OverWeightAmount
        {
            get => overWeightAmount; set => overWeightAmount = value;
        }
        public decimal TagPenaltyAmount
        {
            get => tagPenaltyAmount; set => tagPenaltyAmount = value;
        }
        public decimal TransactionAmount
        {
            get => transactionAmount; set => transactionAmount = value;
        }
        public DateTime TransactionDateTime
        {
            get => transactionDateTime; set => transactionDateTime = value;
        }
        public string TransactionDateTimeStamp
        {
            get => transactionDateTimeStamp; set => transactionDateTimeStamp = value;
        }
        public string TransactionFrontImage
        {
            get => transactionFrontImage; set => transactionFrontImage = value;
        }
        public string TransactionBackImage
        {
            get => transactionBackImage; set => transactionBackImage = value;
        }
        public string TransactionAvcImage
        {
            get => transactionAvcImage; set => transactionAvcImage = value;
        }
        public string TransactionVideo
        {
            get => transactionVideo; set => transactionVideo = value;
        }
        public string ExemptionProofImage
        {
            get => exemptionProofImage; set => exemptionProofImage = value;
        }
        public short DestinationPlazaId
        {
            get => destinationPlazaId; set => destinationPlazaId = value;
        }
        public string DestinationPlazaName
        {
            get => destinationPlazaName; set => destinationPlazaName = value;
        }
        public long UserId
        {
            get => userId; set => userId = value;
        }
        public string LoginId
        {
            get => loginId; set => loginId = value;
        }
        public bool ReturnJourney
        {
            get => returnJourney; set => returnJourney = value;
        }
        public bool ExcessJourney
        {
            get => excessJourney; set => excessJourney = value;
        }
        public bool BarrierAutoClose
        {
            get => barrierAutoClose; set => barrierAutoClose = value;
        }
        public bool TowVehicle
        {
            get => towVehicle; set => towVehicle = value;
        }
        public bool FleetTranscation
        {
            get => fleetTranscation; set => fleetTranscation = value;
        }
        public short FleetCount
        {
            get => fleetCount; set => fleetCount = value;
        }
        public bool TransactionStatus
        {
            get => transactionStatus; set => transactionStatus = value;
        }
        public bool ReveiwedRequired
        {
            get => reveiwedRequired; set => reveiwedRequired = value;
        }
        public bool ReveiwedStatus
        {
            get => reveiwedStatus; set => reveiwedStatus = value;
        }
        public DateTime ReceivedDateTime
        {
            get => receivedDateTime; set => receivedDateTime = value;
        }
        public string ReceiptNumber
        {
            get => receiptNumber; set => receiptNumber = value;
        }
    }
}
