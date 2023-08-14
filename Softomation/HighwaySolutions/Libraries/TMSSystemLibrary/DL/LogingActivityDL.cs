using System;
using System.Data;
using System.Data.Common;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class LogingActivityDL
    {
        #region Global Varialble
        static string tableName = "tbl_LogingActivity";
        #endregion
        internal static void Insert(LogingActivityIL activity)
        {
            try
            {

                string spName = "USP_LogingActivityInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LoginId", DbType.String, activity.LoginId, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserTypeId", DbType.Int64, activity.UserTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LoginDateTime", DbType.DateTime, activity.LoginDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LogoutDateTime", DbType.DateTime, activity.LogoutDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LoginStatusId", DbType.Int16, activity.LoginStatusId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        internal static void Update(LogingActivityIL activity)
        {
            try
            {

                string spName = "USP_LogingActivityUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LoginId", DbType.String, activity.LoginId, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserTypeId", DbType.Int64, activity.UserTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LoginDateTime", DbType.DateTime, activity.LoginDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LogoutDateTime", DbType.DateTime, activity.LogoutDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LoginStatusId", DbType.Int16, activity.LoginStatusId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
