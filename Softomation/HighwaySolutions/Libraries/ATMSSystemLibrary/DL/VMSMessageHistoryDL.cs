using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DBA;


namespace HighwaySoluations.Softomation.ATMSSystemLibrary.DL
{
    public class VMSMessageHistoryDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_VMSMessageHistory";
        #endregion

        internal static List<ResponseIL> Insert(VMSMessageHistoryIL ss)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_VMSMessageHistoryInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageId", DbType.Int32, ss.MessageId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentId", DbType.Int64, ss.EquipmentId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MediaPath", DbType.String, ss.MediaPath, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageTypeId", DbType.Int16, ss.MessageTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DisplayTimout", DbType.Int16, ss.DisplayTimout, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ValidTillDate", DbType.Date, ss.ValidTillDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageDetails", DbType.String, ss.MessageDetails, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlayDateTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
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
        internal static List<VMSMessageHistoryIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<VMSMessageHistoryIL> crData = new List<VMSMessageHistoryIL>();
            try
            {
                string spName = "USP_VMSMessageHistoryGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    crData.Add(CreateObjectFromDataRow(dr));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return crData;
        }
        internal static List<VMSMessageHistoryIL> GetByHours(short hours)
        {
            List<VMSMessageHistoryIL> msgList = new List<VMSMessageHistoryIL>();
            try
            {
                string spName = "USP_VMSMessageHistoryGetByHours";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Hours", DbType.Int16, hours, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    msgList.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return msgList;
        }
        internal static List<VMSMessageHistoryIL> GetByFilter(DataFilterIL data)
        {
            DataTable dt = new DataTable();
            List<VMSMessageHistoryIL> msgsEvents = new List<VMSMessageHistoryIL>();
            try
            {
                string spName = "USP_VMSMessageHistoryGetByFilter";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FilterQuery", DbType.String, data.FilterQuery, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    msgsEvents.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return msgsEvents;
        }
        #endregion

        #region Helper Methods
        private static VMSMessageHistoryIL CreateObjectFromDataRow(DataRow dr)
        {
            VMSMessageHistoryIL sysSet = new VMSMessageHistoryIL();

            if (dr["MessageId"] != DBNull.Value)
                sysSet.MessageId = Convert.ToInt16(dr["MessageId"]);

            if (dr["EquipmentId"] != DBNull.Value)
                sysSet.EquipmentId = Convert.ToInt64(dr["EquipmentId"]);

            if (dr["MediaPath"] != DBNull.Value)
                sysSet.MediaPath = Convert.ToString(dr["MediaPath"]);

            if (dr["MessageTypeId"] != DBNull.Value)
                sysSet.MessageTypeId = Convert.ToInt16(dr["MessageTypeId"]);

            if (dr["DisplayTimout"] != DBNull.Value)
                sysSet.DisplayTimout = Convert.ToInt16(dr["DisplayTimout"]);

            if (dr["ValidTillDate"] != DBNull.Value)
            {
                sysSet.ValidTillDate = Convert.ToDateTime(dr["ValidTillDate"]);
                sysSet.ValidTillDateStamp = sysSet.ValidTillDate.ToString(Constants.DateFormat);
            }

            if (dr["MessageDetails"] != DBNull.Value)
                sysSet.MessageDetails = Convert.ToString(dr["MessageDetails"]);

            if (dr["PlayDateTime"] != DBNull.Value)
            {
                sysSet.PlayDateTime = Convert.ToDateTime(dr["PlayDateTime"]);
                sysSet.PlayDateTimeStamp = sysSet.PlayDateTime.ToString(Constants.DateTimeFormatClient);
            }

            if (dr["DirectionId"] != DBNull.Value)
                sysSet.DirectionId = Convert.ToInt16(dr["DirectionId"]);

            if (dr["EquipmentName"] != DBNull.Value)
                sysSet.EquipmentName = Convert.ToString(dr["EquipmentName"]);

            if (dr["IpAddress"] != DBNull.Value)
                sysSet.IpAddress = Convert.ToString(dr["IpAddress"]);

            if (dr["ChainageNumber"] != DBNull.Value)
            {
                sysSet.ChainageNumber = Convert.ToDecimal(dr["ChainageNumber"]);
                sysSet.ChainageName = sysSet.ChainageNumber.ToString().Replace(".", "+");
            }

            sysSet.DirectionName = Enum.GetName(typeof(SystemConstants.DirectionType), (SystemConstants.DirectionType)sysSet.DirectionId);
            sysSet.MessageTypeName = Enum.GetName(typeof(SystemConstants.VmsMessageFormat), (SystemConstants.VmsMessageFormat)sysSet.MessageTypeId);
            sysSet.DataStatusName = Enum.GetName(typeof(Constants.DataStatusType), (Constants.DataStatusType)sysSet.DataStatus);
            return sysSet;
        }
        #endregion
    }
}
