using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class VSDSReviewedEventBL
    {
        public static List<ResponseIL> ReviewUpdate(VSDSReviewedEventIL data)
        {
            try
            {
                return VSDSReviewedEventDL.ReviewUpdate(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<VSDSReviewedEventIL> GetByHours(short hours)
        {
            try
            {
                return VSDSReviewedEventDL.GetByHours(hours);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<VSDSReviewedEventIL> GetByFilter(DataFilterIL data)
        {
            try
            {
                return VSDSReviewedEventDL.GetByFilter(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
