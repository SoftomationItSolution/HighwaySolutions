using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class ICDPlazaDetailsDL
    {
        #region Global Varialble
        static string tableName = "tbl_PlazaConfiguration";
        #endregion

        internal static List<ICDPlazaDetailsIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<ICDPlazaDetailsIL> plazas = new List<ICDPlazaDetailsIL>();
            try
            {
                string spName = "USP_ICDPlazaGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    plazas.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return plazas;

        }

        #region Helper Methods
        private static ICDPlazaDetailsIL CreateObjectFromDataRow(DataRow dr)
        {
            ICDPlazaDetailsIL plaza = new ICDPlazaDetailsIL();

            if (dr["PlazaId"] != DBNull.Value)
                plaza.PlazaId = Convert.ToInt16(dr["PlazaId"]);

            if (dr["PlazaZoneId"] != DBNull.Value)
                plaza.PlazaZoneId = Convert.ToInt64(dr["PlazaZoneId"]);

            if (dr["PlazaAcquirerId"] != DBNull.Value)
                plaza.PlazaAcquirerId = Convert.ToInt32(dr["PlazaAcquirerId"]);

            if (dr["PlazaName"] != DBNull.Value)
                plaza.PlazaName = Convert.ToString(dr["PlazaName"]);

            if (dr["PlazaState"] != DBNull.Value)
                plaza.PlazaState = Convert.ToString(dr["PlazaState"]);

            if (dr["PlazaAddress"] != DBNull.Value)
                plaza.PlazaAddress = Convert.ToString(dr["PlazaAddress"]);

            if (dr["PlazaFromDistrict"] != DBNull.Value)
                plaza.PlazaFromDistrict = Convert.ToString(dr["PlazaFromDistrict"]);

            if (dr["PlazaToDistrict"] != DBNull.Value)
                plaza.PlazaToDistrict = Convert.ToString(dr["PlazaToDistrict"]);

            if (dr["PlazaAgencyCode"] != DBNull.Value)
                plaza.PlazaAgencyCode = Convert.ToString(dr["PlazaAgencyCode"]);

            if (dr["Latitude"] != DBNull.Value && dr["Longitude"] != DBNull.Value)
            {
                plaza.PlazaGeoCode = Convert.ToString(dr["Latitude"]) + "," + Convert.ToString(dr["Longitude"]);
            }
            return plaza;
        }
        #endregion
    }
}
