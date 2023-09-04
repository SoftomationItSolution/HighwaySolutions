using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class ShiftTiminingDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_ShiftTimining";
        #endregion
        internal static List<ShiftTiminingIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<ShiftTiminingIL> shifts = new List<ShiftTiminingIL>();
            try
            {
                string spName = "USP_ShiftTiminingGetAll";
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

        internal static ShiftTiminingIL GetById(Int16 ShiftId)
        {
            DataTable dt = new DataTable();
            ShiftTiminingIL shifts = new ShiftTiminingIL();
            try
            {
                string spName = "USP_ShiftTiminingGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftId", DbType.Int16, ShiftId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    shifts=CreateObjectFromDataRow(dr);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return shifts;
        }

        internal static List<ShiftTiminingIL> GetActive()
        {
            DataTable dt = new DataTable();
            List<ShiftTiminingIL> shiftsList = new List<ShiftTiminingIL>();
            try
            {
                shiftsList = GetAll();
                return shiftsList.FindAll(n => n.DataStatus == (short)CommonLibrary.Constants.DataStatusType.Active);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        internal static ShiftTiminingIL GetByDateTime(DateTime ShiftDateTime)
        {
            DataTable dt = new DataTable();
            ShiftTiminingIL shifts = new ShiftTiminingIL();
            try
            {
                string spName = "USP_ShiftGetByDateTime";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftDateTime", DbType.DateTime, ShiftDateTime, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    shifts = CreateObjectFromDataRow(dr);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return shifts;
        }
        #region Helper Methods
        private static ShiftTiminingIL CreateObjectFromDataRow(DataRow dr)
        {
            ShiftTiminingIL shift = new ShiftTiminingIL();

            if (dr["ShiftId"] != DBNull.Value)
            {
                shift.ShiftId = Convert.ToInt16(dr["ShiftId"]);
                shift.ShiftNumber = "Shift-" + Convert.ToString(dr["ShiftId"]);
            }

            if (dr["StartTimmng"] != DBNull.Value)
                shift.StartTimmng = Convert.ToString(dr["StartTimmng"]);

            if (dr["EndTimming"] != DBNull.Value)
                shift.EndTimming = Convert.ToString(dr["EndTimming"]);

            if (dr["CreatedDate"] != DBNull.Value)
                shift.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                shift.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                shift.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                shift.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["DataStatus"] != DBNull.Value)
                shift.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            shift.DataStatusName = Enum.GetName(typeof(CommonLibrary.Constants.DataStatusType), (CommonLibrary.Constants.DataStatusType)shift.DataStatus);
            return shift;
        }
        #endregion
    }
}
