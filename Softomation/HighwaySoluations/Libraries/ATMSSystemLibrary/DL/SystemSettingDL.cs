﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.DL
{
    internal class SystemSettingDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_SystemSetting";
        #endregion

        internal static List<ResponseIL> InsertUpdate(SystemSettingIL ss)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_SystemSettingInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TotalLane", DbType.Int16, ss.TotalLane, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IsATCCIndependently", DbType.Boolean, ss.IsATCCIndependently, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ATCCByVIDS", DbType.Boolean, ss.ATCCByVIDS, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ATCCByVSDS", DbType.Boolean, ss.ATCCByVSDS, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TrafficCount", DbType.Int16, ss.TrafficCount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TrafficByTime", DbType.Int16, ss.TrafficByTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, ss.CreatedBy, ParameterDirection.Input));
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
        internal static SystemSettingIL Get()
        {
            DataTable dt = new DataTable();
            SystemSettingIL crData = new SystemSettingIL();
            try
            {
                string spName = "USP_SystemSettingGet";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    crData = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return crData;
        }
        #endregion

        #region Helper Methods
        private static SystemSettingIL CreateObjectFromDataRow(DataRow dr)
        {
            SystemSettingIL sysSet = new SystemSettingIL();

            if (dr["ATCCByVIDS"] != DBNull.Value)
                sysSet.ATCCByVIDS = Convert.ToBoolean(dr["ATCCByVIDS"]);

            if (dr["ATCCByVSDS"] != DBNull.Value)
                sysSet.ATCCByVSDS = Convert.ToBoolean(dr["ATCCByVSDS"]);

            if (dr["IsATCCIndependently"] != DBNull.Value)
                sysSet.IsATCCIndependently = Convert.ToBoolean(dr["IsATCCIndependently"]);

            if (dr["TotalLane"] != DBNull.Value)
                sysSet.TotalLane = Convert.ToInt16(dr["TotalLane"]);

            if (dr["TrafficByTime"] != DBNull.Value)
                sysSet.TrafficByTime = Convert.ToInt16(dr["TrafficByTime"]);

            if (dr["TrafficCount"] != DBNull.Value)
                sysSet.TrafficCount = Convert.ToInt16(dr["TrafficCount"]);

            if (dr["DataStatus"] != DBNull.Value)
                sysSet.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            if (dr["CreatedDate"] != DBNull.Value)
                sysSet.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                sysSet.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                sysSet.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                sysSet.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);
            return sysSet;
        }
        #endregion
    }
}