using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class RoleManagementDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_RoleMaster";
        #endregion

        internal static List<ResponceIL> InsertUpdate(RoleManagementIL role)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_RoleInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, role.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, role.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int32, role.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RoleName", DbType.String, role.RoleName.Trim(), ParameterDirection.Input, 200));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, role.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, role.CreatedBy, ParameterDirection.Input));
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
        internal static List<ResponceIL> PInsertUpdate(RoleManagementIL role)
        {
            List<ResponceIL> responces = null;
            try
            {

                string spName = "USP_RoleInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, role.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, role.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int32, role.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RoleName", DbType.String, role.RoleName.Trim(), ParameterDirection.Input, 200));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, role.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, role.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, role.CreatedDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, role.ModifiedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, role.ModifiedDate, ParameterDirection.Input));
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
                string spName = "USP_RoleMarkedDeleted";
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
                string spName = "USP_RoleDeletedData";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
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
            DataTable dt = new DataTable();
            List<RoleManagementIL> roles = new List<RoleManagementIL>();
            try
            {
                string spName = "USP_RolesGetActive";
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
        internal static RoleManagementIL GetById(Int32 RoleId)
        {
            DataTable dt = new DataTable();
            RoleManagementIL role = new RoleManagementIL();
            try
            {
                string spName = "USP_RolesGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, RoleId, ParameterDirection.Input));
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
        internal static List<RoleManagementIL> GetByClientPlazaId(UserManagementIL user)
        {
            DataTable dt = new DataTable();
            List<RoleManagementIL> roles = new List<RoleManagementIL>();
            try
            {
                string spName = "USP_RolesGetByClientPlazaId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, user.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int32, user.PlazaId, ParameterDirection.Input));
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
        #endregion

        #region Helper Methods
        private static RoleManagementIL CreateObjectFromDataRow(DataRow dr)
        {
            RoleManagementIL role = new RoleManagementIL();

            if (dr["EntryId"] != DBNull.Value)
                role.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["ClientId"] != DBNull.Value)
                role.ClientId = Convert.ToInt16(dr["ClientId"]);

            if (dr["PlazaId"] != DBNull.Value)
                role.PlazaId = Convert.ToInt16(dr["PlazaId"]);

            if (dr["RoleName"] != DBNull.Value)
                role.RoleName = Convert.ToString(dr["RoleName"]);

            if (dr["DataStatus"] != DBNull.Value)
            {
                role.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (role.DataStatus != 1)
                    role.DataStatusName = "Inactive";
            }

            if (dr["CreatedDate"] != DBNull.Value)
                role.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                role.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                role.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                role.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (role.EntryId > 0)
            {
                role.RolePermission = RolePermissionDL.GetByRoleId(role.EntryId);
            }

            return role;
        }
        #endregion
    }
}
