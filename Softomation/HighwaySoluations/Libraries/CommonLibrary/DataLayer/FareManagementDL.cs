using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Text;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class FareManagementDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_FareMaster";
        static string tableName1 = "tbl_FareConfiguration";


        #endregion

        internal static List<ResponceIL> InsertUpdate(FareManagementIL fare)
        {
            List<ResponceIL> responces = null;
            try
            {
                DataTable ImportDataTable = new DataTable();
                ImportDataTable.Clear();
                ImportDataTable.Columns.Add("ClassId");
                ImportDataTable.Columns.Add("EntryPlazaId");
                ImportDataTable.Columns.Add("ExitPlazaId");
                ImportDataTable.Columns.Add("OverWeightFare");
                ImportDataTable.Columns.Add("PenaltyFare");
                ImportDataTable.Columns.Add("TollFare");
                ImportDataTable.Columns.Add("ReturnFare");
                ImportDataTable.Columns.Add("SessionId");
                DataRow row;
                string SessionId = Constants.RandomString(10);
                StringBuilder xmlPermission = new StringBuilder();
                for (int i = 0; i < fare.FareDetails.Count; i++)
                {
                    row = ImportDataTable.NewRow();
                    row["ClassId"] = fare.FareDetails[i].ClassId;
                    row["EntryPlazaId"] = fare.FareDetails[i].EntryPlazaId;
                    row["ExitPlazaId"] = fare.FareDetails[i].ExitPlazaId;
                    row["OverWeightFare"] = fare.FareDetails[i].OverWeightFare;
                    row["PenaltyFare"] = fare.FareDetails[i].PenaltyFare;
                    row["TollFare"] = fare.FareDetails[i].TollFare;
                    row["ReturnFare"] = fare.FareDetails[i].ReturnFare;
                    row["SessionId"] = SessionId;
                    ImportDataTable.Rows.Add(row);
                }
                if (BulkCopy(ImportDataTable, "tbl_TempFareData"))
                {
                    string spName = "USP_FareInsertUpdate";
                    DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int16, fare.ClientId, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EffectiveDate", DbType.Date, fare.EffectiveDate, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SessionId", DbType.String, SessionId, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, fare.DataStatus, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, fare.CreatedBy, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CDateTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                    dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                    responces = Constants.ConvertResponceList(dt);
                }


            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }

        

        internal static List<ResponceIL> PInsertUpdate(FareManagementIL fare)
        {
            List<ResponceIL> responces = null;
            try
            {
                DataTable ImportDataTable = new DataTable();
                ImportDataTable.Clear();
                ImportDataTable.Columns.Add("ClassId");
                ImportDataTable.Columns.Add("EntryPlazaId");
                ImportDataTable.Columns.Add("ExitPlazaId");
                ImportDataTable.Columns.Add("OverWeightFare");
                ImportDataTable.Columns.Add("PenaltyFare");
                ImportDataTable.Columns.Add("TollFare");
                ImportDataTable.Columns.Add("ReturnFare");
                ImportDataTable.Columns.Add("SessionId");
                DataRow row;
                string SessionId = Constants.RandomString(10);
                StringBuilder xmlPermission = new StringBuilder();
                for (int i = 0; i < fare.FareDetails.Count; i++)
                {
                    row = ImportDataTable.NewRow();
                    row["ClassId"] = fare.FareDetails[i].ClassId;
                    row["EntryPlazaId"] = fare.FareDetails[i].EntryPlazaId;
                    row["ExitPlazaId"] = fare.FareDetails[i].ExitPlazaId;
                    row["OverWeightFare"] = fare.FareDetails[i].OverWeightFare;
                    row["PenaltyFare"] = fare.FareDetails[i].PenaltyFare;
                    row["TollFare"] = fare.FareDetails[i].TollFare;
                    row["ReturnFare"] = fare.FareDetails[i].ReturnFare;
                    row["SessionId"] = SessionId;
                    ImportDataTable.Rows.Add(row);
                }
                if (BulkCopy(ImportDataTable, "tbl_TempFareData"))
                {
                    string spName = "USP_FareInsertUpdate";
                    DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, fare.EntryId, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int16, fare.ClientId, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EffectiveDate", DbType.Date, fare.EffectiveDate, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SessionId", DbType.String, SessionId, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, fare.DataStatus, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, fare.CreatedBy, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, fare.CreatedDate, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, fare.ModifiedBy, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, fare.ModifiedDate, ParameterDirection.Input));
                    dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                    responces = Constants.ConvertResponceList(dt);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }

        #region Get Methods

        internal static FareManagementIL GetAllByClientId(FareManagementIL fare)
        {
            DataTable dt = new DataTable();
            FareManagementIL faries = new FareManagementIL();
            List<FareDetailsIL> fareDetail = new List<FareDetailsIL>();
            try
            {
                string spName = "USP_FareMappingGetByClientId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int16, fare.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EffectiveDate", DbType.Date, fare.EffectiveDate, ParameterDirection.Input));
                DataSet ds = DBAccessor.LoadDataSet(command, tableName);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                        faries = (CreateObjectFromDataRow(dr, 0));
                }
                else
                {
                    faries = fare;
                }
                if (ds.Tables[1].Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Tables[1].Rows)
                        fareDetail.Add(CreateDetailObjectFromDataRow(dr));
                    faries.FareDetails = fareDetail;
                }
                if (ds.Tables[2].Rows.Count > 0)
                {
                    string ld = ds.Tables[2].Rows[0]["LastEffectiveDate"].ToString();
                    if (!string.IsNullOrEmpty(ld))
                        faries.LastEffectiveDate = Convert.ToDateTime(ld);
                }


            }
            catch (Exception ex)
            {
                throw ex;
            }
            return faries;
        }
        internal static FareManagementIL GetAllByDate(FareManagementIL fare)
        {
            DataTable dt = new DataTable();
            FareManagementIL faries = new FareManagementIL();
            List<FareDetailsIL> fareDetail = new List<FareDetailsIL>();
            try
            {
                string spName = "USP_FareMappingGetByDate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EffectiveDate", DbType.Date, fare.EffectiveDate, ParameterDirection.Input));
                DataSet ds = DBAccessor.LoadDataSet(command, tableName);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                        faries = (CreateObjectFromDataRow(dr, 0));
                }
                else
                {
                    faries = fare;
                }
                if (ds.Tables[1].Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Tables[1].Rows)
                        fareDetail.Add(CreateDetailObjectFromDataRow(dr));
                    faries.FareDetails = fareDetail;
                }
                if (ds.Tables[2].Rows.Count > 0)
                {
                    string ld = ds.Tables[2].Rows[0]["LastEffectiveDate"].ToString();
                    if (!string.IsNullOrEmpty(ld))
                        faries.LastEffectiveDate = Convert.ToDateTime(ld);
                }


            }
            catch (Exception ex)
            {
                throw ex;
            }
            return faries;
        }
        internal static FareDetailsIL GetFareByJourney(FareDetailsIL fare)
        {
            FareDetailsIL fareDetail = new FareDetailsIL();
            try
            {
                string spName = "USP_FareMappingGetByJourney";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryPlazaId", DbType.Int16, fare.EntryPlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ExitPlazaId", DbType.Int16, fare.ExitPlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClassId", DbType.Int16, fare.ClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionDate", DbType.Date, fare.TransactionTimeStamp, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    fareDetail = CreateDetailObjectFromDataRow(dr);


            }
            catch (Exception ex)
            {
                throw ex;
            }
            return fareDetail;
        }
        internal static List<FareManagementIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<FareManagementIL> faries = new List<FareManagementIL>();
            try
            {
                string spName = "USP_FareMappingGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    faries.Add(CreateObjectFromDataRow(dr, 1));


            }
            catch (Exception ex)
            {
                throw ex;
            }
            return faries;
        }
        internal static List<FareDetailsIL> GetDetailById(long FareId)
        {
            DataTable dt = new DataTable();
            List<FareDetailsIL> fareDetail = new List<FareDetailsIL>();
            try
            {
                string spName = "USP_FareDetailById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FareId", DbType.Int16, FareId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    fareDetail.Add(CreateDetailObjectFromDataRow(dr));


            }
            catch (Exception ex)
            {
                throw ex;
            }
            return fareDetail;
        }
        #endregion

        #region Helper Methods
        private static bool BulkCopy(DataTable dt, string table)
        {
            bool error = true;
            SqlConnection con = (SqlConnection)DBAccessor.CreateConnection();
            con.Open();
            using (SqlBulkCopy bulcopy = new SqlBulkCopy(con))
            {
                bulcopy.DestinationTableName = table;
                try
                {
                    bulcopy.WriteToServer(dt);
                    con.Dispose();
                }
                catch (Exception ex)
                {
                    con.Dispose();
                    error = false;
                    throw ex;
                }
                return error;
            }
        }
        private static FareManagementIL CreateObjectFromDataRow(DataRow dr, short required)
        {
            FareManagementIL fare = new FareManagementIL();

            if (dr["EntryId"] != DBNull.Value)
                fare.EntryId = Convert.ToInt32(dr["EntryId"]);

            if (dr["ClientId"] != DBNull.Value)
                fare.ClientId = Convert.ToInt16(dr["ClientId"]);

            if (dr["EffectiveDate"] != DBNull.Value)
                fare.EffectiveDate = Convert.ToDateTime(dr["EffectiveDate"]);

            if (dr["CreatedDate"] != DBNull.Value)
                fare.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                fare.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                fare.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                fare.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["DataStatus"] != DBNull.Value)
            {
                fare.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (fare.DataStatus != 1)
                    fare.DataStatusName = "Inactive";
            }

            if (required == 1 && fare.EntryId > 0)
            {
                fare.FareDetails = GetDetailById(fare.EntryId);
            }
            return fare;
        }
        private static FareDetailsIL CreateDetailObjectFromDataRow(DataRow dr)
        {
            FareDetailsIL fare = new FareDetailsIL();
            if (dr["EntryPlazaId"] != DBNull.Value)
                fare.EntryPlazaId = Convert.ToInt16(dr["EntryPlazaId"]);

            if (dr["ExitPlazaId"] != DBNull.Value)
                fare.ExitPlazaId = Convert.ToInt16(dr["ExitPlazaId"]);

            if (dr["Journey"] != DBNull.Value)
                fare.Journey = Convert.ToString(dr["Journey"]);

            if (dr["ClassId"] != DBNull.Value)
                fare.ClassId = Convert.ToInt16(dr["ClassId"]);

            if (dr["ClassName"] != DBNull.Value)
                fare.ClassName = Convert.ToString(dr["ClassName"]);

            if (dr["TollFare"] != DBNull.Value)
                fare.TollFare = Convert.ToDecimal(dr["TollFare"]);

            if (dr["ReturnFare"] != DBNull.Value)
                fare.ReturnFare = Convert.ToDecimal(dr["ReturnFare"]);

            if (dr["PenaltyFare"] != DBNull.Value)
                fare.PenaltyFare = Convert.ToDecimal(dr["PenaltyFare"]);

            if (dr["OverWeightFare"] != DBNull.Value)
                fare.OverWeightFare = Convert.ToDecimal(dr["OverWeightFare"]);
            return fare;
        }
        #endregion
    }
}
