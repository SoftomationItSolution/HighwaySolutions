using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;


namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class ICDRequestPaymentDetailsDL
    {
        #region Global Varialble
        static string tableName = "tbl_ICDRequestPayDetail";
        #endregion

        internal static List<ResponseIL> RequestProcess(ICDRequestPaymentDetailsIL ed)
        {
            List<ResponseIL> responses = null;

            try
            {
                string spName = "USP_ICDRequestPayDetailsRequest";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RequestPaymentId", DbType.Int64, ed.RequestPaymentId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaTransactionId", DbType.Int64, ed.PlazaTransactionId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ICDTransactionId", DbType.String, ed.ICDTransactionId, ParameterDirection.Input, 22));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageId", DbType.String, ed.MessageId, ParameterDirection.Input, 35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RequestDateTime", DbType.DateTime, ed.RequestDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@OrgTransactionId", DbType.String, ed.OrgTransactionId, ParameterDirection.Input, 36));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Note", DbType.String, ed.Note, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RefId", DbType.String, ed.RefId, ParameterDirection.Input, 35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RefUrl", DbType.String, ed.RefUrl, ParameterDirection.Input, 35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionDateTime", DbType.DateTime, ed.TransactionDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ICDTransactionTypeId", DbType.Int16, ed.ICDTransactionTypeId, ParameterDirection.Input, 36));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TagReadDateTime", DbType.DateTime, ed.TagReadDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TagReadDateTime", DbType.Int16, ed.TagReadDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, ed.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneId", DbType.Int16, ed.LaneId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneStatusId", DbType.Int16, ed.LaneStatusId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SignAuthId", DbType.Int16, ed.SignAuthId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TagVerifiedId", DbType.Int16, ed.TagVerifiedId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ProcRestrictionResult", DbType.String, ed.ProcRestrictionResult, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehicleAuthId", DbType.Int16, ed.VehicleAuthId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionCounter", DbType.Int64, ed.TransactionCounter, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionStatusId", DbType.Int16, ed.TransactionStatusId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PublicKeyCVV", DbType.String, ed.PublicKeyCVV, ParameterDirection.Input, 32));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TagId", DbType.String, ed.TagId, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TagVRN", DbType.String, ed.TagVRN, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TagClass", DbType.String, ed.TagClass, ParameterDirection.Input, 5));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TID", DbType.String, ed.TID, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@StaticWeight", DbType.Decimal, ed.StaticWeight, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@WimWeight", DbType.Decimal, ed.WimWeight, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AVC", DbType.String, ed.AvcClass, ParameterDirection.Input,5));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LicensePlateNumber", DbType.String, ed.LicensePlateNumber, ParameterDirection.Input,20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RequestCurrency", DbType.String, ed.RequestCurrency, ParameterDirection.Input,5));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TollAmount", DbType.Decimal, ed.TollAmount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PriceModeId", DbType.Int16, ed.PriceModeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IsOverWeightCharged", DbType.Boolean, ed.IsOverWeightCharged, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PaymentModeId", DbType.Int16, ed.PaymentModeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@OverwightAmount", DbType.Decimal, ed.OverwightAmount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ResponseCode", DbType.Int32, ed.ResponseCode, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ResponseResult", DbType.String, ed.ResponseResult, ParameterDirection.Input, 10));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ResponseDateTime", DbType.DateTime, ed.ResponseDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ErrorCode", DbType.Int32, ed.ErrorCode, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FareTypeId", DbType.Int16, ed.FareTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionLiability", DbType.String, ed.TransactionLiability, ParameterDirection.Input,36));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ApprovalNummber", DbType.String, ed.ApprovalNummber, ParameterDirection.Input,4));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ResponseTollFare", DbType.Decimal, ed.ResponseTollFare, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IsCommercialVehicle", DbType.Boolean, ed.IsCommercialVehicle, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RequestStatusId", DbType.Int16, ed.RequestStatusId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IsResponseProcessError", DbType.Boolean, ed.IsResponseProcessError, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageType", DbType.Boolean, ed.MessageType, ParameterDirection.Input));
                DataTable dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responses = ResponseIL.ConvertResponseList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
        }

        internal static List<ICDRequestPaymentDetailsIL> GetPendingRequest()
        {
            DataTable dt = new DataTable();
            List<ICDRequestPaymentDetailsIL> eds = new List<ICDRequestPaymentDetailsIL>();
            try
            {
                string spName = "USP_ICDRequestPayDetailsPendingRequest";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    eds.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return eds;
        }

        #region Helper Methods
        private static ICDRequestPaymentDetailsIL CreateObjectFromDataRow(DataRow dr)
        {
            ICDRequestPaymentDetailsIL ed = new ICDRequestPaymentDetailsIL();

            if (dr["RequestPaymentId"] != DBNull.Value)
                ed.RequestPaymentId = Convert.ToInt64(dr["RequestPaymentId"]);

            if (dr["PlazaTransactionId"] != DBNull.Value)
                ed.PlazaTransactionId = Convert.ToInt64(dr["PlazaTransactionId"]);

            if (dr["MessageId"] != DBNull.Value)
                ed.MessageId = Convert.ToString(dr["MessageId"]);

            if (dr["ICDTransactionId"] != DBNull.Value)
                ed.ICDTransactionId = Convert.ToString(dr["ICDTransactionId"]);

            if (dr["RequestDateTime"] != DBNull.Value)
                ed.RequestDateTime = Convert.ToDateTime(dr["RequestDateTime"]);

            if (dr["Note"] != DBNull.Value)
                ed.Note = Convert.ToString(dr["Note"]);

            if (dr["RefId"] != DBNull.Value)
                ed.RefId = Convert.ToString(dr["RefId"]);

            if (dr["RefUrl"] != DBNull.Value)
                ed.RefUrl = Convert.ToString(dr["RefUrl"]);

            if (dr["TransactionDateTime"] != DBNull.Value)
                ed.TransactionDateTime = Convert.ToDateTime(dr["TransactionDateTime"]);

            if (dr["OrgTransactionId"] != DBNull.Value)
                ed.OrgTransactionId = Convert.ToString(dr["OrgTransactionId"]);

            if (dr["ICDTransactionTypeId"] != DBNull.Value)
                ed.ICDTransactionTypeId = Convert.ToInt16(dr["ICDTransactionTypeId"]);

            if (dr["TagReadDateTime"] != DBNull.Value)
                ed.TagReadDateTime = Convert.ToDateTime(dr["TagReadDateTime"]);

            if (dr["PlazaId"] != DBNull.Value)
                ed.PlazaId = Convert.ToInt16(dr["PlazaId"]);

            if (dr["LaneId"] != DBNull.Value)
                ed.LaneId = Convert.ToInt16(dr["LaneId"]);

            if (dr["LaneStatusId"] != DBNull.Value)
                ed.LaneStatusId = Convert.ToInt16(dr["LaneStatusId"]);

            if (dr["SignAuthId"] != DBNull.Value)
                ed.SignAuthId = Convert.ToInt16(dr["SignAuthId"]);

            if (dr["TagVerifiedId"] != DBNull.Value)
                ed.TagVerifiedId = Convert.ToInt16(dr["TagVerifiedId"]);

            if (dr["ProcRestrictionResult"] != DBNull.Value)
                ed.ProcRestrictionResult = Convert.ToString(dr["ProcRestrictionResult"]);

            if (dr["VehicleAuthId"] != DBNull.Value)
                ed.VehicleAuthId = Convert.ToInt16(dr["VehicleAuthId"]);

            if (dr["TransactionCounter"] != DBNull.Value)
                ed.TransactionCounter = Convert.ToInt64(dr["TransactionCounter"]);

            if (dr["TransactionStatusId"] != DBNull.Value)
                ed.TransactionStatusId = Convert.ToInt16(dr["TransactionStatusId"]);

            if (dr["PublicKeyCVV"] != DBNull.Value)
                ed.PublicKeyCVV = Convert.ToString(dr["PublicKeyCVV"]);

            if (dr["TagId"] != DBNull.Value)
                ed.TagId = Convert.ToString(dr["TagId"]);

            if (dr["TagVRN"] != DBNull.Value)
                ed.TagVRN = Convert.ToString(dr["TagVRN"]);

            if (dr["TagClass"] != DBNull.Value)
                ed.TagClass = Convert.ToString(dr["TagClass"]);

            if (dr["TID"] != DBNull.Value)
                ed.TID = Convert.ToString(dr["TID"]);

            if (dr["StaticWeight"] != DBNull.Value)
                ed.StaticWeight = Convert.ToInt32(dr["StaticWeight"]);

            if (dr["WimWeight"] != DBNull.Value)
                ed.WimWeight = Convert.ToInt32(dr["WimWeight"]);

            if (dr["AVC"] != DBNull.Value)
                ed.AvcClass = Convert.ToString(dr["AVC"]);

            if (dr["LicensePlateNumber"] != DBNull.Value)
                ed.LicensePlateNumber = Convert.ToString(dr["LicensePlateNumber"]);

            if (dr["RequestCurrency"] != DBNull.Value)
                ed.RequestCurrency = Convert.ToString(dr["RequestCurrency"]);

            if (dr["TollAmount"] != DBNull.Value)
                ed.TollAmount = Convert.ToDecimal(dr["TollAmount"]);

            if (dr["PriceModeId"] != DBNull.Value)
                ed.PriceModeId = Convert.ToInt16(dr["PriceModeId"]);

            if (dr["isOverWeightCharged"] != DBNull.Value)
                ed.IsOverWeightCharged = Convert.ToBoolean(dr["isOverWeightCharged"]);

            if (dr["PaymentModeId"] != DBNull.Value)
                ed.PaymentModeId = Convert.ToInt16(dr["PaymentModeId"]);

            if (dr["OverwightAmount"] != DBNull.Value)
                ed.OverwightAmount = Convert.ToDecimal(dr["OverwightAmount"]);

            if (dr["ResponseCode"] != DBNull.Value)
                ed.ResponseCode = Convert.ToInt32(dr["ResponseCode"]);

            if (dr["ResponseResult"] != DBNull.Value)
                ed.ResponseResult = Convert.ToString(dr["ResponseResult"]);

            if (dr["ResponseDateTime"] != DBNull.Value)
                ed.ResponseDateTime = Convert.ToDateTime(dr["ResponseDateTime"]);

            if (dr["FareTypeId"] != DBNull.Value)
                ed.FareTypeId = Convert.ToInt16(dr["FareTypeId"]);

            if (dr["TransactionLiability"] != DBNull.Value)
                ed.TransactionLiability = Convert.ToString(dr["TransactionLiability"]);

            if (dr["ApprovalNummber"] != DBNull.Value)
                ed.ApprovalNummber = Convert.ToString(dr["ApprovalNummber"]);

            if (dr["ResponseTollFare"] != DBNull.Value)
                ed.ResponseTollFare = Convert.ToDecimal(dr["ResponseTollFare"]);

            if (dr["ErrorCode"] != DBNull.Value)
                ed.ErrorCode = Convert.ToInt32(dr["ErrorCode"]);

            if (dr["isCommercialVehicle"] != DBNull.Value)
                ed.IsCommercialVehicle = Convert.ToBoolean(dr["isCommercialVehicle"]);

            if (dr["RequestStatusId"] != DBNull.Value)
                ed.RequestStatusId = Convert.ToInt16(dr["RequestStatusId"]);



            ed.LaneStatusName = Enum.GetName(typeof(SystemConstants.ICDLaneStatusType), (SystemConstants.ICDLaneStatusType)ed.LaneStatusId);
            ed.FareTypeName = Enum.GetName(typeof(SystemConstants.ICDFareType), (SystemConstants.ICDFareType)ed.FareTypeId);
            ed.PaymentModeName = Enum.GetName(typeof(SystemConstants.ICDPaymentModeType), (SystemConstants.ICDPaymentModeType)ed.PaymentModeId);
            ed.PriceModeName = Enum.GetName(typeof(SystemConstants.ICDPriceModeType), (SystemConstants.ICDPriceModeType)ed.PriceModeId);
            ed.TransactionStatusName = Enum.GetName(typeof(SystemConstants.ICDTxnStatusType), (SystemConstants.ICDTxnStatusType)ed.TransactionStatusId);
            ed.VehicleAuthName = Enum.GetName(typeof(SystemConstants.ICDVehicleAuthType), (SystemConstants.ICDVehicleAuthType)ed.VehicleAuthId);
            ed.TagVerifiedName = Enum.GetName(typeof(SystemConstants.ICDTagVerifiedType), (SystemConstants.ICDTagVerifiedType)ed.TagVerifiedId);
            ed.ICDTransactionTypeName = Enum.GetName(typeof(SystemConstants.ICDRequestPayTxnType), (SystemConstants.ICDRequestPayTxnType)ed.ICDTransactionTypeId);
            ed.SignAuthName = Enum.GetName(typeof(SystemConstants.ICDSignAuthType), (SystemConstants.ICDSignAuthType)ed.SignAuthId);
            ed.RequestStatusName = Enum.GetName(typeof(SystemConstants.ICDRequestStatusType), (SystemConstants.ICDRequestStatusType)ed.RequestStatusId);
            ed.VehicleAuthName = ed.VehicleAuthName.Replace("_", " ");
            return ed;
        }
        #endregion
    }
}
