using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.NMSSystemLibrary.IL;
using HighwaySoluations.Softomation.NMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.NMSSystemLibrary.BL
{
    public class IMCPStatusBL
    {
        public static List<ResponseIL> Insert(IMCPStatusIL dataEvent)
        {
            try
            {
                return IMCPStatusDL.Insert(dataEvent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
