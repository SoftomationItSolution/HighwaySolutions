using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using System.Linq;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class SystemVehicleClassDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_SystemVehicleClass";
        #endregion

        internal static List<ResponseIL> InsertUpdate(SystemVehicleClassIL data)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_SystemVehicleClassInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SystemVehicleClassId", DbType.Int64, data.SystemVehicleClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SystemVehicleClassName", DbType.String, data.SystemVehicleClassName, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SystemVehicleClassDescription", DbType.String, data.SystemVehicleClassDescription, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PermissibleWeight", DbType.Decimal, data.PermissibleWeight, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SystemSubClassIds", DbType.String, data.SystemSubClassIds, ParameterDirection.Input, 4000));
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
        internal static List<SystemVehicleClassIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<SystemVehicleClassIL> crs = new List<SystemVehicleClassIL>();
            try
            {
                string spName = "USP_SystemVehicleClassGetAll";
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
        internal static List<SystemVehicleClassIL> GetActive()
        {
            List<SystemVehicleClassIL> crlist = new List<SystemVehicleClassIL>();
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
        internal static SystemVehicleClassIL GetById(short SystemVehicleClassId)
        {
            DataTable dt = new DataTable();
            SystemVehicleClassIL crData = new SystemVehicleClassIL();
            try
            {
                string spName = "USP_SystemVehicleClassGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SystemVehicleClassId", DbType.Int16, SystemVehicleClassId, ParameterDirection.Input));
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
        #endregion

        #region Helper Methods
        private static SystemVehicleClassIL CreateObjectFromDataRow(DataRow dr)
        {
            SystemVehicleClassIL user = new SystemVehicleClassIL();

            if (dr["SystemVehicleClassId"] != DBNull.Value)
                user.SystemVehicleClassId = Convert.ToInt16(dr["SystemVehicleClassId"]);

            if (dr["SystemVehicleClassName"] != DBNull.Value)
                user.SystemVehicleClassName = Convert.ToString(dr["SystemVehicleClassName"]);

            if (dr["SystemVehicleClassDescription"] != DBNull.Value)
                user.SystemVehicleClassDescription = Convert.ToString(dr["SystemVehicleClassDescription"]);

            if (dr["SystemSubClassIds"] != DBNull.Value)
                user.SystemSubClassIds = Convert.ToString(dr["SystemSubClassIds"]);

            if (dr["SystemVehicleClassName"] != DBNull.Value)
                user.SystemVehicleClassName = Convert.ToString(dr["SystemVehicleClassName"]);

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

            user.SystemSubClassIdList = user.SystemSubClassIds?.Split(',')?.Select(Int16.Parse)?.ToArray();
            user.SystemSubClassList = FasTagVehicleClassDL.GetByIds(user.SystemSubClassIds);
            user.SystemSubClassNames = string.Join(",", user.SystemSubClassList.Select(s => s.FasTagVehicleClassName));
            user.DataStatusName = Enum.GetName(typeof(CommonLibrary.Constants.DataStatusType), (CommonLibrary.Constants.DataStatusType)user.DataStatus);
            return user;
        }
        #endregion
    }
}
