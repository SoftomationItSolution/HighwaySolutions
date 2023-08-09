using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class ReportMasterBL
    {
        public static List<ReportMasterIL> GetAll()
        {
            try
            {
                return ReportMasterDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<ReportMasterIL> GetActive()
        {
            try
            {
                return ReportMasterDL.GetActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static ReportMasterIL GetById(short ReportId)
        {
            try
            {
                return ReportMasterDL.GetById(ReportId);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public static ReportMasterIL GetByName(String ReportName)
        {
            try
            {
                return ReportMasterDL.GetByName(ReportName);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}
