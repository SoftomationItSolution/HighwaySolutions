using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class SystemSettingDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_SystemSetting";
        #endregion

        internal static List<ResponceIL> InsertUpdate(SystemSettingIL setting)
        {
            List<ResponceIL> responces = null;
            try
            {

                string spName = "USP_SystemSettingInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AllotmentDays", DbType.Int16, setting.AllotmentDays, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LoginAccess", DbType.Int16, setting.LoginAccess, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ExemptAccess", DbType.Int16, setting.ExemptAccess, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, setting.CreatedBy, ParameterDirection.Input));
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

        #region Get Methods
        internal static SystemSettingIL GetSetting()
        {
            DataTable dt = new DataTable();
            SystemSettingIL setting = new SystemSettingIL();
            try
            {
                string spName = "USP_SystemSettingGet";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    setting=CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return setting;
        }
        #endregion

        #region Helper Methods
        private static SystemSettingIL CreateObjectFromDataRow(DataRow dr)
        {
            SystemSettingIL setting = new SystemSettingIL();
            if (dr["AllotmentDays"] != DBNull.Value)
                setting.AllotmentDays = Convert.ToInt16(dr["AllotmentDays"]);

            if (dr["LoginAccess"] != DBNull.Value)
                setting.LoginAccess = Convert.ToInt16(dr["LoginAccess"]);

            if (dr["ExemptAccess"] != DBNull.Value)
                setting.ExemptAccess = Convert.ToInt16(dr["ExemptAccess"]);

            if (dr["DataStatus"] != DBNull.Value)
            {
                setting.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (setting.DataStatus != 1)
                    setting.DataStatusName = "Inactive";
            }

            if (dr["CreatedDate"] != DBNull.Value)
                setting.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                setting.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                setting.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                setting.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            return setting;
        }
        #endregion
    }
}
