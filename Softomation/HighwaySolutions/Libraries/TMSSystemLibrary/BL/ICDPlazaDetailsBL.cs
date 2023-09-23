using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class ICDPlazaDetailsBL
    {
        public static List<ICDPlazaDetailsIL> GetAll()
        {
            try
            {
                return ICDPlazaDetailsDL.GetAll();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
