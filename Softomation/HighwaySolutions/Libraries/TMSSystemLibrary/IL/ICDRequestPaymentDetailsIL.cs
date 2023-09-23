using System;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class ICDRequestPaymentDetailsIL : ICDCommonIL
    {
        long requestPaymentId;
        long plazaTransactionId;
        string orgTransactionId;
        string note;
        string refId;
        string refUrl;
        short icdTransactionTypeId;
        string icdTransactionTypeName;
        DateTime tagReadDateTime;
        Int16 plazaId;
        Int16 laneId;
        Int16 laneStatusId;
        string laneStatusName;
        ICDPlazaDetailsIL plazaDetail;
        ICDLaneDetailsIL laneDetail;
        string publicKeyCVV;
        string procRestrictionResult;
        short signAuthId;
        string signAuthName;
        short tagVerifiedId;
        string tagVerifiedName;
        long transactionCounter;
        short transactionStatusId;
        string transactionStatusName;
        short vehicleAuthId;
        string vehicleAuthName;
        string tagId;
        string tagVRN;
        string tagClass;
        string tid;
        int staticWeight;
        int wimWeight;
        string avcClass;
        string licensePlateNumber;
        string requestCurrency;
        Decimal tollAmount;
        short priceModeId;
        string priceModeName;
        short paymentModeId;
        string paymentModeName;
        bool isOverWeightCharged;
        Decimal overWeightAmount;
        Int16 fareTypeId;
        string fareTypeName;
        string transactionLiability;
        string approvalNummber;
        decimal responseTollFare;
        bool isCommercialVehicle;

        public ICDRequestPaymentDetailsIL()
        {
            requestPaymentId = 0;
            plazaTransactionId = 0;
            orgTransactionId = string.Empty;
            note = string.Empty;
            refId = string.Empty;
            refUrl = string.Empty;
            icdTransactionTypeId = 0;
            icdTransactionTypeName = string.Empty;
            tagReadDateTime = DateTime.Now;
            plazaId = 0;
            laneId = 0;
            laneStatusId = 0;
            laneStatusName = string.Empty;
            plazaDetail = new ICDPlazaDetailsIL();
            laneDetail = new ICDLaneDetailsIL();
            publicKeyCVV = string.Empty;
            procRestrictionResult = string.Empty;
            signAuthId = 0;
            signAuthName = string.Empty;
            tagVerifiedId = 0;
            tagVerifiedName = string.Empty;
            transactionCounter = 0;
            transactionStatusId = 0;
            transactionStatusName = string.Empty;
            vehicleAuthId = 0;
            vehicleAuthName = string.Empty;
            tagId = string.Empty;
            tagVRN = string.Empty;
            tagClass = string.Empty;
            tid = string.Empty;
            staticWeight = 0;
            wimWeight = 0;
            avcClass = string.Empty;
            licensePlateNumber = string.Empty;
            requestCurrency = "INR";
            tollAmount = 0;
            priceModeId = 0;
            priceModeName = string.Empty;
            isOverWeightCharged = false;
            paymentModeId = 0;
            paymentModeName = string.Empty;
            overWeightAmount = 0;
            fareTypeId = 0;
            fareTypeName = string.Empty;
            transactionLiability = string.Empty;
            approvalNummber = string.Empty;
            responseTollFare = 0;
            isCommercialVehicle = false;
        }

        public Int64 RequestPaymentId
        {
            get
            {
                return requestPaymentId;
            }

            set
            {
                requestPaymentId = value;
            }
        }
        public Int64 PlazaTransactionId
        {
            get
            {
                return plazaTransactionId;
            }

            set
            {
                plazaTransactionId = value;
            }
        }
        public String OrgTransactionId
        {
            get
            {
                return orgTransactionId;
            }

            set
            {
                orgTransactionId = value;
            }
        }
        public String Note
        {
            get
            {
                return note;
            }

            set
            {
                note = value;
            }
        }
        public String RefId
        {
            get
            {
                return refId;
            }

            set
            {
                refId = value;
            }
        }
        public String RefUrl
        {
            get
            {
                return refUrl;
            }

            set
            {
                refUrl = value;
            }
        }
        public Int16 ICDTransactionTypeId
        {
            get
            {
                return icdTransactionTypeId;
            }

            set
            {
                icdTransactionTypeId = value;
            }
        }
        public String ICDTransactionTypeName
        {
            get
            {
                return icdTransactionTypeName;
            }

            set
            {
                icdTransactionTypeName = value;
            }
        }
        public DateTime TagReadDateTime
        {
            get
            {
                return tagReadDateTime;
            }

            set
            {
                tagReadDateTime = value;
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
        public Int16 LaneStatusId
        {
            get
            {
                return laneStatusId;
            }

            set
            {
                laneStatusId = value;
            }
        }
        public String LaneStatusName
        {
            get
            {
                return laneStatusName;
            }

            set
            {
                laneStatusName = value;
            }
        }
        public ICDPlazaDetailsIL PlazaDetail
        {
            get
            {
                return plazaDetail;
            }

            set
            {
                plazaDetail = value;
            }
        }
        public ICDLaneDetailsIL LaneDetail
        {
            get
            {
                return laneDetail;
            }

            set
            {
                laneDetail = value;
            }
        }
        public String PublicKeyCVV
        {
            get
            {
                return publicKeyCVV;
            }

            set
            {
                publicKeyCVV = value;
            }
        }
        public String ProcRestrictionResult
        {
            get
            {
                return procRestrictionResult;
            }

            set
            {
                procRestrictionResult = value;
            }
        }
        public Int16 SignAuthId
        {
            get
            {
                return signAuthId;
            }

            set
            {
                signAuthId = value;
            }
        }
        public String SignAuthName
        {
            get
            {
                return signAuthName;
            }

            set
            {
                signAuthName = value;
            }
        }
        public Int16 TagVerifiedId
        {
            get
            {
                return tagVerifiedId;
            }

            set
            {
                tagVerifiedId = value;
            }
        }
        public String TagVerifiedName
        {
            get
            {
                return tagVerifiedName;
            }

            set
            {
                tagVerifiedName = value;
            }
        }
        public Int64 TransactionCounter
        {
            get
            {
                return transactionCounter;
            }

            set
            {
                transactionCounter = value;
            }
        }
        public Int16 TransactionStatusId
        {
            get
            {
                return transactionStatusId;
            }

            set
            {
                transactionStatusId = value;
            }
        }
        public String TransactionStatusName
        {
            get
            {
                return transactionStatusName;
            }

            set
            {
                transactionStatusName = value;
            }
        }
        public Int16 VehicleAuthId
        {
            get
            {
                return vehicleAuthId;
            }

            set
            {
                vehicleAuthId = value;
            }
        }
        public String VehicleAuthName
        {
            get
            {
                return vehicleAuthName;
            }

            set
            {
                vehicleAuthName = value;
            }
        }
        public String TagId
        {
            get
            {
                return tagId;
            }

            set
            {
                tagId = value;
            }
        }
        public String TagVRN
        {
            get
            {
                return tagVRN;
            }

            set
            {
                tagVRN = value;
            }
        }
        public String TagClass
        {
            get
            {
                return tagClass;
            }

            set
            {
                tagClass = value;
            }
        }
        public String TID
        {
            get
            {
                return tid;
            }

            set
            {
                tid = value;
            }
        }
        public Int32 StaticWeight
        {
            get
            {
                return staticWeight;
            }

            set
            {
                staticWeight = value;
            }
        }
        public Int32 WimWeight
        {
            get
            {
                return wimWeight;
            }

            set
            {
                wimWeight = value;
            }
        }
        public String AvcClass
        {
            get
            {
                return avcClass;
            }

            set
            {
                avcClass = value;
            }
        }
        public String LicensePlateNumber
        {
            get
            {
                return licensePlateNumber;
            }

            set
            {
                licensePlateNumber = value;
            }
        }
        public String RequestCurrency
        {
            get
            {
                return requestCurrency;
            }

            set
            {
                requestCurrency = value;
            }
        }
        public Decimal TollAmount
        {
            get
            {
                return tollAmount;
            }

            set
            {
                tollAmount = value;
            }
        }
        public Int16 PriceModeId
        {
            get
            {
                return priceModeId;
            }

            set
            {
                priceModeId = value;
            }
        }
        public String PriceModeName
        {
            get
            {
                return priceModeName;
            }

            set
            {
                priceModeName = value;
            }
        }
        public Int16 PaymentModeId
        {
            get
            {
                return paymentModeId;
            }

            set
            {
                paymentModeId = value;
            }
        }
        public String PaymentModeName
        {
            get
            {
                return paymentModeName;
            }

            set
            {
                paymentModeName = value;
            }
        }
        public Boolean IsOverWeightCharged
        {
            get
            {
                return isOverWeightCharged;
            }

            set
            {
                isOverWeightCharged = value;
            }
        }
        public Decimal OverwightAmount
        {
            get
            {
                return overWeightAmount;
            }

            set
            {
                overWeightAmount = value;
            }
        }
        public Int16 FareTypeId
        {
            get
            {
                return fareTypeId;
            }

            set
            {
                fareTypeId = value;
            }
        }
        public String FareTypeName
        {
            get
            {
                return fareTypeName;
            }

            set
            {
                fareTypeName = value;
            }
        }
        public String TransactionLiability
        {
            get
            {
                return transactionLiability;
            }

            set
            {
                transactionLiability = value;
            }
        }
        public String ApprovalNummber
        {
            get
            {
                return approvalNummber;
            }

            set
            {
                approvalNummber = value;
            }
        }
        public Decimal ResponseTollFare
        {
            get
            {
                return responseTollFare;
            }

            set
            {
                responseTollFare = value;
            }
        }
        public Boolean IsCommercialVehicle
        {
            get
            {
                return isCommercialVehicle;
            }

            set
            {
                isCommercialVehicle = value;
            }
        }

       
    }
}
