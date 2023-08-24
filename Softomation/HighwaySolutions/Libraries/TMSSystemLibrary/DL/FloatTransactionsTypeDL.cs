using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;


namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class FloatTransactionsTypeDL
    {
        #region Global Varialble
        static string tableName = "tbl_FloatTransactionsTypeMaster";
        #endregion

        #region Get Methods
        internal static List<FloatTransactionsTypeIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<FloatTransactionsTypeIL> ftList = new List<FloatTransactionsTypeIL>();
            try
            {
                string spName = "USP_FloatTransactionsTypeGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    ftList.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ftList;

        }
        internal static List<FloatTransactionsTypeIL> GetActive()
        {
            List<FloatTransactionsTypeIL> ftaList = new List<FloatTransactionsTypeIL>();
            try
            {
                ftaList = GetAll();
                return ftaList.FindAll(n => n.DataStatus == (short)SystemConstants.DataStatusType.Active);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion

        #region Helper Methods
        private static FloatTransactionsTypeIL CreateObjectFromDataRow(DataRow dr)
        {
            FloatTransactionsTypeIL ft = new FloatTransactionsTypeIL();

            if (dr["FloatTransactionsTypeId"] != DBNull.Value)
                ft.FloatTransactionsTypeId = Convert.ToInt16(dr["FloatTransactionsTypeId"]);

            if (dr["FloatTransactionsTypeName"] != DBNull.Value)
                ft.FloatTransactionsTypeName = Convert.ToString(dr["FloatTransactionsTypeName"]);

            if (dr["DataStatus"] != DBNull.Value)
                ft.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            if (dr["CreatedDate"] != DBNull.Value)
                ft.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                ft.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                ft.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                ft.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            ft.DataStatusName = Enum.GetName(typeof(SystemConstants.DataStatusType), (SystemConstants.DataStatusType)ft.DataStatus);
            return ft;
        }
        #endregion
    }
}
