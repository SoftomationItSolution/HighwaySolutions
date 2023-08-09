using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class ClientManagementDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_ClientConfiguration";
        #endregion

        internal static List<ResponceIL> InsertUpdate(ClientManagementIL clientSetup)
        {
            List<ResponceIL> responces = null;
            try
            {

                string spName = "USP_ClientInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, clientSetup.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientName", DbType.String, clientSetup.ClientName.Trim(), ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientAddress", DbType.String, clientSetup.ClientAddress.Trim(), ParameterDirection.Input, 200));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MobileNumber", DbType.String, clientSetup.MobileNumber.Trim(), ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EmailId", DbType.String, clientSetup.EmailId.Trim(), ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, clientSetup.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, clientSetup.CreatedBy, ParameterDirection.Input));
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

        internal static List<ResponceIL> PInsertUpdate(ClientManagementIL clientSetup)
        {
            List<ResponceIL> responces = null;
            try
            {

                string spName = "USP_ClientInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, clientSetup.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientName", DbType.String, clientSetup.ClientName.Trim(), ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientAddress", DbType.String, clientSetup.ClientAddress.Trim(), ParameterDirection.Input, 200));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MobileNumber", DbType.String, clientSetup.MobileNumber.Trim(), ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EmailId", DbType.String, clientSetup.EmailId.Trim(), ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, clientSetup.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, clientSetup.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, clientSetup.CreatedDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, clientSetup.ModifiedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, clientSetup.ModifiedDate, ParameterDirection.Input));
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
                string spName = "USP_ClientMarkedDeleted";
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
                string spName = "USP_ClientDeletedData";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #region Get Methods
        internal static List<ClientManagementIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<ClientManagementIL> clients = new List<ClientManagementIL>();
            try
            {
                string spName = "USP_ClientGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    clients.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return clients;

        }
        internal static List<ClientManagementIL> GetActive()
        {
            DataTable dt = new DataTable();
            List<ClientManagementIL> clients = new List<ClientManagementIL>();
            try
            {
                string spName = "USP_ClientGetActive";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    clients.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return clients;

        }
        internal static ClientManagementIL GetById(Int32 clientId)
        {
            DataTable dt = new DataTable();
            ClientManagementIL client = new ClientManagementIL();
            try
            {
                string spName = "USP_ClientGetbyId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, clientId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    client = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return client;
        }
        #endregion

        #region Helper Methods
        private static ClientManagementIL CreateObjectFromDataRow(DataRow dr)
        {
            ClientManagementIL client = new ClientManagementIL();

            if (dr["EntryId"] != DBNull.Value)
                client.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["ClientName"] != DBNull.Value)
                client.ClientName = Convert.ToString(dr["ClientName"]);

            if (dr["ClientAddress"] != DBNull.Value)
                client.ClientAddress = Convert.ToString(dr["ClientAddress"]);

            if (dr["MobileNumber"] != DBNull.Value)
                client.MobileNumber = Convert.ToString(dr["MobileNumber"]);

            if (dr["EmailId"] != DBNull.Value)
                client.EmailId = Convert.ToString(dr["EmailId"]);

            if (dr["DataStatus"] != DBNull.Value)
            {
                client.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (client.DataStatus != 1)
                    client.DataStatusName = "Inactive";
            }


            if (dr["CreatedDate"] != DBNull.Value)
                client.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                client.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                client.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                client.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            return client;
        }
        #endregion
    }
}
