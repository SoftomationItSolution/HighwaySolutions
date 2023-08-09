using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class VehicleClassificationDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_VehicleClass";
        #endregion
        internal static List<ResponceIL> InsertUpdate(VehicleClassificationIL vehicleClass)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_VehicleClassInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int16, vehicleClass.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClassName", DbType.String, vehicleClass.ClassName, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClassDescription", DbType.String, vehicleClass.ClassDescription, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehicleSpeed", DbType.Int16, vehicleClass.VehicleSpeed, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, vehicleClass.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, vehicleClass.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, vehicleClass.CreatedDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, vehicleClass.ModifiedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, vehicleClass.ModifiedDate, ParameterDirection.Input));
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
        internal static List<VehicleClassificationIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<VehicleClassificationIL> vehicleClasses = new List<VehicleClassificationIL>();
            try
            {
                string spName = "USP_VehicleClassGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    vehicleClasses.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return vehicleClasses;

        }
        internal static List<VehicleClassificationIL> GetActive()
        {
            DataTable dt = new DataTable();
            List<VehicleClassificationIL> vehicleClasses = new List<VehicleClassificationIL>();
            try
            {
                string spName = "USP_VehicleClassGetActive";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    vehicleClasses.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return vehicleClasses;

        }
        internal static VehicleClassificationIL GetById(Int16 EntryId)
        {
            DataTable dt = new DataTable();
            VehicleClassificationIL vehicleClasses = new VehicleClassificationIL();
            try
            {
                string spName = "USP_VehicleClassGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, EntryId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    vehicleClasses = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return vehicleClasses;
        }
        #endregion

        #region Helper Methods
        private static VehicleClassificationIL CreateObjectFromDataRow(DataRow dr)
        {
            VehicleClassificationIL vc = new VehicleClassificationIL();

            if (dr["EntryId"] != DBNull.Value)
                vc.EntryId = Convert.ToInt16(dr["EntryId"]);

            if (dr["ClassName"] != DBNull.Value)
                vc.ClassName = Convert.ToString(dr["ClassName"]);

            if (dr["ClassDescription"] != DBNull.Value)
                vc.ClassDescription = Convert.ToString(dr["ClassDescription"]);

            if (dr["VehicleSpeed"] != DBNull.Value)
                vc.VehicleSpeed = Convert.ToInt16(dr["VehicleSpeed"]);

            if (dr["CreatedDate"] != DBNull.Value)
                vc.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                vc.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                vc.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                vc.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["DataStatus"] != DBNull.Value)
            {
                vc.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (vc.DataStatus != 1)
                    vc.DataStatusName = "Inactive";
            }
            return vc;
        }
        #endregion
    }
}
