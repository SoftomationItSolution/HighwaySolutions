using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class PlazaMappingDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_PlazaMapping";
        #endregion
        internal static List<ResponceIL> InsertUpdate(PlazaMappingIL plaza)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_PlazaMappingInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryPlazaId", DbType.Int32, plaza.EntryPlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ExitPlazaId", DbType.Int32, plaza.ExitPlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaDistance", DbType.Decimal, plaza.PlazaDistance, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, plaza.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, plaza.CreatedBy, ParameterDirection.Input));
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

        internal static List<ResponceIL> ValidateInsertUpdate(PlazaMappingIL plaza)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_PlazaMappingValidateInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryPlazaId", DbType.Int32, plaza.EntryPlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ExitPlazaId", DbType.Int32, plaza.ExitPlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaDistance", DbType.Decimal, plaza.PlazaDistance, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, plaza.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, plaza.CreatedBy, ParameterDirection.Input));
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
        internal static List<PlazaMappingIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<PlazaMappingIL> plazas = new List<PlazaMappingIL>();
            try
            {
                string spName = "USP_PlazaMappingGetAll";
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

        internal static List<PlazaMappingIL> GetByPlazaId(Int32 PlazId)
        {
            DataTable dt = new DataTable();
            List<PlazaMappingIL> plazas = new List<PlazaMappingIL>();
            try
            {
                string spName = "USP_PlazaMappingGetbyPlazaId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazId", DbType.Int32, PlazId, ParameterDirection.Input));
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
        private static PlazaMappingIL CreateObjectFromDataRow(DataRow dr)
        {
            PlazaMappingIL plaza = new PlazaMappingIL();

            if (dr["EntryId"] != DBNull.Value)
                plaza.EntryId = Convert.ToInt32(dr["EntryId"]);

            if (dr["EntryPlazaId"] != DBNull.Value)
                plaza.EntryPlazaId = Convert.ToInt16(dr["EntryPlazaId"]);

            if (dr["EntryPlazaName"] != DBNull.Value)
                plaza.EntryPlazaName = Convert.ToString(dr["EntryPlazaName"]);

            if (dr["ExitPlazaId"] != DBNull.Value)
                plaza.ExitPlazaId = Convert.ToInt16(dr["ExitPlazaId"]);

            if (dr["ExitPlazaName"] != DBNull.Value)
                plaza.ExitPlazaName = Convert.ToString(dr["ExitPlazaName"]);

            if (dr["PlazaDistance"] != DBNull.Value)
                plaza.PlazaDistance = Convert.ToDecimal(dr["PlazaDistance"]);

            if (dr["CreatedDate"] != DBNull.Value)
                plaza.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                plaza.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                plaza.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                plaza.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["DataStatus"] != DBNull.Value)
            {
                plaza.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (plaza.DataStatus != 1)
                    plaza.DataStatusName = "Inactive";
            }
            return plaza;
        }
        #endregion
    }
}
