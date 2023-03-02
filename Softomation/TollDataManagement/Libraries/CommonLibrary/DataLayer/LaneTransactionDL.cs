using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class LaneTransactionDL
    {
        #region Global Varialble
        static DataTable dt;
        static DataSet ds;
        static string tableName = "tbl_LaneTransaction";
        #endregion

        internal static LaneTransactionIL EntryInsert(LaneTransactionIL laneTrans)
        {
            try
            {

                string spName = "USP_LaneTransactionEntryInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneTransId", DbType.Int64, laneTrans.LaneTransId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int16, laneTrans.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, laneTrans.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneNumber", DbType.Int16, laneTrans.LaneNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneType", DbType.Int16, laneTrans.LaneType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneUsed", DbType.Int16, laneTrans.LaneUsed, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftId", DbType.Int16, laneTrans.ShiftId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int16, laneTrans.TCUserId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlateNumber", DbType.String, laneTrans.PlateNumber.ToUpper().Trim(), ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MappingClassId", DbType.Int16, laneTrans.MappingClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AVCClassId", DbType.Int16, laneTrans.AvcClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IHMCLClassId", DbType.Int16, laneTrans.IhmclClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionTypeId", DbType.Int16, laneTrans.TransactionTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PaymentTypeId", DbType.Int16, laneTrans.PaymentTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ExemptTypeId", DbType.Int16, laneTrans.ExemptTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReferenceNumber", DbType.String, laneTrans.ReferenceNumber.ToUpper().Trim(), ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionAmount", DbType.Decimal, laneTrans.TransactionAmount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionTimeStamp", DbType.DateTime, laneTrans.TransactionTimeStamp, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionImage", DbType.String, laneTrans.TransactionImage, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionVideo", DbType.String, laneTrans.TransactionVideo, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedRequired", DbType.Int16, laneTrans.ReveiwedRequired, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReferenceTransactionId", DbType.Int64, laneTrans.ReferenceTransactionId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Chargeable", DbType.Int16, laneTrans.Chargeable, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Overweight", DbType.Int16, laneTrans.Overweight, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Penalty", DbType.Int16, laneTrans.Penalty, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@JourneyType", DbType.Int16, laneTrans.JourneyType, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    laneTrans = CreateObjectFromDataRow(dr);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return laneTrans;
        }
        internal static void EntryDiscard(Int64 EntryId)
        {
            try
            {
                string spName = "USP_LaneTransactionDiscardEntry";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int64, EntryId, ParameterDirection.Input));
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        internal static LaneTransactionIL ExitInsert(LaneTransactionIL laneTrans)
        {
            try
            {

                string spName = "USP_LaneTransactionExitInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneTransId", DbType.Int64, laneTrans.LaneTransId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int16, laneTrans.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, laneTrans.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneNumber", DbType.Int16, laneTrans.LaneNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneType", DbType.Int16, laneTrans.LaneType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneUsed", DbType.Int16, laneTrans.LaneUsed, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftId", DbType.Int16, laneTrans.ShiftId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int16, laneTrans.TCUserId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlateNumber", DbType.String, laneTrans.PlateNumber.ToUpper().Trim(), ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MappingClassId", DbType.Int16, laneTrans.MappingClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AVCClassId", DbType.Int16, laneTrans.AvcClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IHMCLClassId", DbType.Int16, laneTrans.IhmclClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionTypeId", DbType.Int16, laneTrans.TransactionTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PaymentTypeId", DbType.Int16, laneTrans.PaymentTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ExemptTypeId", DbType.Int16, laneTrans.ExemptTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReferenceNumber", DbType.String, laneTrans.ReferenceNumber.ToUpper().Trim(), ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionAmount", DbType.Decimal, laneTrans.TransactionAmount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionTimeStamp", DbType.DateTime, laneTrans.TransactionTimeStamp, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionImage", DbType.String, laneTrans.TransactionImage, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionVideo", DbType.String, laneTrans.TransactionVideo, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedRequired", DbType.Int16, laneTrans.ReveiwedRequired, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReferenceTransactionId", DbType.Int64, laneTrans.ReferenceTransactionId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Chargeable", DbType.Int16, laneTrans.Chargeable, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Overweight", DbType.Int16, laneTrans.Overweight, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Penalty", DbType.Int16, laneTrans.Penalty, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@JourneyType", DbType.Int16, laneTrans.JourneyType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TowVehicle", DbType.Int16, laneTrans.TowVehicle, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    laneTrans = CreateObjectFromDataRow(dr);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return laneTrans;
        }
        internal static void ExitDiscard(Int64 EntryId)
        {
            try
            {
                string spName = "USP_LaneTransactionDiscardExit";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int64, EntryId, ParameterDirection.Input));
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        internal static LaneTransactionIL ExitLaneCharged(LaneTransactionIL laneTrans)
        {
            try
            {
                string spName = "USP_LaneTransactionExitCharged";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int64, laneTrans.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneTransId", DbType.Int64, laneTrans.LaneTransId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int16, laneTrans.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, laneTrans.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneNumber", DbType.Int16, laneTrans.LaneNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneType", DbType.Int16, laneTrans.LaneType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneUsed", DbType.Int16, laneTrans.LaneUsed, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftId", DbType.Int16, laneTrans.ShiftId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int16, laneTrans.TCUserId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlateNumber", DbType.String, laneTrans.PlateNumber.ToUpper().Trim(), ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MappingClassId", DbType.Int16, laneTrans.MappingClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AVCClassId", DbType.Int16, laneTrans.AvcClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IHMCLClassId", DbType.Int16, laneTrans.IhmclClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionTypeId", DbType.Int16, laneTrans.TransactionTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PaymentTypeId", DbType.Int16, laneTrans.PaymentTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ExemptTypeId", DbType.Int16, laneTrans.ExemptTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReferenceNumber", DbType.String, laneTrans.ReferenceNumber.ToUpper().Trim(), ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionAmount", DbType.Decimal, laneTrans.TransactionAmount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionTimeStamp", DbType.DateTime, laneTrans.TransactionTimeStamp, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionImage", DbType.String, laneTrans.TransactionImage, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionVideo", DbType.String, laneTrans.TransactionVideo, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedRequired", DbType.Int16, laneTrans.ReveiwedRequired, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReferenceTransactionId", DbType.Int64, laneTrans.ReferenceTransactionId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Chargeable", DbType.Int16, laneTrans.Chargeable, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Overweight", DbType.Int16, laneTrans.Overweight, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Penalty", DbType.Int16, laneTrans.Penalty, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@JourneyType", DbType.Int16, laneTrans.JourneyType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TowVehicle", DbType.Int16, laneTrans.TowVehicle, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    laneTrans = CreateObjectFromDataRow(dr);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return laneTrans;
        }
        internal static Boolean CheckDuplicateLaneId(LaneTransactionIL laneTrans)
        {
            bool isDuplicate = false;
            try
            {

                string spName = "USP_LaneTransactionCheckDuplicate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneTransId", DbType.Int64, laneTrans.LaneTransId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int16, laneTrans.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, laneTrans.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneNumber", DbType.Int16, laneTrans.LaneNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneType", DbType.Int16, laneTrans.LaneType, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                if (dt.Rows.Count > 0)
                    isDuplicate = true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return isDuplicate;
        }
        internal static Boolean CheckDuplicateCashReceipt(LaneTransactionIL laneTrans)
        {
            bool isDuplicate = false;
            try
            {

                string spName = "USP_LaneTransactionCheckDuplicateCashReceipt";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReferenceNumber", DbType.String, laneTrans.ReferenceNumber, ParameterDirection.Input,255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionTypeId", DbType.Int16, laneTrans.TransactionTypeId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                if (dt.Rows.Count > 0)
                    isDuplicate = true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return isDuplicate;
        }
        internal static LaneTransactionIL OtherEntryInsert(PlazaTransactionIL laneTrans)
        {
            LaneTransactionIL Trans = new LaneTransactionIL();
            try
            {

                string spName = "USP_LaneTransactionOtherPlazaEntryInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MasterId", DbType.Int64, laneTrans.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int16, laneTrans.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, laneTrans.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneNumber", DbType.Int16, laneTrans.LaneNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneType", DbType.Int16, laneTrans.LaneType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneUsed", DbType.Int16, laneTrans.LaneUsed, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftId", DbType.Int16, laneTrans.ShiftId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int16, laneTrans.TCUserId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlateNumber", DbType.String, laneTrans.PlateNumber.ToUpper().Trim(), ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MappingClassId", DbType.Int16, laneTrans.MappingClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AVCClassId", DbType.Int16, laneTrans.AvcClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IHMCLClassId", DbType.Int16, laneTrans.IhmclClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionTypeId", DbType.Int16, laneTrans.TransactionTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PaymentTypeId", DbType.Int16, laneTrans.PaymentTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ExemptTypeId", DbType.Int16, laneTrans.ExemptTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReferenceNumber", DbType.String, laneTrans.ReferenceNumber.ToUpper().Trim(), ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionAmount", DbType.Decimal, laneTrans.TransactionAmount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionTimeStamp", DbType.DateTime, laneTrans.TransactionTimeStamp, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionImage", DbType.String, laneTrans.TransactionImage, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionVideo", DbType.String, laneTrans.TransactionVideo, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReferenceTransactionId", DbType.Int64, laneTrans.ReferenceTransactionId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedRequired", DbType.Int16, laneTrans.ReveiwedRequired, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedStatus", DbType.Int16, laneTrans.ReveiwedStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Chargeable", DbType.Int16, laneTrans.Chargeable, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TowVehicle", DbType.Int16, laneTrans.TowVehicle, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@JourneyType", DbType.Int16, laneTrans.JourneyType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Overweight", DbType.Int16, laneTrans.Overweight, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Penalty", DbType.Int16, laneTrans.Penalty, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionStatus", DbType.Int16, laneTrans.TransactionStatus, ParameterDirection.Input));

                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    Trans = CreateObjectFromDataRow(dr);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return Trans;
        }

        internal static void MarkedTransfer(LaneTransactionIL laneTrans)
        {
            try
            {

                string spName = "USP_LaneTransactionMarkedTransfer";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneType", DbType.Int16, laneTrans.LaneType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int64, laneTrans.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MasterId", DbType.Int64, laneTrans.MasterId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionTimeStamp", DbType.DateTime, laneTrans.TransactionTimeStamp, ParameterDirection.Input));
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #region Get Methods
        internal static Int64 GetMaxId(LaneTransactionIL laneTrans)
        {
            Int64 laneTrnsId = 0;
            try
            {
                string spName = "USP_LaneTransactionGetLaneMaxId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, laneTrans.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneNumber", DbType.Int16, laneTrans.LaneNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneType", DbType.Int16, laneTrans.LaneType, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                if (dt.Rows.Count > 0)
                {
                    laneTrnsId = Convert.ToInt64(dt.Rows[0]["MAXLaneTranId"].ToString());
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                laneTrnsId = laneTrnsId + 1;
            }
            return laneTrnsId;
        }
        internal static List<LaneTransactionIL> GetLaneMatchedDataForRetJourney(LaneTransactionIL retJourney)
        {
            List<LaneTransactionIL> laneData = new List<LaneTransactionIL>();
            try
            {
                string spName = "USP_LaneMatchedDataByRetJourney";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReferenceNumber", DbType.String, retJourney.ReferenceNumber.ToUpper().Trim(), ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionTimeStamp", DbType.DateTime, retJourney.TransactionTimeStamp, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    laneData.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return laneData;
        }
        internal static List<LaneTransactionIL> GetLaneMatchedDataByRefNum(LaneTransactionIL laneTrans)
        {
            List<LaneTransactionIL> laneData = new List<LaneTransactionIL>();
            try
            {
                string spName = "USP_LaneMatchedDataByRefNum";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, laneTrans.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneType", DbType.Int16, laneTrans.LaneType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReferenceNumber", DbType.String, laneTrans.ReferenceNumber.ToUpper().Trim(), ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlateNumber", DbType.String, laneTrans.PlateNumber.ToUpper().Trim(), ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionTimeStamp", DbType.DateTime, laneTrans.TransactionTimeStamp, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    laneData.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return laneData;
        }

        internal static List<LaneTransactionIL> GetUnreviewFilter(DataFilterIL filter)
        {
            List<LaneTransactionIL> laneData = new List<LaneTransactionIL>();
            try
            {
                string spName = "USP_UnReveiewedFilter";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, filter.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReviewType", DbType.Int16, filter.ReviewType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftDate", DbType.Date, filter.ShiftDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftId", DbType.Int16, filter.ShiftId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TCUserId", DbType.Int64, filter.TCUserId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneNumber", DbType.Int16, filter.LaneNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionTypeId", DbType.Int16, filter.TransactionTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlateNumber", DbType.String, filter.PlateNumber, ParameterDirection.Input, 20));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    laneData.Add(CreateObjectFromDataRowForUnreviewFilter(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return laneData;
        }

        internal static LaneTransactionIL GetByEntryId(Int64 EntryId)
        {
            LaneTransactionIL laneData = new LaneTransactionIL();
            try
            {
                string spName = "USP_LaneTransactionEntryGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int64, EntryId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    laneData = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return laneData;
        }

        internal static LaneTransactionIL GetByExitId(Int64 EntryId)
        {
            LaneTransactionIL laneData = new LaneTransactionIL();
            try
            {
                string spName = "USP_LaneTransactionExitGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int64, EntryId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    laneData = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return laneData;
        }

        internal static List<LaneTransactionIL> GetLanePendingData(Int16 Type)
        {
            List<LaneTransactionIL> laneData = new List<LaneTransactionIL>();
            try
            {
                string spName = "USP_PendingTransList";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransFor", DbType.Int16, Type, ParameterDirection.Input, 255));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    laneData.Add(PendingObject(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return laneData;
        }
        internal static List<LaneTransactionIL> GetPendingChargingData()
        {
            List<LaneTransactionIL> laneData = new List<LaneTransactionIL>();
            try
            {
                string spName = "USP_LaneTransactionExitGetByPending";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    laneData.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return laneData;
        }

        #region Reports
        internal static DataTable TransactionDetailReport(DataFilterIL data)
        {
            dt = new DataTable();
            try
            {
                string spName = "USP_TransactionDetailFilter";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, data.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@StartDateTime", DbType.DateTime, data.StartDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EndDateTime", DbType.DateTime, data.EndDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Filter", DbType.String, data.QueryFilter, ParameterDirection.Input, 4000));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SessionId", DbType.String, data.SessionId, ParameterDirection.Input, 20));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;
        }
        internal static DataTable CancelTransactionDetailReport(DataFilterIL data)
        {
            dt = new DataTable();
            try
            {
                string spName = "USP_CancelTransactionDetailFilter";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, data.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@StartDateTime", DbType.DateTime, data.StartDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EndDateTime", DbType.DateTime, data.EndDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Filter", DbType.String, data.QueryFilter, ParameterDirection.Input, 4000));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SessionId", DbType.String, data.SessionId, ParameterDirection.Input, 20));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];


            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;
        }
        internal static DataTable TrafficRevenueConsolidatedReport(DataFilterIL data)
        {
            dt = new DataTable();
            try
            {
                string spName = "USP_TrafficRevenueConsolidatedFilter";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, data.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@StartDateTime", DbType.DateTime, data.StartDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EndDateTime", DbType.DateTime, data.EndDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClassId", DbType.String, data.VehicleClass, ParameterDirection.Input, 4000));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Filter", DbType.String, data.QueryFilter, ParameterDirection.Input, 4000));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SessionId", DbType.String, data.SessionId, ParameterDirection.Input, 20));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;
        }
        internal static DataTable TrafficRevenueSummaryReport(DataFilterIL data)
        {
            dt = new DataTable();
            try
            {
                string spName = "USP_TrafficRevenueSummaryFilter";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, data.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@StartDateTime", DbType.DateTime, data.StartDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EndDateTime", DbType.DateTime, data.EndDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClassId", DbType.String, data.VehicleClass, ParameterDirection.Input, 4000));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Filter", DbType.String, data.QueryFilter, ParameterDirection.Input, 4000));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SessionId", DbType.String, data.SessionId, ParameterDirection.Input, 20));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;
        }
        internal static DataSet ExemptVehicleDetailReport(DataFilterIL data)
        {
            ds = new DataSet();
            try
            {
                string spName = "USP_ExemptVehicleDetailFilter";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, data.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@StartDateTime", DbType.DateTime, data.StartDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EndDateTime", DbType.DateTime, data.EndDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClassId", DbType.String, data.VehicleClass, ParameterDirection.Input, 4000));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Filter", DbType.String, data.QueryFilter, ParameterDirection.Input, 4000));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SessionId", DbType.String, data.SessionId, ParameterDirection.Input, 20));
                ds = DBAccessor.LoadDataSet(command, tableName);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ds;
        }
        internal static DataTable TransactionDataFilter(DataFilterIL data)
        {
            dt = new DataTable();
            try
            {
                string spName = "USP_TransactionDataFilter";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, data.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftDate", DbType.Date, data.ShiftDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Filter", DbType.String, data.QueryFilter, ParameterDirection.Input, 4000));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;
        }
        #endregion

        #endregion

        #region Helper Methods
        private static LaneTransactionIL PendingObject(DataRow dr)
        {
            LaneTransactionIL lane = new LaneTransactionIL();

            if (dr["TransId"] != DBNull.Value)
                lane.EntryId = Convert.ToInt64(dr["TransId"]);

            if (dr["TransFor"] != DBNull.Value)
                lane.LaneType = Convert.ToInt16(dr["TransFor"]);

            if (dr["TransDateTime"] != DBNull.Value)
                lane.TransactionTimeStamp = Convert.ToDateTime(dr["TransDateTime"]);

            return lane;
        }
        private static LaneTransactionIL CreateObjectFromDataRow(DataRow dr)
        {
            LaneTransactionIL lane = new LaneTransactionIL();

            if (dr["EntryId"] != DBNull.Value)
                lane.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["MasterId"] != DBNull.Value)
                lane.MasterId = Convert.ToInt64(dr["MasterId"]);

            if (dr["LaneTransId"] != DBNull.Value)
                lane.LaneTransId = Convert.ToInt64(dr["LaneTransId"]);

            if (dr["ClientId"] != DBNull.Value)
                lane.ClientId = Convert.ToInt16(dr["ClientId"]);

            if (dr["PlazaId"] != DBNull.Value)
                lane.PlazaId = Convert.ToInt16(dr["PlazaId"]);

            if (dr["LaneNumber"] != DBNull.Value)
                lane.LaneNumber = Convert.ToInt16(dr["LaneNumber"]);

            if (dr["LaneType"] != DBNull.Value)
                lane.LaneType = Convert.ToInt16(dr["LaneType"]);

            if (dr["ShiftId"] != DBNull.Value)
                lane.ShiftId = Convert.ToInt16(dr["ShiftId"]);

            if (dr["UserId"] != DBNull.Value)
                lane.TCUserId = Convert.ToInt64(dr["UserId"]);

            if (dr["PlateNumber"] != DBNull.Value)
                lane.PlateNumber = Convert.ToString(dr["PlateNumber"]);

            if (dr["MappingClassId"] != DBNull.Value)
                lane.MappingClassId = Convert.ToInt16(dr["MappingClassId"]);

            if (dr["AVCClassId"] != DBNull.Value)
                lane.AvcClassId = Convert.ToInt16(dr["AVCClassId"]);

            if (dr["IHMCLClassId"] != DBNull.Value)
                lane.IhmclClassId = Convert.ToInt16(dr["IHMCLClassId"]);

            if (dr["TransactionTypeId"] != DBNull.Value)
                lane.TransactionTypeId = Convert.ToInt16(dr["TransactionTypeId"]);

            if (dr["PaymentTypeId"] != DBNull.Value)
                lane.PaymentTypeId = Convert.ToInt16(dr["PaymentTypeId"]);

            if (dr["ExemptTypeId"] != DBNull.Value)
                lane.ExemptTypeId = Convert.ToInt16(dr["ExemptTypeId"]);

            if (dr["ReferenceNumber"] != DBNull.Value)
                lane.ReferenceNumber = Convert.ToString(dr["ReferenceNumber"]);

            if (dr["TransactionAmount"] != DBNull.Value)
                lane.TransactionAmount = Convert.ToDecimal(dr["TransactionAmount"]);

            if (dr["TransactionTimeStamp"] != DBNull.Value)
                lane.TransactionTimeStamp = Convert.ToDateTime(dr["TransactionTimeStamp"]);

            if (dr["TransactionImage"] != DBNull.Value)
                lane.TransactionImage = Convert.ToString(dr["TransactionImage"]);

            if (dr["TransactionVideo"] != DBNull.Value)
                lane.TransactionVideo = Convert.ToString(dr["TransactionVideo"]);

            if (dr["ReferenceTransactionId"] != DBNull.Value)
                lane.ReferenceTransactionId = Convert.ToInt64(dr["ReferenceTransactionId"]);

            if (dr["ReveiwedRequired"] != DBNull.Value)
                lane.ReveiwedRequired = Convert.ToInt16(dr["ReveiwedRequired"]);

            if (dr["ReveiwedStatus"] != DBNull.Value)
                lane.ReveiwedStatus = Convert.ToInt16(dr["ReveiwedStatus"]);

            if (dr["Chargeable"] != DBNull.Value)
                lane.Chargeable = Convert.ToInt16(dr["Chargeable"]);

            if (dr["TowVehicle"] != DBNull.Value)
                lane.TowVehicle = Convert.ToInt16(dr["TowVehicle"]);

            if (dr["JourneyType"] != DBNull.Value)
                lane.JourneyType = Convert.ToInt16(dr["JourneyType"]);

            if (dr["Overweight"] != DBNull.Value)
                lane.Overweight = Convert.ToInt16(dr["Overweight"]);

            if (dr["Penalty"] != DBNull.Value)
                lane.Penalty = Convert.ToInt16(dr["Penalty"]);

            if (dr["TransactionStatus"] != DBNull.Value)
                lane.TransactionStatus = Convert.ToInt16(dr["TransactionStatus"]);

            return lane;
        }
        private static LaneTransactionIL CreateObjectForDisplayFromDataRow(DataRow dr)
        {
            LaneTransactionIL lane = new LaneTransactionIL();

            if (dr["EntryId"] != DBNull.Value)
                lane.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["MasterId"] != DBNull.Value)
                lane.MasterId = Convert.ToInt64(dr["MasterId"]);

            if (dr["LaneTransId"] != DBNull.Value)
                lane.LaneTransId = Convert.ToInt64(dr["LaneTransId"]);

            if (dr["ClientId"] != DBNull.Value)
                lane.ClientId = Convert.ToInt16(dr["ClientId"]);

            if (dr["ClientName"] != DBNull.Value)
                lane.ClientName = Convert.ToString(dr["ClientName"]);

            if (dr["PlazaId"] != DBNull.Value)
                lane.PlazaId = Convert.ToInt16(dr["PlazaId"]);

            if (dr["PlazaName"] != DBNull.Value)
                lane.PlazaName = Convert.ToString(dr["PlazaName"]);

            if (dr["LaneNumber"] != DBNull.Value)
                lane.LaneNumber = Convert.ToInt16(dr["LaneNumber"]);

            if (dr["LaneType"] != DBNull.Value)
                lane.LaneType = Convert.ToInt16(dr["LaneType"]);

            if (dr["LaneTypeName"] != DBNull.Value)
                lane.LaneTypeName = Convert.ToString(dr["LaneTypeName"]);

            if (dr["ShiftId"] != DBNull.Value)
                lane.ShiftId = Convert.ToInt16(dr["ShiftId"]);

            if (dr["UserId"] != DBNull.Value)
                lane.TCUserId = Convert.ToInt64(dr["UserId"]);

            if (dr["LoginId"] != DBNull.Value)
                lane.TCLoginId = Convert.ToString(dr["LoginId"]);

            if (dr["PlateNumber"] != DBNull.Value)
                lane.PlateNumber = Convert.ToString(dr["PlateNumber"]);

            if (dr["MappingClassId"] != DBNull.Value)
                lane.MappingClassId = Convert.ToInt16(dr["MappingClassId"]);

            if (dr["MappingClassName"] != DBNull.Value)
                lane.MappingClassName = Convert.ToString(dr["MappingClassName"]);

            if (dr["AVCClassId"] != DBNull.Value)
                lane.AvcClassId = Convert.ToInt16(dr["AVCClassId"]);

            if (dr["AVCClassName"] != DBNull.Value)
                lane.AvcClassName = Convert.ToString(dr["AVCClassName"]);

            if (dr["TransactionTypeId"] != DBNull.Value)
                lane.TransactionTypeId = Convert.ToInt16(dr["TransactionTypeId"]);

            if (dr["TransactionTypeName"] != DBNull.Value)
                lane.TransactionTypeName = Convert.ToString(dr["TransactionTypeName"]);

            if (dr["ExemptTypeId"] != DBNull.Value)
                lane.ExemptTypeId = Convert.ToInt16(dr["ExemptTypeId"]);

            if (dr["ExemptTypeName"] != DBNull.Value)
                lane.ExemptTypeName = Convert.ToString(dr["ExemptTypeName"]);

            if (dr["ReferenceNumber"] != DBNull.Value)
                lane.ReferenceNumber = Convert.ToString(dr["ReferenceNumber"]);

            if (dr["TransactionAmount"] != DBNull.Value)
                lane.TransactionAmount = Convert.ToDecimal(dr["TransactionAmount"]);

            if (dr["TransactionTimeStamp"] != DBNull.Value)
                lane.TransactionTimeStamp = Convert.ToDateTime(dr["TransactionTimeStamp"]);

            if (dr["TransactionImage"] != DBNull.Value)
                lane.TransactionImage = Convert.ToString(dr["TransactionImage"]);

            if (dr["TransactionVideo"] != DBNull.Value)
                lane.TransactionVideo = Convert.ToString(dr["TransactionVideo"]);

            if (dr["ReferenceTransactionId"] != DBNull.Value)
                lane.ReferenceTransactionId = Convert.ToInt64(dr["ReferenceTransactionId"]);

            if (dr["ReveiwedStatus"] != DBNull.Value)
                lane.ReveiwedStatus = Convert.ToInt16(dr["ReveiwedStatus"]);

            return lane;
        }
        private static LaneTransactionIL CreateObjectFromDataRowForUnreviewFilter(DataRow dr)
        {
            LaneTransactionIL lane = new LaneTransactionIL();

            if (dr["EntryId"] != DBNull.Value)
                lane.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["LaneNumber"] != DBNull.Value)
                lane.LaneNumber = Convert.ToInt16(dr["LaneNumber"]);

            if (dr["ShiftId"] != DBNull.Value)
                lane.ShiftId = Convert.ToInt16(dr["ShiftId"]);

            if (dr["UserId"] != DBNull.Value)
                lane.TCUserId = Convert.ToInt64(dr["UserId"]);

            if (dr["LoginId"] != DBNull.Value)
                lane.TCLoginId = Convert.ToString(dr["LoginId"]);

            if (dr["PlateNumber"] != DBNull.Value)
                lane.PlateNumber = Convert.ToString(dr["PlateNumber"]);

            if (dr["MappingClassId"] != DBNull.Value)
                lane.MappingClassId = Convert.ToInt16(dr["MappingClassId"]);

            if (dr["MappingClassName"] != DBNull.Value)
                lane.MappingClassName = Convert.ToString(dr["MappingClassName"]);

            if (dr["AVCClassId"] != DBNull.Value)
                lane.AvcClassId = Convert.ToInt16(dr["AVCClassId"]);

            if (dr["AVCClassName"] != DBNull.Value)
                lane.AvcClassName = Convert.ToString(dr["AVCClassName"]);

            if (dr["TransactionTypeId"] != DBNull.Value)
                lane.TransactionTypeId = Convert.ToInt16(dr["TransactionTypeId"]);

            if (dr["TransactionTypeName"] != DBNull.Value)
                lane.TransactionTypeName = Convert.ToString(dr["TransactionTypeName"]);

            if (dr["ExemptTypeId"] != DBNull.Value)
                lane.ExemptTypeId = Convert.ToInt16(dr["ExemptTypeId"]);

            if (dr["ExemptTypeName"] != DBNull.Value)
                lane.ExemptTypeName = Convert.ToString(dr["ExemptTypeName"]);

            if (dr["TransactionAmount"] != DBNull.Value)
                lane.TransactionAmount = Convert.ToDecimal(dr["TransactionAmount"]);

            if (dr["TransactionTimeStamp"] != DBNull.Value)
                lane.TransactionTimeStamp = Convert.ToDateTime(dr["TransactionTimeStamp"]);

            if (dr["TransactionImage"] != DBNull.Value)
                lane.TransactionImage = Convert.ToString(dr["TransactionImage"]);

            if (dr["TransactionVideo"] != DBNull.Value)
                lane.TransactionVideo = Convert.ToString(dr["TransactionVideo"]);

            return lane;
        }
        #endregion
    }
}
