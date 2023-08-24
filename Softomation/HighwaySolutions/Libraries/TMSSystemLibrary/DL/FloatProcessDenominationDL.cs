using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class FloatProcessDenominationDL
    {
        #region Global Varialble
        static string tableName = "tbl_FloatProcessDenominationDetails";
        #endregion

        #region Get Methods
        internal static List<FloatProcessDenominationIL> GetById(long FloatProcessId)
        {
            DataTable dt = new DataTable();
            List<FloatProcessDenominationIL> eds = new List<FloatProcessDenominationIL>();
            try
            {
                string spName = "USP_FloatProcessDenominationGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FloatProcessId", DbType.Int64, FloatProcessId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    eds.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return eds;

        }
        #endregion

        #region Helper Methods
        private static FloatProcessDenominationIL CreateObjectFromDataRow(DataRow dr)
        {
            FloatProcessDenominationIL dm = new FloatProcessDenominationIL();

            if (dr["FloatProcessId"] != DBNull.Value)
                dm.FloatProcessId = Convert.ToInt64(dr["FloatProcessId"]);

            if (dr["DenominationId"] != DBNull.Value)
                dm.DenominationId = Convert.ToInt16(dr["DenominationId"]);

            if (dr["DenominationValue"] != DBNull.Value)
                dm.DenominationValue = Convert.ToInt16(dr["DenominationValue"]);
            
            if (dr["DenominationCount"] != DBNull.Value)
                dm.DenominationCount = Convert.ToInt16(dr["DenominationCount"]);

            if (dr["TotalAmount"] != DBNull.Value)
                dm.TotalAmount = Convert.ToDecimal(dr["TotalAmount"]);
            
           
            return dm;
        }
        #endregion
    }
}
