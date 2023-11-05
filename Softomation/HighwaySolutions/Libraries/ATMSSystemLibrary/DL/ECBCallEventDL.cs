using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DBA;
using static HighwaySoluations.Softomation.ATMSSystemLibrary.SystemConstants;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.DL
{
    internal class ECBCallEventDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_ECBCallEventsHistory";
        #endregion

        internal static List<ResponseIL> Insert(ECBCallEventIL dataEvent)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_ECBCallEventsInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CallerId", DbType.Int64, dataEvent.CallerId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CalleeId", DbType.Int64, dataEvent.CalleeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CallerNumber", DbType.String, dataEvent.CallerNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CalleeNumber", DbType.String, dataEvent.CalleeNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EventId", DbType.String, dataEvent.EventId, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@StartDateTime", DbType.DateTime, dataEvent.StartDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EndDateTime", DbType.DateTime, dataEvent.EndDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CallDuration", DbType.Int16, dataEvent.CallDuration, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CallStatusId", DbType.Int16, dataEvent.CallStatusId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CallTypeId", DbType.Int16, dataEvent.CallTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RecordingFileName", DbType.String, dataEvent.RecordingFileName, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SystemProviderId", DbType.Int16, dataEvent.SystemProviderId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responses = ResponseIL.ConvertResponseList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
        }

        

        internal static List<ECBCallEventIL> GetByHours(short hours)
        {
            List<ECBCallEventIL> ecbEvents = new List<ECBCallEventIL>();
            try
            {
                string spName = "USP_ECBEventsGetByHours";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Hours", DbType.Int16, hours, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    ecbEvents.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ecbEvents;
        }
        internal static List<ECBCallEventIL> GetByFilter(DataFilterIL data)
        {
            DataTable dt = new DataTable();
            List<ECBCallEventIL> ecbEvents = new List<ECBCallEventIL>();
            try
            {
                string spName = "USP_ECBEventsGetByFilter";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FilterQuery", DbType.String, data.FilterQuery, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    ecbEvents.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ecbEvents;
        }
        internal static DataSet ReportSummeryGetByFilter(DataFilterIL data)
        {
            DataSet ds = new DataSet();
            try
            {
                string spName = "USP_ECBSummeryReport";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FilterQuery", DbType.String, data.FilterQuery, ParameterDirection.Input));
                ds = DBAccessor.LoadDataSet(command, tableName);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ds;
        }
        internal static DataSet ReportLocationGetByFilter(DataFilterIL data)
        {
            DataSet ds = new DataSet();
            try
            {
                string spName = "USP_ECBLocationReport";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FilterQuery", DbType.String, data.FilterQuery, ParameterDirection.Input));
                ds = DBAccessor.LoadDataSet(command, tableName);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ds;
        }
        internal static DataSet ReportEventGetByFilter(DataFilterIL data)
        {
            DataSet ds = new DataSet();
            try
            {
                string spName = "USP_ECBEventReport";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FilterQuery", DbType.String, data.FilterQuery, ParameterDirection.Input));
                ds = DBAccessor.LoadDataSet(command, tableName);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ds;
        }

        #region Helper Methods
        internal static ECBCallEventIL CreateObjectFromDataRow(DataRow dr)
        {
            ECBCallEventIL events = new ECBCallEventIL();

          

            if (dr["StartDateTime"] != DBNull.Value)
            {
                events.StartDateTime = Convert.ToDateTime(dr["StartDateTime"]);
                events.StartDateTimeStamp = events.StartDateTime.ToString(Constants.DateTimeFormatClient);
            }

            if (dr["EndDateTime"] != DBNull.Value)
            {
                events.EndDateTime = Convert.ToDateTime(dr["EndDateTime"]);
                events.EndDateTimeStamp = events.EndDateTime.ToString(Constants.DateTimeFormatClient);
            }

            if (dr["CallDuration"] != DBNull.Value)
                events.CallDuration = Convert.ToInt32(dr["CallDuration"]);

            if (dr["CallStatusId"] != DBNull.Value)
                events.CallStatusId = Convert.ToInt16(dr["CallStatusId"]);

            if (dr["CallTypeId"] != DBNull.Value)
                events.CallTypeId = Convert.ToInt16(dr["CallTypeId"]);

            if (dr["RecordingFileName"] != DBNull.Value)
                events.RecordingFileName = Convert.ToString(dr["RecordingFileName"]);

            if (dr["OperatorId"] != DBNull.Value)
                events.OperatorId = Convert.ToInt64(dr["OperatorId"]);

            if (dr["IncidentId"] != DBNull.Value)
                events.IncidentId = Convert.ToString(dr["IncidentId"]);

            if (dr["IncidentStatusId"] != DBNull.Value)
                events.IncidentStatusId = Convert.ToInt16(dr["IncidentStatusId"]);

            if (dr["CallerId"] != DBNull.Value)
                events.CallerId = Convert.ToInt64(dr["CallerId"]);

            if (dr["CallerNumber"] != DBNull.Value)
                events.CallerNumber = Convert.ToString(dr["CallerNumber"]);

            if (dr["CallerChainageNumber"] != DBNull.Value)
            {
                events.CallerChainageNumber = Convert.ToDecimal(dr["CallerChainageNumber"]);
                events.CallerChainageName = SystemConstants.ConvertChainageName(events.CallerChainageNumber);
            }

            if (dr["CallerDirectionId"] != DBNull.Value)
                events.CallerDirectionId = Convert.ToInt16(dr["CallerDirectionId"]);

            if (dr["CallerPackageId"] != DBNull.Value)
                events.CallerPackageId = Convert.ToInt16(dr["CallerPackageId"]);

            if (dr["CallerPackageName"] != DBNull.Value)
                events.CallerPackageName = Convert.ToString(dr["CallerPackageName"]);

            if (dr["CallerControlRoomId"] != DBNull.Value)
                events.CallerControlRoomId = Convert.ToInt16(dr["CallerControlRoomId"]);

            if (dr["CallerControlRoomName"] != DBNull.Value)
                events.CallerControlRoomName = Convert.ToString(dr["CallerControlRoomName"]);

            if (dr["CallerLatitude"] != DBNull.Value)
                events.CallerLatitude = Convert.ToDouble(dr["CallerLatitude"]);

            if (dr["CallerLongitude"] != DBNull.Value)
                events.CallerLongitude = Convert.ToDouble(dr["CallerLongitude"]);

            if (dr["CalleeId"] != DBNull.Value)
                events.CalleeId = Convert.ToInt64(dr["CalleeId"]);

            if (dr["CalleeNumber"] != DBNull.Value)
                events.CalleeNumber = Convert.ToString(dr["CalleeNumber"]);

            if (dr["CalleeChainageNumber"] != DBNull.Value)
            {
                events.CalleeChainageNumber = Convert.ToDecimal(dr["CalleeChainageNumber"]);
                events.CalleeChainageName = SystemConstants.ConvertChainageName(events.CalleeChainageNumber);
            }

            if (dr["CalleeDirectionId"] != DBNull.Value)
                events.CalleeDirectionId = Convert.ToInt16(dr["CalleeDirectionId"]);

            if (dr["CalleePackageId"] != DBNull.Value)
                events.CalleePackageId = Convert.ToInt16(dr["CalleePackageId"]);

            if (dr["CalleePackageName"] != DBNull.Value)
                events.CalleePackageName = Convert.ToString(dr["CalleePackageName"]);

            if (dr["CalleeControlRoomId"] != DBNull.Value)
                events.CalleeControlRoomId = Convert.ToInt16(dr["CalleeControlRoomId"]);

            if (dr["CalleeControlRoomName"] != DBNull.Value)
                events.CalleeControlRoomName = Convert.ToString(dr["CalleeControlRoomName"]);

            if (dr["CalleeLatitude"] != DBNull.Value)
                events.CalleeLatitude = Convert.ToDouble(dr["CalleeLatitude"]);

            if (dr["CalleeLongitude"] != DBNull.Value)
                events.CalleeLongitude = Convert.ToDouble(dr["CalleeLongitude"]);

            if (dr["DataSendStatus"] != DBNull.Value)
                events.DataSendStatus = Convert.ToBoolean(dr["DataSendStatus"]);

            if (dr["MediaSendStatus"] != DBNull.Value)
                events.MediaSendStatus = Convert.ToBoolean(dr["MediaSendStatus"]);

            events.CallerDirectionName = Enum.GetName(typeof(Constants.DirectionType), (Constants.DirectionType)events.CallerDirectionId);
            events.CalleeDirectionName = Enum.GetName(typeof(Constants.DirectionType), (Constants.DirectionType)events.CalleeDirectionId);
            events.CallTypeName = Enum.GetName(typeof(ECSCallType), (ECSCallType)events.CallTypeId);
            events.CallStatusName = Enum.GetName(typeof(Constants.IPPbxCallStatusType), (Constants.IPPbxCallStatusType)events.CallStatusId);
            return events;
        }
        #endregion
    }
}
