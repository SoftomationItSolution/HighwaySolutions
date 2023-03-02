using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class ShiftDetailsDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_ShfitDetails";
        #endregion

        internal static List<ResponceIL> ShiftClose(ShiftDetailsIL shift)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_ShiftClose";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, shift.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftDate", DbType.Date, shift.ShiftDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftId", DbType.Int16, shift.ShiftId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int32, shift.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, shift.CreatedBy, ParameterDirection.Input));
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
        internal static List<ShiftDetailsIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<ShiftDetailsIL> shiftsDetails = new List<ShiftDetailsIL>();
            try
            {
                string spName = "USP_ShfitDetailsGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    shiftsDetails.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return shiftsDetails;

        }
        internal static List<ShiftDetailsIL> GetAllByStatus(Int16 Status)
        {
            DataTable dt = new DataTable();
            List<ShiftDetailsIL> shiftsDetails = new List<ShiftDetailsIL>();
            try
            {
                string spName = "USP_ShfitDetailsGetByStatus";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftStatus", DbType.Int16, Status, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    shiftsDetails.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return shiftsDetails;

        }

        internal static ShiftDetailsIL GetAllByShiftId(ShiftDetailsIL shift)
        {
            ShiftDetailsIL shiftsDetails = new ShiftDetailsIL();
            try
            {
                string spName = "USP_ShfitDetailsGetByShiftId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftId", DbType.Int16, shift.ShiftId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftDate", DbType.Date, shift.ShiftDate, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    shiftsDetails = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return shiftsDetails;

        }
        #endregion

        #region Helper Methods
        private static ShiftDetailsIL CreateObjectFromDataRow(DataRow dr)
        {
            ShiftDetailsIL cashFlow = new ShiftDetailsIL();

            if (dr["EntryId"] != DBNull.Value)
                cashFlow.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["ShiftId"] != DBNull.Value)
                cashFlow.ShiftId = Convert.ToInt16(dr["ShiftId"]);

            if (dr["ShiftDate"] != DBNull.Value)
                cashFlow.ShiftDate = Convert.ToDateTime(dr["ShiftDate"]);

            if (dr["StartTimmng"] != DBNull.Value)
                cashFlow.StartTimmng = Convert.ToString(dr["StartTimmng"]);

            if (dr["EndTimming"] != DBNull.Value)
                cashFlow.EndTimming = Convert.ToString(dr["EndTimming"]);

            if (dr["CreatedByLoginId"] != DBNull.Value)
                cashFlow.CreatedByLoginId = Convert.ToString(dr["CreatedByLoginId"]);

            if (dr["ModifiedByLoginId"] != DBNull.Value)
                cashFlow.ModifiedByLoginId = Convert.ToString(dr["ModifiedByLoginId"]);


            if (dr["ShiftStatus"] != DBNull.Value)
            {
                cashFlow.ShiftStatus = Convert.ToInt16(dr["ShiftStatus"]);
                if (cashFlow.ShiftStatus == 2)
                    cashFlow.ShiftStatusName = "Pedning";
                else if (cashFlow.ShiftStatus == 0)
                    cashFlow.ShiftStatusName = "Closed";
            }
            if (dr["DataStatus"] != DBNull.Value)
            {
                cashFlow.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (cashFlow.DataStatus != 1)
                    cashFlow.DataStatusName = "Inactive";
            }


            if (dr["CreatedDate"] != DBNull.Value)
                cashFlow.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                cashFlow.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                cashFlow.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                cashFlow.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            return cashFlow;
        }
        #endregion
    }
}
