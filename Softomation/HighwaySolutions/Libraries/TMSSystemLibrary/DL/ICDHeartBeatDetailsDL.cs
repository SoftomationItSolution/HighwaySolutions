using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class ICDHeartBeatDetailsDL
    {
        #region Global Varialble
        static string tableName = "tbl_ICDRequestHeartBeatDetail";
        #endregion

        internal static List<ResponseIL> Insert(ICDHeartBeatDetailsIL ed)
        {
            List<ResponseIL> responses = null;

            try
            {
                string spName = "USP_ICDHeartBeatIResponseInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageId", DbType.String, ed.MessageId, ParameterDirection.Input, 35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@OrganizationId", DbType.String, ed.OrganizationId, ParameterDirection.Input, 4));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionHeadDatetime", DbType.DateTime, ed.TransactionHeadDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ApiVersion", DbType.String, ed.ApiVersion, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionId", DbType.String, ed.TransactionId, ParameterDirection.Input, 22));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionNote", DbType.String, ed.Note, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionOrganizationId", DbType.String, ed.OrgTransactionId, ParameterDirection.Input, 36));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionReferenceId", DbType.String, ed.RefId, ParameterDirection.Input, 35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionReferenceURL", DbType.String, ed.RefUrl, ParameterDirection.Input, 35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionDateTime", DbType.DateTime, ed.TransactionDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionType", DbType.String, ed.OrgTransactionId, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ResponseResult", DbType.String, ed.ResponseResult, ParameterDirection.Input, 10));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ResponseTime", DbType.DateTime, ed.ResponseDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionErrorCode", DbType.Int32, ed.AcquirerId, ParameterDirection.Input));
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
