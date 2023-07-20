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

        public static List<ResponseIL> Update(IncidentDetailsIL ims)
        {
            try
            {
                return IncidentDetailsDL.Update(ims);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static IncidentDetailsIL GetById(String IncidentId)
        {
            try
            {
                return IncidentDetailsDL.GetById(IncidentId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<IncidentDetailsIL> GetInProgress(short hours)
        {
            try
            {
                return IncidentDetailsDL.GetInProgress(hours);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<IncidentDetailsIL> GetPending(short hours)
        {
            try
            {
                return IncidentDetailsDL.GetPending(hours);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<IncidentDetailsIL> GetClosed(short hours)
        {
            try
            {
                return IncidentDetailsDL.GetClosed(hours);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
