using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using Softomation.ATMSSystemLibrary.DBA;
using Softomation.ATMSSystemLibrary.IL;

namespace Softomation.ATMSSystemLibrary.DL
{
    internal class IncidentActionHistoryDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_IncidentActionHistory";
        #endregion

        internal static List<ResponseIL> Insert(IncidentActionHistoryIL ims)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_IncidentActionInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IncidentId", DbType.String, ims.IncidentId, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ActionImagePath", DbType.String, ims.ActionImagePath, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ActionVideoPath", DbType.String, ims.ActionVideoPath, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ActionAudioPath", DbType.String, ims.ActionAudioPath, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ActionTakenById", DbType.Int64, ims.ActionTakenById, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ActionTakenRemark", DbType.String, ims.ActionTakenRemark, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ActionTakenDateTime", DbType.Date, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ActionStatusId", DbType.Int16, ims.ActionStatusId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responses = ResponseIL.ConvertResponseList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
        }

        internal static List<IncidentActionHistoryIL> GetActionHistory(string IncidentId)
        {
            List<IncidentActionHistoryIL> incidentstatusList = new List<IncidentActionHistoryIL>();
            try
            {
                string spName = "USP_IncidentActionHistorGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IncidentId", DbType.String, IncidentId, ParameterDirection.Input, 255));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    incidentstatusList.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return incidentstatusList;
        }

        #region Helper Methods
        private static IncidentActionHistoryIL CreateObjectFromDataRow(DataRow dr)
        {
            IncidentActionHistoryIL id = new IncidentActionHistoryIL();

            if (dr["IncidentId"] != DBNull.Value)
                id.IncidentId = Convert.ToString(dr["IncidentId"]);

            if (dr["ActionImagePath"] != DBNull.Value)
                id.ActionImagePath = Convert.ToString(dr["ActionImagePath"]);

            if (dr["ActionVideoPath"] != DBNull.Value)
                id.ActionVideoPath = Convert.ToString(dr["ActionVideoPath"]);

            if (dr["ActionAudioPath"] != DBNull.Value)
                id.ActionAudioPath = Convert.ToString(dr["ActionAudioPath"]);

            if (dr["ActionTakenById"] != DBNull.Value)
                id.ActionTakenById = Convert.ToInt64(dr["ActionTakenById"]);

            if (dr["ActionTakenByName"] != DBNull.Value)
                id.ActionTakenByName = Convert.ToString(dr["ActionTakenByName"]);

            if (dr["ActionTakenDateTime"] != DBNull.Value)
                id.ActionTakenDateTime = Convert.ToDateTime(dr["ActionTakenDateTime"]);

            if (dr["ActionTakenRemark"] != DBNull.Value)
                id.ActionTakenRemark = Convert.ToString(dr["ActionTakenRemark"]);

            if (dr["ActionStatusId"] != DBNull.Value)
                id.ActionStatusId = Convert.ToInt16(dr["ActionStatusId"]);

            if (dr["ActionStatusName"] != DBNull.Value)
                id.ActionStatusName = Convert.ToString(dr["ActionStatusName"]);

            if (dr["DataSendStatus"] != DBNull.Value)
                id.DataSendStatus = Convert.ToBoolean(dr["DataSendStatus"]);

            if (dr["MediaSendStatus"] != DBNull.Value)
                id.MediaSendStatus = Convert.ToBoolean(dr["MediaSendStatus"]);

            id.DataStatusName = Enum.GetName(typeof(Constants.DataStatusType), (Constants.DataStatusType)id.DataStatus);
            return id;
        }
        #endregion
    }
}
