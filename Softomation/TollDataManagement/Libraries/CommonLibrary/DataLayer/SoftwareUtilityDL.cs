using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class SoftwareUtilityDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_SoftwareUtility";
        #endregion

        internal SoftwareUtilityDL()
        {
        }

        #region Insert Update
        internal static List<ResponceIL> InsertUpdate(SoftwareUtilityIL softwareUtility)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_SoftwareUtilityInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, softwareUtility.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DeviceId", DbType.Int32, softwareUtility.DeviceId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IntegrationMethodologyId", DbType.Int16, softwareUtility.IntegrationMethodologyId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ApplicationName", DbType.String, softwareUtility.ApplicationName, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LocalIpAddress", DbType.String, softwareUtility.LocalIpAddress, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LocalPort", DbType.Int16, softwareUtility.LocalPort, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PublicIpAddress", DbType.String, softwareUtility.PublicIpAddress, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PublicPort", DbType.Int16, softwareUtility.PublicPort, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, softwareUtility.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, softwareUtility.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, softwareUtility.ModifiedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }
        #endregion

        #region Get Method
        internal static List<SoftwareUtilityIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<SoftwareUtilityIL> softwareUtilities = new List<SoftwareUtilityIL>();
            try
            {
                string spName = "USP_SoftwareUtilityGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    softwareUtilities.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return softwareUtilities;
        }
        internal static SoftwareUtilityIL GetById(int EntryId)
        {
            DataTable dt = new DataTable();
            SoftwareUtilityIL account = new SoftwareUtilityIL();
            try
            {
                string spName = "USP_SoftwareUtilityGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, EntryId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    account = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return account;
        }
        internal static List<SoftwareUtilityIL> GetByDeviceId(Int64 DeviceId)
        {
            DataTable dt = new DataTable();
            List<SoftwareUtilityIL> softwareUtilities = new List<SoftwareUtilityIL>();
            try
            {
                string spName = "USP_SoftwareUtilityGetByDeviceId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DeviceId", DbType.Int32, DeviceId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    softwareUtilities.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return softwareUtilities;
        }
        #endregion

        #region Helper Methods
        private static SoftwareUtilityIL CreateObjectFromDataRow(DataRow dr)
        {
            SoftwareUtilityIL data = new SoftwareUtilityIL();
            if (dr["EntryId"] != DBNull.Value)
                data.EntryId = Convert.ToInt32(dr["EntryId"]);

            if (dr["ApplicationName"] != DBNull.Value)
                data.ApplicationName = Convert.ToString(dr["ApplicationName"]);

            if (dr["IntegrationMethodologyId"] != DBNull.Value)
                data.IntegrationMethodologyId = Convert.ToInt16(dr["IntegrationMethodologyId"]);

            if (dr["MethodologyName"] != DBNull.Value)
                data.MethodologyName = Convert.ToString(dr["MethodologyName"]);

            if (dr["LocalIpAddress"] != DBNull.Value)
                data.LocalIpAddress = Convert.ToString(dr["LocalIpAddress"]);

            if (dr["LocalPort"] != DBNull.Value)
                data.LocalPort = Convert.ToInt16(dr["LocalPort"]);

            if (dr["PublicIpAddress"] != DBNull.Value)
                data.PublicIpAddress = Convert.ToString(dr["PublicIpAddress"]);

            if (dr["PublicPort"] != DBNull.Value)
                data.PublicPort = Convert.ToInt16(dr["PublicPort"]);

            if (dr["CreatedBy"] != DBNull.Value)
                data.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["CreatedTime"] != DBNull.Value)
                data.CreatedDate = Convert.ToDateTime(dr["CreatedTime"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                data.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["ModifiedTime"] != DBNull.Value)
                data.ModifiedDate = Convert.ToDateTime(dr["ModifiedTime"]);

            if (dr["DataStatus"] != DBNull.Value)
                data.DataStatus = Convert.ToInt16(dr["DataStatus"]);
            return data;
        }
        #endregion
    }
}
