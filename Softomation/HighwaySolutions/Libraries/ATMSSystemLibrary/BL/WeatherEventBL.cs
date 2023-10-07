using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class WeatherEventBL
    {
        public static List<ResponseIL> Insert(WeatherEventIL weather)
        {

            try
            {
                return WeatherEventDL.Insert(weather);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<WeatherEventIL> GetByHours(short hours)
        {

            try
            {
                return WeatherEventDL.GetByHours(hours);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<WeatherEventIL> GetByFilter(DataFilterIL data)
        {

            try
            {
                return WeatherEventDL.GetByFilter(data);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
