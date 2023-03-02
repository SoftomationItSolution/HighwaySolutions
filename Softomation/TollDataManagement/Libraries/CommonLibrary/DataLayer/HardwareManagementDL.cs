using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;
namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class HardwareManagementDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_HardwareConfiguration";
        #endregion

        internal static List<ResponceIL> InsertUpdate(HardwareManagementIL hardware)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_HardwareInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, hardware.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneId", DbType.Int32, hardware.LaneId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@HardwareName", DbType.String, hardware.HardwareName.Trim(), ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@HardwareProviderId", DbType.Int16, hardware.HardwareProviderId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@HardwareTypeId", DbType.Int16, hardware.HardwareTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ConnectionTypeId", DbType.Int16, hardware.ConnectionTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ConnectionAddress", DbType.String, hardware.ConnectionAddress, ParameterDirection.Input, 200));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Port", DbType.Int32, hardware.Port, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserName", DbType.String, hardware.UserName.Trim(), ParameterDirection.Input,50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Password", DbType.String, hardware.Password.Trim(), ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, hardware.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, hardware.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CDateTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }
        internal static List<ResponceIL> PInsertUpdate(HardwareManagementIL hardware)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_HardwareInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, hardware.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneId", DbType.Int32, hardware.LaneId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@HardwareName", DbType.String, hardware.HardwareName.Trim(), ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@HardwareProviderId", DbType.Int16, hardware.HardwareProviderId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@HardwareTypeId", DbType.Int16, hardware.HardwareTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ConnectionTypeId", DbType.Int16, hardware.ConnectionTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ConnectionAddress", DbType.String, hardware.ConnectionAddress, ParameterDirection.Input, 200));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Port", DbType.Int32, hardware.Port, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserName", DbType.String, hardware.UserName.Trim(), ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Password", DbType.String, hardware.Password.Trim(), ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, hardware.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, hardware.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, hardware.CreatedDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, hardware.ModifiedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, hardware.ModifiedDate, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }
        internal static void MarkedDeleted()
        {
            try
            {
                string spName = "USP_HardwareMarkedDeleted";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        internal static void DeletedData()
        {
            try
            {
                string spName = "USP_HardwareDeletedData";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #region Get Methods
        internal static DataTable GetAllTest()
        {
            DataTable dt = new DataTable();
            try
            {
                string spName = "USP_GetHardwareConfigurationTest";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
               

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;
        }
        internal static List<HardwareManagementIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<HardwareManagementIL> hardwares = new List<HardwareManagementIL>();
            try
            {
                string spName = "USP_HardwareGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    hardwares.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return hardwares;

        }
        internal static HardwareManagementIL GetById(Int32 HardwareId)
        {
            DataTable dt = new DataTable();
            HardwareManagementIL hardware = new HardwareManagementIL();
            try
            {
                string spName = "USP_HardwareGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, HardwareId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    hardware = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return hardware;
        }
        internal static List<HardwareManagementIL> GetByClientId(Int32 ClientId)
        {
            DataTable dt = new DataTable();
            List<HardwareManagementIL> hardwares = new List<HardwareManagementIL>();
            try
            {
                string spName = "USP_HardwareGetByClientId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, ClientId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    hardwares.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return hardwares;

        }
        internal static List<HardwareManagementIL> GetByPlazaId(Int32 PlazaId)
        {
            DataTable dt = new DataTable();
            List<HardwareManagementIL> hardwares = new List<HardwareManagementIL>();
            try
            {
                string spName = "USP_HardwareGetByPlazaId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int32, PlazaId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    hardwares.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return hardwares;

        }
        internal static List<HardwareManagementIL> GetByClientPlazaId(HardwareManagementIL haredware)
        {
            DataTable dt = new DataTable();
            List<HardwareManagementIL> hardwares = new List<HardwareManagementIL>();
            try
            {
                string spName = "USP_HardwareGetByClientPlazaId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, haredware.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int32, haredware.PlazaId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    hardwares.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return hardwares;
        }
        internal static List<HardwareManagementIL> GetByLaneId(Int32 LaneId)
        {
            DataTable dt = new DataTable();
            List<HardwareManagementIL> hardwares = new List<HardwareManagementIL>();
            try
            {
                string spName = "USP_HardwareGetByLaneId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneId", DbType.Int32, LaneId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    hardwares.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return hardwares;

        }
        internal static List<HardwareManagementIL> GetByLaneNumber(HardwareManagementIL haredware)
        {
            DataTable dt = new DataTable();
            List<HardwareManagementIL> hardwares = new List<HardwareManagementIL>();
            try
            {
                string spName = "USP_HardwareGetByLaneNumber";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, haredware.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int32, haredware.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneNumber", DbType.Int32, haredware.LaneNumber, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    hardwares.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return hardwares;
        }
        #endregion

        #region Helper Methods
        private static HardwareManagementIL CreateObjectFromDataRow(DataRow dr)
        {
            HardwareManagementIL hardware = new HardwareManagementIL();

            if (dr["EntryId"] != DBNull.Value)
                hardware.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["ClientId"] != DBNull.Value)
                hardware.ClientId = Convert.ToInt16(dr["ClientId"]);

            if (dr["ClientName"] != DBNull.Value)
                hardware.ClientName = Convert.ToString(dr["ClientName"]);

            if (dr["PlazaId"] != DBNull.Value)
                hardware.PlazaId = Convert.ToInt32(dr["PlazaId"]);

            if (dr["PlazaName"] != DBNull.Value)
                hardware.PlazaName = Convert.ToString(dr["PlazaName"]);

            if (dr["LaneId"] != DBNull.Value)
                hardware.LaneId = Convert.ToInt32(dr["LaneId"]);

            if (dr["LaneName"] != DBNull.Value)
                hardware.LaneName = Convert.ToString(dr["LaneName"]);

            if (dr["HardwareName"] != DBNull.Value)
                hardware.HardwareName = Convert.ToString(dr["HardwareName"]);

            if (dr["HardwareTypeId"] != DBNull.Value)
                hardware.HardwareTypeId = Convert.ToInt16(dr["HardwareTypeId"]);

            if (dr["HardwareType"] != DBNull.Value)
                hardware.HardwareType = Convert.ToString(dr["HardwareType"]);

            if (dr["IconName"] != DBNull.Value)
                hardware.IconName = Convert.ToString(dr["IconName"]);

            if (dr["ConnectionTypeId"] != DBNull.Value)
                hardware.ConnectionTypeId = Convert.ToInt16(dr["ConnectionTypeId"]);

            if (dr["ConnectionType"] != DBNull.Value)
                hardware.ConnectionType = Convert.ToString(dr["ConnectionType"]);

            if (dr["ConnectionAddress"] != DBNull.Value)
                hardware.ConnectionAddress = Convert.ToString(dr["ConnectionAddress"]);

            if (dr["Port"] != DBNull.Value)
                hardware.Port = Convert.ToInt16(dr["Port"]);

            if (dr["HardwareProviderId"] != DBNull.Value)
                hardware.HardwareProviderId = Convert.ToInt16(dr["HardwareProviderId"]);

            if (dr["ProviderName"] != DBNull.Value)
                hardware.HardwareProviderName = Convert.ToString(dr["ProviderName"]);
            
            if (dr["UserID"] != DBNull.Value)
                hardware.UserName = Convert.ToString(dr["UserID"]);
           
            if (dr["Password"] != DBNull.Value)
                hardware.Password = Convert.ToString(dr["Password"]);

            if (dr["CreatedDate"] != DBNull.Value)
                hardware.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                hardware.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                hardware.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                hardware.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);
            if (dr["DataStatus"] != DBNull.Value)
            {
                hardware.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (hardware.DataStatus != 1)
                    hardware.DataStatusName = "Inactive";
            }

            return hardware;
        }
        #endregion
    }
}
