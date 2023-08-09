using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class ConnectionTypeDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_ConnectionType";
        #endregion

        internal static List<ResponceIL> InsertUpdate(ConnectionTypeIL connectionType)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_ConnectionTypeInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, connectionType.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ConnectionType", DbType.String, connectionType.ConnectionType.Trim(), ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, connectionType.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, connectionType.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, connectionType.CreatedDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, connectionType.ModifiedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, connectionType.ModifiedDate, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }
        internal static List<ResponceIL> PInsertUpdate(ConnectionTypeIL connectionType)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_ConnectionTypeInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, connectionType.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ConnectionType", DbType.String, connectionType.ConnectionType.Trim(), ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, connectionType.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, connectionType.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, connectionType.CreatedDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, connectionType.ModifiedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, connectionType.ModifiedDate, ParameterDirection.Input));
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
                string spName = "USP_ConnectionTypeMarkedDeleted";
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
                string spName = "USP_ConnectionTypeDeletedData";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        
        #region Get Methods
        internal static List<ConnectionTypeIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<ConnectionTypeIL> connectionTypes = new List<ConnectionTypeIL>();
            try
            {
                string spName = "USP_ConnectionTypeGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    connectionTypes.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return connectionTypes;

        }
        internal static List<ConnectionTypeIL> GetActive()
        {
            DataTable dt = new DataTable();
            List<ConnectionTypeIL> connectionTypes = new List<ConnectionTypeIL>();
            try
            {
                string spName = "USP_ConnectionTypeGetAllActive";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    connectionTypes.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return connectionTypes;

        }
        internal static ConnectionTypeIL GetById(Int32 ConnectionTypeId)
        {
            DataTable dt = new DataTable();
            ConnectionTypeIL connectionType = new ConnectionTypeIL();
            try
            {
                string spName = "USP_ConnectionTypeGetbyId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, ConnectionTypeId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    connectionType = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return connectionType;
        }
        #endregion

        #region Helper Methods
        private static ConnectionTypeIL CreateObjectFromDataRow(DataRow dr)
        {
            ConnectionTypeIL connectionType = new ConnectionTypeIL();

            if (dr["EntryId"] != DBNull.Value)
                connectionType.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["ConnectionType"] != DBNull.Value)
                connectionType.ConnectionType = Convert.ToString(dr["ConnectionType"]);

            if (dr["CreatedDate"] != DBNull.Value)
                connectionType.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                connectionType.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                connectionType.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                connectionType.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["DataStatus"] != DBNull.Value)
            {
                connectionType.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (connectionType.DataStatus != 1)
                    connectionType.DataStatusName = "Inactive";
            }
            return connectionType;
        }
        #endregion
    }
}
