using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
   public class ICDQueryExceptionResponseBL
    {
        public static List<ResponseIL> Insert(ICDQueryExceptionResponseIL ed)
        {
            try
            {
                return ICDQueryExceptionResponseDL.Insert(ed);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
