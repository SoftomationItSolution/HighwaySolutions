using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class LaneAccessPermissionDL
    {
        #region Global Varialble
        static DataTable dt;
        static DataSet ds;
        static string tableName = "tbl_LaneAccessPermission";
        #endregion

        internal static void Insert(LaneAccessPermissionIL events)
        {
            try
            {
                string spName = "USP_LaneAccessPermissionInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneNumber", DbType.Int16, events.LaneNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PermissionType", DbType.Int16, events.PermissionType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ExemptTypeId", DbType.Int16, events.ExemptTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@OperatorId", DbType.Int64, events.OperatorId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AccessType", DbType.Int16, events.AccessType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, events.CreatedDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int64, events.CreatedBy, ParameterDirection.Input));
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        internal static void Update(LaneAccessPermissionIL events)
        {
            try
            {
                string spName = "USP_LaneAccessPermissionUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int64, events.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, events.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, events.ModifiedDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int64, events.ModifiedBy, ParameterDirection.Input));
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        internal static void MarkasTransfer(LaneAccessPermissionIL events)
        {
            try
            {
                string spName = "USP_LaneAccessPermissionTransfer";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int64, events.EntryId, ParameterDirection.Input));
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #region Get Methods
        internal static List<LaneAccessPermissionIL> GetRequestPending()
        {
            DataTable dt = new DataTable();
            List<LaneAccessPermissionIL> permissions = new List<LaneAccessPermissionIL>();
            try
            {
                string spName = "USP_LaneAccessPermissionGetAllPending";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    permissions.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return permissions;

        }

        internal static List<LaneAccessPermissionIL> GetTransferPending()
        {
            DataTable dt = new DataTable();
            List<LaneAccessPermissionIL> permissions = new List<LaneAccessPermissionIL>();
            try
            {
                string spName = "USP_LaneAccessPermissionGetAllTransferPending";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    permissions.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return permissions;

        }

        #endregion

        #region Helper Methods
        private static LaneAccessPermissionIL CreateObjectFromDataRow(DataRow dr)
        {
            LaneAccessPermissionIL permission = new LaneAccessPermissionIL();

            if (dr["EntryId"] != DBNull.Value)
                permission.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["LaneNumber"] != DBNull.Value)
                permission.LaneNumber = Convert.ToInt16(dr["LaneNumber"]);

            if (dr["PermissionType"] != DBNull.Value)
                permission.PermissionType = Convert.ToInt16(dr["PermissionType"]);

            if (dr["ExemptTypeId"] != DBNull.Value)
                permission.ExemptTypeId = Convert.ToInt16(dr["ExemptTypeId"]);

            if (dr["ExemptTypeName"] != DBNull.Value)
                permission.ExemptTypeName = Convert.ToString(dr["ExemptTypeName"]);

            if (dr["AccessType"] != DBNull.Value)
            {
                permission.AccessType = Convert.ToInt16(dr["AccessType"]);
                if (permission.AccessType == 1)
                    permission.AccessTypeName = "Login";
                else if (permission.AccessType == 2)
                    permission.AccessTypeName = "Logout";
                else
                    permission.AccessTypeName = "Unknown";
            }

            if (dr["LoginId"] != DBNull.Value)
                permission.OperatorName = Convert.ToString(dr["LoginId"]);

            if (dr["OperatorId"] != DBNull.Value)
                permission.OperatorId = Convert.ToInt64(dr["OperatorId"]);

            if (dr["DataStatus"] != DBNull.Value)
            {
                permission.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (permission.DataStatus == 1)
                    permission.DataStatusName = "Approved";
                else if (permission.DataStatus == 0)
                    permission.DataStatusName = "Rejected";
                else
                    permission.DataStatusName = "Pending";
            }

            if (dr["CreatedDate"] != DBNull.Value)
                permission.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                permission.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                permission.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                permission.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            return permission;
        }
        #endregion
    }
}
