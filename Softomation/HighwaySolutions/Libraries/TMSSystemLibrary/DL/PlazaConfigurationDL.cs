using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class PlazaConfigurationDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_PlazaConfiguration";
        #endregion

        internal static List<ResponseIL> InsertUpdate(PlazaConfigurationIL plaza)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_PlazaInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int32, plaza.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SystemIntegratorId", DbType.Int32, plaza.SystemIntegratorId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaName", DbType.String, plaza.PlazaName.Trim(), ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaServerIpAddress", DbType.String, plaza.PlazaServerIpAddress, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaZoneId", DbType.String, plaza.PlazaZoneId, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ChainageNumber", DbType.Decimal, plaza.ChainageNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Latitude", DbType.Decimal, plaza.Latitude, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Longitude", DbType.Decimal, plaza.Longitude, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, plaza.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, plaza.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, plaza.ModifiedBy, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responses = ResponseIL.ConvertResponseList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
        }
        internal static bool DataMerge(List<PlazaConfigurationIL> plazaList)
        {
            bool result = false;
            List<ResponseIL> responces = null;
            try
            {
                DataTable ImportDataTable = new DataTable();
                ImportDataTable.Clear();
                ImportDataTable.Columns.Add("SystemIntegratorId");
                ImportDataTable.Columns.Add("PlazaId");
                ImportDataTable.Columns.Add("PlazaName");
                ImportDataTable.Columns.Add("PlazaServerIpAddress");
                ImportDataTable.Columns.Add("PlazaZoneId");
                ImportDataTable.Columns.Add("DataStatus");
                ImportDataTable.Columns.Add("CreatedDate");
                ImportDataTable.Columns.Add("CreatedBy");
                ImportDataTable.Columns.Add("ModifiedDate");
                ImportDataTable.Columns.Add("ModifiedBy");
                ImportDataTable.Columns.Add("SessionId");
                DataRow row;
                string SessionId = CommonLibrary.Constants.RandomString(10);
                for (int i = 0; i < plazaList.Count; i++)
                {
                    row = ImportDataTable.NewRow();
                    row["SystemIntegratorId"] = plazaList[i].SystemIntegratorId;
                    row["PlazaId"] = plazaList[i].PlazaId;
                    row["PlazaName"] = plazaList[i].PlazaName;
                    row["PlazaServerIpAddress"] = plazaList[i].PlazaServerIpAddress;
                    row["PlazaZoneId"] = plazaList[i].PlazaZoneId;
                    row["DataStatus"] = plazaList[i].DataStatus;
                    row["CreatedDate"] = plazaList[i].CreatedDate;
                    row["CreatedBy"] = plazaList[i].CreatedBy;
                    row["ModifiedDate"] = plazaList[i].ModifiedDate;
                    row["ModifiedBy"] = plazaList[i].ModifiedBy;
                    row["SessionId"] = SessionId;
                    ImportDataTable.Rows.Add(row);
                }
                if (SystemConstants.BulkCopy(ImportDataTable, "temp_PlazaConfiguration"))
                {
                    string spName = "USP_PlazaConfigurationDataMerge";
                    DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SessionId", DbType.String, SessionId, ParameterDirection.Input));
                    int adt = (int)DBAccessor.ExecuteScalar(command);
                    if (adt > 0)
                        result = true;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        #region Get Methods
        internal static List<PlazaConfigurationIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<PlazaConfigurationIL> plazas = new List<PlazaConfigurationIL>();
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
        internal static List<PlazaConfigurationIL> GetActive()
        {
            DataTable dt = new DataTable();
            List<PlazaConfigurationIL> plazas = new List<PlazaConfigurationIL>();
            try
            {
                plazas = GetAll();
                return plazas.FindAll(n => n.DataStatus == (short)CommonLibrary.Constants.DataStatusType.Active);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        internal static PlazaConfigurationIL GetById(short PlazaId)
        {
            DataTable dt = new DataTable();
            PlazaConfigurationIL plaza = new PlazaConfigurationIL();
            try
            {
                string spName = "USP_PlazaGetbyId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int32, PlazaId, ParameterDirection.Input));
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
        #endregion

        #region Helper Methods
        private static PlazaConfigurationIL CreateObjectFromDataRow(DataRow dr)
        {
            PlazaConfigurationIL plaza = new PlazaConfigurationIL();

            if (dr["PlazaId"] != DBNull.Value)
                plaza.PlazaId = Convert.ToInt16(dr["PlazaId"]);

            if (dr["SystemIntegratorId"] != DBNull.Value)
                plaza.SystemIntegratorId = Convert.ToInt16(dr["SystemIntegratorId"]);

            if (dr["SystemIntegratorName"] != DBNull.Value)
                plaza.SystemIntegratorName = Convert.ToString(dr["SystemIntegratorName"]);

            if (dr["PlazaName"] != DBNull.Value)
                plaza.PlazaName = Convert.ToString(dr["PlazaName"]);

            if (dr["PlazaServerIpAddress"] != DBNull.Value)
                plaza.PlazaServerIpAddress = Convert.ToString(dr["PlazaServerIpAddress"]);

            if (dr["PlazaZoneId"] != DBNull.Value)
                plaza.PlazaZoneId = Convert.ToString(dr["PlazaZoneId"]);

            if (dr["ChainageNumber"] != DBNull.Value)
            {
                plaza.ChainageNumber = Convert.ToDecimal(dr["ChainageNumber"]);
                plaza.ChainageName = plaza.ChainageNumber.ToString().Replace(".", "+");
            }

            if (dr["Latitude"] != DBNull.Value)
                plaza.Latitude = Convert.ToDecimal(dr["Latitude"]);

            if (dr["Longitude"] != DBNull.Value)
                plaza.Longitude = Convert.ToDecimal(dr["Longitude"]);

            if (dr["CreatedDate"] != DBNull.Value)
                plaza.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                plaza.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                plaza.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                plaza.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["DataStatus"] != DBNull.Value)
                plaza.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            plaza.DataStatusName = Enum.GetName(typeof(CommonLibrary.Constants.DataStatusType), (CommonLibrary.Constants.DataStatusType)plaza.DataStatus);

            return plaza;
        }
        #endregion
    }
}
