using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class VIDSReviewedEventBL
    {
        public static List<ResponseIL> ReviewUpdate(VIDSReviewedEventIL data)
        {
            try
            {
                return VIDSReviewedEventDL.ReviewUpdate(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<VIDSReviewedEventIL> GetByHours(short hours)
        {
            try
            {
                return VIDSReviewedEventDL.GetByHours(hours);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<VIDSReviewedEventIL> GetByFilter(DataFilterIL data)
        {
            try
            {
                return VIDSReviewedEventDL.GetByFilter(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
