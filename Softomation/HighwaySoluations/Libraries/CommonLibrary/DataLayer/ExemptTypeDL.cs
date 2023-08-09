using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class ExemptTypeDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_ExemptTypeMaster";
        #endregion

        internal static List<ResponceIL> InsertUpdate(ExemptTypeIL exemptType)
        {
            List<ResponceIL> responces = null;
            try
            {

                string spName = "USP_ExemptTypeInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, exemptType.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, exemptType.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ExemptTypeName", DbType.String, exemptType.ExemptTypeName.Trim(), ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, exemptType.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, exemptType.CreatedBy, ParameterDirection.Input));
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

        internal static List<ResponceIL> PInsertUpdate(ExemptTypeIL exemptType)
        {
            List<ResponceIL> responces = null;
            try
            {

                string spName = "USP_ExemptTypeInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, exemptType.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, exemptType.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ExemptTypeName", DbType.String, exemptType.ExemptTypeName.Trim(), ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, exemptType.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, exemptType.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, exemptType.CreatedDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, exemptType.ModifiedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, exemptType.ModifiedDate, ParameterDirection.Input));
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
                string spName = "USP_ExemptTypeMarkedDeleted";
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
                string spName = "USP_ExemptTypeDeletedData";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #region Get Methods
        internal static List<ExemptTypeIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<ExemptTypeIL> exemptTypes = new List<ExemptTypeIL>();
            try
            {
                string spName = "USP_ExemptTypeGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    exemptTypes.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return exemptTypes;

        }

        internal static List<ExemptTypeIL> GetActive()
        {
            DataTable dt = new DataTable();
            List<ExemptTypeIL> exemptTypes = new List<ExemptTypeIL>();
            try
            {
                string spName = "USP_ExemptTypeGetActive";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    exemptTypes.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return exemptTypes;

        }

        internal static ExemptTypeIL GetById(Int32 ExemptTypeId)
        {
            DataTable dt = new DataTable();
            ExemptTypeIL exemptType = new ExemptTypeIL();
            try
            {
                string spName = "USP_ExemptTypeGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, ExemptTypeId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    exemptType = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return exemptType;
        }

      
        #endregion

        #region Helper Methods
        private static ExemptTypeIL CreateObjectFromDataRow(DataRow dr)
        {
            ExemptTypeIL exemptType = new ExemptTypeIL();

            if (dr["EntryId"] != DBNull.Value)
                exemptType.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["ClientId"] != DBNull.Value)
                exemptType.ClientId = Convert.ToInt16(dr["ClientId"]);

            if (dr["ExemptTypeName"] != DBNull.Value)
                exemptType.ExemptTypeName = Convert.ToString(dr["ExemptTypeName"]);

            if (dr["DataStatus"] != DBNull.Value)
            {
                exemptType.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (exemptType.DataStatus != 1)
                    exemptType.DataStatusName = "Inactive";
            }

            if (dr["CreatedDate"] != DBNull.Value)
                exemptType.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                exemptType.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                exemptType.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                exemptType.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            return exemptType;
        }
        #endregion
    }
}
