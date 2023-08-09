using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class IncidentActionHistoryBL
    {
        public static List<ResponseIL> Insert(IncidentActionHistoryIL ims)
        {
            try
            {
                return IncidentActionHistoryDL.Insert(ims);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<IncidentActionHistoryIL> GetActionHistory(string IncidentId)
        {
            try
            {
                return IncidentActionHistoryDL.GetActionHistory(IncidentId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
