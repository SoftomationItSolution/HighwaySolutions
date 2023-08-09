using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class DenominationDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_DenominationMaster";
        #endregion
        internal static List<ResponceIL> PInsertUpdate(DenominationIL denomination)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_DenominationInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int16, denomination.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@BaseValue", DbType.Int16, denomination.BaseValue, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MoneyCount", DbType.Int16, denomination.MoneyCount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@OrderBy", DbType.Int16, denomination.OrderBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, denomination.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, denomination.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, denomination.CreatedDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, denomination.ModifiedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, denomination.ModifiedDate, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }

        internal static void MarkedDeleted()
        {
            try
            {
                string spName = "USP_DenominationMarkedDeleted";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        internal static void DeletedData()
        {
            try
            {
                string spName = "USP_DenominationDeletedData";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #region Get Methods
        internal static List<DenominationIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<DenominationIL> cashFlows = new List<DenominationIL>();
            try
            {
                string spName = "USP_DenominationMasterGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    cashFlows.Add(CreateObjectFromDataRowMaster(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return cashFlows;

        }

        internal static List<DenominationIL> GetCashAllotment(long cashFlowId)
        {
            DataTable dt = new DataTable();
            List<DenominationIL> cashFlows = new List<DenominationIL>();
            try
            {
                string spName = "USP_DenominationGetCashAllotment";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CashFlowId", DbType.Int64, cashFlowId, ParameterDirection.Input));
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

        internal static List<DenominationIL> GetCashDeposit(long CashFlowId, Int64 ClearanceId)
        {
            DataTable dt = new DataTable();
            List<DenominationIL> cashFlows = new List<DenominationIL>();
            try
            {
                string spName = "USP_DenominationGetCashDeposit";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CashFlowId", DbType.Int64, CashFlowId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClearanceId", DbType.Int64, ClearanceId, ParameterDirection.Input));
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
        #endregion

        #region Helper Methods
        private static DenominationIL CreateObjectFromDataRowMaster(DataRow dr)
        {
            DenominationIL cashFlow = new DenominationIL();

            if (dr["EntryId"] != DBNull.Value)
                cashFlow.EntryId = Convert.ToInt16(dr["EntryId"]);

            if (dr["BaseValue"] != DBNull.Value)
                cashFlow.BaseValue = Convert.ToInt16(dr["BaseValue"]);

            if (dr["MoneyCount"] != DBNull.Value)
                cashFlow.MoneyCount = Convert.ToInt16(dr["MoneyCount"]);

            if (dr["OrderBy"] != DBNull.Value)
                cashFlow.OrderBy = Convert.ToInt16(dr["OrderBy"]);

            if (dr["CreatedDate"] != DBNull.Value)
                cashFlow.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                cashFlow.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                cashFlow.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                cashFlow.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["DataStatus"] != DBNull.Value)
            {
                cashFlow.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (cashFlow.DataStatus != 1)
                    cashFlow.DataStatusName = "Inactive";
            }
            return cashFlow;
        }
        private static DenominationIL CreateObjectFromDataRow(DataRow dr)
        {
            DenominationIL cashFlow = new DenominationIL();

            if (dr["EntryId"] != DBNull.Value)
                cashFlow.EntryId = Convert.ToInt16(dr["EntryId"]);

            if (dr["BaseValue"] != DBNull.Value)
                cashFlow.BaseValue = Convert.ToInt16(dr["BaseValue"]);

            if (dr["MoneyCount"] != DBNull.Value)
                cashFlow.MoneyCount = Convert.ToInt16(dr["MoneyCount"]);
            return cashFlow;
        }
        #endregion
    }
}
