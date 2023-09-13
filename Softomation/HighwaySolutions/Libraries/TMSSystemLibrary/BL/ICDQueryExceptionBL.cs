using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
   public class ICDQueryExceptionBL
    {
        public static List<ResponseIL> Insert(ICDQueryExceptionIL ed)
        {
            try
            {
                return ICDQueryExceptionDL.Insert(ed);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
