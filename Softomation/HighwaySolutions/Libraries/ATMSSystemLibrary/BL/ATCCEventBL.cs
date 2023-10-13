using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class ATCCEventBL
    {
        public static List<ResponseIL> Insert(ATCCEventIL dataEvent)
        {
            try
            {
                return ATCCEventDL.Insert(dataEvent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<ATCCEventIL> GetByHours(short hours)
        {
            try
            {
                return ATCCEventDL.GetByHours(hours);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<ATCCEventIL> GetPendingReviewByHours(short hours)
        {
            try
            {
                return ATCCEventDL.GetPendingReviewByHours(hours);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<ATCCEventIL> GetByFilter(DataFilterIL data)
        {
            try
            {
                return ATCCEventDL.GetByFilter(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        
    }
}
