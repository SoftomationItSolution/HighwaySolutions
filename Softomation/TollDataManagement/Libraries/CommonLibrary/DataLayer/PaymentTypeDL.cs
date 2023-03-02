using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class PaymentTypeDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_PaymentTypeMaster";
        #endregion
        internal static List<ResponceIL> PInsertUpdate(PaymentTypeIL exemptType)
        {
            List<ResponceIL> responces = null;
            try
            {

                string spName = "USP_PaymentTypeInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, exemptType.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, exemptType.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PaymentTypeName", DbType.String, exemptType.PaymentTypeName.Trim(), ParameterDirection.Input, 100));
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
                string spName = "USP_PaymentTypeMarkedDeleted";
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
                string spName = "USP_PaymentTypeDeletedData";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #region Get Methods
        internal static List<PaymentTypeIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<PaymentTypeIL> exemptTypes = new List<PaymentTypeIL>();
            try
            {
                string spName = "USP_PaymentTypeGetAll";
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

        internal static PaymentTypeIL GetById(Int32 ExemptTypeId)
        {
            DataTable dt = new DataTable();
            PaymentTypeIL exemptType = new PaymentTypeIL();
            try
            {
                string spName = "USP_PaymentTypeGetById";
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
        private static PaymentTypeIL CreateObjectFromDataRow(DataRow dr)
        {
            PaymentTypeIL exemptType = new PaymentTypeIL();

            if (dr["EntryId"] != DBNull.Value)
                exemptType.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["ClientId"] != DBNull.Value)
                exemptType.ClientId = Convert.ToInt16(dr["ClientId"]);

            if (dr["PaymentTypeName"] != DBNull.Value)
                exemptType.PaymentTypeName = Convert.ToString(dr["PaymentTypeName"]);

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
