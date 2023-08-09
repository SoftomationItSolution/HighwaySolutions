using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class ATCCEventsDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_ATCCEventsDetails";
        #endregion

        internal static List<ResponceIL> InsertUpdate(ATCCEventsIL atccEvent)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_ATCCEventsInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EventDateTime", DbType.DateTime, atccEvent.EventDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ATCCId", DbType.Int64, atccEvent.ATCCId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehicleClassId", DbType.Int16, atccEvent.VehicleClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AxleCount", DbType.Int16, atccEvent.AxleCount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@GrossWeight", DbType.Decimal, atccEvent.GrossWeight, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehicleImage", DbType.String, atccEvent.VehicleImage, ParameterDirection.Input, 255));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }

        internal static List<ATCCEventsIL> GetLatest()
        {
            DataTable dt = new DataTable();
            List<ATCCEventsIL> metEvents = new List<ATCCEventsIL>();
            try
            {
                string spName = "USP_ATCCEventGetLatest";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    metEvents.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return metEvents;
        }

        #region Helper Methods
        private static ATCCEventsIL CreateObjectFromDataRow(DataRow dr)
        {
            ATCCEventsIL data = new ATCCEventsIL();
            if (dr["EntryId"] != DBNull.Value)
                data.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["EventDateTime"] != DBNull.Value)
                data.EventDateTime = Convert.ToDateTime(dr["EventDateTime"]);

            if (dr["ATCCId"] != DBNull.Value)
                data.ATCCId = Convert.ToInt64(dr["ATCCId"]);

            if (dr["DeviceName"] != DBNull.Value)
                data.DeviceName = Convert.ToString(dr["DeviceName"]);

            if (dr["ControlRoomName"] != DBNull.Value)
                data.ControlRoomName = Convert.ToString(dr["ControlRoomName"]);

            if (dr["VehicleClassId"] != DBNull.Value)
                data.VehicleClassId = Convert.ToInt16(dr["VehicleClassId"]);

            if (dr["ClassName"] != DBNull.Value)
                data.VehicleClassName = Convert.ToString(dr["ClassName"]);

            if (dr["AxleCount"] != DBNull.Value)
                data.AxleCount = Convert.ToInt16(dr["AxleCount"]);

            if (dr["GrossWeight"] != DBNull.Value)
                data.GrossWeight = Convert.ToDecimal(dr["GrossWeight"]);

            if (dr["VehicleImage"] != DBNull.Value)
                data.VehicleImage = Convert.ToString(dr["VehicleImage"]);

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
