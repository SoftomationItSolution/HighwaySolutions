using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class DenominationBL
    {
        public static List<DenominationIL> GetAll()
        {
            try
            {
                return DenominationDL.GetAll();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<DenominationIL> GetActive()
        {
            try
            {
                return DenominationDL.GetActive();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
