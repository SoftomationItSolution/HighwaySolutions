using System;
using System.Collections.Generic;
using System.Data;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class LaneTransactionBL
    {
        public static LaneTransactionIL EntryInsert(LaneTransactionIL laneTrans)
        {
            try
            {
                return LaneTransactionDL.EntryInsert(laneTrans);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static void EntryDiscard(Int64 EntryId)
        {
            LaneTransactionDL.EntryDiscard(EntryId);
        }
        public static LaneTransactionIL ExitInsert(LaneTransactionIL laneTrans)
        {

            try
            {
                return LaneTransactionDL.ExitInsert(laneTrans);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static void ExitDiscard(Int64 EntryId)
        {
            LaneTransactionDL.ExitDiscard(EntryId);
        }
        public static LaneTransactionIL ExitLaneCharged(LaneTransactionIL laneTrans)
        {
            try
            {
                return LaneTransactionDL.ExitLaneCharged(laneTrans);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static LaneTransactionIL OtherEntryInsert(PlazaTransactionIL laneTrans)
        {

            try
            {
                return LaneTransactionDL.OtherEntryInsert(laneTrans);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static bool CheckDuplicateLaneId(LaneTransactionIL lane)
        {
            try
            {
                return LaneTransactionDL.CheckDuplicateLaneId(lane);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static bool CheckDuplicateCashReceipt(LaneTransactionIL lane)
        {
            try
            {
                return LaneTransactionDL.CheckDuplicateCashReceipt(lane);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static void MarkedTransfer(LaneTransactionIL laneTrans)
        {

            try
            {
                LaneTransactionDL.MarkedTransfer(laneTrans);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static Int64 GetMaxId(LaneTransactionIL laneData)
        {

            try
            {
                return LaneTransactionDL.GetMaxId(laneData);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<LaneTransactionIL> GetLaneMatchedDataByRefNum(LaneTransactionIL laneData)
        {

            try
            {
                return LaneTransactionDL.GetLaneMatchedDataByRefNum(laneData);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<LaneTransactionIL> GetUnreviewFilter(DataFilterIL filter)
        {

            try
            {
                return LaneTransactionDL.GetUnreviewFilter(filter);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<LaneTransactionIL> GetLaneMatchedDataForRetJourney(LaneTransactionIL retJourney)
        {

            try
            {
                return LaneTransactionDL.GetLaneMatchedDataForRetJourney(retJourney);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static LaneTransactionIL GetByEntryId(Int64 EntryId)
        {

            try
            {
                return LaneTransactionDL.GetByEntryId(EntryId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static LaneTransactionIL GetByExitId(Int64 EntryId)
        {

            try
            {
                return LaneTransactionDL.GetByExitId(EntryId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<LaneTransactionIL> GetLanePendingData(Int16 Type)
        {

            try
            {
                return LaneTransactionDL.GetLanePendingData(Type);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static DataTable TransactionDetailReport(DataFilterIL data)
        {

            try
            {
                return LaneTransactionDL.TransactionDetailReport(data);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static DataTable CancelTransactionDetailReport(DataFilterIL data)
        {
            try
            {
                return LaneTransactionDL.CancelTransactionDetailReport(data);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static DataTable TrafficRevenueSummaryReport(DataFilterIL data)
        {

            try
            {
                return LaneTransactionDL.TrafficRevenueSummaryReport(data);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static DataTable TrafficRevenueConsolidatedReport(DataFilterIL data)
        {
            try
            {
                return LaneTransactionDL.TrafficRevenueConsolidatedReport(data);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static DataSet ExemptVehicleDetailReport(DataFilterIL data)
        {
            try
            {
                return LaneTransactionDL.ExemptVehicleDetailReport(data);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<LaneTransactionIL> GetPendingChargingData()
        {
            try
            {
                return LaneTransactionDL.GetPendingChargingData();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static DataTable TransactionDataFilter(DataFilterIL data)
        {
            try
            {
                return LaneTransactionDL.TransactionDataFilter(data);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        
    }
}
