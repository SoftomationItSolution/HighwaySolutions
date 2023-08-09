using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.DL
{
    internal class RolePermissionDL
    {
        static string tableName = "tbl_RolePermission";

        internal static List<ResponseIL> ImportData(RoleManagementIL role)
        {
            List<ResponseIL> responses = null;
            try
            {
                DataTable ImportDataTable = new DataTable();
                ImportDataTable.Clear();
                ImportDataTable.Columns.Add("MenuId");
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
                    row["MenuId"] = role.RolePermission[i].MenuId;
                    row["DataView"] = role.RolePermission[i].DataView;
                    row["DataAdd"] = role.RolePermission[i].DataAdd;
                    row["DataUpdate"] = role.RolePermission[i].DataUpdate;
                    row["SessionId"] = SessionId;
                    ImportDataTable.Rows.Add(row);
                }
                if (Constants.BulkCopy(ImportDataTable, "temp_ImportPermission"))
                {
                    string spName = "USP_RolePermissionInsertUpdate";
                    DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SessionId", DbType.String, SessionId, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RoleId", DbType.Int32, role.RoleId, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, role.DataStatus, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, role.CreatedBy, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CDateTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
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
        internal static RolePermissionIL GetByMenu(RolePermissionIL rolePermission)
        {
            DataTable dt = new DataTable();
            RolePermissionIL role = new RolePermissionIL();
            try
            {
                string spName = "USP_RolesPersmissionGetByMenu";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MenuURL", DbType.String, rolePermission.MenuUrl, ParameterDirection.Input,100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SystemId", DbType.Int32, rolePermission.SystemId, ParameterDirection.Input));
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
                rolePermissions = UpdateChildCount(rolePermissions);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return rolePermissions;
        }
        #endregion

        #region Helper Methods
        private static List<RolePermissionIL> UpdateChildCount(List<RolePermissionIL> menus)
        {
            try
            {
                List<RolePermissionIL> UpdatedMenu = new List<RolePermissionIL>();
                if (menus.Count > 0)
                {
                    List<RolePermissionIL> filtered = menus.FindAll(e => e.ParentId == 0);

                    foreach (RolePermissionIL item in filtered)
                    {
                        List<RolePermissionIL> Subfiltered = menus.FindAll(e => e.ParentId == item.MenuId);
                        if (Subfiltered.Count > 0)
                        {
                            UpdatedMenu = menus.Where(w => w.MenuId == item.MenuId).Select(s => { s.ChildCount = Convert.ToInt16(Subfiltered.Count); return s; }).ToList();
                        }
                    }
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }

            return menus;
        }
        private static RolePermissionIL CreateObjectFromDataRow(DataRow dr)
        {
            RolePermissionIL permission = new RolePermissionIL();

            if (dr["MenuId"] != DBNull.Value)
                permission.MenuId = Convert.ToInt32(dr["MenuId"]);

            if (dr["ParentId"] != DBNull.Value)
                permission.ParentId = Convert.ToInt32(dr["ParentId"]);

            if (dr["MenuName"] != DBNull.Value)
                permission.MenuName = Convert.ToString(dr["MenuName"]);

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
                permission.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            permission.DataStatusName = Enum.GetName(typeof(Constants.DataStatusType), (Constants.DataStatusType)permission.DataStatus);
            return permission;
        }
        #endregion
    }
}
