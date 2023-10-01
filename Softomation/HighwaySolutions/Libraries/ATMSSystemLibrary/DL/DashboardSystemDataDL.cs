using System;
using System.Data;
using System.Data.Common;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.DL
{
    internal class DashboardSystemDataDL
    {
        static string tableName = "Dashboard";
        internal static DashboardSystemDataIL GetATCC()
        {
            DashboardSystemDataIL dash = new DashboardSystemDataIL();

            try
            {
                string spName = "USP_DashboardATCCData";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                DataSet dataSet = DBAccessor.LoadDataSet(command, tableName);
                foreach (DataRow dr in dataSet.Tables["Table1"].Rows)
                    dash.HourTrafficCount.Add(CreateHourTraffic(dr));

                foreach (DataRow dr in dataSet.Tables["Table2"].Rows)
                    dash.LocationTrafficCount.Add(CreateLocationTraffic(dr));

                foreach (DataRow dr in dataSet.Tables["Table3"].Rows)
                    dash.VehicleTrafficCount.Add(CreateVehcileTraffic(dr));

                foreach (DataRow dr in dataSet.Tables["Table4"].Rows)
                    dash.LaneTrafficCount.Add(CreateLaneTraffic(dr));

                foreach (DataRow dr in dataSet.Tables["Table5"].Rows)
                    dash.LaneVehicleTrafficCount.Add(CreateLaneVehicleTraffic(dr));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dash;
        }

        private static TrafficDetailsIL CreateHourTraffic(DataRow dr)
        {
            TrafficDetailsIL cr = new TrafficDetailsIL();
            if (dr["StartDateTime"] != DBNull.Value)
                cr.StartDateTime = Convert.ToDateTime(dr["StartDateTime"]);

            if (dr["EndDateTime"] != DBNull.Value)
                cr.EndDateTime = Convert.ToDateTime(dr["EndDateTime"]);

            if (dr["SlotStartTime"] != DBNull.Value)
                cr.TimeSloat = Convert.ToString(dr["SlotStartTime"]);

            if (dr["SlotEndTime"] != DBNull.Value)
                cr.TimeSloat = cr.TimeSloat + "-" + Convert.ToString(dr["SlotEndTime"]);

            if (dr["ChainageNumber"] != DBNull.Value)
                cr.ChainageNumber = Convert.ToDecimal(dr["ChainageNumber"]);

            if (dr["DirectionId"] != DBNull.Value)
                cr.DirectionId = Convert.ToInt16(dr["DirectionId"]);

            if (dr["VehicleCount"] != DBNull.Value)
                cr.EventCount = Convert.ToInt64(dr["VehicleCount"]);

            cr.DirectionName = Enum.GetName(typeof(CommonLibrary.Constants.DirectionType), (CommonLibrary.Constants.DirectionType)cr.DirectionId);

            return cr;
        }

        private static TrafficDetailsIL CreateLocationTraffic(DataRow dr)
        {
            TrafficDetailsIL cr = new TrafficDetailsIL();

            if (dr["ChainageNumber"] != DBNull.Value)
                cr.ChainageNumber = Convert.ToDecimal(dr["ChainageNumber"]);

            if (dr["DirectionId"] != DBNull.Value)
                cr.DirectionId = Convert.ToInt16(dr["DirectionId"]);

            if (dr["VehicleCount"] != DBNull.Value)
                cr.EventCount = Convert.ToInt64(dr["VehicleCount"]);

            cr.DirectionName = Enum.GetName(typeof(CommonLibrary.Constants.DirectionType), (CommonLibrary.Constants.DirectionType)cr.DirectionId);
            return cr;
        }

        private static TrafficDetailsIL CreateVehcileTraffic(DataRow dr)
        {
            TrafficDetailsIL cr = new TrafficDetailsIL();

            if (dr["ChainageNumber"] != DBNull.Value)
                cr.ChainageNumber = Convert.ToDecimal(dr["ChainageNumber"]);

            if (dr["DirectionId"] != DBNull.Value)
                cr.DirectionId = Convert.ToInt16(dr["DirectionId"]);

            if (dr["VehicleClassId"] != DBNull.Value)
                cr.VehicleClassId = Convert.ToInt16(dr["VehicleClassId"]);

            if (dr["VehicleClassName"] != DBNull.Value)
                cr.VehicleClassName = Convert.ToString(dr["VehicleClassName"]);

            if (dr["VehicleClassIcon"] != DBNull.Value)
                cr.VehicleClassIcon = Convert.ToString(dr["VehicleClassIcon"]);
            
            if (dr["VehicleCount"] != DBNull.Value)
                cr.EventCount = Convert.ToInt64(dr["VehicleCount"]);

            cr.DirectionName = Enum.GetName(typeof(CommonLibrary.Constants.DirectionType), (CommonLibrary.Constants.DirectionType)cr.DirectionId);
            return cr;
        }

        private static TrafficDetailsIL CreateLaneTraffic(DataRow dr)
        {
            TrafficDetailsIL cr = new TrafficDetailsIL();

            if (dr["ChainageNumber"] != DBNull.Value)
                cr.ChainageNumber = Convert.ToDecimal(dr["ChainageNumber"]);

            if (dr["DirectionId"] != DBNull.Value)
                cr.DirectionId = Convert.ToInt16(dr["DirectionId"]);

            if (dr["LaneNumber"] != DBNull.Value)
                cr.LaneNumber = Convert.ToInt16(dr["LaneNumber"]);

            if (dr["VehicleCount"] != DBNull.Value)
                cr.EventCount = Convert.ToInt64(dr["VehicleCount"]);

            cr.DirectionName = Enum.GetName(typeof(CommonLibrary.Constants.DirectionType), (CommonLibrary.Constants.DirectionType)cr.DirectionId);
            return cr;
        }

        private static TrafficDetailsIL CreateLaneVehicleTraffic(DataRow dr)
        {
            TrafficDetailsIL cr = new TrafficDetailsIL();

            if (dr["ChainageNumber"] != DBNull.Value)
                cr.ChainageNumber = Convert.ToDecimal(dr["ChainageNumber"]);

            if (dr["DirectionId"] != DBNull.Value)
                cr.DirectionId = Convert.ToInt16(dr["DirectionId"]);

            if (dr["VehicleClassId"] != DBNull.Value)
                cr.VehicleClassId = Convert.ToInt16(dr["VehicleClassId"]);

            if (dr["VehicleClassName"] != DBNull.Value)
                cr.VehicleClassName = Convert.ToString(dr["VehicleClassName"]);

            if (dr["VehicleClassIcon"] != DBNull.Value)
                cr.VehicleClassIcon = Convert.ToString(dr["VehicleClassIcon"]);

            if (dr["LaneNumber"] != DBNull.Value)
                cr.LaneNumber = Convert.ToInt16(dr["LaneNumber"]);

            if (dr["VehicleCount"] != DBNull.Value)
                cr.EventCount = Convert.ToInt64(dr["VehicleCount"]);

            cr.DirectionName = Enum.GetName(typeof(CommonLibrary.Constants.DirectionType), (CommonLibrary.Constants.DirectionType)cr.DirectionId);
            return cr;
        }


    }
}
