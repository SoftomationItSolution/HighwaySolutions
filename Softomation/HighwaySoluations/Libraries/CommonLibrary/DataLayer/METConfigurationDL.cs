using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class METConfigurationDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_METConfiguration";
        #endregion

        internal static List<ResponceIL> InsertUpdate(METConfigurationIL metEvent)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_METConfigurationInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AirTemperatureMin", DbType.Decimal, metEvent.AirTemperatureMin, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AirTemperatureMax", DbType.Decimal, metEvent.AirTemperatureMax, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@HumidityRH", DbType.Decimal, metEvent.HumidityRH, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@HumidityAH", DbType.Decimal, metEvent.HumidityAH, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Visibility", DbType.Decimal, metEvent.Visibility, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RoadTemperature", DbType.Decimal, metEvent.RoadTemperature, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@WindDirectionValue", DbType.Decimal, metEvent.WindDirectionValue, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@WindSpeedValue", DbType.Decimal, metEvent.WindSpeedValue, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RainValue", DbType.Decimal, metEvent.RainValue, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SynchronizeTime", DbType.Int16, metEvent.SynchronizeTime, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }

        internal static METConfigurationIL GetConfiguration()
        {
            DataTable dt = new DataTable();
            METConfigurationIL metConfig = new METConfigurationIL();
            try
            {
                string spName = "USP_METConfigurationGet";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    metConfig = (CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return metConfig;
        }

        #region Helper Methods
        private static METConfigurationIL CreateObjectFromDataRow(DataRow dr)
        {
            METConfigurationIL data = new METConfigurationIL();

            if (dr["EntryId"] != DBNull.Value)
                data.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["AirTemperatureMin"] != DBNull.Value)
                data.AirTemperatureMin = Convert.ToDecimal(dr["AirTemperatureMin"]);

            if (dr["AirTemperatureMax"] != DBNull.Value)
                data.AirTemperatureMax = Convert.ToDecimal(dr["AirTemperatureMax"]);

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

            if (dr["WindSpeedValue"] != DBNull.Value)
                data.WindSpeedValue = Convert.ToDecimal(dr["WindSpeedValue"]);

            if (dr["RainValue"] != DBNull.Value)
                data.RainValue = Convert.ToDecimal(dr["RainValue"]);
            
            if (dr["SynchronizeTime"] != DBNull.Value)
                data.SynchronizeTime = Convert.ToInt16(dr["SynchronizeTime"]);

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
