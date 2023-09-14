using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class ICDTagDetailsBL
    {
        public static List<ResponseIL> RequestProcess(ICDTagDetailsIL ed)
        {
            try
            {
                return ICDTagDetailsDL.RequestProcess(ed);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<ICDTagDetailsIL> GetPendingRequest()
        {
            try
            {
                return ICDTagDetailsDL.GetPendingRequest();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
