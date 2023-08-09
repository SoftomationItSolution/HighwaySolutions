using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class IncidentCategoryBL
    {
        public static List<IncidentCategoryIL> GetAll()
        {
            try
            {
                return IncidentCategoryDL.GetAll();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<IncidentCategoryIL> GetActive()
        {
            try
            {
                return IncidentCategoryDL.GetActive();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
