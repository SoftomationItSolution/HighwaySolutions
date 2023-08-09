using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using Softomation.ATMSSystemLibrary.DBA;
using Softomation.ATMSSystemLibrary.IL;


namespace Softomation.ATMSSystemLibrary.DL
{
    internal class SystemDL
    {
        #region Global Varialble
        static string tableName = "tbl_SystemMaster";
        #endregion

        internal static List<ResponseIL> SetUp(List<SystemIL> setup)
        {
            List<ResponseIL> responses = null;
            try
            {
                DataTable ImportDataTable = new DataTable();
                ImportDataTable.Clear();
                ImportDataTable.Columns.Add("SystemId");
                ImportDataTable.Columns.Add("DataStatus");
                ImportDataTable.Columns.Add("DashBoard");
                ImportDataTable.Columns.Add("ReportIds");
                ImportDataTable.Columns.Add("SessionId");
                DataRow row;
                string SessionId = Constants.RandomString(10);
                StringBuilder xmlPermission = new StringBuilder();
                for (int i = 0; i < setup.Count; i++)
                {
                    row = ImportDataTable.NewRow();
                    row["SystemId"] = setup[i].SystemId;
                    row["DataStatus"] = setup[i].DataStatus;
                    row["DashBoard"] = setup[i].DashBoard;
                    if (setup[i].ReportIdList == null)
                        row["ReportIds"] = string.Empty;
                    else
                        row["ReportIds"] = string.Join(",", setup[i].ReportIdList);
                    row["SessionId"] = SessionId;
                    ImportDataTable.Rows.Add(row);
                }
                if (Constants.BulkCopy(ImportDataTable, "temp_SystemMaster"))
                {
                    string spName = "USP_SystemUpdate";
                    DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SessionId", DbType.String, SessionId, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, setup[0].CreatedBy, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, setup[0].ModifiedBy, ParameterDirection.Input));
                    DataTable dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                    responses = ResponseIL.ConvertResponseList(dt);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
        }

        #region Get Methods
        internal static List<SystemIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<SystemIL> eds = new List<SystemIL>();
            try
            {
                string spName = "USP_SystemGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    eds.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return eds;

        }
        internal static List<SystemIL> GetActive()
        {
            List<SystemIL> smlist = new List<SystemIL>();
            try
            {
                smlist = GetAll();
                return smlist.FindAll(n => n.DataStatus == (short)Constants.DataStatusType.Active);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        internal static SystemIL GetById(short SystemId)
        {
            DataTable dt = new DataTable();
            SystemIL smData = new SystemIL();
            try
            {
                string spName = "USP_SystemGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SystemId", DbType.Int32, SystemId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    smData = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return smData;

        }
        internal static SystemIL GetByName(String SystemName)
        {
            DataTable dt = new DataTable();
            SystemIL smData = new SystemIL();
            try
            {
                string spName = "USP_SystemGetByName";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SystemName", DbType.String, SystemName, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    smData = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return smData;

        }
        #endregion

        #region Helper Methods
        private static SystemIL CreateObjectFromDataRow(DataRow dr)
        {
            SystemIL sm = new SystemIL();

            if (dr["SystemId"] != DBNull.Value)
                sm.SystemId = Convert.ToInt16(dr["SystemId"]);

            if (dr["SystemName"] != DBNull.Value)
                sm.SystemName = Convert.ToString(dr["SystemName"]);

            if (dr["ApiPort"] != DBNull.Value)
                sm.ApiPort = Convert.ToInt32(dr["ApiPort"]);

            if (dr["AppPort"] != DBNull.Value)
                sm.AppPort = Convert.ToInt32(dr["AppPort"]);

            if (dr["DashBoard"] != DBNull.Value)
                sm.DashBoard = Convert.ToBoolean(dr["DashBoard"]);

            if (dr["SystemDescription"] != DBNull.Value)
                sm.SystemDescription = Convert.ToString(dr["SystemDescription"]);

            if (dr["SystemImage"] != DBNull.Value)
                sm.SystemImage = Convert.ToString(dr["SystemImage"]);

            if (dr["SystemIcon"] != DBNull.Value)
                sm.SystemIcon = Convert.ToString(dr["SystemIcon"]);

            if (dr["ReportIds"] != DBNull.Value)
            {
                sm.ReportIds = Convert.ToString(dr["ReportIds"]);
                if (!string.IsNullOrEmpty(sm.ReportIds))
                {
                    sm.ReportIdList = sm.ReportIds?.Split(',')?.Select(Int16.Parse)?.ToArray();
                    sm.ReportMastersList = ReportMasterDL.GetByIds(sm.ReportIds);
                }
            }

            if (dr["DataStatus"] != DBNull.Value)
                sm.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            if (dr["CreatedDate"] != DBNull.Value)
                sm.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                sm.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                sm.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                sm.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            sm.DataStatusName = Enum.GetName(typeof(Constants.DataStatusType), (Constants.DataStatusType)sm.DataStatus);
            return sm;
        }
        #endregion
    }
}
