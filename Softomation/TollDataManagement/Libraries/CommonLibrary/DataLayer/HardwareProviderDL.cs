using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;
namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class HardwareProviderDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_HardwareProvider";
        #endregion
        internal static List<ResponceIL> PInsertUpdate(HardwareProviderIL hardwareProvider)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_HardwareProviderInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, hardwareProvider.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ProviderName", DbType.String, hardwareProvider.ProviderName, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, hardwareProvider.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, hardwareProvider.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, hardwareProvider.CreatedDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, hardwareProvider.ModifiedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, hardwareProvider.ModifiedDate, ParameterDirection.Input));
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
                string spName = "USP_HardwareProviderMarkedDeleted";
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
                string spName = "USP_HardwareProviderDeletedData";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #region Get Methods
        internal static List<HardwareProviderIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<HardwareProviderIL> hardwareTypes = new List<HardwareProviderIL>();
            try
            {
                string spName = "USP_HardwareProviderGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    hardwareTypes.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return hardwareTypes;

        }
        internal static List<HardwareProviderIL> GetActive()
        {
            DataTable dt = new DataTable();
            List<HardwareProviderIL> hardwareTypes = new List<HardwareProviderIL>();
            try
            {
                string spName = "USP_HardwareProviderGetAllActive";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    hardwareTypes.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return hardwareTypes;

        }
        internal static HardwareProviderIL GetById(Int32 ConnectionTypeId)
        {
            DataTable dt = new DataTable();
            HardwareProviderIL hardwareType = new HardwareProviderIL();
            try
            {
                string spName = "USP_HardwareProviderGetbyId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, ConnectionTypeId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    hardwareType = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return hardwareType;
        }
        #endregion

        #region Helper Methods
        private static HardwareProviderIL CreateObjectFromDataRow(DataRow dr)
        {
            HardwareProviderIL hardwareType = new HardwareProviderIL();

            if (dr["EntryId"] != DBNull.Value)
                hardwareType.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["ProviderName"] != DBNull.Value)
                hardwareType.ProviderName = Convert.ToString(dr["ProviderName"]);

            if (dr["CreatedDate"] != DBNull.Value)
                hardwareType.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                hardwareType.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                hardwareType.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                hardwareType.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["DataStatus"] != DBNull.Value)
            {
                hardwareType.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (hardwareType.DataStatus != 1)
                    hardwareType.DataStatusName = "Inactive";
            }
            return hardwareType;
        }
        #endregion
    }
}
