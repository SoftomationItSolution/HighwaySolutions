using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class PlazaTransactionReviewDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_LaneTransactionReviewStatus";
        #endregion
        internal static PlazaTransactionReviewIL Insert(LaneTransactionReviewIL review)
        {
            PlazaTransactionReviewIL plazaData = new PlazaTransactionReviewIL();
            try
            {
                string spName = "USP_LaneTransactionReviewInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaTransId", DbType.Int64, review.TransactionId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, review.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedPlateNumber", DbType.String, review.ReveiwedPlateNumber.ToUpper().Trim(), ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedClassCorrection", DbType.Int16, review.ReveiwedClassCorrection, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedClassId", DbType.Int16, review.ReveiwedClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedTransactionType", DbType.Int16, review.ReveiwedTransactionType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedTransactionAmount", DbType.Decimal, review.ReveiwedTransactionAmount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AmountDifference", DbType.Decimal, review.TransactionAmountDifference, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedBy", DbType.Int64, review.ReveiwedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedDateTime", DbType.DateTime, review.ReveiwedDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedRemark", DbType.String, review.ReveiwedRemark.Trim(), ParameterDirection.Input, 255));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    plazaData = CreateObjectFromDataRow(dr);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return plazaData;

        }
       

        #region Helper Methods
        private static PlazaTransactionReviewIL CreateObjectFromDataRow(DataRow dr)
        {
            PlazaTransactionReviewIL lane = new PlazaTransactionReviewIL();

            if (dr["EntryId"] != DBNull.Value)
                lane.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["PlazaTransId"] != DBNull.Value)
                lane.PlazaTransId = Convert.ToInt64(dr["PlazaTransId"]);

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
