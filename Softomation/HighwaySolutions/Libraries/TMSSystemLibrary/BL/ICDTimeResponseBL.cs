using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class ICDTimeResponseBL
    {
        public static List<ResponseIL> Insert(ICDTimeResponseIL ed)
        {
            try
            {
                return ICDTimeResponseDL.Insert(ed);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
