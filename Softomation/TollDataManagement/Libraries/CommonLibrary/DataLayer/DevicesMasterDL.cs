using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class DevicesMasterDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_DeviceDetails";
        #endregion
        internal DevicesMasterDL()
        {
        }
        #region Insert Update
        internal static List<ResponceIL> InsertUpdate(DevicesMasterIL devicesMaster)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_DevicesMasterInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, devicesMaster.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ControlRoomId", DbType.Int16, devicesMaster.ControlRoomId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CategoryId", DbType.Int16, devicesMaster.CategoryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DeviceTypeId", DbType.Int16, devicesMaster.DeviceTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DeviceName", DbType.String, devicesMaster.DeviceName, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Direction", DbType.Int16, devicesMaster.Direction, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ConnectionTypeId", DbType.Int16, devicesMaster.ConnectionTypeId, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IpAddress", DbType.String, devicesMaster.IpAddress, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PortNumber", DbType.Int16, devicesMaster.PortNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DeviceLoginId", DbType.String, devicesMaster.DeviceLoginId, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DevicePassword", DbType.String, devicesMaster.DevicePassword, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Latitude", DbType.String, devicesMaster.Latitude, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Longitude", DbType.String, devicesMaster.Longitude, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModelNumber", DbType.String, devicesMaster.ModelNumber, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Manufacturer", DbType.String, devicesMaster.Manufacturer, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Vendor", DbType.String, devicesMaster.Vendor, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PurchageDate", DbType.Date, devicesMaster.PurchageDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ManufacturerDate", DbType.Date, devicesMaster.ManufacturerDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@WarrantyExpireDate", DbType.Date, devicesMaster.WarrantyExpireDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Remark", DbType.String, devicesMaster.Remark, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@GantryId", DbType.Int16, devicesMaster.GantryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneNumber", DbType.Int16, devicesMaster.LaneNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, devicesMaster.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, devicesMaster.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, devicesMaster.ModifiedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }


        #endregion

        #region Get Method
        internal static List<DevicesMasterIL> GetAllCoordinates(short ControlRoomId)
        {
            DataTable dt = new DataTable();
            List<DevicesMasterIL> devices = new List<DevicesMasterIL>();
            try
            {
                string spName = "USP_GetAllCoordinates";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ControlRoomId", DbType.Int16, ControlRoomId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    devices.Add(CreateCoordinatesObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return devices;
        }



        internal static List<DevicesMasterIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<DevicesMasterIL> devices = new List<DevicesMasterIL>();
            try
            {
                string spName = "USP_DevicesMasterGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    devices.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return devices;
        }
        internal static List<DevicesMasterIL> GetAllActive()
        {
            DataTable dt = new DataTable();
            List<DevicesMasterIL> devices = new List<DevicesMasterIL>();
            try
            {
                string spName = "USP_DevicesMasterGetAllActive";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    devices.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return devices;
        }
        internal static DevicesMasterIL GetById(int EntryId)
        {
            DataTable dt = new DataTable();
            DevicesMasterIL account = new DevicesMasterIL();
            try
            {
                string spName = "USP_DevicesMasterGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, EntryId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    account = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return account;
        }
        internal static List<DevicesMasterIL> GetByCategory(short CategoryId)
        {
            DataTable dt = new DataTable();
            List<DevicesMasterIL> devices = new List<DevicesMasterIL>();
            try
            {
                string spName = "USP_DevicesMasterGetByCategoryId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CategoryId", DbType.Int16, CategoryId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    devices.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return devices;
        }
        internal static List<DevicesMasterIL> GetByType(short DeviceTypeId)
        {
            DataTable dt = new DataTable();
            List<DevicesMasterIL> devices = new List<DevicesMasterIL>();
            try
            {
                string spName = "USP_DevicesMasterGetByTypeId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DeviceTypeId", DbType.Int16, DeviceTypeId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    devices.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return devices;
        }

        internal static List<DevicesMasterIL> GetByIds(string DeviceIds)
        {
            DataTable dt = new DataTable();
            List<DevicesMasterIL> devices = new List<DevicesMasterIL>();
            try
            {
                string spName = "USP_DevicesMasterGetByIds";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DeviceIds", DbType.String, DeviceIds, ParameterDirection.Input, 4000));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    devices.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return devices;
        }
        internal static List<DevicesMasterIL> GetByControlRoom(short ControlRoomId)
        {
            DataTable dt = new DataTable();
            List<DevicesMasterIL> devices = new List<DevicesMasterIL>();
            try
            {
                string spName = "USP_DevicesMasterGetByControlRoomId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ControlRoomId", DbType.Int16, ControlRoomId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    devices.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return devices;
        }
        internal static List<DevicesMasterIL> GetByControlRoomActive(Int16 ControlRoomId)
        {
            DataTable dt = new DataTable();
            List<DevicesMasterIL> devices = new List<DevicesMasterIL>();
            try
            {
                string spName = "USP_DevicesMasterGetByControlRoomIdActive";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ControlRoomId", DbType.Int16, ControlRoomId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    devices.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return devices;
        }
        internal static DevicesMasterIL GetByIpAddress(String IpAddress)
        {
            DataTable dt = new DataTable();
            DevicesMasterIL account = new DevicesMasterIL();
            try
            {
                string spName = "USP_DevicesMasterGetByIpAddress";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IpAddress", DbType.String, IpAddress, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    account = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return account;
        }
        #endregion

        #region Helper Methods
        private static DevicesMasterIL CreateObjectFromDataRow(DataRow dr)
        {
            DevicesMasterIL data = new DevicesMasterIL();
            if (dr["EntryId"] != DBNull.Value)
                data.EntryId = Convert.ToInt32(dr["EntryId"]);

            if (dr["ControlRoomId"] != DBNull.Value)
                data.ControlRoomId = Convert.ToInt16(dr["ControlRoomId"]);

            if (dr["ControlRoomName"] != DBNull.Value)
                data.ControlRoomName = Convert.ToString(dr["ControlRoomName"]);

            if (dr["CategoryId"] != DBNull.Value)
                data.CategoryId = Convert.ToInt16(dr["CategoryId"]);

            if (dr["CategoryName"] != DBNull.Value)
                data.CategoryName = Convert.ToString(dr["CategoryName"]);

            if (dr["DeviceTypeId"] != DBNull.Value)
                data.DeviceTypeId = Convert.ToInt16(dr["DeviceTypeId"]);

            if (dr["DeviceTypeName"] != DBNull.Value)
                data.DeviceTypeName = Convert.ToString(dr["DeviceTypeName"]);

            if (dr["IconName"] != DBNull.Value)
                data.IconName = Convert.ToString(dr["IconName"]);

            if (dr["DeviceName"] != DBNull.Value)
                data.DeviceName = Convert.ToString(dr["DeviceName"]);

            if (dr["Direction"] != DBNull.Value)
            {
                data.Direction = Convert.ToInt16(dr["Direction"]);
                if (data.Direction == 1)
                    data.DirectionName = "LHS";
                else if (data.Direction == 2)
                    data.DirectionName = "RHS";
                else
                    data.DirectionName = "NONE";
            }

            if (dr["ConnectionTypeId"] != DBNull.Value)
                data.ConnectionTypeId = Convert.ToInt16(dr["ConnectionTypeId"]);

            if (dr["ConnectionType"] != DBNull.Value)
                data.ConnectionType = Convert.ToString(dr["ConnectionType"]);

            if (dr["IpAddress"] != DBNull.Value)
                data.IpAddress = Convert.ToString(dr["IpAddress"]);

            if (dr["PortNumber"] != DBNull.Value)
                data.PortNumber = Convert.ToInt16(dr["PortNumber"]);

            if (dr["DeviceLoginId"] != DBNull.Value)
                data.DeviceLoginId = Convert.ToString(dr["DeviceLoginId"]);

            if (dr["DevicePassword"] != DBNull.Value)
                data.DevicePassword = Convert.ToString(dr["DevicePassword"]);

            if (dr["Latitude"] != DBNull.Value)
                data.Latitude = Convert.ToString(dr["Latitude"]);

            if (dr["Longitude"] != DBNull.Value)
                data.Longitude = Convert.ToString(dr["Longitude"]);

            if (dr["ModelNumber"] != DBNull.Value)
                data.ModelNumber = Convert.ToString(dr["ModelNumber"]);

            if (dr["Manufacturer"] != DBNull.Value)
                data.Manufacturer = Convert.ToString(dr["Manufacturer"]);

            if (dr["Vendor"] != DBNull.Value)
                data.Vendor = Convert.ToString(dr["Vendor"]);

            if (dr["Remark"] != DBNull.Value)
                data.Remark = Convert.ToString(dr["Remark"]);

            if (dr["PurchageDate"] != DBNull.Value)
                data.PurchageDate = Convert.ToDateTime(dr["PurchageDate"]);

            if (dr["ManufacturerDate"] != DBNull.Value)
                data.ManufacturerDate = Convert.ToDateTime(dr["ManufacturerDate"]);

            if (dr["WarrantyExpireDate"] != DBNull.Value)
                data.WarrantyExpireDate = Convert.ToDateTime(dr["WarrantyExpireDate"]);

            if (dr["GantryId"] != DBNull.Value)
                data.GantryId = Convert.ToInt16(dr["GantryId"]);

            if (dr["GantryName"] != DBNull.Value)
                data.GantryName = Convert.ToString(dr["GantryName"]);

            if (dr["LaneNumber"] != DBNull.Value)
                data.LaneNumber = Convert.ToInt16(dr["LaneNumber"]);

            if (dr["OnLineStatus"] != DBNull.Value)
                data.OnLineStatus = Convert.ToInt16(dr["OnLineStatus"]);

            if (dr["CreatedBy"] != DBNull.Value)
                data.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["CreatedDate"] != DBNull.Value)
                data.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                data.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                data.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["DataStatus"] != DBNull.Value)
            {
                data.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (data.DataStatus != 1)
                    data.DataStatusName = "Inactive";
            }
            return data;
        }
        private static DevicesMasterIL CreateCoordinatesObjectFromDataRow(DataRow dr)
        {
            DevicesMasterIL data = new DevicesMasterIL();
            if (dr["Latitude"] != DBNull.Value)
                data.Latitude = Convert.ToDouble(dr["Latitude"]).ToString();

            if (dr["Longitude"] != DBNull.Value)
                data.Longitude = Convert.ToDouble(dr["Longitude"]).ToString();

            return data;
        }
        #endregion
    }
}
