using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class CashFlowConfigurationDL
    {
        #region Global Varialble
        static DataTable dt;
        static DataSet ds;
        static string tableName = "tbl_CashFlowConfiguration";
        #endregion

        internal static List<ResponceIL> InsertUpdate(CashFlowConfigurationIL cashFlow)
        {
            List<ResponceIL> responces = null;
            try
            {
                StringBuilder xmlPermission = new StringBuilder();
                for (int i = 0; i < cashFlow.DenominationData.Count; i++)
                {
                    xmlPermission.AppendLine("<nodes>");
                    xmlPermission.AppendLine("    <node>");
                    xmlPermission.AppendLine("      <EntryId>" + cashFlow.DenominationData[i].EntryId + "</EntryId>");
                    xmlPermission.AppendLine("      <MoneyCount>" + cashFlow.DenominationData[i].MoneyCount + "</MoneyCount>");
                    xmlPermission.AppendLine("    </node>");
                    xmlPermission.AppendLine("</nodes>");
                }
                string spName = "USP_CashFlowInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int64, cashFlow.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftId", DbType.Int16, cashFlow.ShiftId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftDate", DbType.Date, cashFlow.ShiftDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReceiptNumber", DbType.String, cashFlow.ReceiptNumber, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TCUserId", DbType.Int64, cashFlow.TCUserId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AmountAlloted", DbType.Decimal, cashFlow.AmountAlloted, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MappingData", DbType.String, xmlPermission.ToString(), ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, cashFlow.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, cashFlow.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CDateTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }


        internal static List<ResponceIL> ValidateTCLogin(CashFlowConfigurationIL cashFlow)
        {
            DataTable dt = new DataTable();
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_ValidateTC";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LoginId", DbType.String, cashFlow.TCLoginId, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftId", DbType.Int16, cashFlow.ShiftId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftDate", DbType.Date, cashFlow.ShiftDate, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }
        internal static void StartStopShift(CashFlowConfigurationIL cashFlow)
        {
            try
            {
                string spName = "USP_CashFlowStartStopShift";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftId", DbType.Int16, cashFlow.ShiftId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftDate", DbType.Date, cashFlow.ShiftDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftStatus", DbType.Int16, cashFlow.ShiftStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, cashFlow.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, cashFlow.CreatedDate, ParameterDirection.Input));
                DBAccessor.ExecuteNonQuery(command);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        

        internal static List<ResponceIL> Clearance(CashFlowConfigurationIL cashFlow)
        {
            List<ResponceIL> responces = null;
            try
            {
                StringBuilder xmlPermission = new StringBuilder();
                for (int i = 0; i < cashFlow.DenominationData.Count; i++)
                {
                    xmlPermission.AppendLine("<nodes>");
                    xmlPermission.AppendLine("    <node>");
                    xmlPermission.AppendLine("      <EntryId>" + cashFlow.DenominationData[i].EntryId + "</EntryId>");
                    xmlPermission.AppendLine("      <MoneyCount>" + cashFlow.DenominationData[i].MoneyCount + "</MoneyCount>");
                    xmlPermission.AppendLine("    </node>");
                    xmlPermission.AppendLine("</nodes>");
                }
                string spName = "USP_CashFlowClearance";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int64, cashFlow.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReceiptNumber", DbType.String, cashFlow.ReceiptNumber, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DepositedAmount", DbType.Decimal, cashFlow.DepositedAmount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MappingData", DbType.String, xmlPermission.ToString(), ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, cashFlow.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, cashFlow.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CDateTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }

        internal static List<ResponceIL> Finish(CashFlowConfigurationIL cashFlow)
        {
            List<ResponceIL> responces = null;
            try
            {
                StringBuilder xmlPermission = new StringBuilder();
                for (int i = 0; i < cashFlow.DenominationData.Count; i++)
                {
                    xmlPermission.AppendLine("<nodes>");
                    xmlPermission.AppendLine("    <node>");
                    xmlPermission.AppendLine("      <EntryId>" + cashFlow.DenominationData[i].EntryId + "</EntryId>");
                    xmlPermission.AppendLine("      <MoneyCount>" + cashFlow.DenominationData[i].MoneyCount + "</MoneyCount>");
                    xmlPermission.AppendLine("    </node>");
                    xmlPermission.AppendLine("</nodes>");
                }
                string spName = "USP_CashFlowFinish";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int64, cashFlow.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DepositedAmount", DbType.Decimal, cashFlow.DepositedAmount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MappingData", DbType.String, xmlPermission.ToString(), ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, cashFlow.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CDateTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }
        #region Get Methods
        internal static List<CashFlowConfigurationIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<CashFlowConfigurationIL> cashFlows = new List<CashFlowConfigurationIL>();
            try
            {
                string spName = "USP_CashFlowGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
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
        internal static List<CashFlowConfigurationIL> GetAllPending()
        {
            DataTable dt = new DataTable();
            List<CashFlowConfigurationIL> cashFlows = new List<CashFlowConfigurationIL>();
            try
            {
                string spName = "USP_CashFlowGetAllPending";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
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
        internal static List<CashFlowConfigurationIL> GetAllPendingByUserId(Int64 UserId)
        {
            DataTable dt = new DataTable();
            List<CashFlowConfigurationIL> cashFlows = new List<CashFlowConfigurationIL>();
            try
            {
                string spName = "USP_CashFlowGetAllPendingUserId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int64, UserId, ParameterDirection.Input));
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
        internal static CashFlowConfigurationIL GetByReceiptNumber(String ReceiptNumber)
        {
            DataTable dt = new DataTable();
            CashFlowConfigurationIL cashFlow = new CashFlowConfigurationIL();
            try
            {
                string spName = "USP_CashFlowGetReceiptNumber";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReceiptNumber", DbType.String, ReceiptNumber, ParameterDirection.Input, 50));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    cashFlow = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return cashFlow;
        }

        internal static CashFlowConfigurationIL GetById(Int64 cashFlowId)
        {
            DataTable dt = new DataTable();
            CashFlowConfigurationIL cashFlow = new CashFlowConfigurationIL();
            try
            {
                string spName = "USP_CashFlowGetbyId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, cashFlowId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    cashFlow = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return cashFlow;
        }


        internal static List<CashFlowConfigurationIL> CashDepositGetByOpenShift(Int64 ShiftMasterId)
        {
            DataTable dt = new DataTable();
            List<CashFlowConfigurationIL> cashFlows = new List<CashFlowConfigurationIL>();
            try
            {
                string spName = "USP_CashFlowGetByOpenShift";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftMasterId", DbType.Int32, ShiftMasterId, ParameterDirection.Input));
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

        
        #region Reports
        internal static DataSet CashUPReport(DataFilterIL data)
        {
            ds = new DataSet();
            try
            {
                string spName = "USP_CashUPFilter";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@StartDateTime", DbType.DateTime, data.StartDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EndDateTime", DbType.DateTime, data.EndDateTime, ParameterDirection.Input));
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

        internal static DataTable UserClearanceDetailReport(DataFilterIL data)
        {
            dt = new DataTable();
            try
            {
                string spName = "USP_UserClearanceDetailFilter";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
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
        #endregion
        #endregion

        #region Helper Methods
        private static CashFlowConfigurationIL CreateObjectFromDataRow(DataRow dr)
        {
            CashFlowConfigurationIL cashFlow = new CashFlowConfigurationIL();

            if (dr["EntryId"] != DBNull.Value)
                cashFlow.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["ShiftId"] != DBNull.Value)
                cashFlow.ShiftId = Convert.ToInt16(dr["ShiftId"]);

            if (dr["ShiftDate"] != DBNull.Value)
                cashFlow.ShiftDate = Convert.ToDateTime(dr["ShiftDate"]);

            if (dr["StartTimmng"] != DBNull.Value)
                cashFlow.StartTimmng = Convert.ToString(dr["StartTimmng"]);

            if (dr["ReceiptNumber"] != DBNull.Value)
                cashFlow.ReceiptNumber = Convert.ToString(dr["ReceiptNumber"]);
            if (!string.IsNullOrEmpty(cashFlow.ReceiptNumber))
                cashFlow.ReceiptNumber = cashFlow.ReceiptNumber.TrimStart(',');

            if (dr["EndTimming"] != DBNull.Value)
                cashFlow.EndTimming = Convert.ToString(dr["EndTimming"]);

            if (dr["TCUserId"] != DBNull.Value)
                cashFlow.TCUserId = Convert.ToInt64(dr["TCUserId"]);

            if (dr["AmountAlloted"] != DBNull.Value)
                cashFlow.AmountAlloted = Convert.ToDecimal(dr["AmountAlloted"]);

            if (dr["AmountCollection"] != DBNull.Value)
                cashFlow.AmountCollection = Convert.ToDecimal(dr["AmountCollection"]);

            if (dr["DepositedAmount"] != DBNull.Value)
                cashFlow.DepositedAmount = Convert.ToDecimal(dr["DepositedAmount"]);

            if (dr["PendingAmount"] != DBNull.Value)
                cashFlow.PendingAmount = Convert.ToDecimal(dr["PendingAmount"]);

            if (dr["ShiftStatus"] != DBNull.Value)
            {
                cashFlow.ShiftStatus = Convert.ToInt16(dr["ShiftStatus"]);
                if (cashFlow.ShiftStatus == 2)
                    cashFlow.ShiftStatusName = "Pedning";
                else if (cashFlow.ShiftStatus == 0)
                    cashFlow.ShiftStatusName = "Closed";
            }
            if (dr["DataStatus"] != DBNull.Value)
            {
                cashFlow.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (cashFlow.DataStatus != 1)
                    cashFlow.DataStatusName = "Inactive";
            }

            if (dr["TCLoginId"] != DBNull.Value)
                cashFlow.TCLoginId = Convert.ToString(dr["TCLoginId"]);

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
