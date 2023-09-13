using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class ICDPaymentResponseDL
    {
        #region Global Varialble
       
        static string tableName = "tbl_CCHTollReconciliationDetailRecordICD";
        #endregion

        internal static List<ResponseIL> Insert(ICDPaymentResponseIL ed)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_ICDResponsePayInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TagId", DbType.String, ed.TagId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehicleClass", DbType.String, ed.VehicleClass, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlateNumber", DbType.String, ed.PlateNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CCHTrasactionId", DbType.String, ed.CCHTrasactionId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MsgID", DbType.String, ed.MsgId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Note", DbType.String, ed.Note, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionRefID", DbType.String, ed.RFIDTranscation, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionRefUrl", DbType.String, ed.TransactionRefUrl, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryReaderTxndatetime", DbType.String, ed.DateTimeTransction, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionType", DbType.String, ed.TransactionType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@OrgTxnId", DbType.String, ed.OrgTxnId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionLiability", DbType.String, ed.TransactionLiability, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryTransaction_Id", DbType.String, ed.TranscationId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryTransaction_DateTime", DbType.String, ed.DateTimeTransction, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryTransactionType", DbType.String, ed.TransactionType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.String, ed.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Response_Code", DbType.String, ed.ResponseCode, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Result", DbType.String, ed.ResponseResult, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Response_datetime", DbType.String, ed.ResponseDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FareType", DbType.String, ed.ResponseFareType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TollFare", DbType.String, ed.RefTollfare, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ApprovalRefNumber", DbType.String, ed.RefApprovalNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ErrorCode", DbType.String, ed.RefErrorCode, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SettlementCurrency", DbType.String, ed.RefSettCurrency, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TID", DbType.String, ed.TID, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IsComVehicle", DbType.String, ed.IsComvehicle, ParameterDirection.Input));
                DataTable dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responses = ResponseIL.ConvertResponseList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
        }
    }
}
