using System;
using System.Data;
using System.Text;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;


namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class TransactionTypeDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_TransactionTypeMaster";
        #endregion

        internal static List<ResponseIL> SetUp(List<TransactionTypeIL> types)
        {
            List<ResponseIL> responses = null;
            try
            {
                DataTable ImportDataTable = new DataTable();
                ImportDataTable.Clear();
                ImportDataTable.Columns.Add("TransactionTypeId");
                ImportDataTable.Columns.Add("ReviewRequired");
                ImportDataTable.Columns.Add("DataStatus");
                ImportDataTable.Columns.Add("SessionId");
                DataRow row;
                string SessionId = CommonLibrary.Constants.RandomString(10);
                StringBuilder xmlPermission = new StringBuilder();
                for (int i = 0; i < types.Count; i++)
                {
                    row = ImportDataTable.NewRow();
                    row["TransactionTypeId"] = types[i].TransactionTypeId;
                    row["ReviewRequired"] = types[i].ReviewRequired;
                    row["DataStatus"] = types[i].DataStatus;
                    row["SessionId"] = SessionId;
                    ImportDataTable.Rows.Add(row);
                }
                if (SystemConstants.BulkCopy(ImportDataTable, "temp_TransactionTypeMaster"))
                {
                    string spName = "USP_TransactionTypeUpdate";
                    DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SessionId", DbType.String, SessionId, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, types[0].CreatedBy, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, types[0].ModifiedBy, ParameterDirection.Input));
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
        internal static List<TransactionTypeIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<TransactionTypeIL> eds = new List<TransactionTypeIL>();
            try
            {
                string spName = "USP_TransactionTypeGetAll";
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
        internal static List<TransactionTypeIL> GetActive()
        {
            List<TransactionTypeIL> edlist = new List<TransactionTypeIL>();
            try
            {
                edlist = GetAll();
                return edlist.FindAll(n => n.DataStatus == (short)SystemConstants.DataStatusType.Active);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion

        #region Helper Methods
        private static TransactionTypeIL CreateObjectFromDataRow(DataRow dr)
        {
            TransactionTypeIL ed = new TransactionTypeIL();

            if (dr["TransactionTypeId"] != DBNull.Value)
                ed.TransactionTypeId = Convert.ToInt16(dr["TransactionTypeId"]);

            if (dr["TransactionTypeName"] != DBNull.Value)
                ed.TransactionTypeName = Convert.ToString(dr["TransactionTypeName"]);

            if (dr["ReviewRequired"] != DBNull.Value)
                ed.ReviewRequired = Convert.ToBoolean(dr["ReviewRequired"]);

            if (dr["DataStatus"] != DBNull.Value)
                ed.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            if (dr["CreatedDate"] != DBNull.Value)
                ed.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                ed.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                ed.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                ed.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            ed.DataStatusName = Enum.GetName(typeof(SystemConstants.DataStatusType), (SystemConstants.DataStatusType)ed.DataStatus);
            return ed;
        }
        #endregion
    }
}
