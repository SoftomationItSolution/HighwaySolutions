using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class ShiftStatusDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_ShiftStatusDetail";
        #endregion

        internal static List<ShiftStatusIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<ShiftStatusIL> shifts = new List<ShiftStatusIL>();
            try
            {
                string spName = "USP_ShiftStatusGetAll";
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
        internal static List<ShiftStatusIL> GetClose()
        {
            DataTable dt = new DataTable();
            List<ShiftStatusIL> shifts = new List<ShiftStatusIL>();
            try
            {
                string spName = "USP_ShiftStatusGetClose";
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
        internal static List<ShiftStatusIL> GetOpen()
        {
            DataTable dt = new DataTable();
            List<ShiftStatusIL> shifts = new List<ShiftStatusIL>();
            try
            {
                string spName = "USP_ShiftStatusGetOpen";
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
       
        #region Helper Methods
        private static ShiftStatusIL CreateObjectFromDataRow(DataRow dr)
        {
            ShiftStatusIL shift = new ShiftStatusIL();
            if (dr["ShiftStatusId"] != DBNull.Value)
                shift.ShiftStatusId = Convert.ToInt16(dr["ShiftStatusId"]);

            if (dr["PlazaId"] != DBNull.Value)
                shift.PlazaId = Convert.ToInt16(dr["PlazaId"]);

            if (dr["PlazaName"] != DBNull.Value)
                shift.PlazaName = Convert.ToString(dr["PlazaName"]);

            if (dr["ShiftId"] != DBNull.Value)
            {
                shift.ShiftId = Convert.ToInt16(dr["ShiftId"]);
                shift.ShiftNumber = "Shift-" + Convert.ToString(dr["ShiftId"]);
            }

            if (dr["StartTimmng"] != DBNull.Value)
                shift.StartTimmng = Convert.ToString(dr["StartTimmng"]);

            if (dr["EndTimming"] != DBNull.Value)
                shift.EndTimming = Convert.ToString(dr["EndTimming"]);

            if (dr["ShiftDate"] != DBNull.Value)
            {
                shift.ShiftDate = Convert.ToDateTime(dr["ShiftDate"]);
                shift.ShiftDateStamp = shift.ShiftDate.ToString(CommonLibrary.Constants.DateFormat);
            }

            if (dr["ShiftStatus"] != DBNull.Value)
                shift.ShiftStatus = Convert.ToBoolean(dr["ShiftStatus"]);

            if (dr["LaneTransactionCount"] != DBNull.Value)
                shift.LaneTransactionCount = Convert.ToInt64(dr["LaneTransactionCount"]);

            if (dr["FloatDeclare"] != DBNull.Value)
                shift.FloatDeclare = Convert.ToDecimal(dr["FloatDeclare"]);

            if (dr["MidDeclare"] != DBNull.Value)
                shift.MidDeclare = Convert.ToDecimal(dr["MidDeclare"]);

            if (dr["EndDeclare"] != DBNull.Value)
                shift.EndDeclare = Convert.ToDecimal(dr["EndDeclare"]);

            if (dr["SystemDeclare"] != DBNull.Value)
                shift.SystemDeclare = Convert.ToDecimal(dr["SystemDeclare"]);

            if (dr["DifferenceAmount"] != DBNull.Value)
                shift.DifferenceAmount = Convert.ToDecimal(dr["DifferenceAmount"]);

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
