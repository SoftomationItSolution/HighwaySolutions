using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using Softomation.ATMSSystemLibrary.DBA;
using Softomation.ATMSSystemLibrary.IL;

namespace Softomation.ATMSSystemLibrary.DL
{
    internal class VIDSReviewedEventDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_VIDSEventsHistory";
        #endregion
        internal static List<ResponseIL> ReviewUpdate(VIDSReviewedEventIL data)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_VIDSEventReviewUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionId", DbType.String, data.TransactionId, ParameterDirection.Input, 30));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReviewedEventTypeId", DbType.Int16, data.ReviewedEventTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReviewedPlateNumber", DbType.String, data.ReviewedPlateNumber, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReviewedVehicleClassId", DbType.Int16, data.ReviewedVehicleClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IsChallanRequired", DbType.Boolean, data.IsChallanRequired, ParameterDirection.Input));
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
        internal static List<VIDSReviewedEventIL> GetByHours(short hours)
        {
            List<VIDSReviewedEventIL> vidsEvents = new List<VIDSReviewedEventIL>();
            try
            {
                string spName = "USP_VIDSEventsReviewedGetByHours";
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
        internal static List<VIDSReviewedEventIL> GetByFilter(DataFilterIL data)
        {
            DataTable dt = new DataTable();
            List<VIDSReviewedEventIL> vidsEvents = new List<VIDSReviewedEventIL>();
            try
            {
                string spName = "USP_VIDSEventsGetByFilter";
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
        internal static VIDSReviewedEventIL CreateObjectFromDataRow(DataRow dr)
        {
            VIDSReviewedEventIL events = new VIDSReviewedEventIL();
            events = (VIDSReviewedEventIL)VIDSEventDL.CreateObjectFromDataRow(dr);
            if (dr["ReviewedEventTypeId"] != DBNull.Value)
                events.ReviewedEventTypeId = Convert.ToInt16(dr["ReviewedEventTypeId"]);

            if (dr["ReviewedEventTypeName"] != DBNull.Value)
                events.ReviewedEventTypeName = Convert.ToString(dr["ReviewedEventTypeName"]);

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
