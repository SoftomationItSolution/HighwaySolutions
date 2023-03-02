using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;


namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class GantryManagementDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_GantryConfiguration";
        #endregion
        internal GantryManagementDL()
        {
        }
        #region Insert Update
        internal static List<ResponceIL> InsertUpdate(GantryManagementIL gantry)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_GantryInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, gantry.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ControlRoomId", DbType.Int16, gantry.ControlRoomId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@GantryName", DbType.String, gantry.GantryName, ParameterDirection.Input,50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Latitude", DbType.String, gantry.Latitude, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Longitude", DbType.String, gantry.Longitude, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, gantry.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, gantry.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, gantry.ModifiedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }
        #endregion

        #region Get Method
        internal static List<GantryManagementIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<GantryManagementIL> gantries = new List<GantryManagementIL>();
            try
            {
                string spName = "USP_GantryGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    gantries.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return gantries;
        }
        internal static List<GantryManagementIL> GetAllActive()
        {
            DataTable dt = new DataTable();
            List<GantryManagementIL> gantries = new List<GantryManagementIL>();
            try
            {
                string spName = "USP_GantryGetAllActive";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    gantries.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return gantries;
        }
        internal static GantryManagementIL GetById(int EntryId)
        {
            DataTable dt = new DataTable();
            GantryManagementIL gantry = new GantryManagementIL();
            try
            {
                string spName = "USP_GantryGetbyId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, EntryId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    gantry = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return gantry;
        }
        #endregion

        #region Helper Methods
        private static GantryManagementIL CreateObjectFromDataRow(DataRow dr)
        {
            GantryManagementIL data = new GantryManagementIL();
            if (dr["EntryId"] != DBNull.Value)
                data.EntryId = Convert.ToInt32(dr["EntryId"]);

            if (dr["ControlRoomId"] != DBNull.Value)
                data.ControlRoomId = Convert.ToInt16(dr["ControlRoomId"]);

            if (dr["ControlRoomName"] != DBNull.Value)
                data.ControlRoomName = Convert.ToString(dr["ControlRoomName"]);

            if (dr["GantryName"] != DBNull.Value)
                data.GantryName = Convert.ToString(dr["GantryName"]);

            if (dr["Latitude"] != DBNull.Value)
                data.Latitude = Convert.ToString(dr["Latitude"]);

            if (dr["Longitude"] != DBNull.Value)
                data.Longitude = Convert.ToString(dr["Longitude"]);

            if (dr["CreatedBy"] != DBNull.Value)
                data.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["CreatedDate"] != DBNull.Value)
                data.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                data.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                data.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

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
