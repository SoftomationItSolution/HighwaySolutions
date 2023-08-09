using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;
namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class ShiftManagementDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_ShiftTimining";
        #endregion

        internal static List<ResponceIL> PInsertUpdate(ShiftManagementIL shift)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_ShiftInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, shift.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@StartTimmng", DbType.String, shift.StartTimmng, ParameterDirection.Input, 10));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EndTimming", DbType.String, shift.EndTimming, ParameterDirection.Input, 10));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, shift.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, shift.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, shift.CreatedDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, shift.ModifiedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, shift.ModifiedDate, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }
        internal static void MarkedDeleted()
        {
            try
            {
                string spName = "USP_ShiftTiminingMarkedDeleted";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        internal static void DeletedData()
        {
            try
            {
                string spName = "USP_ShiftTiminingDeletedData";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #region Get Methods
        internal static List<ShiftManagementIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<ShiftManagementIL> shifts = new List<ShiftManagementIL>();
            try
            {
                string spName = "USP_ShiftGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    shifts.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return shifts;

        }

        internal static ShiftManagementIL GetById(Int32 clientId)
        {
            DataTable dt = new DataTable();
            ShiftManagementIL shift = new ShiftManagementIL();
            try
            {
                string spName = "USP_ShiftGetbyId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, clientId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    shift = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return shift;
        }
        #endregion

        #region Helper Methods
        private static ShiftManagementIL CreateObjectFromDataRow(DataRow dr)
        {
            ShiftManagementIL shift = new ShiftManagementIL();

            if (dr["EntryId"] != DBNull.Value)
                shift.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["StartTimmng"] != DBNull.Value)
                shift.StartTimmng = Convert.ToString(dr["StartTimmng"]);

            if (dr["EndTimming"] != DBNull.Value)
                shift.EndTimming = Convert.ToString(dr["EndTimming"]);
           
            if (dr["DataStatus"] != DBNull.Value)
            {
                shift.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (shift.DataStatus != 1)
                    shift.DataStatusName = "Inactive";
            }


            if (dr["CreatedDate"] != DBNull.Value)
                shift.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                shift.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                shift.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                shift.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            return shift;
        }
        #endregion
    }
}
