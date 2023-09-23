using Softomation.ECSLibraries.DBManagement;
using Softomation.ECSLibraries.InterfaceLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using Softomation.CommonLibraries.InterfaceLayer;

namespace Softomation.ECSLibraries.DataLayer
{
    internal class PhoneEventsDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_IPPbxEventsHistory";
        static List<ResponseIL> responses = null;
        #endregion

        internal static List<ResponseIL> EventsInsert(PhoneEventsIL pBook)
        {
            try
            {
                string spName = "USP_PhoneEventsInsert";
                DbCommand command = DBExtension.GetStoredProcCommand(spName);
                command.Parameters.Add(DBExtension.CreateDbParameter(ref command, "@ExtensionNumber", DbType.String, pBook.ExtensionNumber, ParameterDirection.Input, 20));
                command.Parameters.Add(DBExtension.CreateDbParameter(ref command, "@EventId", DbType.Int16, pBook.EventId, ParameterDirection.Input));
                command.Parameters.Add(DBExtension.CreateDbParameter(ref command, "@EventMessage", DbType.String, pBook.EventMessage, ParameterDirection.Input, 50));
                command.Parameters.Add(DBExtension.CreateDbParameter(ref command, "@EventDateTime", DbType.DateTime, pBook.EventDateTime, ParameterDirection.Input, 50));
                DBExtension.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
        }

        internal static List<PhoneEventsIL> GetRecent(int ControllRoomId)
        {
            List<PhoneEventsIL> pBooks = new List<PhoneEventsIL>();
            try
            {
                string spName = "USP_IPPbxEventsGetRecent";
                DbCommand command = DBExtension.GetStoredProcCommand(spName);
                dt = DBExtension.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    pBooks.Add(CreateObjectFromDataRow(dr));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return pBooks;
        }


        #region Helper Methods
        private static PhoneEventsIL CreateObjectFromDataRow(DataRow dr)
        {
            PhoneEventsIL data = new PhoneEventsIL();
            if (dr["EventId"] != DBNull.Value)
                data.EventId = Convert.ToInt16(dr["EventId"]);

            if (dr["EventType"] != DBNull.Value)
                data.EventName = Convert.ToString(dr["EventType"]);

            if (dr["ExtensionNumber"] != DBNull.Value)
                data.ExtensionNumber = Convert.ToString(dr["ExtensionNumber"]);

            if (dr["EventMessage"] != DBNull.Value)
                data.EventMessage = Convert.ToString(dr["EventMessage"]);

            if (dr["EventDateTime"] != DBNull.Value)
                data.EventDateTime = Convert.ToDateTime(dr["EventDateTime"]);

            if (dr["IpAddress"] != DBNull.Value)
                data.IpAddress = Convert.ToString(dr["IpAddress"]);

            return data;
        }
        #endregion
    }
}
