using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class LaneManagementDL
    {

        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_LaneConfiguration";
        #endregion
        internal static List<ResponceIL> InsertUpdate(LaneManagementIL lane)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_LaneInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, lane.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int32, lane.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneNumber", DbType.Int16, lane.LaneNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneName", DbType.String, lane.LaneName.Trim(), ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneType", DbType.Int16, lane.LaneTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneFor", DbType.Int16, lane.LaneForId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneDirection", DbType.Int16, lane.LaneDirection, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneIP", DbType.String, lane.LaneIP, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, lane.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, lane.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CDateTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }
        internal static List<ResponceIL> PInsertUpdate(LaneManagementIL lane)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_LaneInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, lane.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int16, lane.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int32, lane.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneNumber", DbType.Int16, lane.LaneNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneName", DbType.String, lane.LaneName, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneType", DbType.Int16, lane.LaneTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneFor", DbType.Int16, lane.LaneForId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneDirection", DbType.Int16, lane.LaneDirection, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneIP", DbType.String, lane.LaneIP, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, lane.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, lane.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, lane.CreatedDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, lane.ModifiedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, lane.ModifiedDate, ParameterDirection.Input));

                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }
        internal static void MarkedDeleted()
        {
            try
            {
                string spName = "USP_LaneMarkedDeleted";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        internal static void DeletedData()
        {
            try
            {
                string spName = "USP_LaneDeletedData";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #region Get Methods
        internal static List<LaneManagementIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<LaneManagementIL> lanes = new List<LaneManagementIL>();
            try
            {
                string spName = "USP_LaneGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    lanes.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return lanes;

        }
        internal static List<LaneManagementIL> GetByLaneType(Int16 LaneType)
        {
            DataTable dt = new DataTable();
            List<LaneManagementIL> lanes = new List<LaneManagementIL>();
            try
            {
                string spName = "USP_LaneGetByType";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneType", DbType.Int16, LaneType, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    lanes.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return lanes;
        }
        internal static List<LaneManagementIL> GetByLaneTypeActive(Int16 LaneType)
        {
            DataTable dt = new DataTable();
            List<LaneManagementIL> lanes = new List<LaneManagementIL>();
            try
            {
                string spName = "USP_LaneGetByTypeActive";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneType", DbType.Int16, LaneType, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    lanes.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return lanes;
        }
        internal static LaneManagementIL GetById(Int32 LaneId)
        {
            DataTable dt = new DataTable();
            LaneManagementIL lane = new LaneManagementIL();
            try
            {
                string spName = "USP_LaneGetbyId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, LaneId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    lane = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return lane;
        }
        internal static List<LaneManagementIL> GetByPlazaId(Int32 PlazaId)
        {
            DataTable dt = new DataTable();
            List<LaneManagementIL> lanes = new List<LaneManagementIL>();
            try
            {
                string spName = "USP_LaneGetbyPlazaId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int32, PlazaId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    lanes.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return lanes;

        }
        internal static List<LaneManagementIL> GetByPlazaIdActive(Int32 PlazaId)
        {
            DataTable dt = new DataTable();
            List<LaneManagementIL> lanes = new List<LaneManagementIL>();
            try
            {
                string spName = "USP_LaneGetbyPlazaIdActive";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int32, PlazaId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    lanes.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return lanes;

        }
        internal static List<LaneManagementIL> GetByClientPlazaId(LaneManagementIL lane)
        {
            DataTable dt = new DataTable();
            List<LaneManagementIL> lanes = new List<LaneManagementIL>();
            try
            {
                string spName = "USP_LaneGetbyClientPlazaId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, lane.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int32, lane.PlazaId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    lanes.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return lanes;
        }
        internal static List<LaneManagementIL> GetByClientPlazaIdActive(LaneManagementIL lane)
        {
            DataTable dt = new DataTable();
            List<LaneManagementIL> lanes = new List<LaneManagementIL>();
            try
            {
                string spName = "USP_LaneGetbyClientPlazaIdActive";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, lane.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int32, lane.PlazaId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    lanes.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return lanes;
        }
        internal static List<LaneManagementIL> GetByClientId(Int32 ClientId)
        {
            DataTable dt = new DataTable();
            List<LaneManagementIL> lanes = new List<LaneManagementIL>();
            try
            {
                string spName = "USP_LaneGetbyClientId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, ClientId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    lanes.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return lanes;
        }
        internal static List<LaneManagementIL> GetByClientIdActive(Int32 ClientId)
        {
            DataTable dt = new DataTable();
            List<LaneManagementIL> lanes = new List<LaneManagementIL>();
            try
            {
                string spName = "USP_LaneGetbyClientIdActive";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, ClientId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    lanes.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return lanes;
        }
        internal static LaneManagementIL GetByLaneNumber(LaneManagementIL lane)
        {
            DataTable dt = new DataTable();
            LaneManagementIL lanes = new LaneManagementIL();
            try
            {
                string spName = "USP_LaneGetbyLaneNumber";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, lane.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int32, lane.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneNumber", DbType.Int32, lane.LaneNumber, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    lanes = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return lanes;
        }

        internal static LaneManagementIL GetByIpAddress(String ipAddress)
        {
            DataTable dt = new DataTable();
            LaneManagementIL lane = new LaneManagementIL();
            try
            {
                string spName = "USP_LaneGetbyIP";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IPAddress", DbType.String, ipAddress, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    lane = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return lane;
        }
        #endregion

        #region Helper Methods
        private static LaneManagementIL CreateObjectFromDataRow(DataRow dr)
        {
            LaneManagementIL lane = new LaneManagementIL();

            if (dr["EntryId"] != DBNull.Value)
                lane.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["ClientId"] != DBNull.Value)
                lane.ClientId = Convert.ToInt16(dr["ClientId"]);

            if (dr["ClientName"] != DBNull.Value)
                lane.ClientName = Convert.ToString(dr["ClientName"]);

            if (dr["PlazaId"] != DBNull.Value)
                lane.PlazaId = Convert.ToInt32(dr["PlazaId"]);

            if (dr["PlazaName"] != DBNull.Value)
                lane.PlazaName = Convert.ToString(dr["PlazaName"]);

            if (dr["LaneNumber"] != DBNull.Value)
                lane.LaneNumber = Convert.ToInt16(dr["LaneNumber"]);

            if (dr["LaneTypeId"] != DBNull.Value)
                lane.LaneTypeId = Convert.ToInt16(dr["LaneTypeId"]);

            if (dr["LaneTypeName"] != DBNull.Value)
                lane.LaneTypeName = Convert.ToString(dr["LaneTypeName"]);

            if (dr["LaneForId"] != DBNull.Value)
                lane.LaneForId = Convert.ToInt16(dr["LaneForId"]);

            if (dr["LaneForName"] != DBNull.Value)
                lane.LaneForName = Convert.ToString(dr["LaneForName"]);

            if (dr["LaneDirection"] != DBNull.Value)
            {
                lane.LaneDirection = Convert.ToInt16(dr["LaneDirection"]);
                if (lane.LaneDirection == 1)
                    lane.Direction = "UP";
                else
                    lane.Direction = "DOWN";
            }

            if (dr["LaneName"] != DBNull.Value)
                lane.LaneName = Convert.ToString(dr["LaneName"]);

            if (dr["LaneIP"] != DBNull.Value)
                lane.LaneIP = Convert.ToString(dr["LaneIP"]);

            if (dr["CreatedDate"] != DBNull.Value)
                lane.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                lane.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                lane.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                lane.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);
            if (dr["DataStatus"] != DBNull.Value)
            {
                lane.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (lane.DataStatus != 1)
                    lane.DataStatusName = "Inactive";
            }
            return lane;
        }
        #endregion

    }
}
