using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class CategoryMasterDL
    {
        #region Global Varialble
        static string tableName = "tbl_CategoryMaster";
        #endregion

        internal static List<CategoryMasterIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<CategoryMasterIL> dataLists = new List<CategoryMasterIL>();
            try
            {
                string spName = "USP_CategoryMasterGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    dataLists.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dataLists;
        }

        internal static List<CategoryMasterIL> GetAllActive()
        {
            DataTable dt = new DataTable();
            List<CategoryMasterIL> dataLists = new List<CategoryMasterIL>();
            try
            {
                string spName = "USP_CategoryMasterGetAllActive";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    dataLists.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dataLists;
        }

        internal static CategoryMasterIL GetById(int EntryId)
        {
            DataTable dt = new DataTable();
            CategoryMasterIL data = new CategoryMasterIL();
            List<CategoryMasterIL> dataLists = new List<CategoryMasterIL>();
            try
            {
                string spName = "USP_CategoryMasterGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, EntryId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                {
                    dataLists.Add(CreateObjectFromDataRow(dr));
                    data = dataLists[0];
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return data;
        }

        private static CategoryMasterIL CreateObjectFromDataRow(DataRow dr)
        {
            CategoryMasterIL data = new CategoryMasterIL();

            if (dr["EntryId"] != DBNull.Value)
                data.EntryId = Convert.ToInt32(dr["EntryId"]);

            if (dr["CategoryName"] != DBNull.Value)
                data.CategoryName = Convert.ToString(dr["CategoryName"]);

            if (dr["CreatedDate"] != DBNull.Value)
                data.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                data.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                data.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                data.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["DataStatus"] != DBNull.Value)
            {
                data.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (data.DataStatus != 1)
                    data.DataStatusName = "Inactive";
            }
            return data;
        }
    }
}
