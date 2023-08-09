using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class LogingActivityDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_LogingActivity";
        #endregion

        internal static void InsertUpdate(LogingActivityIL activity)
        {
            try
            {

                string spName = "USP_LogingActivityInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LoginId", DbType.String, activity.LoginId, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.String, activity.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneNumber", DbType.Int16, activity.LaneNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LoginStatus", DbType.Int16, activity.LoginStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneTransId", DbType.Int64, activity.LaneTransId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, activity.CreatedDate, ParameterDirection.Input));
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
