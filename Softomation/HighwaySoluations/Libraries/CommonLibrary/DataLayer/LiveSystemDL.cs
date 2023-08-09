using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class LiveSystemDL
    {
        #region Global Varialble
        static DataTable dt;
        static DataSet ds;
        static string tableName = "tbl_LiveSystemStatus";
        #endregion
        internal static void SystemProcessingInsert(LiveSystemIL events)
        {
            try
            {
                string spName = "USP_LiveSystemProcessingInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneNumber", DbType.Int16, events.LaneNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftId", DbType.Int16, events.ShiftId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftDate", DbType.Date, events.ShiftDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CpuUtilization", DbType.Decimal, events.CpuUtilization, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RamUtilization", DbType.Decimal, events.RamUtilization, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@StorageAvilable", DbType.Decimal, events.StorageAvilable, ParameterDirection.Input));
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

       

        internal static void SystemTransactionInsert(LiveSystemIL events)
        {
            try
            {
                string spName = "USP_LiveSystemTransactionInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneNumber", DbType.Int16, events.LaneNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftId", DbType.Int16, events.ShiftId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftDate", DbType.Date, events.ShiftDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TCClassId", DbType.Int16, events.TCClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionTypeId", DbType.Int16, events.TransactionTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@OperatorId", DbType.Int64, events.OperatorId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@OperatorLoginTime", DbType.DateTime, events.OperatorLoginTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@OperatorCollection", DbType.Decimal, events.OperatorCollection, ParameterDirection.Input));
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        internal static void SystemAVCTransactionInsert(LiveSystemIL events)
        {
            try
            {
                string spName = "USP_LiveSystemAVCTransactionInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneNumber", DbType.Int16, events.LaneNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AVCClassId", DbType.Int16, events.AVCClassId, ParameterDirection.Input));
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        internal static DataTable GetLiveStatus()
        {
            dt = new DataTable();
            try
            {
                string spName = "USP_LiveSystemStatus";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;
        }

        internal static DataTable GetLiveStatusByLane(Int16 LaneNumber)
        {
            dt = new DataTable();
            try
            {
                string spName = "USP_LiveSystemStatusByLane";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneNumber", DbType.Int16, LaneNumber, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;
        }
    }
}
