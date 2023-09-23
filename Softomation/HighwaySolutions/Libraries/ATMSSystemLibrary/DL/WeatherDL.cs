using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.CommonLibrary;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.DL
{
	internal class WeatherDL
	{
		#region Global Varialble
		static DataTable dt;
		static string tableName = "tbl_SystemSetting";
		#endregion

		internal static List<ResponseIL> InsertUpdateConfig(WeatherConfigIL ss)
		{
			List<ResponseIL> responses = null;
			try
			{
                string spName = "USP_WeatherConfigInsertUpdate";
				DbCommand command = DBAccessor.GetStoredProcCommand(spName);
				command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@WeatherConfigurationId", DbType.Int16, ss.WeatherConfigurationId, ParameterDirection.Input));
				command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AirTemperatureMin", DbType.Decimal, ss.AirTemperatureMin, ParameterDirection.Input));
				command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AirTemperatureMax", DbType.Decimal, ss.AirTemperatureMax, ParameterDirection.Input));
				command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@HumidityRH", DbType.Decimal, ss.HumidityRH, ParameterDirection.Input));
				command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@HumidityAH", DbType.Decimal, ss.HumidityAH, ParameterDirection.Input));
				command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Visibility", DbType.Decimal, ss.Visibility, ParameterDirection.Input));
				command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RoadTemperature", DbType.Decimal, ss.RoadTemperature, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@WindDirectionValue", DbType.Decimal, ss.WindDirectionValue, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@WindSpeedValue", DbType.Decimal, ss.WindSpeedValue, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RainValue", DbType.Decimal, ss.RainValue, ParameterDirection.Input, 255));
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
		internal static List<WeatherConfigIL> GetWeatherConfig()
		{
			DataTable dt = new DataTable();
            List<WeatherConfigIL> crData = new List<WeatherConfigIL>();
			try
			{
				string spName = "USP_GetWeatherConfig";
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
        internal static List<WeatherDataIL> WeatherGetALLByFilter(DataFilterIL data)
        {
            DataTable dt = new DataTable();
            List<WeatherDataIL> WeatherData = new List<WeatherDataIL>();
            try
            {
                string spName = "USP_WeatherEventsGetALLByFilter";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FilterQuery", DbType.String, data.FilterQuery, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    WeatherData.Add(CreateObjectweatherFromDataRow(dr));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return WeatherData;
        }
        #endregion

        #region Helper Methods
        private static WeatherConfigIL CreateObjectFromDataRow(DataRow dr)
		{
			WeatherConfigIL sysSet = new WeatherConfigIL();

			if (dr["WeatherConfigurationId"] != DBNull.Value)
				sysSet.WeatherConfigurationId = Convert.ToInt16(dr["WeatherConfigurationId"]);

			if (dr["AirTemperatureMin"] != DBNull.Value)
				sysSet.AirTemperatureMin = Convert.ToDecimal(dr["AirTemperatureMin"]);

			if (dr["AirTemperatureMax"] != DBNull.Value)
				sysSet.AirTemperatureMax = Convert.ToDecimal(dr["AirTemperatureMax"]);

			if (dr["HumidityRH"] != DBNull.Value)
				sysSet.HumidityRH = Convert.ToDecimal(dr["HumidityRH"]);

			if (dr["HumidityAH"] != DBNull.Value)
				sysSet.HumidityAH = Convert.ToDecimal(dr["HumidityAH"]);

			if (dr["Visibility"] != DBNull.Value)
				sysSet.Visibility = Convert.ToDecimal(dr["Visibility"]);

			if (dr["WindDirectionValue"] != DBNull.Value)
				sysSet.WindDirectionValue = Convert.ToDecimal(dr["WindDirectionValue"]);

			if (dr["WindSpeedValue"] != DBNull.Value)
				sysSet.WindSpeedValue = Convert.ToDecimal(dr["WindSpeedValue"]);

			if (dr["RainValue"] != DBNull.Value)
				sysSet.RainValue = Convert.ToDecimal(dr["RainValue"]);

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
        private static WeatherDataIL CreateObjectweatherFromDataRow(DataRow dr)
        {
            WeatherDataIL sysSet = new WeatherDataIL();

            if (dr["TransactionId"] != DBNull.Value)
                sysSet.TransactionId = Convert.ToInt64(dr["TransactionId"]);

            if (dr["EquipmentName"] != DBNull.Value)
                sysSet.EquipmentName = Convert.ToString(dr["EquipmentName"]);

            if (dr["AirTemperature"] != DBNull.Value)
                sysSet.AirTemperature = Convert.ToDecimal(dr["AirTemperature"]);

            if (dr["HumidityRH"] != DBNull.Value)
                sysSet.HumidityRH = Convert.ToDecimal(dr["HumidityRH"]);

            if (dr["HumidityAH"] != DBNull.Value)
                sysSet.HumidityAH = Convert.ToDecimal(dr["HumidityAH"]);

            if (dr["Visibility"] != DBNull.Value)
                sysSet.Visibility = Convert.ToDecimal(dr["Visibility"]);

            if (dr["WindDirectionValue"] != DBNull.Value)
                sysSet.WindDirectionValue = Convert.ToDecimal(dr["WindDirectionValue"]);

            if (dr["WindSpeedValue"] != DBNull.Value)
                sysSet.WindSpeedValue = Convert.ToDecimal(dr["WindSpeedValue"]);

            if (dr["RainValue"] != DBNull.Value)
                sysSet.RainValue = Convert.ToDecimal(dr["RainValue"]);

            if (dr["WindSpeedMeasurement"] != DBNull.Value)
                sysSet.WindSpeedMeasurement = Convert.ToString(dr["WindSpeedMeasurement"]);

            if (dr["RainMeasurement"] != DBNull.Value)
                sysSet.RainMeasurement = Convert.ToString(dr["RainMeasurement"]);

            if (dr["EventDate"] != DBNull.Value)
            {
                sysSet.EventDate = Convert.ToDateTime(dr["EventDate"]);
                sysSet.EventDateTimestamp = sysSet.EventDate.ToString(Constants.DateTimeFormatClient);
            }
            return sysSet;
        }
        #endregion
    }
}
