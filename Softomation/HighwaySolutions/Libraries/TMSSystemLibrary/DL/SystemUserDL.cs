using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class SystemUserDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_UserMaster";
        #endregion
        internal static List<ResponseIL> InsertUpdate(SystemUserIL user)
        {
            List<ResponseIL> responses = null;
            try
            {
                user.LoginPassword = SystemConstants.Encrypt(user.LoginPassword);
                string spName = "USP_UserInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, user.UserId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LoginId", DbType.String, user.LoginId.Trim(), ParameterDirection.Input, 40));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LoginPassword", DbType.String, user.LoginPassword, ParameterDirection.Input, 200));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FirstName", DbType.String, user.FirstName.Trim(), ParameterDirection.Input, 40));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LastName", DbType.String, user.LastName.Trim(), ParameterDirection.Input, 40));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EmailId", DbType.String, user.EmailId.Trim(), ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MobileNumber", DbType.String, user.MobileNumber.Trim(), ParameterDirection.Input, 30));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AccountExpiredDate", DbType.Date, user.AccountExpiredDate, ParameterDirection.Input, 30));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int32, user.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserTypeId", DbType.Int32, user.UserTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RoleId", DbType.Int32, user.RoleId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, user.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, user.CreatedBy, ParameterDirection.Input));
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
        internal static List<ResponseIL> UpdatePassword(SystemUserIL user)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_UserUpdatePassword";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, user.UserId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LoginPassword", DbType.String, SystemConstants.Encrypt(user.LoginPassword), ParameterDirection.Input, 200));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CDateTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, user.CreatedBy, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responses = ResponseIL.ConvertResponseList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
        }
        internal static List<ResponseIL> UserProfileChange(SystemUserIL user)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_UserProfileChange";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, user.UserId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserProfileImage", DbType.String, user.UserProfileImage, ParameterDirection.Input, 200));
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
        internal static List<SystemUserIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<SystemUserIL> users = new List<SystemUserIL>();
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
        internal static List<SystemUserIL> GetActive()
        {
            List<SystemUserIL> usersList = new List<SystemUserIL>();
            try
            {
                usersList = GetAll();
                return usersList.FindAll(n => n.DataStatus == 1);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        internal static SystemUserIL GetById(Int32 UserId)
        {
            DataTable dt = new DataTable();
            SystemUserIL user = new SystemUserIL();
            try
            {
                string spName = "USP_UserGetbyId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, UserId, ParameterDirection.Input));
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
        internal static SystemUserIL GetByLoginId(SystemUserIL login)
        {
            DataTable dt = new DataTable();
            SystemUserIL account = new SystemUserIL();
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

        internal static List<SystemUserIL> GetByUserType(short UserTypeId)
        {
            DataTable dt = new DataTable();
            List<SystemUserIL> users = new List<SystemUserIL>();
            try
            {
                string spName = "USP_UserGetByUserTypeId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserTypeId", DbType.Int32, UserTypeId, ParameterDirection.Input));
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

        internal static List<SystemUserIL> GetBySystemUserType(short UserTypeId, short SystemId)
        {
            DataTable dt = new DataTable();
            List<SystemUserIL> users = new List<SystemUserIL>();
            try
            {
                string spName = "USP_UserGetBySystemUserTypeId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserTypeId", DbType.Int32, UserTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SystemId", DbType.Int32, SystemId, ParameterDirection.Input));
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
        #endregion

        #region Helper Methods
        private static SystemUserIL CreateObjectFromDataRow(DataRow dr)
        {
            SystemUserIL user = new SystemUserIL();

            if (dr["UserId"] != DBNull.Value)
                user.UserId = Convert.ToInt64(dr["UserId"]);

            if (dr["LoginId"] != DBNull.Value)
                user.LoginId = Convert.ToString(dr["LoginId"]);

            if (dr["LoginPassword"] != DBNull.Value)
                user.LoginPassword = Convert.ToString(dr["LoginPassword"]);

            if (dr["FirstName"] != DBNull.Value)
                user.FirstName = Convert.ToString(dr["FirstName"]);

            if (dr["LastName"] != DBNull.Value)
                user.LastName = Convert.ToString(dr["LastName"]);

            if (dr["AccountExpiredDate"] != DBNull.Value)
                user.AccountExpiredDate = Convert.ToDateTime(dr["AccountExpiredDate"]);

            if (dr["EmailId"] != DBNull.Value)
                user.EmailId = Convert.ToString(dr["EmailId"]);

            if (dr["MobileNumber"] != DBNull.Value)
                user.MobileNumber = Convert.ToString(dr["MobileNumber"]);

            if (dr["UserTypeId"] != DBNull.Value)
                user.UserTypeId = Convert.ToInt16(dr["UserTypeId"]);

            if (dr["UserProfileImage"] != DBNull.Value)
                user.UserProfileImage = Convert.ToString(dr["UserProfileImage"]);
            else
                user.UserProfileImage = "/User/ProfileImage/avatar-7.jpg";
            
            if (dr["RoleId"] != DBNull.Value)
                user.RoleId = Convert.ToInt32(dr["RoleId"]);

            if (dr["RoleName"] != DBNull.Value)
                user.RoleName = Convert.ToString(dr["RoleName"]);

            if (dr["PlazaId"] != DBNull.Value)
                user.PlazaId = Convert.ToInt16(dr["PlazaId"]);

            if (dr["PlazaName"] != DBNull.Value)
                user.PlazaName = Convert.ToString(dr["PlazaName"]);

            if (dr["CreatedDate"] != DBNull.Value)
                user.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                user.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                user.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                user.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["DataStatus"] != DBNull.Value)
                user.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            if (dr["RoleName"] != DBNull.Value)
                user.RoleName = Convert.ToString(dr["RoleName"]);

            user.UserTypeName = Enum.GetName(typeof(SystemConstants.AppUserType), (SystemConstants.AppUserType)user.UserTypeId);
            user.DataStatusName = Enum.GetName(typeof(SystemConstants.DataStatusType), (SystemConstants.DataStatusType)user.DataStatus);
            return user;
        }
        #endregion
    }
}
