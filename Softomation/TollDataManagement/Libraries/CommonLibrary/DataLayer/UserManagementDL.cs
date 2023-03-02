using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class UserManagementDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_UserMaster";
        #endregion

        internal static List<ResponceIL> InsertUpdate(UserManagementIL user)
        {
            List<ResponceIL> responces = null;
            try
            {

                string spName = "USP_UserInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, user.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, user.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int32, user.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LoginId", DbType.String, user.LoginId.Trim(), ParameterDirection.Input, 40));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LoginPassword", DbType.String, Constants.Encrypt(user.LoginPassword.Trim()), ParameterDirection.Input, 200));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FirstName", DbType.String, user.FirstName.Trim(), ParameterDirection.Input, 40));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LastName", DbType.String, user.LastName.Trim(), ParameterDirection.Input, 40));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EmailId", DbType.String, user.EmailId.Trim(), ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MobileNumber", DbType.String, user.MobileNumber.Trim(), ParameterDirection.Input, 30));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserType", DbType.Int16, user.UserType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AccountExpiredDate", DbType.Date, user.AccountExpiredDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, user.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RoleId", DbType.Int32, user.RoleId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, user.CreatedBy, ParameterDirection.Input));
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

        internal static List<ResponceIL> PInsertUpdate(UserManagementIL user)
        {
            List<ResponceIL> responces = null;
            try
            {

                string spName = "USP_UserInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, user.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, user.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int32, user.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LoginId", DbType.String, user.LoginId.Trim(), ParameterDirection.Input, 40));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LoginPassword", DbType.String, user.LoginPassword, ParameterDirection.Input, 200));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FirstName", DbType.String, user.FirstName.Trim(), ParameterDirection.Input, 40));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LastName", DbType.String, user.LastName.Trim(), ParameterDirection.Input, 40));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EmailId", DbType.String, user.EmailId.Trim(), ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MobileNumber", DbType.String, user.MobileNumber.Trim(), ParameterDirection.Input, 30));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserType", DbType.Int16, user.UserType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AccountExpiredDate", DbType.Date, user.AccountExpiredDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, user.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RoleId", DbType.Int32, user.RoleId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, user.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, user.CreatedDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, user.ModifiedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, user.ModifiedDate, ParameterDirection.Input));
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
                string spName = "USP_UserMarkedDeleted";
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
                string spName = "USP_UserDeletedData";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        internal static void UpdatePassword(UserManagementIL user)
        {
            try
            {

                string spName = "USP_UserUpdatePassword";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, user.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LoginPassword", DbType.String, Constants.Encrypt(user.LoginPassword), ParameterDirection.Input, 200));
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #region Get Methods
        internal static List<UserManagementIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<UserManagementIL> users = new List<UserManagementIL>();
            try
            {
                string spName = "USP_UserGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    users.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return users;

        }
        internal static List<UserManagementIL> GetActive()
        {
            DataTable dt = new DataTable();
            List<UserManagementIL> users = new List<UserManagementIL>();
            try
            {
                string spName = "USP_UserGetActive";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    users.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return users;

        }
        internal static List<UserManagementIL> GetAllLaneUsers()
        {
            DataTable dt = new DataTable();
            List<UserManagementIL> users = new List<UserManagementIL>();
            try
            {
                string spName = "USP_UserGetByLaneUsers";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    users.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return users;

        }
        internal static List<UserManagementIL> GetAllLaneUsersActive()
        {
            DataTable dt = new DataTable();
            List<UserManagementIL> users = new List<UserManagementIL>();
            try
            {
                string spName = "USP_UserGetByLaneUsersActive";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    users.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return users;

        }
        internal static List<UserManagementIL> SharedLaneUsers()
        {
            DataTable dt = new DataTable();
            List<UserManagementIL> users = new List<UserManagementIL>();
            try
            {
                string spName = "USP_UserGetByLaneUsers";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    users.Add(CreateObjectFromDataRowDecryptPassword(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return users;
        }
        internal static List<UserManagementIL> GetByClientPlazaId(UserManagementIL user)
        {
            DataTable dt = new DataTable();
            List<UserManagementIL> users = new List<UserManagementIL>();
            try
            {
                string spName = "USP_UserGetByClientPlazaId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, user.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int32, user.PlazaId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    users.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return users;
        }
        internal static List<UserManagementIL> GetByClientPlazaIdActive(UserManagementIL user)
        {
            DataTable dt = new DataTable();
            List<UserManagementIL> users = new List<UserManagementIL>();
            try
            {
                string spName = "USP_UserGetByClientPlazaIdActive";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, user.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int32, user.PlazaId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    users.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return users;
        }
        internal static List<UserManagementIL> GetByClientId(Int32 ClientId)
        {
            DataTable dt = new DataTable();
            List<UserManagementIL> users = new List<UserManagementIL>();
            try
            {
                string spName = "USP_UserGetByClientId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, ClientId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    users.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return users;
        }
        internal static List<UserManagementIL> GetByClientIdActive(Int32 ClientId)
        {
            DataTable dt = new DataTable();
            List<UserManagementIL> users = new List<UserManagementIL>();
            try
            {
                string spName = "USP_UserGetByClientIdActive";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, ClientId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    users.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return users;
        }
        internal static UserManagementIL GetById(Int32 UserId)
        {
            DataTable dt = new DataTable();
            UserManagementIL user = new UserManagementIL();
            try
            {
                string spName = "USP_UserGetbyId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, UserId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    user = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return user;
        }
        internal static UserManagementIL GetByLoginId(UserManagementIL login)
        {
            DataTable dt = new DataTable();
            UserManagementIL account = new UserManagementIL();
            try
            {
                string spName = "USP_UsersGetByLoginId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LoginId", DbType.String, login.LoginId, ParameterDirection.Input, 50));
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
        #endregion

        #region Helper Methods
        private static UserManagementIL CreateObjectFromDataRow(DataRow dr)
        {
            UserManagementIL user = new UserManagementIL();

            if (dr["EntryId"] != DBNull.Value)
                user.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["ClientId"] != DBNull.Value)
                user.ClientId = Convert.ToInt16(dr["ClientId"]);

            if (dr["ClientName"] != DBNull.Value)
                user.ClientName = Convert.ToString(dr["ClientName"]);

            if (dr["PlazaId"] != DBNull.Value)
                user.PlazaId = Convert.ToInt32(dr["PlazaId"]);

            if (dr["PlazaName"] != DBNull.Value)
                user.PlazaName = Convert.ToString(dr["PlazaName"]);

            if (dr["LoginId"] != DBNull.Value)
                user.LoginId = Convert.ToString(dr["LoginId"]);

            if (dr["LoginPassword"] != DBNull.Value)
                user.LoginPassword = Convert.ToString(dr["LoginPassword"]);

            //if (dr["LoginPassword"] != DBNull.Value)
            //{
            //    user.LoginPassword = Convert.ToString(dr["LoginPassword"]);
            //    user.LoginPassword = Constants.Decrypt(user.LoginPassword);
            //}

            if (dr["FirstName"] != DBNull.Value)
                user.FirstName = Convert.ToString(dr["FirstName"]);

            if (dr["LastName"] != DBNull.Value)
                user.LastName = Convert.ToString(dr["LastName"]);

            if (dr["EmailId"] != DBNull.Value)
                user.EmailId = Convert.ToString(dr["EmailId"]);

            if (dr["MobileNumber"] != DBNull.Value)
                user.MobileNumber = Convert.ToString(dr["MobileNumber"]);

            if (dr["RoleId"] != DBNull.Value)
                user.RoleId = Convert.ToInt32(dr["RoleId"]);

            if (dr["CreatedDate"] != DBNull.Value)
                user.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                user.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                user.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                user.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["AccountExpiredDate"] != DBNull.Value)
                user.AccountExpiredDate = Convert.ToDateTime(dr["AccountExpiredDate"]);

            if (dr["DataStatus"] != DBNull.Value)
            {
                user.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (user.DataStatus != 1)
                    user.DataStatusName = "Inactive";
            }

            if (dr["RoleName"] != DBNull.Value)
                user.RoleName = Convert.ToString(dr["RoleName"]);

            if (dr["UserType"] != DBNull.Value)
            {
                user.UserType = Convert.ToInt16(dr["UserType"]);
                if (user.UserType == 1)
                    user.UserTypeName = "Central Server";
                else if (user.UserType == 2)
                    user.UserTypeName = "Plaza Server";
                else
                    user.UserTypeName = "Lane Server";
            }

            return user;
        }

        private static UserManagementIL CreateObjectFromDataRowDecryptPassword(DataRow dr)
        {
            UserManagementIL user = new UserManagementIL();

            if (dr["EntryId"] != DBNull.Value)
                user.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["ClientId"] != DBNull.Value)
                user.ClientId = Convert.ToInt16(dr["ClientId"]);

            if (dr["ClientName"] != DBNull.Value)
                user.ClientName = Convert.ToString(dr["ClientName"]);

            if (dr["PlazaId"] != DBNull.Value)
                user.PlazaId = Convert.ToInt32(dr["PlazaId"]);

            if (dr["PlazaName"] != DBNull.Value)
                user.PlazaName = Convert.ToString(dr["PlazaName"]);

            if (dr["LoginId"] != DBNull.Value)
                user.LoginId = Convert.ToString(dr["LoginId"]);

            if (dr["LoginPassword"] != DBNull.Value)
            {
                user.LoginPassword = Convert.ToString(dr["LoginPassword"]);
                user.LoginPassword = Constants.Decrypt(user.LoginPassword);
            }

            if (dr["FirstName"] != DBNull.Value)
                user.FirstName = Convert.ToString(dr["FirstName"]);

            if (dr["LastName"] != DBNull.Value)
                user.LastName = Convert.ToString(dr["LastName"]);

            if (dr["EmailId"] != DBNull.Value)
                user.EmailId = Convert.ToString(dr["EmailId"]);

            if (dr["MobileNumber"] != DBNull.Value)
                user.MobileNumber = Convert.ToString(dr["MobileNumber"]);

            if (dr["RoleId"] != DBNull.Value)
                user.RoleId = Convert.ToInt32(dr["RoleId"]);

            if (dr["CreatedDate"] != DBNull.Value)
                user.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                user.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                user.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                user.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["AccountExpiredDate"] != DBNull.Value)
                user.AccountExpiredDate = Convert.ToDateTime(dr["AccountExpiredDate"]);

            if (dr["DataStatus"] != DBNull.Value)
                user.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            if (dr["RoleName"] != DBNull.Value)
                user.RoleName = Convert.ToString(dr["RoleName"]);

            if (dr["UserType"] != DBNull.Value)
            {
                user.UserType = Convert.ToInt16(dr["UserType"]);
                if (user.UserType == 1)
                    user.UserTypeName = "Central Server";
                else if (user.UserType == 2)
                    user.UserTypeName = "Plaza Server";
                else
                    user.UserTypeName = "Lane Server";
            }

            return user;
        }
        #endregion
    }
}
