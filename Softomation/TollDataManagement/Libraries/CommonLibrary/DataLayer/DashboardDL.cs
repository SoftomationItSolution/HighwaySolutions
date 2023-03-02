using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class DashboardDL
    {
        #region Global Varialble
        static DataTable dt;
        static DataSet ds;
        static string tableName = "tbl_DashBoard";
        #endregion
        internal static List<DashboardIL> GetHourlyTrafic(DashboardIL dashboard)
        {
            DataTable dt = new DataTable();
            List<DashboardIL> dataLists = new List<DashboardIL>();
            try
            {
                string spName = "USP_HourlyTraficCountDashboard";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, dashboard.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@StatusDate", DbType.String, dashboard.StartDateTime.ToString("dd-MMM-yyyy"), ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EndDateTime", DbType.DateTime, dashboard.EndDateTime, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    dataLists.Add(CreateHourlyTraficFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dataLists;
        }

        internal static List<DashboardIL> GetTransTypeCount(DashboardIL dashboard)
        {
            DataTable dt = new DataTable();
            List<DashboardIL> dataLists = new List<DashboardIL>();
            try
            {
                string spName = "USP_TrandTypeCountDashboard";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, dashboard.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@StatusDate", DbType.String, dashboard.StartDateTime.ToString("dd-MMM-yyyy"), ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    dataLists.Add(CreateTranTypeTraficFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dataLists;
        }

        internal static List<DashboardIL> GetLaneRevenue(DashboardIL dashboard)
        {
            DataTable dt = new DataTable();
            List<DashboardIL> dataLists = new List<DashboardIL>();
            try
            {
                string spName = "USP_LaneRevenueDashboard";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, dashboard.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@StatusDate", DbType.String, dashboard.StartDateTime.ToString("dd-MMM-yyyy"), ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    dataLists.Add(CreateLaneRevenueFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dataLists;
        }

        #region Helper Methods
        private static DashboardIL CreateHourlyTraficFromDataRow(DataRow dr)
        {
            DashboardIL data = new DashboardIL();

            if (dr["StatusTime"] != DBNull.Value)
                data.StatusTime = Convert.ToString(dr["StatusTime"]);

            if (dr["TraficCount"] != DBNull.Value)
                data.TraficCount = Convert.ToInt64(dr["TraficCount"]);

            return data;
        }
        private static DashboardIL CreateTranTypeTraficFromDataRow(DataRow dr)
        {
            DashboardIL data = new DashboardIL();

            if (dr["TypeName"] != DBNull.Value)
                data.StatusTime = Convert.ToString(dr["TypeName"]);

            if (dr["TraficCount"] != DBNull.Value)
                data.TraficCount = Convert.ToInt64(dr["TraficCount"]);

            return data;
        }

        private static DashboardIL CreateLaneRevenueFromDataRow(DataRow dr)
        {
            DashboardIL data = new DashboardIL();

            if (dr["LaneNumber"] != DBNull.Value)
                data.StatusTime = Convert.ToString(dr["LaneNumber"]);

            if (dr["TranAmountPer"] != DBNull.Value)
                data.AverageAmount = Convert.ToInt64(dr["TranAmountPer"]);

            return data;
        }
        #endregion
    }
}
