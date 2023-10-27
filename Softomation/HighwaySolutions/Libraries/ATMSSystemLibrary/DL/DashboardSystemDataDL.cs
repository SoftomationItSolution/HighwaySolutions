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

        internal static DashboardSystemDataIL GetEquipments()
        {
            DashboardSystemDataIL dash = new DashboardSystemDataIL();
            try
            {
                string spName = "USP_DashboardEquipmentDetailsGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                DataSet dataSet = DBAccessor.LoadDataSet(command, tableName);
                foreach (DataRow dr in dataSet.Tables["Dashboard"].Rows)
                    dash.EquipmentDetails.Add(EquipmentDetailsDL.CreateObjectFromDataRow(dr));
                foreach (DataRow dr in dataSet.Tables["Table1"].Rows)
                    dash.EquipmentTypeDetails.Add(EquipmentTypeDL.CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dash;

        }

        internal static DashboardSystemDataIL GetATCC()
        {
            DashboardSystemDataIL dash = new DashboardSystemDataIL();

            try
            {
                string spName = "USP_DashboardATCCData";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                DataSet dataSet = DBAccessor.LoadDataSet(command, tableName);
                foreach (DataRow dr in dataSet.Tables["Dashboard"].Rows)
                    dash.HourTrafficCount.Add(CreateHourTraffic(dr));

                foreach (DataRow dr in dataSet.Tables["Table1"].Rows)
                    dash.LocationTrafficCount.Add(CreateLocationTraffic(dr));

                foreach (DataRow dr in dataSet.Tables["Table2"].Rows)
                    dash.VehicleTrafficCount.Add(CreateVehcileTraffic(dr));

                foreach (DataRow dr in dataSet.Tables["Table3"].Rows)
                    dash.LaneTrafficCount.Add(CreateLaneTraffic(dr));

                foreach (DataRow dr in dataSet.Tables["Table4"].Rows)
                    dash.LaneVehicleTrafficCount.Add(CreateLaneVehicleCount(dr));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dash;
        }

        internal static DashboardSystemDataIL GetVIDS()
        {
            DashboardSystemDataIL dash = new DashboardSystemDataIL();

            try
            {
                string spName = "USP_DashboardVIDSData";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                DataSet dataSet = DBAccessor.LoadDataSet(command, tableName);
                foreach (DataRow dr in dataSet.Tables["Dashboard"].Rows)
                    dash.HourTrafficCount.Add(CreateHourTraffic(dr));

                foreach (DataRow dr in dataSet.Tables["Table1"].Rows)
                    dash.LocationTrafficCount.Add(CreateLocationTraffic(dr));

                foreach (DataRow dr in dataSet.Tables["Table2"].Rows)
                    dash.EventCount.Add(CreateEventCount(dr));

                foreach (DataRow dr in dataSet.Tables["Table3"].Rows)
                    dash.LocationEventCount.Add(CreateLocationEventCount(dr));
               
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dash;
        }

       


        #region Common
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

            if (dr["LEventCount"] != DBNull.Value)
                cr.LEventCount = Convert.ToInt64(dr["LEventCount"]);

            if (dr["REventCount"] != DBNull.Value)
                cr.REventCount = Convert.ToInt64(dr["REventCount"]);

            if (dr["EventCount"] != DBNull.Value)
                cr.EventCount = Convert.ToInt64(dr["EventCount"]);

            return cr;
        }
        private static TrafficDetailsIL CreateLocationTraffic(DataRow dr)
        {
            TrafficDetailsIL cr = new TrafficDetailsIL();

            if (dr["ChainageNumber"] != DBNull.Value)
                cr.ChainageNumber = Convert.ToDecimal(dr["ChainageNumber"]);

            if (dr["LEventCount"] != DBNull.Value)
                cr.LEventCount = Convert.ToInt64(dr["LEventCount"]);

            if (dr["REventCount"] != DBNull.Value)
                cr.REventCount = Convert.ToInt64(dr["REventCount"]);

            if (dr["EventCount"] != DBNull.Value)
                cr.EventCount = Convert.ToInt64(dr["EventCount"]);
            return cr;
        }
        #endregion

        #region ATCC

        private static TrafficDetailsIL CreateVehcileTraffic(DataRow dr)
        {
            TrafficDetailsIL cr = new TrafficDetailsIL();

            if (dr["ChainageNumber"] != DBNull.Value)
                cr.ChainageNumber = Convert.ToDecimal(dr["ChainageNumber"]);

            if (dr["VehicleClassId"] != DBNull.Value)
                cr.VehicleClassId = Convert.ToInt16(dr["VehicleClassId"]);

            if (dr["VehicleClassName"] != DBNull.Value)
                cr.VehicleClassName = Convert.ToString(dr["VehicleClassName"]);

            if (dr["VehicleClassIcon"] != DBNull.Value)
                cr.VehicleClassIcon = Convert.ToString(dr["VehicleClassIcon"]);

            if (dr["LEventCount"] != DBNull.Value)
                cr.LEventCount = Convert.ToInt64(dr["LEventCount"]);

            if (dr["REventCount"] != DBNull.Value)
                cr.REventCount = Convert.ToInt64(dr["REventCount"]);

            if (dr["EventCount"] != DBNull.Value)
                cr.EventCount = Convert.ToInt64(dr["EventCount"]);
            return cr;
        }

        private static TrafficDetailsIL CreateLaneTraffic(DataRow dr)
        {
            TrafficDetailsIL cr = new TrafficDetailsIL();

            if (dr["ChainageNumber"] != DBNull.Value)
                cr.ChainageNumber = Convert.ToDecimal(dr["ChainageNumber"]);

            if (dr["LaneNumber"] != DBNull.Value)
                cr.LaneNumber = Convert.ToInt16(dr["LaneNumber"]);

            if (dr["LEventCount"] != DBNull.Value)
                cr.LEventCount = Convert.ToInt64(dr["LEventCount"]);

            if (dr["REventCount"] != DBNull.Value)
                cr.REventCount = Convert.ToInt64(dr["REventCount"]);

            if (dr["EventCount"] != DBNull.Value)
                cr.EventCount = Convert.ToInt64(dr["EventCount"]);
            return cr;
        }

        private static TrafficDetailsIL CreateLaneVehicleCount(DataRow dr)
        {
            TrafficDetailsIL cr = new TrafficDetailsIL();

            if (dr["ChainageNumber"] != DBNull.Value)
                cr.ChainageNumber = Convert.ToDecimal(dr["ChainageNumber"]);

            if (dr["VehicleClassId"] != DBNull.Value)
                cr.VehicleClassId = Convert.ToInt16(dr["VehicleClassId"]);

            if (dr["VehicleClassName"] != DBNull.Value)
                cr.VehicleClassName = Convert.ToString(dr["VehicleClassName"]);

            if (dr["VehicleClassIcon"] != DBNull.Value)
                cr.VehicleClassIcon = Convert.ToString(dr["VehicleClassIcon"]);

            if (dr["LaneNumber"] != DBNull.Value)
                cr.LaneNumber = Convert.ToInt16(dr["LaneNumber"]);

            if (dr["LEventCount"] != DBNull.Value)
                cr.LEventCount = Convert.ToInt64(dr["LEventCount"]);

            if (dr["REventCount"] != DBNull.Value)
                cr.REventCount = Convert.ToInt64(dr["REventCount"]);

            if (dr["EventCount"] != DBNull.Value)
                cr.EventCount = Convert.ToInt64(dr["EventCount"]);
            return cr;
        }


        #endregion

        #region VIDS
        private static TrafficDetailsIL CreateEventCount(DataRow dr)
        {
            TrafficDetailsIL cr = new TrafficDetailsIL();

            if (dr["EventTypeId"] != DBNull.Value)
                cr.EventTypeId = Convert.ToInt16(dr["EventTypeId"]);

            if (dr["EventTypeName"] != DBNull.Value)
                cr.EventTypeName = Convert.ToString(dr["EventTypeName"]);

            if (dr["LEventCount"] != DBNull.Value)
                cr.LEventCount = Convert.ToInt64(dr["LEventCount"]);

            if (dr["REventCount"] != DBNull.Value)
                cr.REventCount = Convert.ToInt64(dr["REventCount"]);

            if (dr["EventCount"] != DBNull.Value)
                cr.EventCount = Convert.ToInt64(dr["EventCount"]);
            return cr;
        }
        private static TrafficDetailsIL CreateLocationEventCount(DataRow dr)
        {
            TrafficDetailsIL cr = new TrafficDetailsIL();

            if (dr["ChainageNumber"] != DBNull.Value)
                cr.ChainageNumber = Convert.ToDecimal(dr["ChainageNumber"]);

            if (dr["EventTypeId"] != DBNull.Value)
                cr.EventTypeId = Convert.ToInt16(dr["EventTypeId"]);

            if (dr["EventTypeName"] != DBNull.Value)
                cr.EventTypeName = Convert.ToString(dr["EventTypeName"]);

            if (dr["LEventCount"] != DBNull.Value)
                cr.LEventCount = Convert.ToInt64(dr["LEventCount"]);

            if (dr["REventCount"] != DBNull.Value)
                cr.REventCount = Convert.ToInt64(dr["REventCount"]);

            if (dr["EventCount"] != DBNull.Value)
                cr.EventCount = Convert.ToInt64(dr["EventCount"]);
            return cr;
        }
        #endregion

    }
}
