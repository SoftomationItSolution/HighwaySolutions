using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using Softomation.ATMSSystemLibrary.DBA;
using Softomation.ATMSSystemLibrary.IL;

namespace Softomation.ATMSSystemLibrary.DL
{
    internal class IncidentCategoryDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_IncidentCategoryMaster";
        #endregion

        #region Get Methods
        internal static List<IncidentCategoryIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<IncidentCategoryIL> eds = new List<IncidentCategoryIL>();
            try
            {
                string spName = "USP_IncidentCategoryMasterGetAll";
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
        internal static List<IncidentCategoryIL> GetActive()
        {
            List<IncidentCategoryIL> edlist = new List<IncidentCategoryIL>();
            try
            {
                edlist = GetAll();
                return edlist.FindAll(n => n.DataStatus == (short)Constants.DataStatusType.Active);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion

        #region Helper Methods
        private static IncidentCategoryIL CreateObjectFromDataRow(DataRow dr)
        {
            IncidentCategoryIL ed = new IncidentCategoryIL();

            if (dr["IncidentCategoryId"] != DBNull.Value)
                ed.IncidentCategoryId = Convert.ToInt16(dr["IncidentCategoryId"]);

            if (dr["IncidentCategoryName"] != DBNull.Value)
                ed.IncidentCategoryName = Convert.ToString(dr["IncidentCategoryName"]);

            if (dr["IncidentCategoryIcon"] != DBNull.Value)
                ed.IncidentCategoryIcon = Convert.ToString(dr["IncidentCategoryIcon"]);

            if (dr["PriorityId"] != DBNull.Value)
                ed.PriorityId = Convert.ToInt16(dr["PriorityId"]);

            if (dr["IncidentCategoryIcon"] != DBNull.Value)
                ed.IncidentCategoryIcon = Convert.ToString(dr["IncidentCategoryIcon"]);

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

            ed.DataStatusName = Enum.GetName(typeof(Constants.DataStatusType), (Constants.DataStatusType)ed.DataStatus);
            ed.PriorityName = Enum.GetName(typeof(Constants.PriorityType), (Constants.PriorityType)ed.PriorityId);
            return ed;
        }
        #endregion
    }
}
