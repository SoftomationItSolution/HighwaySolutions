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
    internal class VSDSReviewedEventDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_VSDSEventsHistory";
        #endregion
        internal static List<ResponseIL> ReviewUpdate(VSDSReviewedEventIL data)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_VSDSEventReviewUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionId", DbType.String, data.TransactionId, ParameterDirection.Input, 30));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReviewedPlateNumber", DbType.String, data.ReviewedPlateNumber, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReviewedVehicleClassId", DbType.Int16, data.ReviewedVehicleClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EventTypeId", DbType.Int16, data.EventTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IsReviewedPlateVisible", DbType.Boolean, data.IsReviewedPlateVisible, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IsReviewedFaultyPlate", DbType.Boolean, data.IsReviewedFaultyPlate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IsReviewedStandardPlate", DbType.Boolean, data.IsReviewedStandardPlate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IsReviewedWrongDirection", DbType.Boolean, data.IsReviewedWrongDirection, ParameterDirection.Input));
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
        internal static List<VSDSReviewedEventIL> GetByHours(short hours)
        {
            List<VSDSReviewedEventIL> vidsEvents = new List<VSDSReviewedEventIL>();
            try
            {
                string spName = "USP_VSDSEventsReviewedGetByHours";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Hours", DbType.Int16, hours, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    vidsEvents.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return vidsEvents;
        }
        internal static List<VSDSReviewedEventIL> GetByFilter(DataFilterIL data)
        {
            DataTable dt = new DataTable();
            List<VSDSReviewedEventIL> vidsEvents = new List<VSDSReviewedEventIL>();
            try
            {
                string spName = "USP_VSDSEventsGetByFilter";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FilterQuery", DbType.String, data.FilterQuery, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    vidsEvents.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return vidsEvents;
        }

        #region Helper Methods
        internal static VSDSReviewedEventIL CreateObjectFromDataRow(DataRow dr)
        {
            VSDSReviewedEventIL events = new VSDSReviewedEventIL();
            JavaScriptSerializer json_serializer = new JavaScriptSerializer() { MaxJsonLength = 86753090 };
            events = json_serializer.Deserialize<VSDSReviewedEventIL>(json_serializer.Serialize(VSDSEventDL.CreateObjectFromDataRow(dr)));
            if (dr["ReviewedPlateNumber"] != DBNull.Value)
                events.ReviewedPlateNumber = Convert.ToString(dr["ReviewedPlateNumber"]);

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
