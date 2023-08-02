using System;
using Softomation.ATMSSystemLibrary.DL;
using Softomation.ATMSSystemLibrary.IL;

namespace Softomation.ATMSSystemLibrary.BL
{
    public class DataFilterBL
    {
        public static DataFilterIL GetBySystemId(Int16 SystemId)
        {
            try
            {
                return DataFilterDL.GetBySystemId(SystemId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataFilterIL GetReportBySystemId(Int16 SystemId)
        {
            try
            {
                return DataFilterDL.GetReportBySystemId(SystemId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
