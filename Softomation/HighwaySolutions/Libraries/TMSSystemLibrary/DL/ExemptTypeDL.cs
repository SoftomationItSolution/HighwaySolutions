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
    internal class ExemptTypeDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_ExemptTypeMaster";
        #endregion

        internal static List<ResponseIL> SetUp(List<ExemptTypeIL> types)
        {
            List<ResponseIL> responses = null;
            try
            {
                DataTable ImportDataTable = new DataTable();
                ImportDataTable.Clear();
                ImportDataTable.Columns.Add("ExemptTypeId");
                ImportDataTable.Columns.Add("ReviewRequired");
                ImportDataTable.Columns.Add("DataStatus");
                ImportDataTable.Columns.Add("SessionId");
                DataRow row;
                string SessionId = CommonLibrary.Constants.RandomString(10);
                StringBuilder xmlPermission = new StringBuilder();
                for (int i = 0; i < types.Count; i++)
                {
                    row = ImportDataTable.NewRow();
                    row["ExemptTypeId"] = types[i].ExemptTypeId;
                    row["DataStatus"] = types[i].DataStatus;
                    row["SessionId"] = SessionId;
                    ImportDataTable.Rows.Add(row);
                }
                if (SystemConstants.BulkCopy(ImportDataTable, "temp_ExemptTypeMaster"))
                {
                    string spName = "USP_ExemptTypeUpdate";
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
        internal static List<ExemptTypeIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<ExemptTypeIL> eds = new List<ExemptTypeIL>();
            try
            {
                string spName = "USP_ExemptTypeMasterGetAll";
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
        internal static List<ExemptTypeIL> GetActive()
        {
            List<ExemptTypeIL> edlist = new List<ExemptTypeIL>();
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
        private static ExemptTypeIL CreateObjectFromDataRow(DataRow dr)
        {
            ExemptTypeIL ed = new ExemptTypeIL();

            if (dr["ExemptTypeId"] != DBNull.Value)
                ed.ExemptTypeId = Convert.ToInt16(dr["ExemptTypeId"]);

            if (dr["ExemptTypeName"] != DBNull.Value)
                ed.ExemptTypeName = Convert.ToString(dr["ExemptTypeName"]);

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
