using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class FasTagVehicleClassDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_FasTagVehicleClass";
        #endregion

        internal static List<ResponseIL> InsertUpdate(FasTagVehicleClassIL data)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_FasTagVehicleClassInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FasTagVehicleClassId", DbType.Int64, data.FasTagVehicleClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FasTagVehicleClassName", DbType.String, data.FasTagVehicleClassName, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FasTagVehicleClassDescription", DbType.String, data.FasTagVehicleClassDescription, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PermissibleWeight", DbType.Decimal, data.PermissibleWeight, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, data.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, data.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, data.ModifiedBy, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responses = ResponseIL.ConvertResponseList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
        }

        #region Get Methods
        internal static List<FasTagVehicleClassIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<FasTagVehicleClassIL> crs = new List<FasTagVehicleClassIL>();
            try
            {
                string spName = "USP_FasTagVehicleClassGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    crs.Add(CreateObjectFromDataRow(dr));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return crs;
        }
        internal static List<FasTagVehicleClassIL> GetActive()
        {
            List<FasTagVehicleClassIL> crlist = new List<FasTagVehicleClassIL>();
            try
            {
                crlist = GetAll();
                return crlist.FindAll(n => n.DataStatus == (short)SystemConstants.DataStatusType.Active);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        internal static FasTagVehicleClassIL GetById(short FasTagVehicleClassId)
        {
            DataTable dt = new DataTable();
            FasTagVehicleClassIL crData = new FasTagVehicleClassIL();
            try
            {
                string spName = "USP_FasTagVehicleClassGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FasTagVehicleClassId", DbType.Int16, FasTagVehicleClassId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    crData = CreateObjectFromDataRow(dr);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return crData;
        }

        internal static List<FasTagVehicleClassIL> GetByIds(string FasTagVehicleClassIds)
        {
            DataTable dt = new DataTable();
            List<FasTagVehicleClassIL> crs = new List<FasTagVehicleClassIL>();
            try
            {
                string spName = "USP_FasTagVehicleClassGetByIds";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FasTagVehicleClassIds", DbType.String, FasTagVehicleClassIds, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    crs.Add(CreateObjectFromDataRow(dr));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return crs;
        }
        #endregion

        #region Helper Methods
        private static FasTagVehicleClassIL CreateObjectFromDataRow(DataRow dr)
        {
            FasTagVehicleClassIL user = new FasTagVehicleClassIL();

            if (dr["FasTagVehicleClassId"] != DBNull.Value)
                user.FasTagVehicleClassId = Convert.ToInt16(dr["FasTagVehicleClassId"]);

            if (dr["FasTagVehicleClassName"] != DBNull.Value)
                user.FasTagVehicleClassName = Convert.ToString(dr["FasTagVehicleClassName"]);

            if (dr["FasTagVehicleClassDescription"] != DBNull.Value)
                user.FasTagVehicleClassDescription = Convert.ToString(dr["FasTagVehicleClassDescription"]);

            if (dr["PermissibleWeight"] != DBNull.Value)
                user.PermissibleWeight = Convert.ToDecimal(dr["PermissibleWeight"]);

            if (dr["CreatedDate"] != DBNull.Value)
                user.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                user.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                user.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                user.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["DataStatus"] != DBNull.Value)
                user.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            user.DataStatusName = Enum.GetName(typeof(CommonLibrary.Constants.DataStatusType), (CommonLibrary.Constants.DataStatusType)user.DataStatus);
            return user;
        }
        #endregion
    }
}
