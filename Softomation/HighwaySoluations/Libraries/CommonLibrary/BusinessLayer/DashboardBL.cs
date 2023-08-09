using System;
using System.Collections.Generic;
using System.Data;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class DashboardBL
    {
        public static List<DashboardIL> GetHourlyTrafic(DashboardIL dashboard)
        {
            try
            {
                return DashboardDL.GetHourlyTrafic(dashboard);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<DashboardIL> GetTransTypeCount(DashboardIL dashboard)
        {
            try
            {
                return DashboardDL.GetTransTypeCount(dashboard);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<DashboardIL> GetLaneRevenue(DashboardIL dashboard)
        {
            try
            {
                return DashboardDL.GetLaneRevenue(dashboard);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
