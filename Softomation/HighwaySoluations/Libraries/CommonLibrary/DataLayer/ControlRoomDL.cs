using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class ControlRoomDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_ControlRoomMaster";
        #endregion

        internal ControlRoomDL()
        {
        }
        #region Insert Update
        internal static List<ResponceIL> InsertUpdate(ControlRoomIL controlRoom)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_ControlRoomMasterInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, controlRoom.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ControlRoomName", DbType.String, controlRoom.ControlRoomName, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, controlRoom.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, controlRoom.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, controlRoom.ModifiedBy, ParameterDirection.Input));
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
       
        internal static List<ControlRoomIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<ControlRoomIL> controlRooms = new List<ControlRoomIL>();
            try
            {
                string spName = "USP_ControlRoomMasterGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    controlRooms.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return controlRooms;
        }
        internal static ControlRoomIL GetById(int EntryId)
        {
            DataTable dt = new DataTable();
            ControlRoomIL account = new ControlRoomIL();
            try
            {
                string spName = "USP_ControlRoomMasterGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, EntryId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    account = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return account;
        }
        internal static List<ControlRoomIL> GetByUserId(Int64 UserId)
        {
            DataTable dt = new DataTable();
            List<ControlRoomIL> controlRooms = new List<ControlRoomIL>();
            try
            {
                string spName = "USP_ControlRoomMasterGetByUserId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, UserId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    controlRooms.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return controlRooms;
        }
        #endregion

        #region Helper Methods
        private static ControlRoomIL CreateObjectFromDataRow(DataRow dr)
        {
            ControlRoomIL data = new ControlRoomIL();
            if (dr["EntryId"] != DBNull.Value)
                data.EntryId = Convert.ToInt32(dr["EntryId"]);

            if (dr["ControlRoomName"] != DBNull.Value)
                data.ControlRoomName = Convert.ToString(dr["ControlRoomName"]);
            
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
