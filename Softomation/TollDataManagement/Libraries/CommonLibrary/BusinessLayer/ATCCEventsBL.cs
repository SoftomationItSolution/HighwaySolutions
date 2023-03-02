using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class ATCCEventsBL
    {
        public static List<ResponceIL> InsertUpdate(ATCCEventsIL metEvent)
        {
            try
            {
                return ATCCEventsDL.InsertUpdate(metEvent);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<ATCCEventsIL> GetLatest()
        {
            try
            {
                return ATCCEventsDL.GetLatest();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
