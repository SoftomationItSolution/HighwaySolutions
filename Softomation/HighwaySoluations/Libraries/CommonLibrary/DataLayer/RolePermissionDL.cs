using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Text;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.BusinessLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class RolePermissionDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_RolePermission";
        #endregion

        internal static List<ResponceIL> ImportData(RoleManagementIL role)
        {
            List<ResponceIL> responces = null;
            try
            {
                DataTable ImportDataTable = new DataTable();
                ImportDataTable.Clear();
                ImportDataTable.Columns.Add("EventId");
                ImportDataTable.Columns.Add("DataView");
                ImportDataTable.Columns.Add("DataAdd");
                ImportDataTable.Columns.Add("DataUpdate");
                ImportDataTable.Columns.Add("SessionId");
                DataRow row;
                string SessionId = Constants.RandomString(10);
                StringBuilder xmlPermission = new StringBuilder();
                for (int i = 0; i < role.RolePermission.Count; i++)
                {
                    row = ImportDataTable.NewRow();
                    row["EventId"] = role.RolePermission[i].EventId;
                    row["DataView"] = role.RolePermission[i].DataView;
                    row["DataAdd"] = role.RolePermission[i].DataAdd;
                    row["DataUpdate"] = role.RolePermission[i].DataUpdate;
                    row["SessionId"] = SessionId;
                    ImportDataTable.Rows.Add(row);
                }
                if (BulkCopy(ImportDataTable, "tbl_TempImportPermission"))
                {
                    string spName = "USP_RolePermissionInsertUpdate";
                    DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SessionId", DbType.String, SessionId, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RoleId", DbType.Int32, role.EntryId, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, role.DataStatus, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, role.CreatedBy, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CDateTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                    dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                    responces = Constants.ConvertResponceList(dt);
                }


            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }

        #region Get Methods
        internal static List<RolePermissionIL> GetByRoleId(Int64 roleId)
        {
            DataTable dt = new DataTable();
            List<RolePermissionIL> rolePermissions = new List<RolePermissionIL>();
            try
            {
                string spName = "USP_RolesPersmissionGetByRoleId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RoleId", DbType.Int32, roleId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    rolePermissions.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return rolePermissions;
        }

        internal static RolePermissionIL GetByEventId(RolePermissionIL rolePermission)
        {
            DataTable dt = new DataTable();
            RolePermissionIL role = new RolePermissionIL();
            try
            {
                string spName = "USP_RolesPersmissionGetByEventId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EventId", DbType.Int32, rolePermission.EventId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RoleId", DbType.Int32, rolePermission.RoleId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    role = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return role;
        }
        #endregion

        #region Helper Methods

        private static bool BulkCopy(DataTable dt, string table)
        {
            bool error = true;
            SqlConnection con = (SqlConnection)DBAccessor.CreateConnection();
            con.Open();
            using (SqlBulkCopy bulcopy = new SqlBulkCopy(con))
            {
                bulcopy.DestinationTableName = table;
                try
                {
                    bulcopy.WriteToServer(dt);
                    con.Dispose();
                }
                catch (Exception ex)
                {
                    con.Dispose();
                    error = false;
                    throw ex;
                }
                return error;
            }
        }
        private static RolePermissionIL CreateObjectFromDataRow(DataRow dr)
        {
            RolePermissionIL permission = new RolePermissionIL();

            if (dr["EventId"] != DBNull.Value)
                permission.EventId = Convert.ToInt32(dr["EventId"]);

            if (dr["EventName"] != DBNull.Value)
                permission.EventName = Convert.ToString(dr["EventName"]);

            if (dr["RoleId"] != DBNull.Value)
                permission.RoleId = Convert.ToInt32(dr["RoleId"]);

            if (dr["DataView"] != DBNull.Value)
                permission.DataView = Convert.ToInt16(dr["DataView"]);

            if (dr["DataAdd"] != DBNull.Value)
                permission.DataAdd = Convert.ToInt16(dr["DataAdd"]);

            if (dr["DataUpdate"] != DBNull.Value)
                permission.DataUpdate = Convert.ToInt16(dr["DataUpdate"]);

            if (dr["CreatedDate"] != DBNull.Value)
                permission.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                permission.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                permission.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                permission.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);
            if (dr["DataStatus"] != DBNull.Value)
            {
                permission.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (permission.DataStatus != 1)
                    permission.DataStatusName = "Inactive";
            }

            return permission;
        }
        #endregion
    }
}
