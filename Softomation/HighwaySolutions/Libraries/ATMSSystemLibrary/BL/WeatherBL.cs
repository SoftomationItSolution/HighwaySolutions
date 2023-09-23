using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class WeatherBL
    {
        public static List<ResponseIL> InsertUpdateConfig(WeatherConfigIL ss)
        {
            try
            {
                return WeatherDL.InsertUpdateConfig(ss);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<WeatherConfigIL> GetWeatherConfig()
        {
            try
            {
                return WeatherDL.GetWeatherConfig();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<WeatherDataIL> WeatherGetALLByFilter(DataFilterIL data)
        {
            try
            {
                return WeatherDL.WeatherGetALLByFilter(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
