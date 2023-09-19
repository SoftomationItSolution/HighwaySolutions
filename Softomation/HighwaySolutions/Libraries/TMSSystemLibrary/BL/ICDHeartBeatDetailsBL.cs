using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class ICDHeartBeatDetailsBL
    {
        public static List<ResponseIL> Insert(ICDHeartBeatDetailsIL ed)
        {
            try
            {
                return ICDHeartBeatDetailsDL.Insert(ed);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
