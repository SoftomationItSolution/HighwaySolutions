using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class ICDRequestPaymentDetailsBL
    {
        public static List<ResponseIL> RequestProcess(ICDRequestPaymentDetailsIL ed)
        {
            try
            {
                return ICDRequestPaymentDetailsDL.RequestProcess(ed);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<ICDRequestPaymentDetailsIL> GetPendingRequest()
        {
            try
            {
                return ICDRequestPaymentDetailsDL.GetPendingRequest();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
