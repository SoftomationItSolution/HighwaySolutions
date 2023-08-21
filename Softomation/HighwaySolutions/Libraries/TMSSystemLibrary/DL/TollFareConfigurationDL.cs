using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class TollFareConfigurationDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "temp_TollFareConfiguration";
        #endregion
        internal static List<TollFareConfigurationIL> GetByTollFareId(long TollFareId)
        {
            DataTable dt = new DataTable();
            List<TollFareConfigurationIL> farelist = new List<TollFareConfigurationIL>();
            try
            {
                string spName = "USP_TollFareConfigurationGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TollFareId", DbType.Int64, TollFareId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    farelist.Add(CreateObjectFromDataRow(dr));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return farelist;
        }
       

        #region Helper Methods
        private static TollFareConfigurationIL CreateObjectFromDataRow(DataRow dr)
        {
            TollFareConfigurationIL fc = new TollFareConfigurationIL();

            if (dr["TollFareId"] != DBNull.Value)
                fc.TollFareId = Convert.ToInt64(dr["TollFareId"]);

            if (dr["JourneyId"] != DBNull.Value)
                fc.JourneyId = Convert.ToInt64(dr["JourneyId"]);

            if (dr["JourneyName"] != DBNull.Value)
                fc.JourneyName = Convert.ToString(dr["JourneyName"]);

            if (dr["SystemVehicleClassId"] != DBNull.Value)
                fc.SystemVehicleClassId = Convert.ToInt16(dr["SystemVehicleClassId"]);

            if (dr["SystemVehicleClassName"] != DBNull.Value)
                fc.SystemVehicleClassName = Convert.ToString(dr["SystemVehicleClassName"]);

            if (dr["TollFare"] != DBNull.Value)
                fc.TollFare = Convert.ToDecimal(dr["TollFare"]);

            if (dr["ReturnFare"] != DBNull.Value)
                fc.ReturnFare = Convert.ToDecimal(dr["ReturnFare"]);

            if (dr["FasTagPenalty"] != DBNull.Value)
                fc.FasTagPenalty = Convert.ToDecimal(dr["FasTagPenalty"]);

            if (dr["OverweightPenalty"] != DBNull.Value)
                fc.OverweightPenalty = Convert.ToDecimal(dr["OverweightPenalty"]);
            return fc;
        }
        #endregion
    }
}
