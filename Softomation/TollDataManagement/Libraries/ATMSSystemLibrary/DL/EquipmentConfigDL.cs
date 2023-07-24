using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using Softomation.ATMSSystemLibrary.DBA;
using Softomation.ATMSSystemLibrary.IL;
using static Softomation.ATMSSystemLibrary.Constants;

namespace Softomation.ATMSSystemLibrary.DL
{
    internal class EquipmentConfigDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_EquipmentConfig";
        #endregion

        internal static List<EquipmentConfigIL> GetBySystemId(short SystemId)
        {
            List<EquipmentConfigIL> config = new List<EquipmentConfigIL>();
            try
            {
                string spName = "USP_EquipmentConfigGetBySystemId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SystemId", DbType.Int16, SystemId, ParameterDirection.Input, 255));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    config.Add(CreateObjectFromDataRow(dr, SystemId));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return config;
        }

        #region Helper Methods
        private static EquipmentConfigIL CreateObjectFromDataRow(DataRow dr, short SystemId)
        {
            EquipmentConfigIL id = new EquipmentConfigIL();

            if (dr["EquipmentId"] != DBNull.Value)
                id.EquipmentId = Convert.ToInt64(dr["EquipmentId"]);

            if (dr["EquipmentTypeId"] != DBNull.Value)
                id.EquipmentTypeId = Convert.ToInt16(dr["EquipmentTypeId"]);

            if (dr["ChainageNumber"] != DBNull.Value)
                id.ChainageNumber = Convert.ToDecimal(dr["ChainageNumber"]);

            if (dr["IpAddress"] != DBNull.Value)
                id.IpAddress = Convert.ToString(dr["IpAddress"]);

            if (dr["EquipmentName"] != DBNull.Value)
                id.EquipmentName = Convert.ToString(dr["EquipmentName"]);

            if (dr["ParentId"] != DBNull.Value)
                id.ParentId = Convert.ToInt64(dr["ParentId"]);

            if (dr["PositionId"] != DBNull.Value)
                id.PositionId = Convert.ToInt16(dr["PositionId"]);

            if (SystemId == (short)SystemMasterType.VIDS)
                id.PositionName = Enum.GetName(typeof(VIDSEquipmentPositionType), (VIDSEquipmentPositionType)id.PositionId);
            else if (SystemId == (short)SystemMasterType.VSDS)
                id.PositionName = Enum.GetName(typeof(VSDSEquipmentPositionType), (VSDSEquipmentPositionType)id.PositionId);
            else if (SystemId == (short)SystemMasterType.ATCC)
                id.PositionName = Enum.GetName(typeof(ATCCEquipmentPositionType), (ATCCEquipmentPositionType)id.PositionId);
            else if (SystemId == (short)SystemMasterType.VMS)
                id.PositionName = Enum.GetName(typeof(VMSEquipmentPositionType), (VMSEquipmentPositionType)id.PositionId);
            return id;
        }
        #endregion
    }
}
