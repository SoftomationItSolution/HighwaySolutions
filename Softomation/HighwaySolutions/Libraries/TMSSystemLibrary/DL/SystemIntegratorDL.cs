using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class SystemIntegratorDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_SystemIntegratorConfiguration";
        #endregion
        internal static List<ResponseIL> InsertUpdate(SystemIntegratorIL siSetup)
        {
            List<ResponseIL> responses = null;
            try
            {

                string spName = "USP_SystemIntegratorInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SystemIntegratorId", DbType.Int16, siSetup.SystemIntegratorId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SystemIntegratorName", DbType.String, siSetup.SystemIntegratorName.Trim(), ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SystemIntegratorAddress", DbType.String, siSetup.SystemIntegratorAddress.Trim(), ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MobileNumber", DbType.String, siSetup.SystemIntegratorMobileNumber.Trim(), ParameterDirection.Input, 15));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EmailId", DbType.String, siSetup.SystemIntegratorEmailId.Trim(), ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LoginId", DbType.String, siSetup.SystemIntegratorLoginId.Trim(), ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LoginPassword", DbType.String, siSetup.SystemIntegratorLoginPassword.Trim(), ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, siSetup.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, siSetup.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, siSetup.ModifiedBy, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responses = ResponseIL.ConvertResponseList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
        }
        internal static bool DataMerge(List<SystemIntegratorIL> systemIntegrators)
        {
            bool result = false;
            try
            {
                DataTable ImportDataTable = new DataTable();
                ImportDataTable.Clear();
                ImportDataTable.Columns.Add("SystemIntegratorId");
                ImportDataTable.Columns.Add("SystemIntegratorName");
                ImportDataTable.Columns.Add("SystemIntegratorAddress");
                ImportDataTable.Columns.Add("MobileNumber");
                ImportDataTable.Columns.Add("EmailId");
                ImportDataTable.Columns.Add("DataStatus");
                ImportDataTable.Columns.Add("CreatedDate");
                ImportDataTable.Columns.Add("CreatedBy");
                ImportDataTable.Columns.Add("ModifiedDate");
                ImportDataTable.Columns.Add("ModifiedBy");
                ImportDataTable.Columns.Add("SessionId");
                DataRow row;
                string SessionId = CommonLibrary.Constants.RandomString(10);
                for (int i = 0; i < systemIntegrators.Count; i++)
                {
                    row = ImportDataTable.NewRow();
                    row["SystemIntegratorId"] = systemIntegrators[i].SystemIntegratorId;
                    row["SystemIntegratorName"] = systemIntegrators[i].SystemIntegratorName;
                    row["SystemIntegratorAddress"] = systemIntegrators[i].SystemIntegratorAddress;
                    row["MobileNumber"] = systemIntegrators[i].SystemIntegratorMobileNumber;
                    row["EmailId"] = systemIntegrators[i].SystemIntegratorEmailId;
                    row["DataStatus"] = systemIntegrators[i].DataStatus;
                    row["CreatedDate"] = systemIntegrators[i].CreatedDate;
                    row["CreatedBy"] = systemIntegrators[i].CreatedBy;
                    row["ModifiedDate"] = systemIntegrators[i].ModifiedDate;
                    row["ModifiedBy"] = systemIntegrators[i].ModifiedBy;
                    row["SessionId"] = SessionId;
                    ImportDataTable.Rows.Add(row);
                }
                if (SystemConstants.BulkCopy(ImportDataTable, "temp_SystemIntegratorConfiguration"))
                {
                    string spName = "USP_SystemIntegratorMerge";
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
        internal static List<SystemIntegratorIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<SystemIntegratorIL> clients = new List<SystemIntegratorIL>();
            try
            {
                string spName = "USP_SystemIntegratorGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    clients.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return clients;

        }
        internal static List<SystemIntegratorIL> GetActive()
        {
            List<SystemIntegratorIL> crlist = new List<SystemIntegratorIL>();
            try
            {
                crlist = GetAll();
                return crlist.FindAll(n => n.DataStatus == (short)CommonLibrary.Constants.DataStatusType.Active);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        internal static SystemIntegratorIL GetById(short SystemIntegratorId)
        {
            DataTable dt = new DataTable();
            SystemIntegratorIL client = new SystemIntegratorIL();
            try
            {
                string spName = "USP_SystemIntegratorGetbyId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SystemIntegratorId", DbType.Int16, SystemIntegratorId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    client = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return client;
        }
        #endregion

        #region Helper Methods
        private static SystemIntegratorIL CreateObjectFromDataRow(DataRow dr)
        {
            SystemIntegratorIL systemIntegrator = new SystemIntegratorIL();

            if (dr["SystemIntegratorId"] != DBNull.Value)
                systemIntegrator.SystemIntegratorId = Convert.ToInt16(dr["SystemIntegratorId"]);

            if (dr["SystemIntegratorName"] != DBNull.Value)
                systemIntegrator.SystemIntegratorName = Convert.ToString(dr["SystemIntegratorName"]);

            if (dr["SystemIntegratorAddress"] != DBNull.Value)
                systemIntegrator.SystemIntegratorAddress = Convert.ToString(dr["SystemIntegratorAddress"]);

            if (dr["SystemIntegratorMobileNumber"] != DBNull.Value)
                systemIntegrator.SystemIntegratorMobileNumber = Convert.ToString(dr["SystemIntegratorMobileNumber"]);

            if (dr["SystemIntegratorEmailId"] != DBNull.Value)
                systemIntegrator.SystemIntegratorEmailId = Convert.ToString(dr["SystemIntegratorEmailId"]);

            if (dr["DataStatus"] != DBNull.Value)
                systemIntegrator.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            if (dr["CreatedDate"] != DBNull.Value)
                systemIntegrator.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                systemIntegrator.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                systemIntegrator.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                systemIntegrator.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            systemIntegrator.DataStatusName = Enum.GetName(typeof(CommonLibrary.Constants.DataStatusType), (CommonLibrary.Constants.DataStatusType)systemIntegrator.DataStatus);

            return systemIntegrator;
        }
        #endregion
    }
}
