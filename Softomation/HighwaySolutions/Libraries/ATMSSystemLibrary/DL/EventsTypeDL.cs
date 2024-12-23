﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.DL
{
    internal class EventsTypeDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_EventsTypeMaster";
        #endregion

        internal static List<ResponseIL> SetUp(List<EventsTypeIL> types)
        {
            List<ResponseIL> responses = null;
            try
            {
                DataTable ImportDataTable = new DataTable();
                ImportDataTable.Clear();
                ImportDataTable.Columns.Add("EventTypeId");
                ImportDataTable.Columns.Add("EventsRequired");
                ImportDataTable.Columns.Add("ReviewRequired");
                ImportDataTable.Columns.Add("ChallanTypeId");
                ImportDataTable.Columns.Add("MinimumValue");
                ImportDataTable.Columns.Add("MaximumValue");
                ImportDataTable.Columns.Add("SessionId");
                DataRow row;
                string SessionId = CommonLibrary.Constants.RandomString(10);
                StringBuilder xmlPermission = new StringBuilder();
                for (int i = 0; i < types.Count; i++)
                {
                    row = ImportDataTable.NewRow();
                    row["EventTypeId"] = types[i].EventTypeId;
                    row["EventsRequired"] = types[i].EventsRequired;
                    row["ReviewRequired"] = types[i].ReviewRequired;
                    row["ChallanTypeId"] = types[i].ChallanTypeId;
                    row["MinimumValue"] = types[i].MinimumValue;
                    row["MaximumValue"] = types[i].MaximumValue;
                    row["SessionId"] = SessionId;
                    ImportDataTable.Rows.Add(row);
                }
                if (SystemConstants.BulkCopy(ImportDataTable, "temp_EventsTypeMaster"))
                {
                    string spName = "USP_EventsTypeUpdate";
                    DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SessionId", DbType.String, SessionId, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SystemId", DbType.Int16, types[0].SystemId, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, types[0].CreatedBy, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                    command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, types[0].ModifiedBy, ParameterDirection.Input));
                    DataTable dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                    responses = ResponseIL.ConvertResponseList(dt);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
        }

        #region Get Methods
        internal static List<EventsTypeIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<EventsTypeIL> eds = new List<EventsTypeIL>();
            try
            {
                string spName = "USP_EventsTypeMasterGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
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
        internal static List<EventsTypeIL> GetActive()
        {
            List<EventsTypeIL> edlist = new List<EventsTypeIL>();
            try
            {
                edlist = GetAll();
                return edlist.FindAll(n => n.DataStatus == (short)SystemConstants.DataStatusType.Active);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        internal static List<EventsTypeIL> GetBySystemId(Int16 SystemId)
        {
            DataTable dt = new DataTable();
            List<EventsTypeIL> eds = new List<EventsTypeIL>();
            try
            {
                string spName = "USP_EventsTypeMasterGetBySystemId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SystemId", DbType.Int32, SystemId, ParameterDirection.Input));
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
        private static EventsTypeIL CreateObjectFromDataRow(DataRow dr)
        {
            EventsTypeIL ed = new EventsTypeIL();

            if (dr["EventTypeId"] != DBNull.Value)
                ed.EventTypeId = Convert.ToInt16(dr["EventTypeId"]);

            if (dr["EventTypeName"] != DBNull.Value)
                ed.EventTypeName = Convert.ToString(dr["EventTypeName"]);

            if (dr["EventsRequired"] != DBNull.Value)
                ed.EventsRequired = Convert.ToBoolean(dr["EventsRequired"]);

            if (dr["ReviewRequired"] != DBNull.Value)
                ed.ReviewRequired = Convert.ToBoolean(dr["ReviewRequired"]);

            if (dr["SystemId"] != DBNull.Value)
                ed.SystemId = Convert.ToInt16(dr["SystemId"]);

            if (dr["ChallanTypeId"] != DBNull.Value)
                ed.ChallanTypeId = Convert.ToInt16(dr["ChallanTypeId"]);

            if (dr["MinimumValue"] != DBNull.Value)
                ed.MinimumValue = Convert.ToInt16(dr["MinimumValue"]);

            if (dr["MaximumValue"] != DBNull.Value)
                ed.MaximumValue = Convert.ToInt16(dr["MaximumValue"]);

            if (dr["DataStatus"] != DBNull.Value)
                ed.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            if (dr["CreatedDate"] != DBNull.Value)
                ed.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                ed.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                ed.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                ed.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            ed.DataStatusName = Enum.GetName(typeof(SystemConstants.DataStatusType), (SystemConstants.DataStatusType)ed.DataStatus);
            return ed;
        }
        #endregion
    }
}
