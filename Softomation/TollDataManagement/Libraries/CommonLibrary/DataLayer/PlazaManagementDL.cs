using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;
namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class PlazaManagementDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_PlazaConfiguration";
        #endregion
        internal static List<ResponceIL> InsertUpdate(PlazaManagementIL plaza)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_PlazaInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, plaza.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, plaza.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaName", DbType.String, plaza.PlazaName.Trim(), ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaServerIpAddress", DbType.String, plaza.PlazaServerIpAddress, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataSendAPI", DbType.String, plaza.DataSendAPI.Trim(), ParameterDirection.Input, 200));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataReceiveAPI", DbType.String, plaza.DataReceiveAPI.Trim(), ParameterDirection.Input, 200));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FTPPath", DbType.String, plaza.FTPPath, ParameterDirection.Input, 200));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FTPLoginId", DbType.String, plaza.FTPLoginId, ParameterDirection.Input, 20));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FTPPassword", DbType.String, plaza.FTPPassword, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, plaza.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, plaza.CreatedBy, ParameterDirection.Input));
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
        internal static void MarkedDeleted()
        {
            try
            {
                string spName = "USP_PlazaMarkedDeleted";
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
                string spName = "USP_PlazaDeletedData";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        internal static List<ResponceIL> PInsertUpdate(PlazaManagementIL plaza)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_PlazaInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, plaza.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, plaza.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaName", DbType.String, plaza.PlazaName.Trim(), ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaServerIpAddress", DbType.String, plaza.PlazaServerIpAddress, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataSendAPI", DbType.String, plaza.DataSendAPI.Trim(), ParameterDirection.Input, 200));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataReceiveAPI", DbType.String, plaza.DataReceiveAPI.Trim(), ParameterDirection.Input, 200));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, plaza.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, plaza.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, plaza.CreatedDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, plaza.ModifiedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, plaza.ModifiedDate, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }
        internal static void UpdatePendingList(Int16 plazaId, Int64 lastTrsnId)
        {
            try
            {
                string spName = "USP_PlazaUpdatePendingId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, plazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LastSyncId", DbType.Int32, lastTrsnId, ParameterDirection.Input));
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #region Get Methods
        internal static List<PlazaManagementIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<PlazaManagementIL> plazas = new List<PlazaManagementIL>();
            try
            {
                string spName = "USP_PlazaGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    plazas.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return plazas;

        }
        internal static List<PlazaManagementIL> GetActive()
        {
            DataTable dt = new DataTable();
            List<PlazaManagementIL> plazas = new List<PlazaManagementIL>();
            try
            {
                string spName = "USP_PlazaGetActive";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    plazas.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return plazas;

        }
        internal static PlazaManagementIL GetById(Int32 PlazId)
        {
            DataTable dt = new DataTable();
            PlazaManagementIL plaza = new PlazaManagementIL();
            try
            {
                string spName = "USP_PlazaGetbyId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, PlazId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    plaza = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return plaza;
        }
        internal static PlazaManagementIL GetByIP(String iPAddress)
        {
            DataTable dt = new DataTable();
            PlazaManagementIL plaza = new PlazaManagementIL();
            try
            {
                string spName = "USP_PlazaGetbyIP";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IPAddress", DbType.String, iPAddress, ParameterDirection.Input, 20));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    plaza = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return plaza;
        }
        internal static List<PlazaManagementIL> GetByClientId(Int32 ClientId)
        {
            DataTable dt = new DataTable();
            List<PlazaManagementIL> plazas = new List<PlazaManagementIL>();
            try
            {
                string spName = "USP_PlazaGetbyClientId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, ClientId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    plazas.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return plazas;
        }


        #endregion

        #region Helper Methods
        private static PlazaManagementIL CreateObjectFromDataRow(DataRow dr)
        {
            PlazaManagementIL plaza = new PlazaManagementIL();

            if (dr["EntryId"] != DBNull.Value)
                plaza.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["ClientId"] != DBNull.Value)
                plaza.ClientId = Convert.ToInt16(dr["ClientId"]);

            if (dr["ClientName"] != DBNull.Value)
                plaza.ClientName = Convert.ToString(dr["ClientName"]);

            if (dr["PlazaName"] != DBNull.Value)
                plaza.PlazaName = Convert.ToString(dr["PlazaName"]);

            if (dr["PlazaServerIpAddress"] != DBNull.Value)
                plaza.PlazaServerIpAddress = Convert.ToString(dr["PlazaServerIpAddress"]);

            if (dr["DataSendAPI"] != DBNull.Value)
                plaza.DataSendAPI = Convert.ToString(dr["DataSendAPI"]);

            if (dr["DataReceiveAPI"] != DBNull.Value)
                plaza.DataReceiveAPI = Convert.ToString(dr["DataReceiveAPI"]);

            //if (dr["FTPPath"] != DBNull.Value)
            //    plaza.FTPPath = Convert.ToString(dr["FTPPath"]);

            //if (dr["FTPLoginId"] != DBNull.Value)
            //    plaza.FTPLoginId = Convert.ToString(dr["FTPLoginId"]);

            //if (dr["FTPPassword"] != DBNull.Value)
            //    plaza.FTPPassword = Convert.ToString(dr["FTPPassword"]);

            if (dr["CreatedDate"] != DBNull.Value)
                plaza.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                plaza.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                plaza.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                plaza.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["DataStatus"] != DBNull.Value)
            {
                plaza.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (plaza.DataStatus != 1)
                    plaza.DataStatusName = "Inactive";
            }
            return plaza;
        }
        #endregion
    }
}
