using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class ATCCEventBL
    {
        public static List<ATCCEventIL> GetALLByFilter(DataFilterIL data)
        {
            try
            {
                return ATCCEventDL.GetALLByFilter(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<ATCCEventIL> ATCCUnreviewedEventsGetByFilter(DataFilterIL data)
        {
            try
            {
                return ATCCEventDL.ATCCUnreviewedEventsGetByFilter(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<AtccReviewedIL> GetReviewedByFilter(DataFilterIL data)
        {
            try
            {
                return ATCCEventDL.GetReviewedByFilter(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<ResponseIL> ReviewUpdate(VSDSReviewedEventIL data)
        {
            try
            {
                return ATCCEventDL.ReviewUpdate(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
