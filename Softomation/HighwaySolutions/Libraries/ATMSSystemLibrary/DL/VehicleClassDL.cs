using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.CommonLibrary.IL;
namespace HighwaySoluations.Softomation.ATMSSystemLibrary.DL
{
    internal class VehicleClassDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_VehicleClass";
        #endregion

        internal static List<ResponseIL> InsertUpdate(VehicleClassIL data)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_VehicleClassInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClassId", DbType.Int64, data.ClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehicleClassId", DbType.Int64, data.VehicleClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehicleClassName", DbType.String, data.VehicleClassName, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AllowedSpeed", DbType.Decimal, data.AllowedSpeed, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, data.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, data.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CDateTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
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
        internal static List<VehicleClassIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<VehicleClassIL> crs = new List<VehicleClassIL>();
            try
            {
                string spName = "USP_VehicleClassGetAll";
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
        internal static List<VehicleClassIL> GetActive()
        {
            List<VehicleClassIL> crlist = new List<VehicleClassIL>();
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
        internal static VehicleClassIL GetById(Int32 ClassId)
        {
            DataTable dt = new DataTable();
            VehicleClassIL crData = new VehicleClassIL();
            try
            {
                string spName = "USP_VehicleClassGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClassId", DbType.Int32, ClassId, ParameterDirection.Input));
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

        internal static List<VehicleClassIL> GetByIds(String AllowedClassIds)
        {
            DataTable dt = new DataTable();
            List<VehicleClassIL> smData = new List<VehicleClassIL>();
            try
            {
                string spName = "USP_VehicleClassGetByIds";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClassIds", DbType.String, AllowedClassIds, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    smData.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return smData;
        }
        #endregion

        #region Helper Methods
        private static VehicleClassIL CreateObjectFromDataRow(DataRow dr)
        {
            VehicleClassIL user = new VehicleClassIL();

            if (dr["ClassId"] != DBNull.Value)
                user.ClassId = Convert.ToInt16(dr["ClassId"]);

            if (dr["VehicleClassId"] != DBNull.Value)
                user.VehicleClassId = Convert.ToInt16(dr["VehicleClassId"]);

            if (dr["VehicleClassName"] != DBNull.Value)
                user.VehicleClassName = Convert.ToString(dr["VehicleClassName"]);

            if (dr["VehicleClassIcon"] != DBNull.Value)
                user.VehicleClassIcon = Convert.ToString(dr["VehicleClassIcon"]);

            if (dr["AllowedSpeed"] != DBNull.Value)
                user.AllowedSpeed = Convert.ToDecimal(dr["AllowedSpeed"]);

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

            user.DataStatusName = Enum.GetName(typeof(SystemConstants.DataStatusType), (SystemConstants.DataStatusType)user.DataStatus);
            return user;
        }

        
        #endregion
    }
}
