using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class DenominationDL
    {
        #region Global Varialble
        static string tableName = "tbl_DenominationMaster";
        #endregion

        #region Get Methods
        internal static List<DenominationIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<DenominationIL> eds = new List<DenominationIL>();
            try
            {
                string spName = "USP_DenominationGetAll";
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
        internal static List<DenominationIL> GetActive()
        {
            List<DenominationIL> dmlist = new List<DenominationIL>();
            try
            {
                dmlist = GetAll();
                return dmlist.FindAll(n => n.DataStatus == (short)SystemConstants.DataStatusType.Active);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion

        #region Helper Methods
        private static DenominationIL CreateObjectFromDataRow(DataRow dr)
        {
            DenominationIL dm = new DenominationIL();

            if (dr["DenominationId"] != DBNull.Value)
                dm.DenominationId = Convert.ToInt16(dr["DenominationId"]);
            
            if (dr["DenominationValue"] != DBNull.Value)
                dm.DenominationValue = Convert.ToInt16(dr["DenominationValue"]);

            if (dr["OrderBy"] != DBNull.Value)
                dm.OrderBy = Convert.ToInt16(dr["OrderBy"]);
            
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

            dm.DataStatusName = Enum.GetName(typeof(SystemConstants.DataStatusType), (SystemConstants.DataStatusType)dm.DataStatus);
            return dm;
        }
        #endregion
    }
}
