using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using Softomation.ATMSSystemLibrary.DBA;
using Softomation.ATMSSystemLibrary.IL;
namespace Softomation.ATMSSystemLibrary.DL
{
    internal class ControlRoomDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_ControlRoomMaster";
        #endregion

        internal static List<ResponseIL> InsertUpdate(ControlRoomIL role)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_ControlRoomInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ControlRoomId", DbType.Int32, role.ControlRoomId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ControlRoomName", DbType.String, role.ControlRoomName.Trim(), ParameterDirection.Input, 200));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, role.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, role.CreatedBy, ParameterDirection.Input));
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
        internal static List<ControlRoomIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<ControlRoomIL> crs = new List<ControlRoomIL>();
            try
            {
                string spName = "USP_ControlRoomGetAll";
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
        internal static List<ControlRoomIL> GetActive()
        {
            List<ControlRoomIL> crlist = new List<ControlRoomIL>();
            try
            {
                crlist = GetAll();
                return crlist.FindAll(n => n.DataStatus == (short)Constants.DataStatus.Active);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        internal static ControlRoomIL GetById(Int32 ControlRoomId)
        {
            DataTable dt = new DataTable();
            ControlRoomIL crData = new ControlRoomIL();
            try
            {
                string spName = "USP_ControlRoomGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ControlRoomId", DbType.Int32, ControlRoomId, ParameterDirection.Input));
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
        private static ControlRoomIL CreateObjectFromDataRow(DataRow dr)
        {
            ControlRoomIL cr = new ControlRoomIL();

            if (dr["ControlRoomId"] != DBNull.Value)
                cr.ControlRoomId = Convert.ToInt64(dr["ControlRoomId"]);

            if (dr["ControlRoomName"] != DBNull.Value)
                cr.ControlRoomName = Convert.ToString(dr["ControlRoomName"]);

            if (dr["DataStatus"] != DBNull.Value)
                cr.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            if (dr["CreatedDate"] != DBNull.Value)
                cr.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                cr.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                cr.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                cr.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            cr.DataStatusName = Enum.GetName(typeof(Constants.DataStatus), (Constants.DataStatus)cr.DataStatus);

            return cr;
        }
        #endregion
    }
}
