using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.DL
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
                return incidentstatusList.FindAll(n => n.DataStatus == (short)SystemConstants.DataStatusType.Active);
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
            IncidentStatusIL imsStatus = new IncidentStatusIL();

            if (dr["IncidentStatusId"] != DBNull.Value)
                imsStatus.IncidentStatusId = Convert.ToInt16(dr["IncidentStatusId"]);

            if (dr["IncidentStatusName"] != DBNull.Value)
                imsStatus.IncidentStatusName = Convert.ToString(dr["IncidentStatusName"]);

            if (dr["IncidentStatusIcon"] != DBNull.Value)
                imsStatus.IncidentStatusIcon = Convert.ToString(dr["IncidentStatusIcon"]);

            if (dr["IncidentStatusColorCode"] != DBNull.Value)
                imsStatus.IncidentStatusColorCode = Convert.ToString(dr["IncidentStatusColorCode"]);

            if (dr["ProcessPercentage"] != DBNull.Value)
                imsStatus.ProcessPercentage = Convert.ToDecimal(dr["ProcessPercentage"]);

            if (dr["DataStatus"] != DBNull.Value)
                imsStatus.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            if (dr["CreatedDate"] != DBNull.Value)
                imsStatus.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                imsStatus.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                imsStatus.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                imsStatus.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            imsStatus.DataStatusName = Enum.GetName(typeof(SystemConstants.DataStatusType), (SystemConstants.DataStatusType)imsStatus.DataStatus);
            return imsStatus;
        }
        #endregion
    }
}
