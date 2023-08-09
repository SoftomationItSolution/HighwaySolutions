using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class ShiftLaneDetailsDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_ShfitDetails";
        #endregion
        internal static void ShfitLaneDetailsInsert(ShiftLaneDetailsIL shift)
        {
            try
            {
                string spName = "USP_ShfitLaneDetailsInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShfitDetailId", DbType.Int64, shift.ShfitDetailId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneNumber", DbType.Int16, shift.LaneNumber, ParameterDirection.Input));
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        internal static void ShfitLaneDetailsClose(ShiftLaneDetailsIL shift)
        {
            try
            {
                string spName = "USP_ShfitLaneDetailsClose";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShfitDetailId", DbType.Int64, shift.ShfitDetailId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneNumber", DbType.Int16, shift.LaneNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LastTransId", DbType.Int64, shift.LastTransId, ParameterDirection.Input));
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        internal static ShiftLaneDetailsIL GetAllByStatus(ShiftLaneDetailsIL shift)
        {
            DataTable dt = new DataTable();
            ShiftLaneDetailsIL shiftsDetails = new ShiftLaneDetailsIL();
            try
            {
                string spName = "USP_ShfitLaneDetailsGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShfitDetailId", DbType.Int64, shift.ShfitDetailId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneNumber", DbType.Int16, shift.LaneNumber, ParameterDirection.Input));
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


        private static ShiftLaneDetailsIL CreateObjectFromDataRow(DataRow dr)
        {
            ShiftLaneDetailsIL cashFlow = new ShiftLaneDetailsIL();

            if (dr["ShfitDetailId"] != DBNull.Value)
                cashFlow.ShfitDetailId = Convert.ToInt64(dr["ShfitDetailId"]);

            if (dr["LaneNumber"] != DBNull.Value)
                cashFlow.LaneNumber = Convert.ToInt16(dr["LaneNumber"]);
            
            if (dr["LastTransId"] != DBNull.Value)
                cashFlow.LastTransId = Convert.ToInt64(dr["LastTransId"]);


            return cashFlow;
        }
    }
}
