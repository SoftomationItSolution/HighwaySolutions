using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;
using System.Data;

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

        public static DataSet ReportSummeryGetByFilter(DataFilterIL data)
        {
            try
            {
                return ATCCEventDL.ReportSummeryGetByFilter(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataSet ReportLocationGetByFilter(DataFilterIL data)
        {
            try
            {
                return ATCCEventDL.ReportLocationGetByFilter(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataSet ReportClassGetByFilter(DataFilterIL data)
        {
            try
            {
                return ATCCEventDL.ReportClassGetByFilter(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataSet ReportPositionGetByFilter(DataFilterIL data)
        {
            try
            {
                return ATCCEventDL.ReportPositionGetByFilter(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
