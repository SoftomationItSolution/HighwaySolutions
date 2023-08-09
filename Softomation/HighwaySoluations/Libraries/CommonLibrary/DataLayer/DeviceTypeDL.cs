using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class DeviceTypeDL
    {
        #region Global Varialble
        static string tableName = "tbl_DeviceTypeMaster";
        #endregion

        internal static List<DeviceTypeIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<DeviceTypeIL> dataLists = new List<DeviceTypeIL>();
            try
            {
                string spName = "USP_DeviceTypeGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    dataLists.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dataLists;
        }

        internal static List<DeviceTypeIL> GetAllActive()
        {
            DataTable dt = new DataTable();
            List<DeviceTypeIL> dataLists = new List<DeviceTypeIL>();
            try
            {
                string spName = "USP_DeviceTypeGetAllActive";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    dataLists.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dataLists;
        }

        internal static List<DeviceTypeIL> GetAllActiveByCatId(Int16 CategoryId)
        {
            DataTable dt = new DataTable();
            List<DeviceTypeIL> dataLists = new List<DeviceTypeIL>();
            try
            {
                string spName = "USP_DeviceTypeGetAllActiveByCatId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CategoryId", DbType.Int16, CategoryId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    dataLists.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dataLists;
        }

        internal static DeviceTypeIL GetById(int EntryId)
        {
            DataTable dt = new DataTable();
            DeviceTypeIL data = new DeviceTypeIL();
            List<DeviceTypeIL> dataLists = new List<DeviceTypeIL>();
            try
            {
                string spName = "USP_DeviceTypeGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, EntryId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                {
                    dataLists.Add(CreateObjectFromDataRow(dr));
                    data = dataLists[0];
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return data;
        }

        private static DeviceTypeIL CreateObjectFromDataRow(DataRow dr)
        {
            DeviceTypeIL data = new DeviceTypeIL();

            if (dr["EntryId"] != DBNull.Value)
                data.EntryId = Convert.ToInt32(dr["EntryId"]);

            if (dr["CategoryId"] != DBNull.Value)
                data.CategoryId = Convert.ToInt16(dr["CategoryId"]);

            if (dr["DeviceTypeName"] != DBNull.Value)
                data.DeviceTypeName = Convert.ToString(dr["DeviceTypeName"]);

            if (dr["IconName"] != DBNull.Value)
                data.IconName = Convert.ToString(dr["IconName"]);

            if (dr["CreatedDate"] != DBNull.Value)
                data.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                data.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                data.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                data.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["DataStatus"] != DBNull.Value)
            {
                data.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (data.DataStatus != 1)
                    data.DataStatusName = "Inactive";
            }
            return data;
        }
    }
}
