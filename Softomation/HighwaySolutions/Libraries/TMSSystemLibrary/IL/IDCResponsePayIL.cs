using System;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class IDCResponsePayIL
    {
        string msgId;
        string plateNumber;
        string id;
        string transcationId;
        string cchTranscationId;
        string respPayId;
        string note;
        string rfidTranscation;
        string refUrlTranscation;
        string dateTimeTransction;
        string transctionType;
        string orgId;
        string transctionLibility;
        string plazaID;
        string responseCode;
        string responseResult;
        DateTime responseDateTime;
        string responseFareType;
        string refTollfare;
        string refApprovalNumber;
        string refErrorCode;
        string refSettCurrency;
        string refURL;
        string tagId;
        string tid;
        string vehicleClass;
        string vehicleNumber;
        string vehicleId;
        string isComvehicle;
        string filePath;
        string saveLoc;
        string version;
        string orgTxnId;
        string respId;
        DateTime transctionDateTime;
        bool isResponseFileSuccess;
        string vehicleRespId;
        string vehicleDetailID;
        string vehicleDetailsID;
        string detailName;
        string detailVehicleDetailsId;
        string detailName1;
        string detailVehicleDetailsId1;
        string detailName2;
        string detailVehicleDetailsId2;
        string refApprovalNum;
        string refErrcode;
        string refRespId;
        public IDCResponsePayIL()
        {
            msgId=string.Empty;
            id = string.Empty;
            transcationId = string.Empty;
            cchTranscationId = string.Empty;
            note = string.Empty;
            rfidTranscation = string.Empty;
            refUrlTranscation = string.Empty;
            dateTimeTransction = string.Empty;
            transctionType = string.Empty;
            orgId = string.Empty;
            transctionLibility = string.Empty;
            plazaID = string.Empty;
            responseCode = string.Empty;
            responseResult = string.Empty;
            responseDateTime = DateTime.Now;
            responseFareType = string.Empty;
            refTollfare = string.Empty;
            refApprovalNumber = string.Empty;
            refErrorCode = string.Empty;
            refSettCurrency = string.Empty;
            tagId = string.Empty;
            tid = string.Empty;
            vehicleClass = string.Empty;
            vehicleNumber = string.Empty;
            isComvehicle = string.Empty;
            filePath = string.Empty;
            saveLoc = string.Empty;
            isResponseFileSuccess=false;
            version = string.Empty;
            orgTxnId = string.Empty;
            vehicleId = string.Empty;
            refURL = string.Empty;
        }

        public String MsgId
        {
            get
            {
                return msgId;
            }

            set
            {
                msgId = value;
            }
        }
        public String ID
        {
            get
            {
                return id;
            }

            set
            {
                id = value;
            }
        }
        public String TranscationId
        {
            get
            {
                return transcationId;
            }

            set
            {
                transcationId = value;
            }
        }

        public String CCHTrasactionId
        {
            get
            {
                return cchTranscationId;
            }

            set
            {
                cchTranscationId = value;
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

        public String RFIDTranscation
        {
            get
            {
                return rfidTranscation;
            }

            set
            {
                rfidTranscation = value;
            }
        }

        public String TransactionRefUrl
        {
            get
            {
                return refUrlTranscation;
            }

            set
            {
                refUrlTranscation = value;
            }
        }

        public String DateTimeTransction
        {
            get
            {
                return dateTimeTransction;
            }

            set
            {
                dateTimeTransction = value;
            }
        }

        public String TransactionType
        {
            get
            {
                return transctionType;
            }

            set
            {
                transctionType = value;
            }
        }

        public String OrgId
        {
            get
            {
                return orgId;
            }

            set
            {
                orgId = value;
            }
        }

        public String TransactionLiability
        {
            get
            {
                return transctionLibility;
            }

            set
            {
                transctionLibility = value;
            }
        }

        public String PlazaId
        {
            get
            {
                return plazaID;
            }

            set
            {
                plazaID = value;
            }
        }

        public String ResponseCode
        {
            get
            {
                return responseCode;
            }

            set
            {
                responseCode = value;
            }
        }

        public String ResponseResult
        {
            get
            {
                return responseResult;
            }

            set
            {
                responseResult = value;
            }
        }

        public DateTime ResponseDateTime
        {
            get
            {
                return responseDateTime;
            }

            set
            {
                responseDateTime = value;
            }
        }

        public String ResponseFareType
        {
            get
            {
                return responseFareType;
            }

            set
            {
                responseFareType = value;
            }
        }

        public String RefTollfare
        {
            get
            {
                return refTollfare;
            }

            set
            {
                refTollfare = value;
            }
        }

        public String RefApprovalNumber
        {
            get
            {
                return refApprovalNumber;
            }

            set
            {
                refApprovalNumber = value;
            }
        }

        public String RefErrorCode
        {
            get
            {
                return refErrorCode;
            }

            set
            {
                refErrorCode = value;
            }
        }

        public String RefSettCurrency
        {
            get
            {
                return refSettCurrency;
            }

            set
            {
                refSettCurrency = value;
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

        public String VehicleClass
        {
            get
            {
                return vehicleClass;
            }

            set
            {
                vehicleClass = value;
            }
        }

        public String VehicleNumber
        {
            get
            {
                return vehicleNumber;
            }

            set
            {
                vehicleNumber = value;
            }
        }

        public String IsComvehicle
        {
            get
            {
                return isComvehicle;
            }

            set
            {
                isComvehicle = value;
            }
        }

        public String FilePath
        {
            get
            {
                return filePath;
            }

            set
            {
                filePath = value;
            }
        }

        public String SaveLoc
        {
            get
            {
                return saveLoc;
            }

            set
            {
                saveLoc = value;
            }
        }

        public Boolean IsResponseFileSuccess
        {
            get
            {
                return isResponseFileSuccess;
            }

            set
            {
                isResponseFileSuccess = value;
            }
        }

        public String Version
        {
            get
            {
                return version;
            }

            set
            {
                version = value;
            }
        }

        public String OrgTxnId
        {
            get
            {
                return orgTxnId;
            }

            set
            {
                orgTxnId = value;
            }
        }

        public String RefURL
        {
            get
            {
                return refURL;
            }

            set
            {
                refURL = value;
            }
        }

        public String RespPayId
        {
            get
            {
                return respPayId;
            }

            set
            {
                respPayId = value;
            }
        }

        public DateTime TransctionDateTime
        {
            get
            {
                return transctionDateTime;
            }

            set
            {
                transctionDateTime = value;
            }
        }

        public String RespId
        {
            get
            {
                return respId;
            }

            set
            {
                respId = value;
            }
        }

        public String VehicleId
        {
            get
            {
                return vehicleId;
            }

            set
            {
                vehicleId = value;
            }
        }

        public String VehicleRespId
        {
            get
            {
                return vehicleRespId;
            }

            set
            {
                vehicleRespId = value;
            }
        }

        public String VehicleDetailID
        {
            get
            {
                return vehicleDetailID;
            }

            set
            {
                vehicleDetailID = value;
            }
        }

        public String VehicleDetailsID
        {
            get
            {
                return vehicleDetailsID;
            }

            set
            {
                vehicleDetailsID = value;
            }
        }

        public String DetailName
        {
            get
            {
                return detailName;
            }

            set
            {
                detailName = value;
            }
        }

        public String DetailVehicleDetailsId
        {
            get
            {
                return detailVehicleDetailsId;
            }

            set
            {
                detailVehicleDetailsId = value;
            }
        }

        public String DetailName1
        {
            get
            {
                return detailName1;
            }

            set
            {
                detailName1 = value;
            }
        }

        public String DetailVehicleDetailsId1
        {
            get
            {
                return detailVehicleDetailsId1;
            }

            set
            {
                detailVehicleDetailsId1 = value;
            }
        }

        public String DetailName2
        {
            get
            {
                return detailName2;
            }

            set
            {
                detailName2 = value;
            }
        }

        public String DetailVehicleDetailsId2
        {
            get
            {
                return detailVehicleDetailsId2;
            }

            set
            {
                detailVehicleDetailsId2 = value;
            }
        }

        public String RefApprovalNum
        {
            get
            {
                return refApprovalNum;
            }

            set
            {
                refApprovalNum = value;
            }
        }

        public String RefErrcode
        {
            get
            {
                return refErrcode;
            }

            set
            {
                refErrcode = value;
            }
        }

        public String RefRespId
        {
            get
            {
                return refRespId;
            }

            set
            {
                refRespId = value;
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

        
    }
}
