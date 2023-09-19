using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;
namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    public class ICDSyncTimeDetailsDL
    {
        #region Global Varialble

        static string tableName = "tbl_ICDResponseSyncTime";
        #endregion

        internal static List<ResponseIL> RequestProcess(ICDSyncTimeDetailsIL ed)
        {
            List<ResponseIL> responses = null;

            try
            {
                string spName = "USP_ICDSyncTimeRequest";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RequestSyncTimeId", DbType.Int64, ed.RequestSyncTimeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageId", DbType.String, ed.MessageId, ParameterDirection.Input, 35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RequestDateTime", DbType.DateTime, ed.RequestDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@BankServerDateTime", DbType.DateTime, ed.BankServerDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ResponseCode", DbType.Int32, ed.ResponseCode, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ResponseResult", DbType.String, ed.ResponseResult, ParameterDirection.Input, 10));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ResponseDateTime", DbType.DateTime, ed.ResponseDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ErrorCode", DbType.Int32, ed.ErrorCode, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageType", DbType.Boolean, ed.MessageType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RequestStatusId", DbType.Int16, ed.RequestStatusId, ParameterDirection.Input));
                DataTable dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responses = ResponseIL.ConvertResponseList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
        }

        internal static List<ICDSyncTimeDetailsIL> GetPendingRequest()
        {
            DataTable dt = new DataTable();
            List<ICDSyncTimeDetailsIL> eds = new List<ICDSyncTimeDetailsIL>();
            try
            {
                string spName = "USP_ICDSyncTimeDetailPendingRequest";
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
        private static ICDSyncTimeDetailsIL CreateObjectFromDataRow(DataRow dr)
        {
            ICDSyncTimeDetailsIL ed = new ICDSyncTimeDetailsIL();

            if (dr["RequestSyncTimeId"] != DBNull.Value)
                ed.RequestSyncTimeId = Convert.ToInt64(dr["RequestSyncTimeId"]);

            if (dr["MessageId"] != DBNull.Value)
                ed.MessageId = Convert.ToString(dr["MessageId"]);

            if (dr["RequestDateTime"] != DBNull.Value)
                ed.RequestDateTime = Convert.ToDateTime(dr["RequestDateTime"]);

            if (dr["BankServerDateTime"] != DBNull.Value)
                ed.BankServerDateTime = Convert.ToDateTime(dr["BankServerDateTime"]);

            if (dr["ResponseCode"] != DBNull.Value)
                ed.ResponseCode = Convert.ToInt32(dr["ResponseCode"]);

            if (dr["ResponseResult"] != DBNull.Value)
                ed.ResponseResult = Convert.ToString(dr["ResponseResult"]);

            if (dr["ResponseDateTime"] != DBNull.Value)
                ed.ResponseDateTime = Convert.ToDateTime(dr["ResponseDateTime"]);

            if (dr["ErrorCode"] != DBNull.Value)
                ed.ErrorCode = Convert.ToInt32(dr["ErrorCode"]);

            if (dr["RequestStatusId"] != DBNull.Value)
                ed.RequestStatusId = Convert.ToInt16(dr["RequestStatusId"]);

            ed.RequestStatusName = Enum.GetName(typeof(SystemConstants.ICDRequestStatusType), (SystemConstants.ICDRequestStatusType)ed.RequestStatusId);
            return ed;
        }
        #endregion
    }
}
