using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class DataFilterBL
    {
        public static DataFilterIL Get()
        {
            try
            {
                return DataFilterDL.Get();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataFilterIL GetForReport()
        {
            try
            {
                return DataFilterDL.GetForReport();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<ReportMasterIL> GetReportCategory()
        {
            try
            {
                return DataFilterDL.GetReportCategory();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<ReportMasterIL> GetReportCategoryBYId(Int32 ReportId)
        {
            try
            {
                return DataFilterDL.GetReportCategoryBYId(ReportId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
