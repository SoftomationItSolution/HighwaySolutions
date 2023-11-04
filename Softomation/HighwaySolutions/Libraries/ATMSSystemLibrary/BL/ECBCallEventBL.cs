using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;
using System.Data;

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
        public static List<ECBCallEventIL> GetByHours(short hours)
        {
            try
            {
                return ECBCallEventDL.GetByHours(hours);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<ECBCallEventIL> GetByFilter(DataFilterIL data)
        {
            try
            {
                return ECBCallEventDL.GetByFilter(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static DataSet ReportSummeryGetByFilter(DataFilterIL filter)
        {
            try
            {
                return ECBCallEventDL.ReportSummeryGetByFilter(filter);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static DataSet ReportLocationGetByFilter(DataFilterIL filter)
        {
            try
            {
                return ECBCallEventDL.ReportLocationGetByFilter(filter);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
