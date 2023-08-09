using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class VMSMessagingDL
    {
        #region Global Varialble
        static string tableName = "tbl_VMSMessageDetails";
        #endregion

        #region Insert Update
        internal static List<ResponceIL> InsertUpdate(VMSMessagingIL vms)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_VMSMessageInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, vms.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VmsIds", DbType.String, vms.VmsIds, ParameterDirection.Input, 4000));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageFormatId", DbType.Int16, vms.MessageFormatId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FontFormat", DbType.String, vms.FontFormat, ParameterDirection.Input,100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FontSize", DbType.Int16, vms.FontSize, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AlignmentId", DbType.Int16, vms.AlignmentId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Brightness", DbType.Int16, vms.Brightness, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageLanguageId", DbType.Int16, vms.MessageLanguageId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageOrientationId", DbType.Int16, vms.MessageOrientationId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageDuration", DbType.Int16, vms.MessageDuration, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageBody", DbType.String, vms.MessageBody, ParameterDirection.Input, 500));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessagePriority", DbType.Int16, vms.MessagePriority, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, vms.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, vms.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, vms.ModifiedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
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
        internal static List<VMSMessagingIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<VMSMessagingIL> dataLists = new List<VMSMessagingIL>();
            try
            {
                string spName = "USP_VMSMessageGetAll";
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
        internal static VMSMessagingIL GetbyId(int EntryId)
        {
            DataTable dt = new DataTable();
            VMSMessagingIL data = new VMSMessagingIL();
            try
            {
                string spName = "USP_VMSMessageGetbyId";
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
        internal static List<VMSMessagingIL> GetActiveMessage()
        {
            DataTable dt = new DataTable();
            List<VMSMessagingIL> dataLists = new List<VMSMessagingIL>();
            try
            {
                string spName = "USP_VMSMessageGetAvtiveAll";
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
        #endregion

        #region Helper Methods
        private static VMSMessagingIL CreateObjectFromDataRow(DataRow dr)
        {
            VMSMessagingIL data = new VMSMessagingIL();

            if (dr["EntryId"] != DBNull.Value)
                data.EntryId = Convert.ToInt32(dr["EntryId"]);

            if (dr["VmsIds"] != DBNull.Value)
            {
                data.VmsIds = Convert.ToString(dr["VmsIds"]);
                if (data.VmsIds == "0")
                    data.VmsList = DevicesMasterDL.GetByType(8);
                else
                    data.VmsList = DevicesMasterDL.GetByIds(data.VmsIds);
            }
            if (dr["FontFormat"] != DBNull.Value)
                data.FontFormat = Convert.ToString(dr["FontFormat"]);

            if (dr["FontSize"] != DBNull.Value)
                data.FontSize = Convert.ToInt16(dr["FontSize"]);

            if (dr["AlignmentId"] != DBNull.Value)
                data.AlignmentId = Convert.ToInt16(dr["AlignmentId"]);
            
            if (dr["Brightness"] != DBNull.Value)
                data.Brightness = Convert.ToInt16(dr["Brightness"]);

            if (dr["Brightness"] != DBNull.Value)
                data.Brightness = Convert.ToInt16(dr["Brightness"]);

            if (dr["MessageDuration"] != DBNull.Value)
                data.MessageDuration = Convert.ToInt16(dr["MessageDuration"]);

            if (dr["MessageBody"] != DBNull.Value)
                data.MessageBody = Convert.ToString(dr["MessageBody"]);

            if (dr["MessageFormatId"] != DBNull.Value)
            {
                data.MessageFormatId = Convert.ToInt16(dr["MessageFormatId"]);
                if (data.MessageFormatId == 1)
                    data.MessageFormat = "Text";
                else if (data.MessageFormatId == 2)
                    data.MessageFormat = "Image";
            }
            if (dr["MessageLanguageId"] != DBNull.Value)
            {
                data.MessageLanguageId = Convert.ToInt16(dr["MessageLanguageId"]);
                if (data.MessageLanguageId == 1)
                    data.MessageLanguage = "English";
                else if (data.MessageLanguageId == 2)
                    data.MessageLanguage = "Other";
            }
            if (dr["MessageOrientationId"] != DBNull.Value)
            {
                data.MessageOrientationId = Convert.ToInt16(dr["MessageOrientationId"]);
                if (data.MessageOrientationId == 1)
                    data.MessageOrientation = "Static";
                else if (data.MessageOrientationId == 2)
                    data.MessageOrientation = "Other";
            }

            if (dr["MessagePriority"] != DBNull.Value)
                data.MessagePriority = Convert.ToInt16(dr["MessagePriority"]);

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
