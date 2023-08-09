using System;
using System.Collections.Generic;
using Softomation.ATMSSystemLibrary.IL;
using Softomation.ATMSSystemLibrary.DL;

namespace Softomation.ATMSSystemLibrary.BL
{
    public class IncidentStatusBL
    {
        public static List<IncidentStatusIL> GetAll()
        {
            try
            {
                return IncidentStatusDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<IncidentStatusIL> GetActive()
        {
            try
            {
                return IncidentStatusDL.GetActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
