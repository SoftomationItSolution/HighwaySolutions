using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class RoleManagementDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_RoleMaster";
        #endregion

        internal static List<ResponseIL> InsertUpdate(RoleManagementIL role)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_RoleInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RoleId", DbType.Int32, role.RoleId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RoleName", DbType.String, role.RoleName.Trim(), ParameterDirection.Input, 200));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, role.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, role.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CDateTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responses = ResponseIL.ConvertResponseList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
        }

        #region Get Methods
        internal static List<RoleManagementIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<RoleManagementIL> roles = new List<RoleManagementIL>();
            try
            {
                string spName = "USP_RolesGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    roles.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return roles;

        }
        internal static List<RoleManagementIL> GetActive()
        {
            List<RoleManagementIL> roleList = new List<RoleManagementIL>();
            try
            {
                roleList = GetAll();
                return roleList.FindAll(n => n.DataStatus == (short)SystemConstants.DataStatusType.Active);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        internal static RoleManagementIL GetById(Int32 RoleId)
        {
            DataTable dt = new DataTable();
            RoleManagementIL role = new RoleManagementIL();
            try
            {
                string spName = "USP_RolesGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RoleId", DbType.Int32, RoleId, ParameterDirection.Input));
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
        private static RoleManagementIL CreateObjectFromDataRow(DataRow dr)
        {
            RoleManagementIL role = new RoleManagementIL();

            if (dr["RoleId"] != DBNull.Value)
                role.RoleId = Convert.ToInt64(dr["RoleId"]);

            if (dr["RoleName"] != DBNull.Value)
                role.RoleName = Convert.ToString(dr["RoleName"]);

            if (dr["DataStatus"] != DBNull.Value)
                role.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            if (dr["CreatedDate"] != DBNull.Value)
                role.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                role.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                role.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                role.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            role.DataStatusName = Enum.GetName(typeof(SystemConstants.DataStatusType), (SystemConstants.DataStatusType)role.DataStatus);
            role.RolePermission = RolePermissionDL.GetByRoleId(role.RoleId);

            return role;
        }
        #endregion
    }
}
