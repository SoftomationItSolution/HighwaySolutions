using System;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class DashboardSystemDataBL
    {
        public static DashboardSystemDataIL GetEquipments()
        {
            try
            {
                return DashboardSystemDataDL.GetEquipments();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DashboardSystemDataIL GetATCC()
        {
            try
            {
                return DashboardSystemDataDL.GetATCC();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static DashboardSystemDataIL GetVIDS()
        {
            try
            {
                return DashboardSystemDataDL.GetVIDS();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
