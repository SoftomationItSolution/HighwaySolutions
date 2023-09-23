using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.DL
{
    internal class ATCCEventDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_ATCCEventHistory";
        #endregion
        internal static List<ATCCEventIL> GetALLByFilter(DataFilterIL data)
        {
            DataTable dt = new DataTable();
            List<ATCCEventIL> vidsEvents = new List<ATCCEventIL>();
            try
            {
                string spName = "USP_ATCCEventsGetALLByFilter";
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
        internal static List<AtccReviewedIL> GetReviewedByFilter(DataFilterIL data)
        {
            DataTable dt = new DataTable();
            List<AtccReviewedIL> atccEvents = new List<AtccReviewedIL>();
            try
            {
                string spName = "USP_ATCCEventsGetReviewedByFilter";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FilterQuery", DbType.String, data.FilterQuery, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    atccEvents.Add(CreateReviewedObjectFromDataRow(dr));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return atccEvents;
        }
        internal static List<ATCCEventIL> ATCCUnreviewedEventsGetByFilter(DataFilterIL data)
        {
            DataTable dt = new DataTable();
            List<ATCCEventIL> vidsEvents = new List<ATCCEventIL>();
            try
            {
                string spName = "USP_ATCCEventsGetUnreviewedByFilter";
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
        internal static List<ResponseIL> ReviewUpdate(VSDSReviewedEventIL data)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_ATCCEventReviewUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionId", DbType.String, data.TransactionId, ParameterDirection.Input, 30));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReviewedVehicleClassId", DbType.Int16, data.ReviewedVehicleClassId, ParameterDirection.Input));
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


        #region Helper Methods
        internal static ATCCEventIL CreateObjectFromDataRow(DataRow dr)
        {
            ATCCEventIL events = new ATCCEventIL();

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

            if (dr["PackageId"] != DBNull.Value)
                events.PackageId = Convert.ToInt16(dr["PackageId"]);

            if (dr["PackageName"] != DBNull.Value)
                events.PackageName = Convert.ToString(dr["PackageName"]);

            if (dr["ControlRoomId"] != DBNull.Value)
                events.ControlRoomId = Convert.ToInt16(dr["ControlRoomId"]);

            if (dr["ControlRoomName"] != DBNull.Value)
                events.ControlRoomName = Convert.ToString(dr["ControlRoomName"]);

            //if (dr["EventTypeId"] != DBNull.Value)
            //    events.EventTypeId = Convert.ToInt16(dr["EventTypeId"]);

            //if (dr["EventTypeName"] != DBNull.Value)
            //    events.EventTypeName = Convert.ToString(dr["EventTypeName"]);

            if (dr["Latitude"] != DBNull.Value)
                events.Latitude = Convert.ToDouble(dr["Latitude"]);

            if (dr["Longitude"] != DBNull.Value)
                events.Longitude = Convert.ToDouble(dr["Longitude"]);

            if (dr["EventDate"] != DBNull.Value)
            {
                events.EventDate = Convert.ToDateTime(dr["EventDate"]);
                events.EventDateStamp = events.EventDate.ToString(Constants.DateTimeFormatClient);
            }

            if (dr["LaneNumber"] != DBNull.Value)
            {
                events.LaneNumber = Convert.ToInt16(dr["LaneNumber"]);
                events.LaneName = "Lane-" + events.LaneNumber.ToString();
            }

            if (dr["VehicleClassId"] != DBNull.Value)
                events.VehicleClassId = Convert.ToInt16(dr["VehicleClassId"]);

            if (dr["VehicleClassName"] != DBNull.Value)
                events.VehicleClassName = Convert.ToString(dr["VehicleClassName"]);

            //if (dr["PlateNumber"] != DBNull.Value)
            //    events.PlateNumber = Convert.ToString(dr["PlateNumber"]);

            //if (dr["PlateImageUrl"] != DBNull.Value)
            //    events.PlateImageUrl = Convert.ToString(dr["PlateImageUrl"]);

            if (dr["VehicleImageUrl"] != DBNull.Value)
                events.VehicleImageUrl = Convert.ToString(dr["VehicleImageUrl"]);

            if (dr["VehicleVideoUrl"] != DBNull.Value)
                events.VehicleVideoUrl = Convert.ToString(dr["VehicleVideoUrl"]);

            if (dr["CameraSpeed"] != DBNull.Value)
                events.CameraSpeed = Convert.ToDecimal(dr["CameraSpeed"]);

            //if (dr["RadarSpeed"] != DBNull.Value)
            //    events.RadarSpeed = Convert.ToDecimal(dr["RadarSpeed"]);

            //if (dr["AllowedSpeed"] != DBNull.Value)
            //    events.AllowedSpeed = Convert.ToDecimal(dr["AllowedSpeed"]);

            //if (dr["OcrConfidencelevel"] != DBNull.Value)
            //    events.OcrConfidencelevel = Convert.ToDecimal(dr["OcrConfidencelevel"]);

            if (dr["ClassConfidencelevel"] != DBNull.Value)
                events.ClassConfidencelevel = Convert.ToDecimal(dr["ClassConfidencelevel"]);

            //if (dr["PlateFontColor"] != DBNull.Value)
            //    events.PlateFontColor = Convert.ToString(dr["PlateFontColor"]);

            //if (dr["PlateBackColor"] != DBNull.Value)
            //    events.PlateBackColor = Convert.ToString(dr["PlateBackColor"]);

            //if (dr["VehicleColor"] != DBNull.Value)
            //    events.VehicleColor = Convert.ToString(dr["VehicleColor"]);

            if (dr["VehicleDirectionId"] != DBNull.Value)
                events.VehicleDirectionId = Convert.ToInt16(dr["VehicleDirectionId"]);

            //if (dr["IsPlateVisible"] != DBNull.Value)
            //    events.IsPlateVisible = Convert.ToBoolean(dr["IsPlateVisible"]);

            //if (dr["IsFaultyPlate"] != DBNull.Value)
            //    events.IsFaultyPlate = Convert.ToBoolean(dr["IsFaultyPlate"]);

            //if (dr["IsStandardPlate"] != DBNull.Value)
            //    events.IsStandardPlate = Convert.ToBoolean(dr["IsStandardPlate"]);

            if (dr["IsWrongDirection"] != DBNull.Value)
                events.IsWrongDirection = Convert.ToBoolean(dr["IsWrongDirection"]);

            if (dr["DataSendStatus"] != DBNull.Value)
                events.DataSendStatus = Convert.ToBoolean(dr["DataSendStatus"]);

            if (dr["MediaSendStatus"] != DBNull.Value)
                events.MediaSendStatus = Convert.ToBoolean(dr["MediaSendStatus"]);

            if (dr["CreatedDate"] != DBNull.Value)
                events.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            events.DirectionName = Enum.GetName(typeof(Constants.DirectionType), (Constants.DirectionType)events.DirectionId);
            events.VehicleDirectionName = Enum.GetName(typeof(SystemConstants.VehicleDirectionType), (SystemConstants.VehicleDirectionType)events.VehicleDirectionId);
            return events;
        }
        internal static AtccReviewedIL CreateReviewedObjectFromDataRow(DataRow dr)
        {
            AtccReviewedIL events = new AtccReviewedIL();

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

            if (dr["PackageId"] != DBNull.Value)
                events.PackageId = Convert.ToInt16(dr["PackageId"]);

            if (dr["PackageName"] != DBNull.Value)
                events.PackageName = Convert.ToString(dr["PackageName"]);

            if (dr["ControlRoomId"] != DBNull.Value)
                events.ControlRoomId = Convert.ToInt16(dr["ControlRoomId"]);

            if (dr["ControlRoomName"] != DBNull.Value)
                events.ControlRoomName = Convert.ToString(dr["ControlRoomName"]);

            if (dr["Latitude"] != DBNull.Value)
                events.Latitude = Convert.ToDouble(dr["Latitude"]);

            if (dr["Longitude"] != DBNull.Value)
                events.Longitude = Convert.ToDouble(dr["Longitude"]);

            if (dr["EventDate"] != DBNull.Value)
            {
                events.EventDate = Convert.ToDateTime(dr["EventDate"]);
                events.EventDateStamp = events.EventDate.ToString(Constants.DateTimeFormatClient);
            }

            if (dr["LaneNumber"] != DBNull.Value)
            {
                events.LaneNumber = Convert.ToInt16(dr["LaneNumber"]);
                events.LaneName = "Lane-" + events.LaneNumber.ToString();
            }

            if (dr["VehicleClassId"] != DBNull.Value)
                events.VehicleClassId = Convert.ToInt16(dr["VehicleClassId"]);

            if (dr["VehicleClassName"] != DBNull.Value)
                events.VehicleClassName = Convert.ToString(dr["VehicleClassName"]);

            if (dr["ReviewedVehicleClassId"] != DBNull.Value)
                events.ReviewedVehicleClassId = Convert.ToInt16(dr["ReviewedVehicleClassId"]);

            if (dr["ReviewedVehicleClaasName"] != DBNull.Value)
                events.ReviewedVehicleClassName = Convert.ToString(dr["ReviewedVehicleClaasName"]);

            if (dr["VehicleImageUrl"] != DBNull.Value)
                events.VehicleImageUrl = Convert.ToString(dr["VehicleImageUrl"]);

            if (dr["VehicleVideoUrl"] != DBNull.Value)
                events.VehicleVideoUrl = Convert.ToString(dr["VehicleVideoUrl"]);

            if (dr["CameraSpeed"] != DBNull.Value)
                events.CameraSpeed = Convert.ToDecimal(dr["CameraSpeed"]);

            if (dr["ClassConfidencelevel"] != DBNull.Value)
                events.ClassConfidencelevel = Convert.ToDecimal(dr["ClassConfidencelevel"]);

            if (dr["VehicleDirectionId"] != DBNull.Value)
                events.VehicleDirectionId = Convert.ToInt16(dr["VehicleDirectionId"]);

            //if (dr["IsPlateVisible"] != DBNull.Value)
            //    events.IsPlateVisible = Convert.ToBoolean(dr["IsPlateVisible"]);

            //if (dr["IsFaultyPlate"] != DBNull.Value)
            //    events.IsFaultyPlate = Convert.ToBoolean(dr["IsFaultyPlate"]);

            //if (dr["IsStandardPlate"] != DBNull.Value)
            //    events.IsStandardPlate = Convert.ToBoolean(dr["IsStandardPlate"]);

            if (dr["IsWrongDirection"] != DBNull.Value)
                events.IsWrongDirection = Convert.ToBoolean(dr["IsWrongDirection"]);

            if (dr["DataSendStatus"] != DBNull.Value)
                events.DataSendStatus = Convert.ToBoolean(dr["DataSendStatus"]);

            if (dr["MediaSendStatus"] != DBNull.Value)
                events.MediaSendStatus = Convert.ToBoolean(dr["MediaSendStatus"]);

            if (dr["CreatedDate"] != DBNull.Value)
                events.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            events.DirectionName = Enum.GetName(typeof(Constants.DirectionType), (Constants.DirectionType)events.DirectionId);
            events.VehicleDirectionName = Enum.GetName(typeof(SystemConstants.VehicleDirectionType), (SystemConstants.VehicleDirectionType)events.VehicleDirectionId);
            return events;
        }
        #endregion
    }
}
