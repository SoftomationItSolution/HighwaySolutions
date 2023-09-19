using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class ICDSyncTimeDetailsBL
    {
        public static List<ResponseIL> RequestProcess(ICDSyncTimeDetailsIL ed)
        {
            try
            {
                return ICDSyncTimeDetailsDL.RequestProcess(ed);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<ICDSyncTimeDetailsIL> GetPendingRequest()
        {
            try
            {
                return ICDSyncTimeDetailsDL.GetPendingRequest();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
