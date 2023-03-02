using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class LaneTransactionReviewDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_LaneTransactionReviewStatus";
        #endregion
        internal static List<ResponceIL> Insert(LaneTransactionReviewIL review)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_LaneTransactionReviewInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionId", DbType.Int64, review.TransactionId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, review.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedPlateNumber", DbType.String, review.ReveiwedPlateNumber.ToUpper().Trim(), ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedClassCorrection", DbType.Int16, review.ReveiwedClassCorrection, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedClassId", DbType.Int16, review.ReveiwedClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedTransactionType", DbType.Int16, review.ReveiwedTransactionType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedTransactionAmount", DbType.Decimal, review.ReveiwedTransactionAmount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AmountDifference", DbType.Decimal, review.TransactionAmountDifference, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedBy", DbType.Int64, review.ReveiwedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedDateTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedRemark", DbType.String, review.ReveiwedRemark.Trim(), ParameterDirection.Input, 255));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;

        }
        internal static List<ResponceIL> Cancel(LaneTransactionReviewIL review)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_LaneTransactionReviewCancel";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionId", DbType.Int64, review.TransactionId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, review.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedPlateNumber", DbType.String, review.ReveiwedPlateNumber.ToUpper().Trim(), ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedClassCorrection", DbType.Int16, review.ReveiwedClassCorrection, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedClassId", DbType.Int16, review.ReveiwedClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedTransactionType", DbType.Int16, review.ReveiwedTransactionType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedTransactionAmount", DbType.Decimal, review.ReveiwedTransactionAmount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AmountDifference", DbType.Decimal, review.TransactionAmountDifference, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedBy", DbType.Int64, review.ReveiwedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedDateTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedRemark", DbType.String, review.ReveiwedRemark, ParameterDirection.Input, 255));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }
        internal static List<ResponceIL> Scrap(LaneTransactionReviewIL review)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_LaneTransactionReviewScrap";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionId", DbType.Int64, review.TransactionId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, review.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedPlateNumber", DbType.String, review.ReveiwedPlateNumber.ToUpper().Trim(), ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedClassCorrection", DbType.Int16, review.ReveiwedClassCorrection, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedClassId", DbType.Int16, review.ReveiwedClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedTransactionType", DbType.Int16, review.ReveiwedTransactionType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedTransactionAmount", DbType.Decimal, review.ReveiwedTransactionAmount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AmountDifference", DbType.Decimal, review.TransactionAmountDifference, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedBy", DbType.Int64, review.ReveiwedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedDateTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedRemark", DbType.String, review.ReveiwedRemark, ParameterDirection.Input, 255));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }
        internal static LaneTransactionReviewIL GetByEntryId(Int64 TransactionId)
        {
            LaneTransactionReviewIL laneData = new LaneTransactionReviewIL();
            try
            {
                string spName = "USP_LaneTransactionReviewGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionId", DbType.Int64, TransactionId, ParameterDirection.Input));
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
        internal static LaneTransactionReviewIL GetByExitId(Int64 TransactionId)
        {
            LaneTransactionReviewIL laneData = new LaneTransactionReviewIL();
            try
            {
                string spName = "USP_LaneTransactionReviewGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionId", DbType.Int64, TransactionId, ParameterDirection.Input));
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

        #region Helper Methods
        private static LaneTransactionReviewIL CreateObjectFromDataRow(DataRow dr)
        {
            LaneTransactionReviewIL lane = new LaneTransactionReviewIL();

            if (dr["TransactionId"] != DBNull.Value)
                lane.TransactionId = Convert.ToInt64(dr["TransactionId"]);

            if (dr["MasterId"] != DBNull.Value)
                lane.MasterId = Convert.ToInt64(dr["MasterId"]);

            if (dr["PlazaId"] != DBNull.Value)
                lane.PlazaId = Convert.ToInt16(dr["PlazaId"]);

            if (dr["ReveiwedPlateNumber"] != DBNull.Value)
                lane.ReveiwedPlateNumber = Convert.ToString(dr["ReveiwedPlateNumber"]);

            if (dr["ReveiwedClassCorrection"] != DBNull.Value)
                lane.ReveiwedClassCorrection = Convert.ToInt16(dr["ReveiwedClassCorrection"]);

            if (dr["ReveiwedClassId"] != DBNull.Value)
                lane.ReveiwedClassId = Convert.ToInt16(dr["ReveiwedClassId"]);

            if (dr["ReveiwedTransactionType"] != DBNull.Value)
                lane.ReveiwedTransactionType = Convert.ToInt16(dr["ReveiwedTransactionType"]);

            if (dr["ReveiwedTransactionAmount"] != DBNull.Value)
                lane.ReveiwedTransactionAmount = Convert.ToDecimal(dr["ReveiwedTransactionAmount"]);

            if (dr["TransactionAmountDifference"] != DBNull.Value)
                lane.TransactionAmountDifference = Convert.ToDecimal(dr["TransactionAmountDifference"]);

            if (dr["ReveiwedBy"] != DBNull.Value)
                lane.ReveiwedBy = Convert.ToInt64(dr["ReveiwedBy"]);

            if (dr["ReveiwedDateTime"] != DBNull.Value)
                lane.ReveiwedDateTime = Convert.ToDateTime(dr["ReveiwedDateTime"]);

            if (dr["ReveiwedRemark"] != DBNull.Value)
                lane.ReveiwedRemark = Convert.ToString(dr["ReveiwedRemark"]);


            return lane;
        }

        #endregion
    }
}
