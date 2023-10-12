using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.DL
{
    internal class IncidentDetailsDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_IncidentDetailsHistory";
        #endregion

        #region Insert Update
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
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Latitude", DbType.Double, ims.Latitude, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Longitude", DbType.Double, ims.Longitude, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehiclePlateNumber", DbType.String, ims.VehiclePlateNumber, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehicleClassId", DbType.Int16, ims.VehicleClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SourceSystemId", DbType.Int16, ims.SourceSystemId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentId", DbType.Int64, ims.EquipmentId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IncidentGeneratedByTypeId", DbType.Int16, ims.IncidentGeneratedByTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IncidentGeneratedById", DbType.Int64, ims.IncidentGeneratedById, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AssignedToId", DbType.Int64, ims.AssignedToId, ParameterDirection.Input));
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
        internal static List<ResponseIL> Update(IncidentDetailsIL ims)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_IncidentDetailsUpdate";
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
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Latitude", DbType.Double, ims.Latitude, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Longitude", DbType.Double, ims.Longitude, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehiclePlateNumber", DbType.String, ims.VehiclePlateNumber, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehicleClassId", DbType.Int16, ims.VehicleClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SourceSystemId", DbType.Int16, ims.SourceSystemId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentId", DbType.Int64, ims.EquipmentId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IncidentGeneratedByTypeId", DbType.Int16, ims.IncidentGeneratedByTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IncidentGeneratedById", DbType.Int64, ims.IncidentGeneratedById, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AssignedToId", DbType.Int64, ims.AssignedToId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IncidentStatusId", DbType.Int16, ims.IncidentStatusId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, ims.ModifiedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responses = ResponseIL.ConvertResponseList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
        }
        #endregion

        #region Get Methods
        internal static IncidentDetailsIL GetById(String IncidentId)
        {
            DataTable dt = new DataTable();
            IncidentDetailsIL imsData = new IncidentDetailsIL();
            try
            {
                string spName = "USP_IncidentDetailsGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IncidentId", DbType.String, IncidentId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    imsData = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return imsData;
        }
        internal static List<IncidentDetailsIL> GetInProgress(short hours)
        {
            List<IncidentDetailsIL> incidentstatusList = new List<IncidentDetailsIL>();
            try
            {
                string spName = "USP_IncidentGetInProgress";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Hours", DbType.Int16, hours, ParameterDirection.Input));
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
        internal static List<IncidentDetailsIL> GetPending(short hours)
        {
            List<IncidentDetailsIL> incidentstatusList = new List<IncidentDetailsIL>();
            try
            {
                string spName = "USP_IncidentGetPending";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Hours", DbType.Int16, hours, ParameterDirection.Input));
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
        internal static List<IncidentDetailsIL> GetClosed(short hours)
        {
            List<IncidentDetailsIL> incidentstatusList = new List<IncidentDetailsIL>();
            try
            {
                string spName = "USP_IncidentGetClose";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Hours", DbType.Int16, hours, ParameterDirection.Input));
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
        internal static List<IncidentDetailsIL> GetByFilter(DataFilterIL data)
        {
            DataTable dt = new DataTable();
            List<IncidentDetailsIL> imsEvents = new List<IncidentDetailsIL>();
            try
            {
                string spName = "USP_IncidentGetByFilter";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FilterQuery", DbType.String, data.FilterQuery, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    imsEvents.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return imsEvents;
        }
        #endregion

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
            {
                id.ChainageNumber = Convert.ToDecimal(dr["ChainageNumber"]);
                id.ChainageName = SystemConstants.ConvertChainageName(id.ChainageNumber);
            }

            if (dr["Latitude"] != DBNull.Value)
                id.Latitude = Convert.ToDouble(dr["Latitude"]);

            if (dr["Longitude"] != DBNull.Value)
                id.Longitude = Convert.ToDouble(dr["Longitude"]);

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

            if (dr["NearByPTZId"] != DBNull.Value)
                id.NearByPTZId = Convert.ToInt64(dr["NearByPTZId"]);

            if (dr["IncidentGeneratedByTypeId"] != DBNull.Value)
                id.IncidentGeneratedByTypeId = Convert.ToInt16(dr["IncidentGeneratedByTypeId"]);

            if (dr["IncidentGeneratedById"] != DBNull.Value)
                id.IncidentGeneratedById = Convert.ToInt64(dr["IncidentGeneratedById"]);

            if (dr["IncidentGeneratedByName"] != DBNull.Value)
                id.IncidentGeneratedByName = Convert.ToString(dr["IncidentGeneratedByName"]);
            
            if (dr["AssignedToId"] != DBNull.Value)
                id.AssignedToId = Convert.ToInt64(dr["AssignedToId"]);

            if (dr["AssignedToName"] != DBNull.Value)
                id.AssignedToName = Convert.ToString(dr["AssignedToName"]);

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

            if (dr["CreatedDate"] != DBNull.Value)
                id.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                id.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                id.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                id.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            id.ActionHistoryDetails = IncidentActionHistoryDL.GetActionHistory(id.IncidentId);
            id.DirectionName = Enum.GetName(typeof(SystemConstants.DirectionType), (SystemConstants.DirectionType)id.DirectionId);
            id.IncidentGeneratedByTypeName = Enum.GetName(typeof(SystemConstants.IncidentGeneratedByType), (SystemConstants.IncidentGeneratedByType)id.IncidentGeneratedByTypeId);
            id.PriorityName = Enum.GetName(typeof(SystemConstants.PriorityType), (SystemConstants.PriorityType)id.PriorityId);
            return id;
        }

       
        #endregion
    }
}
