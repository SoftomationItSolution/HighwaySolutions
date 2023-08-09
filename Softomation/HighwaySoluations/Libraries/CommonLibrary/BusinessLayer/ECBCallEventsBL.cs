using System;
using System.Collections.Generic;
using System.Data;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class ECBCallEventsBL
    {
        public static List<ResponceIL> Insert(ECBCallEventsIL ecbCallEvents)
        {
            try
            {
                return ECBCallEventsDL.Insert(ecbCallEvents);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<ResponceIL> Update(ECBCallEventsIL ecbCallEvents)
        {
            try
            {
                return ECBCallEventsDL.Update(ecbCallEvents);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<ECBCallEventsIL> GetLatest()
        {
            try
            {
                return ECBCallEventsDL.GetLatest();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
