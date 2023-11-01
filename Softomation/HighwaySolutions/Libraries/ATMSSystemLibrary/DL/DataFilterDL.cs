using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DBA;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.DL
{
    internal class DataFilterDL
    {
        internal static DataFilterIL GetBySystemId(Int16 SystemId)
        {
            DataSet ds = new DataSet();
            DataFilterIL dataResult = new DataFilterIL();
            List<MasterDataIL> SystemData = new List<MasterDataIL>();
            List<MasterDataIL> ControlData = new List<MasterDataIL>();
            List<MasterDataIL> PackageData = new List<MasterDataIL>();
            List<MasterDataIL> ChainageData = new List<MasterDataIL>();
            List<MasterDataIL> IncidentData = new List<MasterDataIL>();
            List<MasterDataIL> VehcileData = new List<MasterDataIL>();
            try
            {
                string spName = "USP_MasterDataGetBySystemId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SystemId", DbType.Int32, SystemId, ParameterDirection.Input));
                ds = DBAccessor.LoadDataSet(command, "temp");
                #region System Master
                foreach (DataRow dr in ds.Tables[0].Rows)
                    SystemData.Add(CreateObjectForSystem(dr));
                #endregion

                #region Control Room
                foreach (DataRow dr in ds.Tables[1].Rows)
                    ControlData.Add(CreateObjectForControlRoom(dr));
                #endregion
                
                #region Package
                foreach (DataRow dr in ds.Tables[2].Rows)
                    PackageData.Add(CreateObjectForPackage(dr));
                #endregion
                
                #region Chainage
                foreach (DataRow dr in ds.Tables[3].Rows)
                    ChainageData.Add(CreateObjectForChainage(dr));
                #endregion
                
                #region Incident
                foreach (DataRow dr in ds.Tables[4].Rows)
                    IncidentData.Add(CreateObjectForIncident(dr));
                #endregion

                #region Vehcile
                foreach (DataRow dr in ds.Tables[5].Rows)
                    VehcileData.Add(CreateObjectForVehcile(dr));
                #endregion
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally 
            {
                dataResult.SystemDataList = SystemData;
                dataResult.ControlRoomDataList = ControlData;
                dataResult.PackageDataList = PackageData;
                dataResult.ChainageDataList = ChainageData;
                dataResult.IncidentDataList = IncidentData;
                dataResult.VehicleTypeList = VehcileData;
            }
            return dataResult;
        }
        internal static DataFilterIL GetReportBySystemId(Int16 SystemId)
        {
            DataSet ds = new DataSet();
            DataFilterIL dataResult = new DataFilterIL();
            List<MasterDataIL> reportData = new List<MasterDataIL>();
            try
            {
                string spName = "USP_ReportDataGetBySystemId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SystemId", DbType.Int32, SystemId, ParameterDirection.Input));
                ds = DBAccessor.LoadDataSet(command, "temp");
                #region System Master
                foreach (DataRow dr in ds.Tables[0].Rows)
                    reportData.Add(CreateObjectForReport(dr));
                #endregion
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally 
            {
                dataResult.ReportTypeList = reportData;
            }
            return dataResult;
        }

        #region Helpler Method
        private static MasterDataIL CreateObjectForSystem(DataRow dr)
        {
            MasterDataIL dataFilter = new MasterDataIL();
            if (dr["SystemId"] != DBNull.Value)
                dataFilter.DataId = Convert.ToInt16(dr["SystemId"]);

            if (dr["SystemName"] != DBNull.Value)
                dataFilter.DataName = Convert.ToString(dr["SystemName"]);

            return dataFilter;
        }
        private static MasterDataIL CreateObjectForControlRoom(DataRow dr)
        {
            MasterDataIL dataFilter = new MasterDataIL();
            if (dr["ControlRoomId"] != DBNull.Value)
                dataFilter.DataId = Convert.ToInt16(dr["ControlRoomId"]);

            if (dr["ControlRoomName"] != DBNull.Value)
                dataFilter.DataName = Convert.ToString(dr["ControlRoomName"]);

            return dataFilter;
        }
        private static MasterDataIL CreateObjectForPackage(DataRow dr)
        {
            MasterDataIL dataFilter = new MasterDataIL();
            if (dr["PackageId"] != DBNull.Value)
                dataFilter.DataId = Convert.ToInt16(dr["PackageId"]);

            if (dr["PackageName"] != DBNull.Value)
                dataFilter.DataName = Convert.ToString(dr["PackageName"]);
            
            if (dr["ControlRoomId"] != DBNull.Value)
                dataFilter.ParentId = Convert.ToInt16(dr["ControlRoomId"]);

            if (dr["StartChainageNumber"] != DBNull.Value)
                dataFilter.MinValue = Convert.ToDecimal(dr["StartChainageNumber"]);

            if (dr["EndChainageNumber"] != DBNull.Value)
                dataFilter.MaxValue = Convert.ToDecimal(dr["EndChainageNumber"]);

            return dataFilter;
        }
        private static MasterDataIL CreateObjectForChainage(DataRow dr)
        {
            MasterDataIL dataFilter = new MasterDataIL();
            if (dr["ChainageNumber"] != DBNull.Value)
            {
                dataFilter.DataValue = Convert.ToDecimal(dr["ChainageNumber"]);
                dataFilter.DataName = SystemConstants.ConvertChainageName(dataFilter.DataValue);
            }

            return dataFilter;
        }
        private static MasterDataIL CreateObjectForIncident(DataRow dr)
        {
            MasterDataIL dataFilter = new MasterDataIL();
            if (dr["IncidentCategoryId"] != DBNull.Value)
                dataFilter.DataId = Convert.ToInt16(dr["IncidentCategoryId"]);

            if (dr["IncidentCategoryName"] != DBNull.Value)
                dataFilter.DataName = Convert.ToString(dr["IncidentCategoryName"]);

            return dataFilter;
        }

        private static MasterDataIL CreateObjectForVehcile(DataRow dr)
        {
            MasterDataIL dataFilter = new MasterDataIL();
            if (dr["VehicleClassId"] != DBNull.Value)
                dataFilter.DataId = Convert.ToInt16(dr["VehicleClassId"]);

            if (dr["VehicleClassName"] != DBNull.Value)
                dataFilter.DataName = Convert.ToString(dr["VehicleClassName"]);

            return dataFilter;
        }

        private static MasterDataIL CreateObjectForReport(DataRow dr)
        {
            MasterDataIL dataFilter = new MasterDataIL();
            if (dr["ReportId"] != DBNull.Value)
                dataFilter.DataId = Convert.ToInt16(dr["ReportId"]);

            if (dr["ReportName"] != DBNull.Value)
                dataFilter.DataName = Convert.ToString(dr["ReportName"]);

            if (dr["ParentId"] != DBNull.Value)
                dataFilter.ParentId = Convert.ToInt16(dr["ParentId"]);

            return dataFilter;
        }
        #endregion

    }
}
