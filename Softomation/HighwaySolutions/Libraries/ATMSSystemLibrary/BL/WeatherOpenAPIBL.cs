using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;


namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class WeatherOpenAPIBL
    {
        public static List<ResponseIL> Insert(WeatherOpenAPIIL weather)
        {

            try
            {
                return WeatherOpenAPIDL.Insert(weather);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
