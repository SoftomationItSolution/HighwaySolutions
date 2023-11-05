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
    internal class VIDSEventDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_VIDSEventsHistory";
        #endregion

        internal static List<ResponseIL> Insert(VIDSEventIL dataEvent)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_VIDSEventsInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionId", DbType.String, dataEvent.TransactionId, ParameterDirection.Input, 30));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentId", DbType.Int64, dataEvent.EquipmentId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EventId", DbType.String, dataEvent.EventId, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DirectionId", DbType.Int16, dataEvent.DirectionId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EventTypeId", DbType.Int16, dataEvent.EventTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EventStartDate", DbType.DateTime2, dataEvent.EventStartDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EventEndDate", DbType.DateTime2, dataEvent.EventEndDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneNumber", DbType.Int16, dataEvent.LaneNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehicleSpeed", DbType.Decimal, dataEvent.VehicleSpeed, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehicleClassId", DbType.Int16, dataEvent.VehicleClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlateNumber", DbType.String, dataEvent.PlateNumber, ParameterDirection.Input,20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlateImageUrl", DbType.String, dataEvent.PlateImageUrl, ParameterDirection.Input,255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EventImageUrl", DbType.String, dataEvent.EventImageUrl, ParameterDirection.Input,255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EventVideoUrl", DbType.String, dataEvent.EventVideoUrl, ParameterDirection.Input,255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IsReviewedRequired", DbType.Boolean, dataEvent.IsReviewedRequired, ParameterDirection.Input));
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
        internal static List<VIDSEventIL> GetByHours(short hours)
        {
            List<VIDSEventIL> vidsEvents = new List<VIDSEventIL>();
            try
            {
                string spName = "USP_VIDSEventsGetByHours";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Hours", DbType.Int16, hours, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    vidsEvents.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return vidsEvents;
        }

        internal static List<VIDSEventIL> GetPendingReviewByHours(short hours)
        {
            List<VIDSEventIL> vidsEvents = new List<VIDSEventIL>();
            try
            {
                string spName = "USP_VIDSPendingReviewEventsGetByHours";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Hours", DbType.Int16, hours, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    vidsEvents.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return vidsEvents;
        }
        internal static List<VIDSEventIL> GetByFilter(DataFilterIL data)
        {
            DataTable dt = new DataTable();
            List<VIDSEventIL> vidsEvents = new List<VIDSEventIL>();
            try
            {
                string spName = "USP_VIDSEventsGetByFilter";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FilterQuery", DbType.String, data.FilterQuery, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    vidsEvents.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return vidsEvents;
        }

        internal static DataSet ReportSummeryGetByFilter(DataFilterIL data)
        {
            DataSet ds = new DataSet();
            try
            {
                string spName = "USP_VIDSSummeryReport";
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
                string spName = "USP_VIDSLocationReport";
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
                string spName = "USP_VIDSEventReport";
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
        internal static DataSet ReportPositionGetByFilter(DataFilterIL data)
        {
            DataSet ds = new DataSet();
            try
            {
                string spName = "USP_VIDSPositionReport";
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
        internal static VIDSEventIL CreateObjectFromDataRow(DataRow dr)
        {
            VIDSEventIL events = new VIDSEventIL();

            if (dr["TransactionId"] != DBNull.Value)
                events.TransactionId = Convert.ToString(dr["TransactionId"]);

            if (dr["EquipmentId"] != DBNull.Value)
                events.EquipmentId = Convert.ToInt64(dr["EquipmentId"]);

            if (dr["ChainageNumber"] != DBNull.Value)
            {
                events.ChainageNumber = Convert.ToDecimal(dr["ChainageNumber"]);
                events.ChainageName = SystemConstants.ConvertChainageName(events.ChainageNumber);
            }

            if (dr["DirectionId"] != DBNull.Value)
                events.DirectionId = Convert.ToInt16(dr["DirectionId"]);

            if (dr["PositionId"] != DBNull.Value)
                events.PositionId = Convert.ToInt16(dr["PositionId"]);

            if (dr["PackageId"] != DBNull.Value)
                events.PackageId = Convert.ToInt16(dr["PackageId"]);

            if (dr["PackageName"] != DBNull.Value)
                events.PackageName = Convert.ToString(dr["PackageName"]);

            if (dr["ControlRoomId"] != DBNull.Value)
                events.ControlRoomId = Convert.ToInt16(dr["ControlRoomId"]);

            if (dr["ControlRoomName"] != DBNull.Value)
                events.ControlRoomName = Convert.ToString(dr["ControlRoomName"]);

            if (dr["EventTypeId"] != DBNull.Value)
                events.EventTypeId = Convert.ToInt16(dr["EventTypeId"]);

            if (dr["EventTypeName"] != DBNull.Value)
                events.EventTypeName = Convert.ToString(dr["EventTypeName"]);

            if (dr["Latitude"] != DBNull.Value)
                events.Latitude = Convert.ToDouble(dr["Latitude"]);

            if (dr["Longitude"] != DBNull.Value)
                events.Longitude = Convert.ToDouble(dr["Longitude"]);

            if (dr["EventStartDate"] != DBNull.Value)
            {
                events.EventStartDate = Convert.ToDateTime(dr["EventStartDate"]);
                events.EventStartDateStamp = events.EventStartDate.ToString(Constants.DateTimeFormatClient);
            }

            if (dr["EventEndDate"] != DBNull.Value)
                events.EventEndDate = Convert.ToDateTime(dr["EventEndDate"]);

            if (dr["EventDuration"] != DBNull.Value)
                events.EventDuration = Convert.ToInt16(dr["EventDuration"]);

            if (dr["LaneNumber"] != DBNull.Value)
            {
                events.LaneNumber = Convert.ToInt16(dr["LaneNumber"]);
                events.LaneName = "Lane-" + events.LaneNumber.ToString();
            }

            if (dr["VehicleSpeed"] != DBNull.Value)
                events.VehicleSpeed = Convert.ToDecimal(dr["VehicleSpeed"]);

            if (dr["VehicleClassId"] != DBNull.Value)
                events.VehicleClassId = Convert.ToInt16(dr["VehicleClassId"]);

            if (dr["VehicleClassName"] != DBNull.Value)
                events.VehicleClassName = Convert.ToString(dr["VehicleClassName"]);

            if (dr["PlateNumber"] != DBNull.Value)
                events.PlateNumber = Convert.ToString(dr["PlateNumber"]);

            if (dr["PlateImageUrl"] != DBNull.Value)
                events.PlateImageUrl = Convert.ToString(dr["PlateImageUrl"]);

            if (dr["EventImageUrl"] != DBNull.Value)
                events.EventImageUrl = Convert.ToString(dr["EventImageUrl"]);

            if (dr["EventVideoUrl"] != DBNull.Value)
                events.EventVideoUrl = Convert.ToString(dr["EventVideoUrl"]);

            if (dr["IncidentStatusId"] != DBNull.Value)
                events.IncidentStatusId = Convert.ToInt16(dr["IncidentStatusId"]);

            if (dr["IncidentStatusName"] != DBNull.Value)
                events.IncidentStatusName = Convert.ToString(dr["IncidentStatusName"]);

            if (dr["DataSendStatus"] != DBNull.Value)
                events.DataSendStatus = Convert.ToBoolean(dr["DataSendStatus"]);

            if (dr["MediaSendStatus"] != DBNull.Value)
                events.MediaSendStatus = Convert.ToBoolean(dr["MediaSendStatus"]);

            if (dr["CreatedDate"] != DBNull.Value)
                events.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            events.DirectionName = Enum.GetName(typeof(Constants.DirectionType), (Constants.DirectionType)events.DirectionId);
            events.PositionName = Enum.GetName(typeof(SystemConstants.VIDSEquipmentPositionType), (SystemConstants.VIDSEquipmentPositionType)events.PositionId);
            return events;
        }
        #endregion
    }
}
