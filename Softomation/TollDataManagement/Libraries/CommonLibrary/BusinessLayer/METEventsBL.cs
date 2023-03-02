using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class METEventsBL
    {
        public static List<ResponceIL> InsertUpdate(METEventsIL metEvent)
        {
            try
            {
                return METEventsDL.InsertUpdate(metEvent);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<METEventsIL> GetLatest()
        {
            try
            {
                return METEventsDL.GetLatest();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
