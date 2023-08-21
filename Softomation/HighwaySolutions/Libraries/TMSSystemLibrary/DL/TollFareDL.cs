using System;
using System.Data;
using System.Text;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class TollFareDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_TollFareMaster";
        #endregion

        internal static List<ResponseIL> SetUp(TollFareIL types)
        {
            List<ResponseIL> responses = null;
            try
            {
                DataTable ImportDataTable = new DataTable();
                ImportDataTable.Clear();
                ImportDataTable.Columns.Add("SessionId");
                ImportDataTable.Columns.Add("JourneyId");
                ImportDataTable.Columns.Add("SystemVehicleClassId");
                ImportDataTable.Columns.Add("TollFare");
                ImportDataTable.Columns.Add("ReturnFare");
                ImportDataTable.Columns.Add("FasTagPenalty");
                ImportDataTable.Columns.Add("OverweightPenalty");

                DataRow row;
                string SessionId = CommonLibrary.Constants.RandomString(10);
                StringBuilder xmlPermission = new StringBuilder();
                foreach (TollFareConfigurationIL item in types.TollFareConfigurations)
                {
                    row = ImportDataTable.NewRow();
                    row["SessionId"] = SessionId;
                    row["JourneyId"] = item.JourneyId;
                    row["SystemVehicleClassId"] = item.SystemVehicleClassId;
                    row["TollFare"] = item.TollFare;
                    row["ReturnFare"] = item.ReturnFare;
                    row["FasTagPenalty"] = item.FasTagPenalty;
                    row["OverweightPenalty"] = item.OverweightPenalty;
                    ImportDataTable.Rows.Add(row);
                }
                if (SystemConstants.BulkCopy(ImportDataTable, "temp_TollFareConfiguration"))
                {
                    string spName = "USP_TollFareSetup";
                    DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EffectedFrom", DbType.Date, types.EffectedFrom, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SessionId", DbType.String, SessionId, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, types.DataStatus, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, types.CreatedBy, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, types.ModifiedBy, ParameterDirection.Input));
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

        internal static TollFareIL GetByEffectedFrom(string EffectedFrom)
        {
            DataTable dt = new DataTable();
            TollFareIL fares = new TollFareIL();
            try
            {
                string spName = "USP_TollFareGetByEffectedFrom";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EffectedFrom", DbType.Date, EffectedFrom, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                        fares = CreateObjectFromDataRow(dr);
                }
                else
                    fares = GetDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return fares;
        }

        private static TollFareIL GetDefault()
        {
            DataTable dt = new DataTable();
            TollFareIL fares = new TollFareIL();
            try
            {
                string spName = "USP_TollFareGetDefault";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    fares = CreateObjectFromDataRow(dr);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return fares;
        }

        #region Helper Methods
        private static TollFareIL CreateObjectFromDataRow(DataRow dr)
        {
            TollFareIL fare = new TollFareIL();

            if (dr["TollFareId"] != DBNull.Value)
                fare.TollFareId = Convert.ToInt64(dr["TollFareId"]);

            if (dr["EffectedFrom"] != DBNull.Value)
            {
                fare.EffectedFrom = Convert.ToDateTime(dr["EffectedFrom"]);
                fare.EffectedFromStamp = fare.EffectedFrom.ToString(CommonLibrary.Constants.DateFormat);
            }

            if (dr["CreatedDate"] != DBNull.Value)
                fare.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                fare.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                fare.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                fare.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["DataStatus"] != DBNull.Value)
                fare.DataStatus = Convert.ToInt16(dr["DataStatus"]);
           
            fare.TollFareConfigurations = TollFareConfigurationDL.GetByTollFareId(fare.TollFareId);
            fare.DataStatusName = Enum.GetName(typeof(CommonLibrary.Constants.DataStatusType), (CommonLibrary.Constants.DataStatusType)fare.DataStatus);
            return fare;
        }
        #endregion
    }
}
