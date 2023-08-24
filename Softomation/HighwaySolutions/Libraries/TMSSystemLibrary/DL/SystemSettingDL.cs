using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;


namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class SystemSettingDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_SystemSetting";
        #endregion

        internal static List<ResponseIL> InsertUpdate(SystemSettingIL setting)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_SystemSettingInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DefaultPlazaId", DbType.Int16, setting.DefaultPlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TollingTypeId", DbType.Int16, setting.TollingTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AllotmentDays", DbType.Int16, setting.AllotmentDays, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CashPenalty", DbType.Boolean, setting.CashPenalty, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LoginAccess", DbType.Boolean, setting.LoginAccess, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ExemptAccess", DbType.Boolean, setting.ExemptAccess, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FleetAccess", DbType.Boolean, setting.FleetAccess, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@OpeningBalance", DbType.Decimal, setting.OpeningBalance, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, setting.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, setting.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, setting.ModifiedBy, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responses = ResponseIL.ConvertResponseList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
        }

        internal static SystemSettingIL Get()
        {
            DataTable dt = new DataTable();
            SystemSettingIL config = new SystemSettingIL();
            try
            {
                string spName = "USP_SystemSettingGet";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    config = CreateObjectFromDataRow(dr);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return config;
        }

        #region Helper Methods
        private static SystemSettingIL CreateObjectFromDataRow(DataRow dr)
        {
            SystemSettingIL setting = new SystemSettingIL();

            if (dr["DefaultPlazaId"] != DBNull.Value)
                setting.DefaultPlazaId = Convert.ToInt16(dr["DefaultPlazaId"]);

            if (dr["TollingTypeId"] != DBNull.Value)
                setting.TollingTypeId = Convert.ToInt16(dr["TollingTypeId"]);

            if (dr["AllotmentDays"] != DBNull.Value)
                setting.AllotmentDays = Convert.ToInt16(dr["AllotmentDays"]);

            if (dr["CashPenalty"] != DBNull.Value)
                setting.CashPenalty = Convert.ToBoolean(dr["CashPenalty"]);

            if (dr["LoginAccess"] != DBNull.Value)
                setting.LoginAccess = Convert.ToBoolean(dr["LoginAccess"]);

            if (dr["ExemptAccess"] != DBNull.Value)
                setting.ExemptAccess = Convert.ToBoolean(dr["ExemptAccess"]);

            if (dr["FleetAccess"] != DBNull.Value)
                setting.FleetAccess = Convert.ToBoolean(dr["FleetAccess"]);

            if (dr["OpeningBalance"] != DBNull.Value)
                setting.OpeningBalance = Convert.ToDecimal(dr["OpeningBalance"]);

            if (dr["ClosingBalance"] != DBNull.Value)
                setting.ClosingBalance = Convert.ToDecimal(dr["ClosingBalance"]);

            if (dr["DataStatus"] != DBNull.Value)
                setting.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            if (dr["CreatedDate"] != DBNull.Value)
                setting.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                setting.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                setting.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                setting.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);
            setting.DataStatusName = Enum.GetName(typeof(SystemConstants.DataStatusType), (SystemConstants.DataStatusType)setting.DataStatus);
            return setting;
        }
        #endregion
    }
}
