using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Data.Common;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DBA;
using System.Linq;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.DL
{
    internal class LaneConfigDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_LaneConfig";
        #endregion

        internal static List<ResponseIL> SetUp(List<LaneConfigIL> config)
        {
            List<ResponseIL> responses = null;
            try
            {
                DataTable ImportDataTable = new DataTable();
                ImportDataTable.Clear();
                ImportDataTable.Columns.Add("LaneNumber");
                ImportDataTable.Columns.Add("AllowedClassIds");
                ImportDataTable.Columns.Add("AllowedSpeed");
                ImportDataTable.Columns.Add("DataStatus");
                ImportDataTable.Columns.Add("SessionId");
                DataRow row;
                string SessionId = SystemConstants.RandomString(10);
                StringBuilder xmlPermission = new StringBuilder();
                for (int i = 0; i < config.Count; i++)
                {
                    row = ImportDataTable.NewRow();
                    row["LaneNumber"] = config[i].LaneNumber;
                    row["AllowedClassIds"] = config[i].AllowedClassIds;
                    row["AllowedSpeed"] = config[i].AllowedSpeed;
                    row["DataStatus"] = config[i].DataStatus;
                    row["SessionId"] = SessionId;
                    ImportDataTable.Rows.Add(row);
                }
                if (SystemConstants.BulkCopy(ImportDataTable, "temp_LaneConfig"))
                {
                    string spName = "USP_LaneConfigInsertUpdate";
                    DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SessionId", DbType.String, SessionId, ParameterDirection.Input));
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

        internal static List<LaneConfigIL> GetAll()
        {
            List<LaneConfigIL> config = new List<LaneConfigIL>();
            try
            {
                string spName = "USP_LaneConfigGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    config.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return config;
        }
        internal static List<LaneConfigIL> GetActive()
        {
            List<LaneConfigIL> crlist = new List<LaneConfigIL>();
            try
            {
                crlist = GetAll();
                return crlist.FindAll(n => n.DataStatus == (short)CommonLibrary.Constants.DataStatusType.Active);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        
        #region Helper Methods
        private static LaneConfigIL CreateObjectFromDataRow(DataRow dr)
        {
            LaneConfigIL lc = new LaneConfigIL();
            if (dr["LaneNumber"] != DBNull.Value)
            {
                lc.LaneNumber = Convert.ToInt16(dr["LaneNumber"]);
                lc.LaneName = "Lane-" + lc.LaneNumber.ToString();
            }
            if (dr["AllowedClassIds"] != DBNull.Value)
            {
                lc.AllowedClassIds = Convert.ToString(dr["AllowedClassIds"]);
                if (!string.IsNullOrEmpty(lc.AllowedClassIds))
                {
                    lc.AllowedClassIdList = lc.AllowedClassIds?.Split(',')?.Select(Int16.Parse)?.ToArray();
                    lc.AllowedClassList = VehicleClassDL.GetByIds(lc.AllowedClassIds);
                }
            }
            if (dr["AllowedSpeed"] != DBNull.Value)
                lc.AllowedSpeed = Convert.ToDecimal(dr["AllowedSpeed"]);

            if (dr["DataStatus"] != DBNull.Value)
                lc.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            lc.DataStatusName = Enum.GetName(typeof(CommonLibrary.Constants.DataStatusType), (CommonLibrary.Constants.DataStatusType)lc.DataStatus);
            return lc;
        }
        #endregion
    }
}
