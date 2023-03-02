using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class HardwareTypeDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_HardwareType";
        #endregion
        internal static List<ResponceIL> PHardwareTypesUpdate(HardwareTypeIL hardwareType)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_HardwareTypesInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, hardwareType.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@HardwareType", DbType.String, hardwareType.HardwareType, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IconName", DbType.String, hardwareType.IconName, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ConnectionTypeId", DbType.Int16, hardwareType.ConnectionTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, hardwareType.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, hardwareType.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, hardwareType.CreatedDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, hardwareType.ModifiedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, hardwareType.ModifiedDate, ParameterDirection.Input));
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
                string spName = "USP_HardwareTypeMarkedDeleted";
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
                string spName = "USP_HardwareTypeDeletedData";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #region Get Methods
        internal static List<HardwareTypeIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<HardwareTypeIL> hardwareTypes = new List<HardwareTypeIL>();
            try
            {
                string spName = "USP_HardwareTypeGetAll";
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
        internal static List<HardwareTypeIL> GetActive()
        {
            DataTable dt = new DataTable();
            List<HardwareTypeIL> hardwareTypes = new List<HardwareTypeIL>();
            try
            {
                string spName = "USP_HardwareTypeGetAllActive";
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
        internal static HardwareTypeIL GetById(Int32 ConnectionTypeId)
        {
            DataTable dt = new DataTable();
            HardwareTypeIL hardwareType = new HardwareTypeIL();
            try
            {
                string spName = "USP_HardwareTypeGetbyId";
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
        private static HardwareTypeIL CreateObjectFromDataRow(DataRow dr)
        {
            HardwareTypeIL hardwareType = new HardwareTypeIL();

            if (dr["EntryId"] != DBNull.Value)
                hardwareType.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["HardwareType"] != DBNull.Value)
                hardwareType.HardwareType = Convert.ToString(dr["HardwareType"]);
           
            if (dr["IconName"] != DBNull.Value)
                hardwareType.IconName = Convert.ToString(dr["IconName"]);

            if (dr["ConnectionTypeId"] != DBNull.Value)
                hardwareType.ConnectionTypeId = Convert.ToInt16(dr["ConnectionTypeId"]);

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
