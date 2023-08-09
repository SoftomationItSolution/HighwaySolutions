using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class METEventsDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_METEventsDetails";
        #endregion

        internal static List<ResponceIL> InsertUpdate(METEventsIL metEvent)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_METEventsInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EventDateTime", DbType.DateTime, metEvent.EventDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MetId", DbType.Int64, metEvent.MetId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AirTemperature", DbType.Decimal, metEvent.AirTemperature, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@HumidityRH", DbType.Decimal, metEvent.HumidityRH, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@HumidityAH", DbType.Decimal, metEvent.HumidityAH, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Visibility", DbType.Decimal, metEvent.Visibility, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RoadTemperature", DbType.Decimal, metEvent.RoadTemperature, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@WindDirectionValue", DbType.Decimal, metEvent.WindDirectionValue, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@WindDirection", DbType.String, metEvent.WindDirection, ParameterDirection.Input,10));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@WindSpeedValue", DbType.Decimal, metEvent.WindSpeedValue, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@WindSpeedMeasurement", DbType.String, metEvent.WindSpeedMeasurement, ParameterDirection.Input, 10));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RainValue", DbType.Decimal, metEvent.RainValue, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RainMeasurement", DbType.String, metEvent.RainMeasurement, ParameterDirection.Input, 10));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AlertRequired", DbType.Int16, metEvent.AlertRequired, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }

        internal static List<METEventsIL> GetLatest()
        {
            DataTable dt = new DataTable();
            List<METEventsIL> metEvents = new List<METEventsIL>();
            try
            {
                string spName = "USP_METEventGetLatest";
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
        private static METEventsIL CreateObjectFromDataRow(DataRow dr)
        {
            METEventsIL data = new METEventsIL();
            if (dr["EntryId"] != DBNull.Value)
                data.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["EventDateTime"] != DBNull.Value)
                data.EventDateTime = Convert.ToDateTime(dr["EventDateTime"]);

            if (dr["MetId"] != DBNull.Value)
                data.MetId = Convert.ToInt64(dr["MetId"]);

            if (dr["DeviceName"] != DBNull.Value)
                data.DeviceName = Convert.ToString(dr["DeviceName"]);

            if (dr["ControlRoomName"] != DBNull.Value)
                data.ControlRoomName = Convert.ToString(dr["ControlRoomName"]);

            if (dr["AirTemperature"] != DBNull.Value)
                data.AirTemperature = Convert.ToDecimal(dr["AirTemperature"]);

            if (dr["HumidityRH"] != DBNull.Value)
                data.HumidityRH = Convert.ToDecimal(dr["HumidityRH"]);

            if (dr["HumidityAH"] != DBNull.Value)
                data.HumidityAH = Convert.ToDecimal(dr["HumidityAH"]);

            if (dr["Visibility"] != DBNull.Value)
                data.Visibility = Convert.ToDecimal(dr["Visibility"]);

            if (dr["RoadTemperature"] != DBNull.Value)
                data.RoadTemperature = Convert.ToDecimal(dr["RoadTemperature"]);

            if (dr["WindDirectionValue"] != DBNull.Value)
                data.WindDirectionValue = Convert.ToDecimal(dr["WindDirectionValue"]);

            if (dr["WindDirection"] != DBNull.Value)
                data.WindDirection = Convert.ToString(dr["WindDirection"]);

            if (dr["WindSpeedValue"] != DBNull.Value)
                data.WindSpeedValue = Convert.ToDecimal(dr["WindSpeedValue"]);

            if (dr["WindSpeedMeasurement"] != DBNull.Value)
                data.WindSpeedMeasurement = Convert.ToString(dr["WindSpeedMeasurement"]);

            if (dr["RainValue"] != DBNull.Value)
                data.RainValue = Convert.ToDecimal(dr["RainValue"]);

            if (dr["RainMeasurement"] != DBNull.Value)
                data.RainMeasurement = Convert.ToString(dr["RainMeasurement"]);

            
            if (dr["AlertRequired"] != DBNull.Value)
            {
                data.AlertRequired = Convert.ToInt16(dr["AlertRequired"]);
                if (data.AlertRequired == 1)
                    data.AlertStatus = "Generated";
                else
                    data.AlertStatus = "Not Required";
            }

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
