using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class CashFlowDepositDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_CashFlowDenominationDeposit";
        #endregion

        #region Get Methods
        internal static List<CashFlowDepositIL> CashDepositGetByCashId(Int64 CashFlowId)
        {
            DataTable dt = new DataTable();
            List<CashFlowDepositIL> cashFlows = new List<CashFlowDepositIL>();
            try
            {
                string spName = "USP_CashFlowClearanceGetByCashFlowId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CashFlowId", DbType.Int32, CashFlowId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    cashFlows.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return cashFlows;
        }
        internal static CashFlowDepositIL CashDepositGetById(Int64 EntryId)
        {
            DataTable dt = new DataTable();
            CashFlowDepositIL cashFlows = new CashFlowDepositIL();
            try
            {
                string spName = "USP_CashFlowClearanceGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.String, EntryId, ParameterDirection.Input, 50));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    cashFlows = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return cashFlows;
        }
        internal static CashFlowDepositIL CashDepositGetByReceipt(String ReceiptNumber)
        {
            DataTable dt = new DataTable();
            CashFlowDepositIL cashFlows = new CashFlowDepositIL();
            try
            {
                string spName = "USP_CashFlowClearanceGetByReceipt";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReceiptNumber", DbType.String, ReceiptNumber, ParameterDirection.Input, 50));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    cashFlows = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return cashFlows;
        }

        
        #endregion
        #region Helper Methods
        private static CashFlowDepositIL CreateObjectFromDataRow(DataRow dr)
        {
            CashFlowDepositIL cashFlow = new CashFlowDepositIL();

            if (dr["EntryId"] != DBNull.Value)
                cashFlow.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["CashFlowId"] != DBNull.Value)
                cashFlow.CashFlowId = Convert.ToInt64(dr["CashFlowId"]);

            if (dr["ReceiptNumber"] != DBNull.Value)
                cashFlow.ReceiptNumber = Convert.ToString(dr["ReceiptNumber"]);

            if (dr["DepositedAmount"] != DBNull.Value)
                cashFlow.DepositedAmount = Convert.ToDecimal(dr["DepositedAmount"]);

            if (dr["ClearanceUserId"] != DBNull.Value)
                cashFlow.ClearanceUserId = Convert.ToInt64(dr["ClearanceUserId"]);

            if (dr["ClearanceLoginId"] != DBNull.Value)
                cashFlow.ClearanceLoginId = Convert.ToString(dr["ClearanceLoginId"]);

            if (dr["ClearanceDate"] != DBNull.Value)
                cashFlow.ClearanceDate = Convert.ToDateTime(dr["ClearanceDate"]);

            if (dr["CreatedDate"] != DBNull.Value)
                cashFlow.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                cashFlow.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                cashFlow.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                cashFlow.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            return cashFlow;
        }
        #endregion

    }
}
