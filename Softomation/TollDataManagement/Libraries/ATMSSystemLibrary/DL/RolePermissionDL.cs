using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using Softomation.ATMSSystemLibrary.DBA;
using Softomation.ATMSSystemLibrary.IL;

namespace Softomation.ATMSSystemLibrary.DL
{
    internal class RolePermissionDL
    {
        static string tableName = "tbl_RolePermission";

        #region Get Methods
        internal static RolePermissionIL GetByMenuId(RolePermissionIL rolePermission)
        {
            DataTable dt = new DataTable();
            RolePermissionIL role = new RolePermissionIL();
            try
            {
                string spName = "USP_RolesPersmissionGetByMenuId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MenuId", DbType.Int32, rolePermission.MenuId, ParameterDirection.Input));
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

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return rolePermissions;
        }
        #endregion
        
        #region Helper Methods
        private static RolePermissionIL CreateObjectFromDataRow(DataRow dr)
        {
            RolePermissionIL permission = new RolePermissionIL();

            if (dr["MenuId"] != DBNull.Value)
                permission.MenuId = Convert.ToInt32(dr["MenuId"]);

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

            permission.DataStatusName = Enum.GetName(typeof(Constants.DataStatus), (Constants.DataStatus)permission.DataStatus);
            return permission;
        }
        #endregion
    }
}
