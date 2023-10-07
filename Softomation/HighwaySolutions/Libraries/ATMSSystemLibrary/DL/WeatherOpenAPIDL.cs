using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DBA;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.DL
{
    internal class WeatherOpenAPIDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_WeatherOpenAPI";
        #endregion

        internal static List<ResponseIL> Insert(WeatherOpenAPIIL weather)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_WeatherOpenAPIInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentId", DbType.Int64, weather.EquipmentId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReceivedDateTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@APIDateTime", DbType.DateTime, weather.APIDateTime, ParameterDirection.Input));
                if (weather.weather.Count > 0)
                {
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@WeatherMain", DbType.String, weather.weather[0].main, ParameterDirection.Input, 100));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@WeatherDescription", DbType.String, weather.weather[0].description, ParameterDirection.Input, 100));
                }
                else
                {
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@WeatherMain", DbType.String, "NA", ParameterDirection.Input, 100));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@WeatherDescription", DbType.String, "NA", ParameterDirection.Input, 100));
                }

                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Temperature", DbType.Decimal, weather.main.temp, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MinTemperature", DbType.Double, weather.main.temp_min, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MaxTemperature", DbType.Double, weather.main.temp_max, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Pressure", DbType.Int64, weather.main.pressure, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Humidity", DbType.Int64, weather.main.humidity, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Visibility", DbType.Int64, weather.visibility, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@WindSpeed", DbType.Double, weather.wind.speed, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@WindDegree", DbType.Double, weather.wind.deg, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Clouds", DbType.Int16, weather.clouds.all, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@GetDateTime", DbType.Int64, weather.dt, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Sunrise", DbType.Int64, weather.sys.sunrise, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Sunset", DbType.Int64, weather.sys.sunset, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CityName", DbType.String, weather.name, ParameterDirection.Input, 100));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responses = ResponseIL.ConvertResponseList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
        }
    }
}
