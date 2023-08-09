using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;
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


        internal static List<ResponseIL> SetUp(List<EquipmentConfigIL> config)
        {
            List<ResponseIL> responses = null;
            try
            {
                DataTable ImportDataTable = new DataTable();
                ImportDataTable.Clear();
                ImportDataTable.Columns.Add("SystemId");
                ImportDataTable.Columns.Add("EquipmentTypeId");
                ImportDataTable.Columns.Add("EquipmentId");
                ImportDataTable.Columns.Add("ParentId");
                ImportDataTable.Columns.Add("PositionId");
                ImportDataTable.Columns.Add("LaneNumberId");
                ImportDataTable.Columns.Add("SessionId");
                DataRow row;
                string SessionId = Constants.RandomString(10);
                StringBuilder xmlPermission = new StringBuilder();
                for (int i = 0; i < config.Count; i++)
                {
                    row = ImportDataTable.NewRow();
                    row["SystemId"] = config[i].SystemId;
                    row["EquipmentTypeId"] = config[i].EquipmentTypeId;
                    row["EquipmentId"] = config[i].EquipmentId;
                    row["ParentId"] = config[i].ParentId;
                    row["PositionId"] = config[i].PositionId;
                    row["LaneNumberId"] = config[i].LaneNumberId;
                    row["SessionId"] = SessionId;
                    ImportDataTable.Rows.Add(row);
                }
                if (Constants.BulkCopy(ImportDataTable, "temp_EquipmentConfig"))
                {
                    string spName = "USP_EquipmentConfigInsertUpdate";
                    DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SessionId", DbType.String, SessionId, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SystemId", DbType.Int16, config[0].SystemId, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, config[0].CreatedBy, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input)); 
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, config[0].ModifiedBy, ParameterDirection.Input));
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
            
            if (dr["EquipmentTypeName"] != DBNull.Value)
                id.EquipmentTypeName = Convert.ToString(dr["EquipmentTypeName"]);
            
            if (dr["ChainageNumber"] != DBNull.Value)
            {
                id.ChainageNumber = Convert.ToDecimal(dr["ChainageNumber"]);
                id.ChainageName = id.ChainageNumber.ToString().Replace(".", "+");
            }

            if (dr["IpAddress"] != DBNull.Value)
                id.IpAddress = Convert.ToString(dr["IpAddress"]);

            if (dr["EquipmentName"] != DBNull.Value)
                id.EquipmentName = Convert.ToString(dr["EquipmentName"]);

            if (dr["DirectionId"] != DBNull.Value)
                id.DirectionId = Convert.ToInt16(dr["DirectionId"]);

            if (dr["ParentId"] != DBNull.Value)
                id.ParentId = Convert.ToInt64(dr["ParentId"]);

            if (dr["PositionId"] != DBNull.Value)
                id.PositionId = Convert.ToInt16(dr["PositionId"]);

            if (dr["LaneNumberId"] != DBNull.Value)
                id.LaneNumberId = Convert.ToInt16(dr["LaneNumberId"]);

            id.DirectionName = Enum.GetName(typeof(DirectionType), (DirectionType)id.DirectionId);

            if (SystemId == (short)SystemMasterType.VIDS)
                id.PositionName = Enum.GetName(typeof(VIDSEquipmentPositionType), (VIDSEquipmentPositionType)id.PositionId);
            else if (SystemId == (short)SystemMasterType.VSDS)
                id.PositionName = Enum.GetName(typeof(HighwayLaneNumber), (HighwayLaneNumber)id.PositionId);
            else if (SystemId == (short)SystemMasterType.ATCC)
                id.PositionName = Enum.GetName(typeof(ATCCEquipmentPositionType), (ATCCEquipmentPositionType)id.PositionId);
            else if (SystemId == (short)SystemMasterType.VMS)
                id.PositionName = Enum.GetName(typeof(VMSEquipmentPositionType), (VMSEquipmentPositionType)id.PositionId);

            id.LaneNumberName = SplitCamelCase(Enum.GetName(typeof(HighwayLaneNumber), (HighwayLaneNumber)id.LaneNumberId));
            return id;
        }
        #endregion
    }
}
