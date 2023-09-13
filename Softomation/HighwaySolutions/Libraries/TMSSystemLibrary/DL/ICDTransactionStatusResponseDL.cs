using System;
using System.Text;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;


namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class ICDTransactionStatusResponseDL
    {
        #region Global Varialble
        static string tableName = "tbl_ICDTransactionStatus";
        #endregion

        internal static List<ResponseIL> Insert(ICDTransactionStatusResponseIL ed)
        {
            List<ResponseIL> responses = null;

            try
            {
                string SessionId = CommonLibrary.Constants.RandomString(10);
                DataTable ImportDataTable = new DataTable();
                ImportDataTable.Clear();
                ImportDataTable.Columns.Add("TransactionErrorCode");
                ImportDataTable.Columns.Add("TransactionStatus");
                ImportDataTable.Columns.Add("TransactionReaderTime");
                ImportDataTable.Columns.Add("TransactionType");
                ImportDataTable.Columns.Add("TransactionReceivedTime");
                ImportDataTable.Columns.Add("TransactionFare");
                ImportDataTable.Columns.Add("TransactionVehicleClass");
                ImportDataTable.Columns.Add("TransactionRegistrationNumber");
                ImportDataTable.Columns.Add("SessionId");
                DataRow row;
                StringBuilder xmlPermission = new StringBuilder();
                foreach (CheckTransactionStatus item in ed.TransactionList)
                {
                    row = ImportDataTable.NewRow();
                    row["TransactionErrorCode"] = item.TransactionErrorCode;
                    row["TransactionStatus"] = item.TransactionStatus;
                    row["TransactionReaderTime"] = item.TransactionReaderTime;
                    row["TransactionType"] = item.TransactionType;
                    row["TransactionReceivedTime"] = item.TransactionReceivedTime;
                    row["TransactionFare"] = item.TransactionFare;
                    row["TransactionVehicleClass"] = item.TransactionVehicleClass;
                    row["TransactionRegistrationNumber"] = item.TransactionRegistrationNumber;
                    row["SessionId"] = SessionId;
                    ImportDataTable.Rows.Add(row);
                }
                SystemConstants.BulkCopy(ImportDataTable, "temp_ICDTransactionStatusDetails");
                string spName = "USP_ICDTransactionStatusInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CCHTransactionId", DbType.String, ed.CCHTransactionId, ParameterDirection.Input, 22));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionMessageId", DbType.String, ed.TransactionMessageId, ParameterDirection.Input, 35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionApiCallDatetime", DbType.DateTime, ed.TransactionApiCallDatetime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionApiVersion", DbType.String, ed.TransactionApiVersion, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionId", DbType.String, ed.TransactionId, ParameterDirection.Input, 35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionOrganizationId", DbType.String, ed.TransactionOrganizationId, ParameterDirection.Input, 6));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionNote", DbType.String, ed.TransactionNote, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionReferenceId", DbType.String, ed.TransactionReferenceId, ParameterDirection.Input, 35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionReferenceURL", DbType.String, ed.TransactionReferenceURL, ParameterDirection.Input, 35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionDateTime", DbType.DateTime, ed.TransactionDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionType", DbType.String, ed.TransactionType, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@OrganizationTransactionId", DbType.String, ed.OrganizationTransactionId, ParameterDirection.Input, 36));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionPlazaId", DbType.String, ed.TransactionPlazaId, ParameterDirection.Input, 6));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionLaneId", DbType.String, ed.TransactionLaneId, ParameterDirection.Input, 3));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionResponseTime", DbType.DateTime, ed.TransactionResponseTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionResult", DbType.String, ed.TransactionResult, ParameterDirection.Input, 10));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionResponseCode", DbType.Int32, ed.TransactionResponseCode, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionTotalRequestCount", DbType.Int32, ed.TransactionTotalRequestCount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionSuccessRequestCount", DbType.Int32, ed.TransactionSuccessRequestCount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionSettlementDate", DbType.DateTime, ed.TransactionSettlementDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SessionId", DbType.String, SessionId, ParameterDirection.Input, 10));
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
