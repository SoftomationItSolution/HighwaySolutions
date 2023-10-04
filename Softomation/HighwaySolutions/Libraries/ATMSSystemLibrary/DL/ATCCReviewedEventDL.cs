using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DBA;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.DL
{
    internal class ATCCReviewedEventDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_ATCCEventHistory";
        #endregion
        internal static List<ResponseIL> ReviewUpdate(ATCCReviewedEventIL data)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_ATCCEventReviewUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionId", DbType.String, data.TransactionId, ParameterDirection.Input, 30));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReviewedVehicleClassId", DbType.Int16, data.ReviewedVehicleClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReviewedById", DbType.Int64, data.ReviewedById, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReviewedDateTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responses = ResponseIL.ConvertResponseList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
        }
        internal static List<ATCCReviewedEventIL> GetByHours(short hours)
        {
            List<ATCCReviewedEventIL> atccEvents = new List<ATCCReviewedEventIL>();
            try
            {
                string spName = "USP_ATCCEventsReviewedGetByHours";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Hours", DbType.Int16, hours, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    atccEvents.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return atccEvents;
        }
        internal static List<ATCCReviewedEventIL> GetByFilter(DataFilterIL data)
        {
            DataTable dt = new DataTable();
            List<ATCCReviewedEventIL> atccEvents = new List<ATCCReviewedEventIL>();
            try
            {
                string spName = "USP_ATCCEventsReviewedGetByFilter";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FilterQuery", DbType.String, data.FilterQuery, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    atccEvents.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return atccEvents;
        }

        #region Helper Methods
        internal static ATCCReviewedEventIL CreateObjectFromDataRow(DataRow dr)
        {
            ATCCReviewedEventIL events = new ATCCReviewedEventIL();
            JavaScriptSerializer json_serializer = new JavaScriptSerializer() { MaxJsonLength = 86753090 };
            events = json_serializer.Deserialize<ATCCReviewedEventIL>(json_serializer.Serialize(ATCCEventDL.CreateObjectFromDataRow(dr)));
            if (dr["ReviewedVehicleClassId"] != DBNull.Value)
                events.ReviewedVehicleClassId = Convert.ToInt16(dr["ReviewedVehicleClassId"]);

            if (dr["ReviewedVehicleClassName"] != DBNull.Value)
                events.ReviewedVehicleClassName = Convert.ToString(dr["ReviewedVehicleClassName"]);

            if (dr["ReviewedById"] != DBNull.Value)
                events.ReviewedById = Convert.ToInt64(dr["ReviewedById"]);

            if (dr["ReviewedByLoginId"] != DBNull.Value)
                events.ReviewedByLoginId = Convert.ToString(dr["ReviewedByLoginId"]);

            return events;
        }
        #endregion
    }
}
