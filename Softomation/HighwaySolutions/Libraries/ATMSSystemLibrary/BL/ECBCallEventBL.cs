using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;
namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class ECBCallEventBL
    {
        public static List<ResponseIL> Insert(ECBCallEventIL dataEvent)
        {
            try
            {
                return ECBCallEventDL.Insert(dataEvent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
