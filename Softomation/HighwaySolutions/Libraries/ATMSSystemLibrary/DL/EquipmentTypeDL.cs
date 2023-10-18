using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DBA;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.DL
{
    internal class EquipmentTypeDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_EquipmentTypeMaster";
        #endregion

        #region Get Methods
        internal static List<EquipmentTypeIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<EquipmentTypeIL> eds = new List<EquipmentTypeIL>();
            try
            {
                string spName = "USP_EquipmentTypeMasterGetAll";
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
        internal static List<EquipmentTypeIL> GetActive()
        {
            List<EquipmentTypeIL> edlist = new List<EquipmentTypeIL>();
            try
            {
                edlist = GetAll();
                return edlist.FindAll(n => n.DataStatus == (short)CommonLibrary.Constants.DataStatusType.Active);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion

        #region Helper Methods
        private static EquipmentTypeIL CreateObjectFromDataRow(DataRow dr)
        {
            EquipmentTypeIL ed = new EquipmentTypeIL();

            if (dr["EquipmentTypeId"] != DBNull.Value)
                ed.EquipmentTypeId = Convert.ToInt16(dr["EquipmentTypeId"]);

            if (dr["EquipmentTypeName"] != DBNull.Value)
                ed.EquipmentTypeName = Convert.ToString(dr["EquipmentTypeName"]);

            if (dr["EquipmentCategoryTypeId"] != DBNull.Value)
                ed.EquipmentCategoryTypeId = Convert.ToInt16(dr["EquipmentCategoryTypeId"]);

            if (dr["EquipmentConnectionTypeId"] != DBNull.Value)
                ed.EquipmentConnectionTypeId = Convert.ToInt16(dr["EquipmentConnectionTypeId"]);

            if (dr["EquipmentIconName"] != DBNull.Value)
                ed.EquipmentIconName = Convert.ToString(dr["EquipmentIconName"]);

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
           
            ed.EquipmentCategoryTypeName = Enum.GetName(typeof(SystemConstants.EquipmentCategoryType), (SystemConstants.EquipmentCategoryType)ed.EquipmentCategoryTypeId);
            ed.EquipmentConnectionTypeName = Enum.GetName(typeof(SystemConstants.EquipmentConnectionType), (SystemConstants.EquipmentConnectionType)ed.EquipmentConnectionTypeId);
            return ed;
        }
        #endregion
    }
}
