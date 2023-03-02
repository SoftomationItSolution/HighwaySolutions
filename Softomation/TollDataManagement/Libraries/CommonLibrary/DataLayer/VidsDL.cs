using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class VidsDL
    {
        #region Global Varialble
        static string tableName = "tbl_VidsEventsDetails";
        #endregion

        #region Insert Update
        internal static List<ResponceIL> InsertUpdate(VidsIL vids)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_VMSMessageInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, vms.EntryId, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VmsIds", DbType.String, vms.VmsIds, ParameterDirection.Input, 4000));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageFormatId", DbType.Int16, vms.MessageFormatId, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FontFormat", DbType.String, vms.FontFormat, ParameterDirection.Input,100));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FontSize", DbType.Int16, vms.FontSize, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AlignmentId", DbType.Int16, vms.AlignmentId, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Brightness", DbType.Int16, vms.Brightness, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageLanguageId", DbType.Int16, vms.MessageLanguageId, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageOrientationId", DbType.Int16, vms.MessageOrientationId, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageDuration", DbType.Int16, vms.MessageDuration, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageBody", DbType.String, vms.MessageBody, ParameterDirection.Input, 500));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessagePriority", DbType.Int16, vms.MessagePriority, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, vms.DataStatus, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, vms.CreatedBy, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, vms.ModifiedBy, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                DataTable dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }
        #endregion
        
        #region Get Methods
        internal static List<VidsIL> GetLatest()
        {
            DataTable dt = new DataTable();
            List<VidsIL> dataLists = new List<VidsIL>();
            try
            {
                string spName = "USP_VidsEventGetLatest";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                {
                    dataLists.Add(CreateObjectFromDataRow(dr));
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dataLists;
        }
        internal static VidsIL GetbyId(int EntryId)
        {
            DataTable dt = new DataTable();
            VidsIL data = new VidsIL();
            try
            {
                string spName = "USP_VidsEventGetbyId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, EntryId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                {
                    data = CreateObjectFromDataRow(dr);
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return data;
        }
        #endregion

        #region Helper Methods
        private static VidsIL CreateObjectFromDataRow(DataRow dr)
        {
            VidsIL data = new VidsIL();

            if (dr["EntryId"] != DBNull.Value)
                data.EntryId = Convert.ToInt32(dr["EntryId"]);

            if (dr["VidsId"] != DBNull.Value)
                data.VidsId = Convert.ToInt64(dr["VidsId"]);

            if (dr["DeviceName"] != DBNull.Value)
                data.DeviceName = Convert.ToString(dr["DeviceName"]);

            if (dr["EventDateTime"] != DBNull.Value)
                data.EventDateTime = Convert.ToDateTime(dr["EventDateTime"]);

            if (dr["ControlRoomName"] != DBNull.Value)
                data.ControlRoomName = Convert.ToString(dr["ControlRoomName"]);

            if (dr["VidsEventTypeId"] != DBNull.Value)
                data.EventTypeId = Convert.ToInt16(dr["VidsEventTypeId"]);

            if (dr["EventType"] != DBNull.Value)
                data.EvenTypeName = Convert.ToString(dr["EventType"]);

            if (dr["CreatedBy"] != DBNull.Value)
                data.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["CreatedDate"] != DBNull.Value)
                data.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                data.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                data.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

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
