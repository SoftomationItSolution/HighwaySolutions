using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class VMSMessageHistoryBL
    {
        public static List<ResponseIL> Insert(VMSMessageHistoryIL ss)
        {
            try
            {
                return VMSMessageHistoryDL.Insert(ss);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<VMSMessageHistoryIL> GetAll()
        {
            try
            {
                return VMSMessageHistoryDL.GetAll();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<VMSMessageHistoryIL> GetByHours(short hours)
        {
            try
            {
                return VMSMessageHistoryDL.GetByHours(hours);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<VMSMessageHistoryIL> GetByFilter(DataFilterIL data)
        {
            try
            {
                return VMSMessageHistoryDL.GetByFilter(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
