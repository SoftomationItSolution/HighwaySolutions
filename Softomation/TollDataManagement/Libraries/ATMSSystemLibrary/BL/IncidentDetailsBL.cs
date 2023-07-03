using System;
using System.Collections.Generic;
using Softomation.ATMSSystemLibrary.IL;
using Softomation.ATMSSystemLibrary.DL;

namespace Softomation.ATMSSystemLibrary.BL
{
    public class IncidentDetailsBL
    {
        public static List<ResponseIL> Insert(IncidentDetailsIL ims)
        {
            try
            {
                return IncidentDetailsDL.Insert(ims);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<IncidentDetailsIL> GetUnAssigned()
        {
            try
            {
                return IncidentDetailsDL.GetUnAssigned();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<IncidentDetailsIL> GetPending()
        {
            try
            {
                return IncidentDetailsDL.GetPending();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<IncidentDetailsIL> GetClosed()
        {
            try
            {
                return IncidentDetailsDL.GetClosed();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
