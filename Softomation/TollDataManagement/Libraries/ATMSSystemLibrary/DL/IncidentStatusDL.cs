using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using Softomation.ATMSSystemLibrary.DBA;
using Softomation.ATMSSystemLibrary.IL;

namespace Softomation.ATMSSystemLibrary.DL
{
    internal class IncidentStatusDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_IncidentStatusMaster";
        #endregion

        #region Get Methods
        internal static List<IncidentStatusIL> GetAll()
        {
            List<IncidentStatusIL> incidentstatusList = new List<IncidentStatusIL>();
            try
            {
                string spName = "USP_IncidentStatusMasterGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    incidentstatusList.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return incidentstatusList;

        }
        internal static List<IncidentStatusIL> GetActive()
        {
            List<IncidentStatusIL> incidentstatusList = new List<IncidentStatusIL>();
            try
            {
                incidentstatusList = GetAll();
                return incidentstatusList.FindAll(n => n.DataStatus == (short)Constants.DataStatusType.Active);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion

        #region Helper Methods
        internal static IncidentStatusIL CreateObjectFromDataRow(DataRow dr)
        {
            IncidentStatusIL incidentstatus = new IncidentStatusIL();

            if (dr["IncidentStatusId"] != DBNull.Value)
                incidentstatus.IncidentStatusId = Convert.ToInt16(dr["IncidentStatusId"]);

            if (dr["IncidentStatusName"] != DBNull.Value)
                incidentstatus.IncidentStatusName = Convert.ToString(dr["IncidentStatusName"]);

            if (dr["IncidentStatusIcon"] != DBNull.Value)
                incidentstatus.IncidentStatusIcon = Convert.ToString(dr["IncidentStatusIcon"]);

            if (dr["IncidentStatusColorCode"] != DBNull.Value)
                incidentstatus.IncidentStatusColorCode = Convert.ToString(dr["IncidentStatusColorCode"]);

            if (dr["DataStatus"] != DBNull.Value)
                incidentstatus.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            if (dr["CreatedDate"] != DBNull.Value)
                incidentstatus.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                incidentstatus.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                incidentstatus.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                incidentstatus.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            incidentstatus.DataStatusName = Enum.GetName(typeof(Constants.DataStatusType), (Constants.DataStatusType)incidentstatus.DataStatus);
            return incidentstatus;
        }
        #endregion
    }
}
