using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class TransactionTypeDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_TransactionTypeMaster";
        #endregion
        internal static List<ResponceIL> InsertUpdate(TransactionTypeIL tranType)
        {
            List<ResponceIL> responces = null;
            try
            {

                string spName = "USP_TransactionTypeInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, tranType.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, tranType.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionTypeName", DbType.String, tranType.TransactionTypeName.Trim(), ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, tranType.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, tranType.CreatedBy, ParameterDirection.Input));
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
        internal static List<ResponceIL> PInsertUpdate(TransactionTypeIL tranType)
        {
            List<ResponceIL> responces = null;
            try
            {

                string spName = "USP_TransactionTypeInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, tranType.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, tranType.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedRequired", DbType.Int16, tranType.ReveiwedRequired, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionTypeName", DbType.String, tranType.TransactionTypeName.Trim(), ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, tranType.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, tranType.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, tranType.CreatedDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, tranType.ModifiedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, tranType.ModifiedDate, ParameterDirection.Input));
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
                string spName = "USP_TransactionTypeMarkedDeleted";
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
                string spName = "USP_TransactionTypeDeletedData";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #region Get Methods
        internal static List<TransactionTypeIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<TransactionTypeIL> transactionTypes = new List<TransactionTypeIL>();
            try
            {
                string spName = "USP_TransactionTypeGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    transactionTypes.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return transactionTypes;

        }

        internal static TransactionTypeIL GetById(Int32 TransactionTypeId)
        {
            DataTable dt = new DataTable();
            TransactionTypeIL transactionType = new TransactionTypeIL();
            try
            {
                string spName = "USP_TransactionTypeGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, TransactionTypeId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    transactionType = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return transactionType;
        }


        #endregion

        #region Helper Methods
        private static TransactionTypeIL CreateObjectFromDataRow(DataRow dr)
        {
            TransactionTypeIL transactionType = new TransactionTypeIL();

            if (dr["EntryId"] != DBNull.Value)
                transactionType.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["ClientId"] != DBNull.Value)
                transactionType.ClientId = Convert.ToInt16(dr["ClientId"]);

            if (dr["ReveiwedRequired"] != DBNull.Value)
                transactionType.ReveiwedRequired = Convert.ToInt16(dr["ReveiwedRequired"]);

            if (dr["TransactionTypeName"] != DBNull.Value)
                transactionType.TransactionTypeName = Convert.ToString(dr["TransactionTypeName"]);

            if (dr["DataStatus"] != DBNull.Value)
            {
                transactionType.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (transactionType.DataStatus != 1)
                    transactionType.DataStatusName = "Inactive";
            }

            if (dr["CreatedDate"] != DBNull.Value)
                transactionType.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                transactionType.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                transactionType.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                transactionType.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            return transactionType;
        }
        #endregion
    }
}
