using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class ICDTagDetailsBL
    {
        public static List<ResponseIL> Insert(ICDTagDetailsIL ed)
        {
            try
            {
                return ICDTagDetailsDL.Insert(ed);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
