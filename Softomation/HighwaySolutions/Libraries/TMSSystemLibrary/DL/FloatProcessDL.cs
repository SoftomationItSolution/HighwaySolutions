using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;
using System.Text;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class FloatProcessDL
    {
        #region Global Varialble
        static string tableName = "tbl_FloatProcessTransactions";
        #endregion
        internal static List<ResponseIL> InsertUpdate(FloatProcessIL types)
        {
            List<ResponseIL> responses = null;
            try
            {
                DataTable ImportDataTable = new DataTable();
                ImportDataTable.Clear();
                ImportDataTable.Columns.Add("DenominationId");
                ImportDataTable.Columns.Add("DenominationValue");
                ImportDataTable.Columns.Add("DenominationCount");
                ImportDataTable.Columns.Add("SessionId");
                DataRow row;
                string SessionId = CommonLibrary.Constants.RandomString(10);
                StringBuilder xmlPermission = new StringBuilder();
                foreach (FloatProcessDenominationIL item in types.FloatProcessDenominationList)
                {
                    row = ImportDataTable.NewRow();
                    row["DenominationId"] = item.DenominationId;
                    row["DenominationValue"] = item.DenominationValue;
                    row["DenominationCount"] = item.DenominationCount;
                    row["SessionId"] = SessionId;
                    ImportDataTable.Rows.Add(row);

                }
                if (SystemConstants.BulkCopy(ImportDataTable, "temp_DenominationDetails"))
                {
                    string spName = "USP_FloatProcessInsertUpdate";
                    DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SessionId", DbType.String, SessionId, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FloatProcessId", DbType.Int64, types.FloatProcessId, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, types.PlazaId, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneId", DbType.Int16, types.LaneId, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftId", DbType.Int16, types.ShiftId, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FloatTransactionTypeId", DbType.Int16, types.FloatTransactionTypeId, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionDate", DbType.Date, types.TransactionDate, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionAmount", DbType.Decimal, types.TransactionAmount, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReceiptNumber", DbType.String, types.ReceiptNumber, ParameterDirection.Input, 50));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AssignedBy", DbType.Int64, types.AssignedBy, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AssignedTo", DbType.Int64, types.AssignedTo, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, types.DataStatus, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, types.CreatedBy, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, types.ModifiedBy, ParameterDirection.Input));
                    DataTable dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                    responses = ResponseIL.ConvertResponseList(dt);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
        }

        #region Get Methods
        internal static List<FloatProcessIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<FloatProcessIL> eds = new List<FloatProcessIL>();
            try
            {
                string spName = "USP_FloatProcessGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    eds.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return eds;

        }
        internal static List<FloatProcessIL> GetActive()
        {
            List<FloatProcessIL> dmlist = new List<FloatProcessIL>();
            try
            {
                dmlist = GetAll();
                return dmlist.FindAll(n => n.DataStatus == (short)CommonLibrary.Constants.DataStatusType.Active);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        internal static FloatProcessIL GetById(Int64 FloatProcessId)
        {
            DataTable dt = new DataTable();
            FloatProcessIL floatProcess = new FloatProcessIL();
            try
            {
                string spName = "USP_FloatProcessGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FloatProcessId", DbType.Int64, FloatProcessId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    floatProcess = CreateObjectFromDataRow(dr);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return floatProcess;
        }
        #endregion

        #region Helper Methods
        private static FloatProcessIL CreateObjectFromDataRow(DataRow dr)
        {
            FloatProcessIL dm = new FloatProcessIL();

            if (dr["FloatProcessId"] != DBNull.Value)
                dm.FloatProcessId = Convert.ToInt64(dr["FloatProcessId"]);

            if (dr["PlazaId"] != DBNull.Value)
                dm.PlazaId = Convert.ToInt16(dr["PlazaId"]);

            if (dr["PlazaName"] != DBNull.Value)
                dm.PlazaName = Convert.ToString(dr["PlazaName"]);

            if (dr["LaneId"] != DBNull.Value)
                dm.LaneId = Convert.ToInt16(dr["LaneId"]);

            if (dr["LaneNumber"] != DBNull.Value)
                dm.LaneNumber = "Lane-" + Convert.ToString(dr["LaneNumber"]);

            if (dr["ShiftId"] != DBNull.Value)
            {
                dm.ShiftId = Convert.ToInt16(dr["ShiftId"]);
                dm.ShiftNumber = "Shift-" + Convert.ToString(dr["ShiftId"]);
            }

            if (dr["StartTimmng"] != DBNull.Value)
                dm.ShiftTimining = Convert.ToString(dr["StartTimmng"]);

            if (dr["EndTimming"] != DBNull.Value)
            {
                if (string.IsNullOrEmpty(dm.ShiftTimining))
                    dm.ShiftTimining = Convert.ToString(dr["EndTimming"]);
                else
                    dm.ShiftTimining = dm.ShiftTimining + "-" + Convert.ToString(dr["EndTimming"]);
            }

            if (dr["FloatTransactionTypeId"] != DBNull.Value)
                dm.FloatTransactionTypeId = Convert.ToInt16(dr["FloatTransactionTypeId"]);

            if (dr["FloatTransactionTypeName"] != DBNull.Value)
                dm.FloatTransactionTypeName = Convert.ToString(dr["FloatTransactionTypeName"]);

            if (dr["TransactionDate"] != DBNull.Value)
            {
                dm.TransactionDate = Convert.ToDateTime(dr["TransactionDate"]);
                dm.TransactionDateStamp = dm.TransactionDate.ToString(CommonLibrary.Constants.DateFormat);
            }

            if (dr["TransactionAmount"] != DBNull.Value)
                dm.TransactionAmount = Convert.ToDecimal(dr["TransactionAmount"]);

            if (dr["ReceiptNumber"] != DBNull.Value)
                dm.ReceiptNumber = Convert.ToString(dr["ReceiptNumber"]);

            if (dr["AssignedBy"] != DBNull.Value)
                dm.AssignedBy = Convert.ToInt64(dr["AssignedBy"]);

            if (dr["AssignedByLoginId"] != DBNull.Value)
                dm.AssignedByLoginId = Convert.ToString(dr["AssignedByLoginId"]);

            if (dr["AssignedTo"] != DBNull.Value)
                dm.AssignedTo = Convert.ToInt64(dr["AssignedTo"]);

            if (dr["AssignedToLoginId"] != DBNull.Value)
                dm.AssignedToLoginId = Convert.ToString(dr["AssignedToLoginId"]);

            if (dr["DataStatus"] != DBNull.Value)
                dm.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            if (dr["CreatedDate"] != DBNull.Value)
                dm.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                dm.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                dm.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                dm.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);
            dm.FloatProcessDenominationList = FloatProcessDenominationDL.GetById(dm.FloatProcessId);
            dm.DataStatusName = Enum.GetName(typeof(SystemConstants.DataStatusType), (SystemConstants.DataStatusType)dm.DataStatus);
            return dm;
        }
        #endregion
    }
}
