using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.NMSSystemLibrary.IL;
using HighwaySoluations.Softomation.NMSSystemLibrary.DBA;

namespace HighwaySoluations.Softomation.NMSSystemLibrary.DL
{
    internal class IMCPStatusDL
    {
        #region Global Varialble
        static string tableName = "tbl_EquipmentStatus";
        #endregion

        internal static List<ResponseIL> Insert(IMCPStatusIL dataEvent)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_EquipmentStatusInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentId", DbType.Int64, dataEvent.EquipmentId, ParameterDirection.Input)); 
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IpAddress", DbType.String, dataEvent.IpAddress, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@StatusId", DbType.Int16, dataEvent.StatusId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Latency", DbType.Int64, dataEvent.Latency, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@OnLineStatus", DbType.Boolean, dataEvent.OnLineStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime2, dataEvent.CreatedDate, ParameterDirection.Input));
                DataTable dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responses = ResponseIL.ConvertResponseList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
        }
    }
}
