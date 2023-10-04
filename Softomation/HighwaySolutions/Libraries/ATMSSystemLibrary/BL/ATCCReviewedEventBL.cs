using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class ATCCReviewedEventBL
    {
        public static List<ResponseIL> ReviewUpdate(ATCCReviewedEventIL data)
        {
            try
            {
                return ATCCReviewedEventDL.ReviewUpdate(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<ATCCReviewedEventIL> GetByHours(short hours)
        {
            try
            {
                return ATCCReviewedEventDL.GetByHours(hours);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<ATCCReviewedEventIL> GetByFilter(DataFilterIL data)
        {
            try
            {
                return ATCCReviewedEventDL.GetByFilter(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
