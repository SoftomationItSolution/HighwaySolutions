using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class IncidentSourceBL
    {
        public static List<IncidentSourceIL> GetAll()
        {
            try
            {
                return IncidentSourceDL.GetAll();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<IncidentSourceIL> GetActive()
        {
            try
            {
                return IncidentSourceDL.GetActive();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
