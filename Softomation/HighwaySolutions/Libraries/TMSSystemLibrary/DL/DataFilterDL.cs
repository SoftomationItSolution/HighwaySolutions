using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class DataFilterDL
    {
        internal static DataFilterIL Get()
        {
            DataSet ds = new DataSet();
            DataFilterIL dataResult = new DataFilterIL();
            List<MasterDataIL> ShiftTimining = new List<MasterDataIL>();
            List<MasterDataIL> TCMasterData = new List<MasterDataIL>();
            List<MasterDataIL> AuditerMasterData = new List<MasterDataIL>();
            List<MasterDataIL> PlazaData = new List<MasterDataIL>();
            List<MasterDataIL> LaneData = new List<MasterDataIL>();
            List<MasterDataIL> TransactionTypeData = new List<MasterDataIL>();
            List<MasterDataIL> PayemntTypeData = new List<MasterDataIL>();
            List<MasterDataIL> ExemptTypeData = new List<MasterDataIL>();
            List<MasterDataIL> SystemClassData = new List<MasterDataIL>();
            List<MasterDataIL> SystemSubClassData = new List<MasterDataIL>();
            try
            {
                string spName = "USP_MasterDataGet";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                ds = DBAccessor.LoadDataSet(command, "temp");
                #region Shift Timining
                foreach (DataRow dr in ds.Tables[0].Rows)
                    ShiftTimining.Add(CreateObjectForShiftTimining(dr));
                #endregion

                #region TC User Master
                foreach (DataRow dr in ds.Tables[1].Rows)
                    TCMasterData.Add(CreateObjectForTCUserMaster(dr));
                #endregion

                #region Auditor User Master
                foreach (DataRow dr in ds.Tables[2].Rows)
                    AuditerMasterData.Add(CreateObjectForAuditorUserMaster(dr));
                #endregion

                #region Plaza
                foreach (DataRow dr in ds.Tables[3].Rows)
                    PlazaData.Add(CreateObjectForPlaza(dr));
                #endregion

                #region Lane
                foreach (DataRow dr in ds.Tables[4].Rows)
                    LaneData.Add(CreateObjectForLane(dr));
                #endregion

                #region Transaction Type
                foreach (DataRow dr in ds.Tables[5].Rows)
                    TransactionTypeData.Add(CreateObjectForTransactionType(dr));
                #endregion

                #region Payemnt Type
                foreach (DataRow dr in ds.Tables[6].Rows)
                    PayemntTypeData.Add(CreateObjectForPayemntType(dr));
                #endregion

                #region Exempt Type
                foreach (DataRow dr in ds.Tables[7].Rows)
                    ExemptTypeData.Add(CreateObjectForExemptType(dr));
                #endregion

                #region System Class Data
                foreach (DataRow dr in ds.Tables[8].Rows)
                    SystemClassData.Add(CreateObjectForSystemVehicleClass(dr));
                #endregion

                #region System Sub Class Data
                foreach (DataRow dr in ds.Tables[9].Rows)
                    SystemSubClassData.Add(CreateObjectForSystemVehicleSubClass(dr));
                #endregion
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dataResult.ShiftTiminingList = ShiftTimining;
                dataResult.TCMasterList = TCMasterData;
                dataResult.AuditerMasterList = AuditerMasterData;
                dataResult.PlazaDataList = PlazaData;
                dataResult.LaneDataList = LaneData;
                dataResult.TransactionTypeList = TransactionTypeData;
                dataResult.PayemntTypeList = PayemntTypeData;
                dataResult.ExemptTypeList = ExemptTypeData;
                dataResult.SystemClassList = SystemClassData;
                dataResult.SystemSubClassList = SystemSubClassData;
            }
            return dataResult;
        }
        internal static DataFilterIL GetForReport()
        {
            DataSet ds = new DataSet();
            DataFilterIL dataResult = new DataFilterIL();
            try
            {
                string spName = "USP_ReportDataGetBySystemId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                ds = DBAccessor.LoadDataSet(command, "temp");
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dataResult;
        }
        #region Helpler Method
        private static MasterDataIL CreateObjectForShiftTimining(DataRow dr)
        {
            MasterDataIL dataFilter = new MasterDataIL();
            if (dr["ShiftId"] != DBNull.Value)
            {
                dataFilter.DataId = Convert.ToInt16(dr["ShiftId"]);
                dataFilter.DataName = "Shift-" + Convert.ToString(dr["ShiftId"]);
            }
            return dataFilter;
        }
        private static MasterDataIL CreateObjectForTCUserMaster(DataRow dr)
        {
            MasterDataIL dataFilter = new MasterDataIL();
            if (dr["UserId"] != DBNull.Value)
                dataFilter.DataId = Convert.ToInt16(dr["UserId"]);

            if (dr["LoginId"] != DBNull.Value)
                dataFilter.DataName = Convert.ToString(dr["LoginId"]);

            return dataFilter;
        }

        private static MasterDataIL CreateObjectForAuditorUserMaster(DataRow dr)
        {
            MasterDataIL dataFilter = new MasterDataIL();
            if (dr["UserId"] != DBNull.Value)
                dataFilter.DataId = Convert.ToInt16(dr["UserId"]);

            if (dr["LoginId"] != DBNull.Value)
                dataFilter.DataName = Convert.ToString(dr["LoginId"]);

            return dataFilter;
        }
        private static MasterDataIL CreateObjectForPlaza(DataRow dr)
        {
            MasterDataIL dataFilter = new MasterDataIL();
            if (dr["PlazaId"] != DBNull.Value)
                dataFilter.DataId = Convert.ToInt16(dr["PlazaId"]);

            if (dr["PlazaName"] != DBNull.Value)
                dataFilter.DataName = Convert.ToString(dr["PlazaName"]);

            return dataFilter;
        }
        private static MasterDataIL CreateObjectForLane(DataRow dr)
        {
            MasterDataIL dataFilter = new MasterDataIL();
            if (dr["LaneId"] != DBNull.Value)
                dataFilter.DataId = Convert.ToInt64(dr["LaneId"]);

            if (dr["LaneNumber"] != DBNull.Value)
                dataFilter.DataName = "Lane-" + Convert.ToString(dr["LaneNumber"]);

            if (dr["PlazaId"] != DBNull.Value)
                dataFilter.ParentId = Convert.ToInt64(dr["PlazaId"]);

            return dataFilter;
        }
        private static MasterDataIL CreateObjectForTransactionType(DataRow dr)
        {
            MasterDataIL dataFilter = new MasterDataIL();
            if (dr["TransactionTypeId"] != DBNull.Value)
                dataFilter.DataId = Convert.ToInt16(dr["TransactionTypeId"]);

            if (dr["TransactionTypeName"] != DBNull.Value)
                dataFilter.DataName = Convert.ToString(dr["TransactionTypeName"]);

            return dataFilter;
        }

        private static MasterDataIL CreateObjectForPayemntType(DataRow dr)
        {
            MasterDataIL dataFilter = new MasterDataIL();
            if (dr["PaymentTypeId"] != DBNull.Value)
                dataFilter.DataId = Convert.ToInt16(dr["PaymentTypeId"]);

            if (dr["PaymentTypeName"] != DBNull.Value)
                dataFilter.DataName = Convert.ToString(dr["PaymentTypeName"]);

            return dataFilter;
        }

        private static MasterDataIL CreateObjectForExemptType(DataRow dr)
        {
            MasterDataIL dataFilter = new MasterDataIL();
            if (dr["ExemptTypeId"] != DBNull.Value)
                dataFilter.DataId = Convert.ToInt16(dr["ExemptTypeId"]);

            if (dr["ExemptTypeName"] != DBNull.Value)
                dataFilter.DataName = Convert.ToString(dr["ExemptTypeName"]);

            return dataFilter;
        }

        private static MasterDataIL CreateObjectForSystemVehicleClass(DataRow dr)
        {
            MasterDataIL dataFilter = new MasterDataIL();
            if (dr["SystemVehicleClassId"] != DBNull.Value)
                dataFilter.DataId = Convert.ToInt16(dr["SystemVehicleClassId"]);

            if (dr["SystemVehicleClassName"] != DBNull.Value)
                dataFilter.DataName = Convert.ToString(dr["SystemVehicleClassName"]);

            return dataFilter;
        }

        private static MasterDataIL CreateObjectForSystemVehicleSubClass(DataRow dr)
        {
            MasterDataIL dataFilter = new MasterDataIL();
            if (dr["FasTagVehicleClassId"] != DBNull.Value)
                dataFilter.DataId = Convert.ToInt16(dr["FasTagVehicleClassId"]);

            if (dr["FasTagVehicleClassName"] != DBNull.Value)
                dataFilter.DataName = Convert.ToString(dr["FasTagVehicleClassName"]);

            if (dr["ParentClassId"] != DBNull.Value)
                dataFilter.ParentId = Convert.ToInt64(dr["ParentClassId"]);
            return dataFilter;
        }
        #endregion
    }
}
