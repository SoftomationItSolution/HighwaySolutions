using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using Softomation.ATMSSystemLibrary.DBA;
using Softomation.ATMSSystemLibrary.IL;

namespace Softomation.ATMSSystemLibrary.DL
{
    internal class IncidentDetailsDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_IncidentDetailsHistory";
        #endregion

        internal static List<ResponseIL> Insert(IncidentDetailsIL ims)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_IncidentDetailsInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IncidentId", DbType.String, ims.IncidentId, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IncidentCategoryId", DbType.Int16, ims.IncidentCategoryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PriorityId", DbType.Int16, ims.PriorityId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IncidentDescription", DbType.String, ims.IncidentDescription, ParameterDirection.Input, 500));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IncidentImagePath", DbType.String, ims.IncidentImagePath, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IncidentVideoPath", DbType.String, ims.IncidentVideoPath, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IncidentAudioPath", DbType.String, ims.IncidentAudioPath, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DirectionId", DbType.Int16, ims.DirectionId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ChainageNumber", DbType.Decimal, ims.ChainageNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Latitude", DbType.Decimal, ims.Latitude, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Longitude", DbType.Decimal, ims.Longitude, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehiclePlateNumber", DbType.String, ims.VehiclePlateNumber, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehicleClassId", DbType.Int16, ims.VehicleClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SourceSystemId", DbType.Int16, ims.SourceSystemId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentId", DbType.Int64, ims.EquipmentId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IncidentGeneratedByTypeId", DbType.Int16, ims.IncidentGeneratedByTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IncidentGeneratedById", DbType.Int64, ims.IncidentGeneratedById, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IncidentStatusId", DbType.Int16, ims.IncidentStatusId, ParameterDirection.Input)); 
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, ims.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responses = ResponseIL.ConvertResponseList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
        }
        internal static List<IncidentDetailsIL> GetUnAssigned()
        {
            List<IncidentDetailsIL> incidentstatusList = new List<IncidentDetailsIL>();
            try
            {
                string spName = "USP_IncidentGetUnAssigned";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
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

        internal static List<IncidentDetailsIL> GetPending()
        {
            List<IncidentDetailsIL> incidentstatusList = new List<IncidentDetailsIL>();
            try
            {
                string spName = "USP_IncidentGetPending";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
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

        internal static List<IncidentDetailsIL> GetClosed()
        {
            List<IncidentDetailsIL> incidentstatusList = new List<IncidentDetailsIL>();
            try
            {
                string spName = "USP_IncidentGetClose";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
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
        private static IncidentDetailsIL CreateObjectFromDataRow(DataRow dr)
        {
            IncidentDetailsIL id = new IncidentDetailsIL();

            if (dr["IncidentId"] != DBNull.Value)
                id.IncidentId = Convert.ToString(dr["IncidentId"]);

            if (dr["IncidentCategoryId"] != DBNull.Value)
                id.IncidentCategoryId = Convert.ToInt16(dr["IncidentCategoryId"]);

            if (dr["IncidentCategoryName"] != DBNull.Value)
                id.IncidentCategoryName = Convert.ToString(dr["IncidentCategoryName"]);

            if (dr["PriorityId"] != DBNull.Value)
                id.PriorityId = Convert.ToInt16(dr["PriorityId"]);

            if (dr["IncidentDescription"] != DBNull.Value)
                id.IncidentDescription = Convert.ToString(dr["IncidentDescription"]);

            if (dr["IncidentImagePath"] != DBNull.Value)
                id.IncidentImagePath = Convert.ToString(dr["IncidentImagePath"]);

            if (dr["IncidentVideoPath"] != DBNull.Value)
                id.IncidentVideoPath = Convert.ToString(dr["IncidentVideoPath"]);

            if (dr["IncidentAudioPath"] != DBNull.Value)
                id.IncidentAudioPath = Convert.ToString(dr["IncidentAudioPath"]);

            if (dr["DirectionId"] != DBNull.Value)
                id.DirectionId = Convert.ToInt16(dr["DirectionId"]);

            if (dr["ChainageNumber"] != DBNull.Value)
                id.ChainageNumber = Convert.ToDecimal(dr["ChainageNumber"]);

            if (dr["Latitude"] != DBNull.Value)
                id.Latitude = Convert.ToDecimal(dr["Latitude"]);

            if (dr["Longitude"] != DBNull.Value)
                id.Longitude = Convert.ToDecimal(dr["Longitude"]);

            if (dr["VehiclePlateNumber"] != DBNull.Value)
                id.VehiclePlateNumber = Convert.ToString(dr["VehiclePlateNumber"]);

            if (dr["VehicleClassId"] != DBNull.Value)
                id.VehicleClassId = Convert.ToInt16(dr["VehicleClassId"]);

            if (dr["VehicleClassName"] != DBNull.Value)
                id.VehicleClassName = Convert.ToString(dr["VehicleClassName"]);

            if (dr["SourceSystemId"] != DBNull.Value)
                id.SourceSystemId = Convert.ToInt16(dr["SourceSystemId"]);

            if (dr["SourceSystemName"] != DBNull.Value)
                id.SourceSystemName = Convert.ToString(dr["SourceSystemName"]);

            if (dr["EquipmentId"] != DBNull.Value)
                id.EquipmentId = Convert.ToInt64(dr["EquipmentId"]);

            if (dr["EquipmentName"] != DBNull.Value)
                id.EquipmentName = Convert.ToString(dr["EquipmentName"]);

            if (dr["NearByVMSId"] != DBNull.Value)
                id.NearByVMSId = Convert.ToInt64(dr["NearByVMSId"]);

            if (dr["NearByPTZId"] != DBNull.Value)
                id.NearByPTZId = Convert.ToInt64(dr["NearByPTZId"]);

            if (dr["IncidentGeneratedByTypeId"] != DBNull.Value)
                id.IncidentGeneratedByTypeId = Convert.ToInt16(dr["IncidentGeneratedByTypeId"]);

            if (dr["IncidentGeneratedById"] != DBNull.Value)
                id.IncidentGeneratedById = Convert.ToInt64(dr["IncidentGeneratedById"]);

            if (dr["IncidentGeneratedByName"] != DBNull.Value)
                id.IncidentGeneratedByName = Convert.ToString(dr["IncidentGeneratedByName"]);
            
            if (dr["AssignedTo"] != DBNull.Value)
                id.AssignedTo = Convert.ToInt64(dr["AssignedTo"]);

            if (dr["AssignedName"] != DBNull.Value)
                id.AssignedName = Convert.ToString(dr["AssignedName"]);

            if (dr["AssignedDateTime"] != DBNull.Value)
                id.AssignedDateTime = Convert.ToDateTime(dr["AssignedDateTime"]);

            if (dr["IncidentStatusId"] != DBNull.Value)
                id.IncidentStatusId = Convert.ToInt16(dr["IncidentStatusId"]);

            if (dr["IncidentStatusName"] != DBNull.Value)
                id.IncidentStatusName = Convert.ToString(dr["IncidentStatusName"]);

            if (dr["IncidentStatusIcon"] != DBNull.Value)
                id.IncidentStatusIcon = Convert.ToString(dr["IncidentStatusIcon"]);

            if (dr["IncidentStatusColorCode"] != DBNull.Value)
                id.IncidentStatusColorCode = Convert.ToString(dr["IncidentStatusColorCode"]);

            if (dr["ProcessPercentage"] != DBNull.Value)
                id.ProcessPercentage = Convert.ToDecimal(dr["ProcessPercentage"]);

            if (dr["DataSendStatus"] != DBNull.Value)
                id.DataSendStatus = Convert.ToBoolean(dr["DataSendStatus"]);

            if (dr["MediaSendStatus"] != DBNull.Value)
                id.MediaSendStatus = Convert.ToBoolean(dr["MediaSendStatus"]);

            if (dr["DataStatus"] != DBNull.Value)
                id.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            if (dr["CreatedDate"] != DBNull.Value)
                id.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                id.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                id.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                id.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            id.DataStatusName = Enum.GetName(typeof(Constants.DataStatusType), (Constants.DataStatusType)id.DataStatus);
            id.DirectionName = Enum.GetName(typeof(Constants.DirectionType), (Constants.DirectionType)id.DirectionId);
            id.IncidentGeneratedByTypeName = Enum.GetName(typeof(Constants.IncidentGeneratedByType), (Constants.IncidentGeneratedByType)id.IncidentGeneratedByTypeId);
            id.PriorityName = Enum.GetName(typeof(Constants.PriorityType), (Constants.PriorityType)id.PriorityId);
            return id;
        }
        #endregion
    }
}
