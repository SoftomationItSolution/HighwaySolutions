﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using Softomation.ATMSSystemLibrary.DBA;
using Softomation.ATMSSystemLibrary.IL;

namespace Softomation.ATMSSystemLibrary.DL
{
    internal class VIDSReviewedEventDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_VIDSEventsHistory";
        #endregion
        internal static List<ResponseIL> ReviewUpdate(VIDSReviewedEventIL data)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_VIDSEventReviewUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionId", DbType.String, data.TransactionId, ParameterDirection.Input, 30));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReviewedEventTypeId", DbType.Int16, data.ReviewedEventTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReviewedPlateNumber", DbType.String, data.ReviewedPlateNumber, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReviewedVehicleClassId", DbType.Int16, data.ReviewedVehicleClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IsChallanRequired", DbType.Boolean, data.IsChallanRequired, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReviewedById", DbType.Int64, data.ReviewedById, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReviewedDateTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responses = ResponseIL.ConvertResponseList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
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

        

        #region Helper Methods
        private static VIDSEventIL CreateObjectFromDataRow(DataRow dr)
        {
            VIDSEventIL events = new VIDSEventIL();

            if (dr["TransactionId"] != DBNull.Value)
                events.TransactionId = Convert.ToString(dr["TransactionId"]);

            if (dr["EquipmentId"] != DBNull.Value)
                events.EquipmentId = Convert.ToInt64(dr["EquipmentId"]);

            if (dr["ChainageNumber"] != DBNull.Value)
            {
                events.ChainageNumber = Convert.ToDecimal(dr["ChainageNumber"]);
                events.ChainageName = events.ChainageNumber.ToString().Replace(".", "+");
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
                events.Latitude = Convert.ToDecimal(dr["Latitude"]);

            if (dr["Longitude"] != DBNull.Value)
                events.Longitude = Convert.ToDecimal(dr["Longitude"]);

            if (dr["EventStartDate"] != DBNull.Value)
            {
                events.EventStartDate = Convert.ToDateTime(dr["EventStartDate"]);
                events.EventStartDateStamp = events.EventStartDate.ToString(Constants.DATETIME_FORMAT_Client);
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
            events.PositionName = Enum.GetName(typeof(Constants.VIDSEquipmentPositionType), (Constants.VIDSEquipmentPositionType)events.PositionId);
            return events;
        }
        #endregion
    }
}