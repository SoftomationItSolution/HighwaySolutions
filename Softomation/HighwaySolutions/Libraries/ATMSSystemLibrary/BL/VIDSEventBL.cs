using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class VIDSEventBL
    {
        public static List<ResponseIL> Insert(VIDSEventIL dataEvent)
        {
            try
            {
                return VIDSEventDL.Insert(dataEvent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<VIDSEventIL> GetByHours(short hours)
        {
            try
            {
                return VIDSEventDL.GetByHours(hours);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<VIDSEventIL> GetPendingReviewByHours(short hours)
        {
            try
            {
                return VIDSEventDL.GetPendingReviewByHours(hours);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<VIDSEventIL> GetByFilter(DataFilterIL data)
        {
            try
            {
                return VIDSEventDL.GetByFilter(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

       
    }
}
