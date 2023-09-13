using System;
using System.Text;
using System.Data;
using System.Linq;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;


namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class ICDQueryExceptionResponseDL
    {
        #region Global Varialble
        static string tableName = "tbl_ICDBlackListTagHeader";
        #endregion

        internal static List<ResponseIL> Insert(ICDQueryExceptionResponseIL ed)
        {
            List<ResponseIL> responses = null;

            try
            {
                string SessionId = CommonLibrary.Constants.RandomString(10);
                if (ed.CheckTransactionStatusList != null && ed.CheckTransactionStatusList.Count > 0 && ed.ReadQueryExceptionList != null && ed.ReadQueryExceptionList.Count > 0)
                {
                    DataTable ImportDataTable = new DataTable();
                    ImportDataTable.Clear();
                    ImportDataTable.Columns.Add("ExceptionId");
                    ImportDataTable.Columns.Add("TagId");
                    ImportDataTable.Columns.Add("UpdatedTime");
                    ImportDataTable.Columns.Add("ErrorCode");
                    ImportDataTable.Columns.Add("OP");
                    ImportDataTable.Columns.Add("Description");
                    ImportDataTable.Columns.Add("SessionId");


                    var query = from e in ed.ReadQueryExceptionList
                                join d in ed.CheckTransactionStatusList on e.ExceptionId equals d.ExceptionId
                                select new {
                                    e.ExceptionId,
                                    d.TagId,
                                    d.UpdatedTime,
                                    e.ErrorCode,
                                    d.Operation,
                                    e.Description
                                };
                    DataRow row;
                    
                    foreach (var item in query)
                    {
                        row = ImportDataTable.NewRow();
                        row["ExceptionId"] = item.ExceptionId;
                        row["TagId"] = item.TagId;
                        row["UpdatedTime"] = item.UpdatedTime;
                        row["ErrorCode"] = item.ErrorCode;
                        row["Operation"] = item.Operation;
                        row["Description"] = item.Description;
                        row["SessionId"] = SessionId;
                        ImportDataTable.Rows.Add(row);
                    }
                    SystemConstants.BulkCopy(ImportDataTable, "temp_ICDDiffDetails");
                }
                string spName = "USP_IDCAddOrRemoveBlackList";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageId", DbType.String, ed.MessageId, ParameterDirection.Input, 35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@OrganizationId", DbType.String, ed.OrganizationId, ParameterDirection.Input, 4));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ApiVersion", DbType.String, ed.ApiVersion, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionHeadDateTime", DbType.DateTime, ed.TransactionHeadDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionId", DbType.String, ed.TransactionId, ParameterDirection.Input, 22));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Note", DbType.String, ed.Note, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@OrganizationTransactionId", DbType.String, ed.OrganizationTransactionId, ParameterDirection.Input, 36));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionReferanceId", DbType.String, ed.TransactionReferanceId, ParameterDirection.Input, 35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionReferanceUrl", DbType.String, ed.TransactionReferanceUrl, ParameterDirection.Input, 35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionDateTime", DbType.DateTime, ed.TransactionDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionType", DbType.String, ed.TransactionType, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ResponseMessageNumber", DbType.Int32, ed.ResponseMessageNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ResponseCode", DbType.Int32, ed.ResponseCode, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ResponseResult", DbType.String, ed.ResponseResult, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SuccessRequestCount", DbType.Int32, ed.SuccessRequestCount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ResponseTotalRequestCount", DbType.Int32, ed.ResponseTotalRequestCount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ResponseTotalMessage", DbType.Int32, ed.ResponseTotalMessage, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TotalTagsInMessage", DbType.Int32, ed.TotalTagsInMessage, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TotalTagsInResponse", DbType.Int32, ed.TotalTagsInResponse, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ResponseTime", DbType.DateTime, ed.ResponseTime, ParameterDirection.Input));
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
