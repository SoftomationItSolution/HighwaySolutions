using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class GantryMappingDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_GantryMapping";
        #endregion
        internal static List<ResponceIL> InsertUpdate(GantryMappingIL gantry)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_GantryMappingInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryGantryId", DbType.Int32, gantry.EntryGantryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ExitGantryId", DbType.Int32, gantry.ExitGantryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@GantryDistance", DbType.Decimal, gantry.GantryDistance, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, gantry.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, gantry.CreatedBy, ParameterDirection.Input));
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

        internal static List<ResponceIL> ValidateInsertUpdate(GantryMappingIL gantry)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_GantryMappingValidateInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryGantryId", DbType.Int32, gantry.EntryGantryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ExitGantryId", DbType.Int32, gantry.ExitGantryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@GantryDistance", DbType.Decimal, gantry.GantryDistance, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, gantry.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, gantry.CreatedBy, ParameterDirection.Input));
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
        #region Get Methods
        internal static List<GantryMappingIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<GantryMappingIL> plazas = new List<GantryMappingIL>();
            try
            {
                string spName = "USP_GantryMappingGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    plazas.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return plazas;

        }

        internal static List<GantryMappingIL> GetByGantryId(Int16 GantryId)
        {
            DataTable dt = new DataTable();
            List<GantryMappingIL> plazas = new List<GantryMappingIL>();
            try
            {
                string spName = "USP_GantryMappingGetbyGantryId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@GantryId", DbType.Int16, GantryId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    plazas.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return plazas;
        }

        #endregion

        #region Helper Methods
        private static GantryMappingIL CreateObjectFromDataRow(DataRow dr)
        {
            GantryMappingIL data = new GantryMappingIL();

            if (dr["EntryId"] != DBNull.Value)
                data.EntryId = Convert.ToInt32(dr["EntryId"]);

            if (dr["EntryGantryId"] != DBNull.Value)
                data.EntryGantryId = Convert.ToInt32(dr["EntryGantryId"]);

            if (dr["EntryGantryName"] != DBNull.Value)
                data.EntryGantryName = Convert.ToString(dr["EntryGantryName"]);

            if (dr["ExitGantryId"] != DBNull.Value)
                data.ExitGantryId = Convert.ToInt32(dr["ExitGantryId"]);

            if (dr["ExitGantryName"] != DBNull.Value)
                data.ExitGantryName = Convert.ToString(dr["ExitGantryName"]);

            if (dr["GantryDistance"] != DBNull.Value)
                data.GantryDistance = Convert.ToDecimal(dr["GantryDistance"]);

            if (dr["CreatedDate"] != DBNull.Value)
                data.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                data.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                data.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                data.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["DataStatus"] != DBNull.Value)
            {
                data.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (data.DataStatus != 1)
                    data.DataStatusName = "Inactive";
            }
            return data;
        }
        #endregion
    }
}
