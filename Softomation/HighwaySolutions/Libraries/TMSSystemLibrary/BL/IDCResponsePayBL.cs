using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class IDCResponsePayBL
    {
        public static List<ResponseIL> Insert(IDCResponsePayIL ed)
        {
            try
            {
                return IDCResponsePayDL.Insert(ed);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
