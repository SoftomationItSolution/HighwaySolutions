using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class ECBCallEventsDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_ECBCallEventsDetails";
        #endregion

        internal static List<ResponceIL> Insert(ECBCallEventsIL ecbCallEvents)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_ECBCallEventsInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@StartDateTime", DbType.DateTime, ecbCallEvents.StartDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CallerId", DbType.Int64, ecbCallEvents.CallerId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CalleeId", DbType.Int64, ecbCallEvents.CalleeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SessionId", DbType.String, ecbCallEvents.SessionId, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CallTypeId", DbType.Int16, ecbCallEvents.CallTypeId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }

        internal static List<ResponceIL> Update(ECBCallEventsIL ecbCallEvents)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_ECBCallEventsUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EndDateTime", DbType.DateTime, ecbCallEvents.EndDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CallDuration", DbType.Int16, ecbCallEvents.CallDuration, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CallStatusId", DbType.Int16, ecbCallEvents.CallStatusId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SessionId", DbType.String, ecbCallEvents.SessionId, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RecordingFileName", DbType.String, ecbCallEvents.RecordingFileName, ParameterDirection.Input, 255));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }

        internal static List<ECBCallEventsIL> GetLatest()
        {
            DataTable dt = new DataTable();
            List<ECBCallEventsIL> metEvents = new List<ECBCallEventsIL>();
            try
            {
                string spName = "USP_ECBEventGetLatest";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    metEvents.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return metEvents;
        }

        #region Helper Methods
        private static ECBCallEventsIL CreateObjectFromDataRow(DataRow dr)
        {
            ECBCallEventsIL data = new ECBCallEventsIL();
            if (dr["EntryId"] != DBNull.Value)
                data.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["CallerId"] != DBNull.Value)
                data.CallerId = Convert.ToInt64(dr["CallerId"]);

            if (dr["Caller"] != DBNull.Value)
                data.Caller = Convert.ToString(dr["CallerName"]);

            if (dr["CallerControlRoomName"] != DBNull.Value)
                data.CallerControlRoomName = Convert.ToString(dr["CallerControlRoomName"]);

            if (dr["CalleeId"] != DBNull.Value)
                data.CalleeId = Convert.ToInt64(dr["CalleeId"]);

            if (dr["Callee"] != DBNull.Value)
                data.Callee = Convert.ToString(dr["CalleeName"]);

            if (dr["CalleeControlRoomName"] != DBNull.Value)
                data.CalleeControlRoomName = Convert.ToString(dr["CalleeControlRoomName"]);

            if (dr["CallTypeId"] != DBNull.Value)
                data.CallTypeId = Convert.ToInt16(dr["CallTypeId"]);

            if (dr["CallTypeName"] != DBNull.Value)
                data.CallTypeName = Convert.ToString(dr["CallTypeName"]);

            if (dr["SessionId"] != DBNull.Value)
                data.SessionId = Convert.ToString(dr["SessionId"]);

            if (dr["StartDateTime"] != DBNull.Value)
                data.StartDateTime = Convert.ToDateTime(dr["StartDateTime"]);

            if (dr["EndDateTime"] != DBNull.Value)
                data.EndDateTime = Convert.ToDateTime(dr["EndDateTime"]);

            if (dr["CallDuration"] != DBNull.Value)
                data.CallDuration = Convert.ToInt16(dr["CallDuration"]);

            if (dr["CallStatusId"] != DBNull.Value)
                data.CallStatusId = Convert.ToInt16(dr["CallStatusId"]);

            if (dr["CallStatusName"] != DBNull.Value)
                data.CallStatusName = Convert.ToString(dr["CallStatusName"]);

            if (dr["RecordingFileName"] != DBNull.Value)
                data.RecordingFileName = Convert.ToString(dr["RecordingFileName"]);

            if (dr["CreatedDate"] != DBNull.Value)
                data.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                data.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                data.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                data.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["DataStatus"] != DBNull.Value)
            {
                data.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (data.DataStatus != 1)
                    data.DataStatusName = "Inactive";
            }
            return data;
        }
        #endregion
    }
}
