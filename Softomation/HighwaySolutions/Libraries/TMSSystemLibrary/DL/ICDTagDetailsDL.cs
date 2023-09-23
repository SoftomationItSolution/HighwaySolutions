using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class ICDTagDetailsDL
    {
        #region Global Varialble
        static string tableName = "tbl_ICDRequestTagDetail";
        #endregion

        internal static List<ResponseIL> RequestProcess(ICDTagDetailsIL ed)
        {
            List<ResponseIL> responses = null;

            try
            {
                string spName = "USP_ICDTagDetailsRequest";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RequestTagId", DbType.Int64, ed.RequestTagId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageId", DbType.String, ed.MessageId, ParameterDirection.Input, 35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RequestDateTime", DbType.DateTime, ed.RequestDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Note", DbType.String, ed.Note, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RefId", DbType.String, ed.RefId, ParameterDirection.Input, 35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RefUrl", DbType.String, ed.RefUrl, ParameterDirection.Input, 35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionDateTime", DbType.DateTime, ed.TransactionDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TagId", DbType.String, ed.TagId, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TID", DbType.String, ed.TID, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VRN", DbType.String, ed.VRN, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ResponseCode", DbType.Int32, ed.ResponseCode, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ResponseResult", DbType.String, ed.ResponseResult, ParameterDirection.Input, 10));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SuccessRequestCount", DbType.Int32, ed.SuccessRequestCount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TotalRequestCount", DbType.Int32, ed.TotalRequestCount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ResponseDateTime", DbType.DateTime, ed.ResponseDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionErrorCode", DbType.Int32, ed.TransactionErrorCode, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehicleClass", DbType.String, ed.VehicleClass, ParameterDirection.Input, 5));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TagStatus", DbType.Boolean, ed.TagStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ErrorCode", DbType.Int32, ed.ErrorCode, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IsCommercialVehicle", DbType.Boolean, ed.IsCommercialVehicle, ParameterDirection.Input));
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

        internal static List<ICDTagDetailsIL> GetPendingRequest()
        {
            DataTable dt = new DataTable();
            List<ICDTagDetailsIL> eds = new List<ICDTagDetailsIL>();
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
        private static ICDTagDetailsIL CreateObjectFromDataRow(DataRow dr)
        {
            ICDTagDetailsIL ed = new ICDTagDetailsIL();

            if (dr["RequestTagId"] != DBNull.Value)
                ed.RequestTagId = Convert.ToInt32(dr["RequestTagId"]);

            if (dr["MessageId"] != DBNull.Value)
                ed.MessageId = Convert.ToString(dr["MessageId"]);

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

            if (dr["TagId"] != DBNull.Value)
                ed.TagId = Convert.ToString(dr["TagId"]);

            if (dr["TID"] != DBNull.Value)
                ed.TID = Convert.ToString(dr["TID"]);

            if (dr["VRN"] != DBNull.Value)
                ed.VRN = Convert.ToString(dr["VRN"]);

            if (dr["ResponseCode"] != DBNull.Value)
                ed.ResponseCode = Convert.ToInt32(dr["ResponseCode"]);

            if (dr["ResponseResult"] != DBNull.Value)
                ed.ResponseResult = Convert.ToString(dr["ResponseResult"]);

            if (dr["SuccessRequestCount"] != DBNull.Value)
                ed.SuccessRequestCount = Convert.ToInt32(dr["SuccessRequestCount"]);

            if (dr["TotalRequestCount"] != DBNull.Value)
                ed.TotalRequestCount = Convert.ToInt32(dr["TotalRequestCount"]);

            if (dr["ResponseDateTime"] != DBNull.Value)
                ed.ResponseDateTime = Convert.ToDateTime(dr["ResponseDateTime"]);

            if (dr["TransactionErrorCode"] != DBNull.Value)
                ed.TransactionErrorCode = Convert.ToInt32(dr["TransactionErrorCode"]);

            if (dr["VehicleClass"] != DBNull.Value)
                ed.VehicleClass = Convert.ToString(dr["VehicleClass"]);

            if (dr["TagStatus"] != DBNull.Value)
                ed.TagStatus = Convert.ToBoolean(dr["TagStatus"]);

            if (dr["ErrorCode"] != DBNull.Value)
                ed.ErrorCode = Convert.ToInt32(dr["ErrorCode"]);

            if (dr["IsCommercialVehicle"] != DBNull.Value)
                ed.IsCommercialVehicle = Convert.ToBoolean(dr["IsCommercialVehicle"]);

            if (dr["RequestStatusId"] != DBNull.Value)
                ed.RequestStatusId = Convert.ToInt16(dr["RequestStatusId"]);

            ed.RequestStatusName = Enum.GetName(typeof(SystemConstants.ICDRequestStatusType), (SystemConstants.ICDRequestStatusType)ed.RequestStatusId);
            return ed;
        }
        #endregion
    }
}
