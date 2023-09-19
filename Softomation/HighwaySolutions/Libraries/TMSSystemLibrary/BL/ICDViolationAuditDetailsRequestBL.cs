using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class ICDViolationAuditDetailsRequestBL
    {
        public static List<ResponseIL> RequestProcess(ICDViolationAuditDetailsRequestIL ed)
        {
            try
            {
                return ICDViolationAuditDetailsRequestDL.RequestProcess(ed);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<ICDViolationAuditDetailsRequestIL> GetPendingRequest()
        {
            try
            {
                return ICDViolationAuditDetailsRequestDL.GetPendingRequest();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
