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
    internal class WeatherEventDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_WeatherEventHistory";
        #endregion

        internal static List<ResponseIL> Insert(WeatherEventIL weather)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_WeatherEventInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentId", DbType.Int64, weather.EquipmentId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EventDateTime", DbType.DateTime, weather.EventDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AirTemperature", DbType.Decimal, weather.AirTemperature, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SurfaceTemperature", DbType.Decimal, weather.SurfaceTemperature, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Humidity", DbType.Decimal, weather.Humidity, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Visibility", DbType.Decimal, weather.Visibility, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@WindDirection", DbType.Decimal, weather.WindDirection, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@WindSpeed", DbType.Decimal, weather.WindSpeed, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Airquality", DbType.Decimal, weather.AirQuality, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RainMeasurement", DbType.Decimal, weather.RainMeasurement, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@WeatherDescription", DbType.String, weather.WeatherDescription, ParameterDirection.Input, 100));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responses = ResponseIL.ConvertResponseList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
        }
        internal static List<WeatherEventIL> GetByHours(short hours)
        {
            List<WeatherEventIL> weatherEvents = new List<WeatherEventIL>();
            try
            {
                string spName = "USP_WeatherEventsGetByHours";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Hours", DbType.Int16, hours, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    weatherEvents.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return weatherEvents;
        }
        internal static List<WeatherEventIL> GetByFilter(DataFilterIL data)
        {
            DataTable dt = new DataTable();
            List<WeatherEventIL> weatherEvents = new List<WeatherEventIL>();
            try
            {
                string spName = "USP_WeatherEventsGetByFilter";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FilterQuery", DbType.String, data.FilterQuery, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    weatherEvents.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return weatherEvents;
        }
        
        #region Helper Methods
        internal static WeatherEventIL CreateObjectFromDataRow(DataRow dr)
        {
            WeatherEventIL events = new WeatherEventIL();

            if (dr["EquipmentId"] != DBNull.Value)
                events.EquipmentId = Convert.ToInt64(dr["EquipmentId"]);

            if (dr["AirTemperature"] != DBNull.Value)
                events.AirTemperature = Convert.ToDecimal(dr["AirTemperature"]);

            if (dr["SurfaceTemperature"] != DBNull.Value)
                events.SurfaceTemperature = Convert.ToDecimal(dr["SurfaceTemperature"]);

            if (dr["Humidity"] != DBNull.Value)
                events.Humidity = Convert.ToDecimal(dr["Humidity"]);

            if (dr["Visibility"] != DBNull.Value)
                events.Visibility = Convert.ToDecimal(dr["Visibility"]);

            if (dr["WindDirection"] != DBNull.Value)
                events.WindDirection = Convert.ToDecimal(dr["WindDirection"]);

            if (dr["WindSpeed"] != DBNull.Value)
                events.WindSpeed = Convert.ToDecimal(dr["WindSpeed"]);

            if (dr["AirQuality"] != DBNull.Value)
                events.AirQuality = Convert.ToDecimal(dr["AirQuality"]);

            if (dr["RainMeasurement"] != DBNull.Value)
                events.RainMeasurement = Convert.ToDecimal(dr["RainMeasurement"]);

            if (dr["WeatherDescription"] != DBNull.Value)
                events.WeatherDescription = Convert.ToString(dr["WeatherDescription"]);

            if (dr["ChainageNumber"] != DBNull.Value)
            {
                events.ChainageNumber = Convert.ToDecimal(dr["ChainageNumber"]);
                events.ChainageName = SystemConstants.ConvertChainageName(events.ChainageNumber);
            }

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

            if (dr["EventDateTime"] != DBNull.Value)
            {
                events.EventDateTime = Convert.ToDateTime(dr["EventDateTime"]);
                events.EventDateTimeStamp = events.EventDateTime.ToString(Constants.DateTimeFormatClient);
            }

            if (dr["DataSendStatus"] != DBNull.Value)
                events.DataSendStatus = Convert.ToBoolean(dr["DataSendStatus"]);
            return events;
        }
        #endregion
    }
}
