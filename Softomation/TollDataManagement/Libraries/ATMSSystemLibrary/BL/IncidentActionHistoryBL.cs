using System;
using System.Collections.Generic;
using Softomation.ATMSSystemLibrary.DL;
using Softomation.ATMSSystemLibrary.IL;

namespace Softomation.ATMSSystemLibrary.BL
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
