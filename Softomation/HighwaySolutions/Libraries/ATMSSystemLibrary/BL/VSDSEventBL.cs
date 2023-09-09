using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class VSDSEventBL
    {
        public static List<VSDSEventIL> GetByHours(short hours)
        {
            try
            {
                return VSDSEventDL.GetByHours(hours);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<VSDSEventIL> GetPendingReviewByHours(short hours)
        {
            try
            {
                return VSDSEventDL.GetPendingReviewByHours(hours);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<VSDSEventIL> GetByFilter(DataFilterIL data)
        {
            try
            {
                return VSDSEventDL.GetByFilter(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
