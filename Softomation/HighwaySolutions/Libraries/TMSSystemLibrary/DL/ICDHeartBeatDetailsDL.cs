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

        internal static List<ResponseIL> RequestProcess(ICDHeartBeatDetailsIL ed)
        {
            List<ResponseIL> responses = null;

            try
            {
                string spName = "USP_ICDHeartBeatDetailsRequest";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RequestHeartBeatId", DbType.Int64, ed.RequestHeartBeatId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageId", DbType.String, ed.MessageId, ParameterDirection.Input, 35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionId", DbType.String, ed.TransactionId, ParameterDirection.Input, 22));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RequestDateTime", DbType.DateTime, ed.RequestDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Note", DbType.String, ed.Note, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RefId", DbType.String, ed.RefId, ParameterDirection.Input, 35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RefUrl", DbType.String, ed.RefUrl, ParameterDirection.Input, 35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionDateTime", DbType.DateTime, ed.TransactionDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@OrgTransactionId", DbType.String, ed.OrgTransactionId, ParameterDirection.Input, 36));
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

        internal static List<ICDHeartBeatDetailsIL> GetPendingRequest()
        {
            DataTable dt = new DataTable();
            List<ICDHeartBeatDetailsIL> eds = new List<ICDHeartBeatDetailsIL>();
            try
            {
                string spName = "USP_ICDTagDetailsPendingRequest";
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
        private static ICDHeartBeatDetailsIL CreateObjectFromDataRow(DataRow dr)
        {
            ICDHeartBeatDetailsIL ed = new ICDHeartBeatDetailsIL();

            if (dr["RequestHeartBeatId"] != DBNull.Value)
                ed.RequestHeartBeatId = Convert.ToInt32(dr["RequestHeartBeatId"]);

            if (dr["MessageId"] != DBNull.Value)
                ed.MessageId = Convert.ToString(dr["MessageId"]);

            if (dr["TransactionId"] != DBNull.Value)
                ed.TransactionId = Convert.ToString(dr["TransactionId"]);

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

            if (dr["ResponseResult"] != DBNull.Value)
                ed.ResponseResult = Convert.ToString(dr["ResponseResult"]);

            if (dr["ResponseDateTime"] != DBNull.Value)
                ed.ResponseDateTime = Convert.ToDateTime(dr["ResponseDateTime"]);

            if (dr["ErrorCode"] != DBNull.Value)
                ed.ErrorCode = Convert.ToInt32(dr["ErrorCode"]);

            if (dr["RequestStatusId"] != DBNull.Value)
                ed.RequestStatusId = Convert.ToInt16(dr["RequestStatusId"]);

            //if (dr["PlazaZoneId"] != DBNull.Value)
            //    ed.PlazaZoneId = Convert.ToInt64(dr["PlazaZoneId"]);

            //if (dr["PlazaName"] != DBNull.Value)
            //    ed.PlazaName = Convert.ToString(dr["PlazaName"]);

            //if (dr["PlazaState"] != DBNull.Value)
            //    ed.PlazaState = Convert.ToString(dr["PlazaState"]);

            //if (dr["PlazaAddress"] != DBNull.Value)
            //    ed.PlazaAddress = Convert.ToString(dr["PlazaAddress"]);

            //if (dr["PlazaFromDistrict"] != DBNull.Value)
            //    ed.PlazaFromDistrict = Convert.ToString(dr["PlazaFromDistrict"]);

            //if (dr["PlazaToDistrict"] != DBNull.Value)
            //    ed.PlazaToDistrict = Convert.ToString(dr["PlazaToDistrict"]);

            //if (dr["PlazaAgencyCode"] != DBNull.Value)
            //    ed.PlazaAgencyCode = Convert.ToString(dr["PlazaAgencyCode"]);

            //if (dr["PlazaAcquirerId"] != DBNull.Value)
            //    ed.PlazaAcquirerId = Convert.ToInt32(dr["PlazaAcquirerId"]);

            ed.RequestStatusName = Enum.GetName(typeof(SystemConstants.ICDRequestStatusType), (SystemConstants.ICDRequestStatusType)ed.RequestStatusId);
            return ed;
        }
        #endregion
    }
}
