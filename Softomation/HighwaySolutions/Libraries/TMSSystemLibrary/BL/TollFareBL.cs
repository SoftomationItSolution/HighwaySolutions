using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class TollFareBL
    {
        public static List<ResponseIL> SetUp(TollFareIL types)
        {
            try
            {
                return TollFareDL.SetUp(types);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static TollFareIL GetByEffectedFrom(string EffectedFrom)
        {
            try
            {
                return TollFareDL.GetByEffectedFrom(EffectedFrom);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
