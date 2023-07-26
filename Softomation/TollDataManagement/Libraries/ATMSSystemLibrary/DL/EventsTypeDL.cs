using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using Softomation.ATMSSystemLibrary.DBA;
using Softomation.ATMSSystemLibrary.IL;

namespace Softomation.ATMSSystemLibrary.DL
{
    internal class EventsTypeDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_EventsTypeMaster";
        #endregion

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
                return edlist.FindAll(n => n.DataStatus == (short)Constants.DataStatusType.Active);
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
                string spName = "USP_EventsTypeMasterGetAll";
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

            if (dr["EventsTypeId"] != DBNull.Value)
                ed.EventsTypeId = Convert.ToInt16(dr["EventsTypeId"]);

            if (dr["EventTypeName"] != DBNull.Value)
                ed.EventTypeName = Convert.ToString(dr["EventTypeName"]);

            if (dr["EventsRequired"] != DBNull.Value)
                ed.EventsRequired = Convert.ToBoolean(dr["EventsRequired"]);

            if (dr["ChallanRequired"] != DBNull.Value)
                ed.ChallanRequired = Convert.ToBoolean(dr["ChallanRequired"]);

            if (dr["SystemId"] != DBNull.Value)
                ed.SystemId = Convert.ToInt16(dr["SystemId"]);

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

            ed.DataStatusName = Enum.GetName(typeof(Constants.DataStatusType), (Constants.DataStatusType)ed.DataStatus);
            return ed;
        }
        #endregion
    }
}
