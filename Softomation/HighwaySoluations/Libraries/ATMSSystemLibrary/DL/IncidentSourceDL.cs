using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.DL
{
    internal class IncidentSourceDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_IncidentSourceMaster";
        #endregion

        #region Get Methods
        internal static List<IncidentSourceIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<IncidentSourceIL> srcList = new List<IncidentSourceIL>();
            try
            {
                string spName = "USP_IncidentSourceGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    srcList.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return srcList;

        }
        internal static List<IncidentSourceIL> GetActive()
        {
            List<IncidentSourceIL> srcList = new List<IncidentSourceIL>();
            try
            {
                srcList = GetAll();
                return srcList.FindAll(n => n.DataStatus == (short)SystemConstants.DataStatusType.Active);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion

        #region Helper Methods
        private static IncidentSourceIL CreateObjectFromDataRow(DataRow dr)
        {
            IncidentSourceIL src = new IncidentSourceIL();

            if (dr["SourceId"] != DBNull.Value)
                src.SourceId = Convert.ToInt16(dr["SourceId"]);

            if (dr["SourceName"] != DBNull.Value)
                src.SourceName = Convert.ToString(dr["SourceName"]);

            if (dr["ReferenceNo"] != DBNull.Value)
                src.ReferenceNo = Convert.ToString(dr["ReferenceNo"]);

            if (dr["DataStatus"] != DBNull.Value)
                src.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            if (dr["CreatedDate"] != DBNull.Value)
                src.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                src.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                src.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                src.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            src.DataStatusName = Enum.GetName(typeof(SystemConstants.DataStatusType), (SystemConstants.DataStatusType)src.DataStatus);
            return src;
        }
        #endregion
    }
}
