using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.DL
{
    internal class PhoneBookDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_EquipmentDetails";
        #endregion

        internal static List<ResponseIL> InsertUpdate(PhoneBookIL ed)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_EquipmentDetailsInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentId", DbType.Int64, ed.EquipmentId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PackageId", DbType.Int16, ed.PackageId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SystemId", DbType.Int16, ed.SystemId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentTypeId", DbType.Int16, ed.EquipmentTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ProtocolTypeId", DbType.Int16, ed.ProtocolTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentName", DbType.String, ed.EquipmentName.Trim(), ParameterDirection.Input, 200));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DirectionId", DbType.Int16, ed.DirectionId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IpAddress", DbType.String, ed.IpAddress, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PortNumber", DbType.Int64, ed.PortNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LoginId", DbType.String, ed.LoginId, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Password", DbType.String, ed.Password, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ChainageNumber", DbType.Decimal, ed.ChainageNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Latitude", DbType.Double, ed.Latitude, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Longitude", DbType.Double, ed.Longitude, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MacAddress", DbType.String, ed.MacAddress, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModelNumber", DbType.String, ed.ModelNumber, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SerialNumber", DbType.String, ed.SerialNumber, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ManufacturerDetail", DbType.String, ed.ManufacturerDetail, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VendorDetail", DbType.String, ed.VendorDetail, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ManufacturerDate", DbType.Date, ed.ManufacturerDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PurchageDate", DbType.Date, ed.PurchageDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@WarrantyExpireDate", DbType.Date, ed.WarrantyExpireDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, ed.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, ed.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CDateTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responses = ResponseIL.ConvertResponseList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
        }


        #region Get Methods
        
        internal static List<PhoneBookIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<PhoneBookIL> eds = new List<PhoneBookIL>();
            try
            {
                string spName = "USP_EquipmentDetailsGetAll";
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
        internal static List<PhoneBookIL> GetActive()
        {
            List<PhoneBookIL> edlist = new List<PhoneBookIL>();
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

       

        internal static PhoneBookIL GetById(Int32 EquipmentId)
        {
            DataTable dt = new DataTable();
            PhoneBookIL edData = new PhoneBookIL();
            try
            {
                string spName = "USP_EquipmentDetailsGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentId", DbType.Int32, EquipmentId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    edData = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return edData;
        }

       
        #endregion

        #region Helper Methods
        private static PhoneBookIL CreateObjectFromDataRow(DataRow dr)
        {
            PhoneBookIL ed = new PhoneBookIL();

            if (dr["EquipmentId"] != DBNull.Value)
                ed.EquipmentId = Convert.ToInt64(dr["EquipmentId"]);

            if (dr["ControlRoomId"] != DBNull.Value)
                ed.ControlRoomId = Convert.ToInt16(dr["ControlRoomId"]);

            if (dr["ControlRoomName"] != DBNull.Value)
                ed.ControlRoomName = Convert.ToString(dr["ControlRoomName"]);

            if (dr["PackageId"] != DBNull.Value)
                ed.PackageId = Convert.ToInt16(dr["PackageId"]);

            if (dr["PackageName"] != DBNull.Value)
                ed.PackageName = Convert.ToString(dr["PackageName"]);

            if (dr["SystemId"] != DBNull.Value)
                ed.SystemId = Convert.ToInt16(dr["SystemId"]);

            if (dr["SystemName"] != DBNull.Value)
                ed.SystemName = Convert.ToString(dr["SystemName"]);

            if (dr["EquipmentName"] != DBNull.Value)
                ed.EquipmentName = Convert.ToString(dr["EquipmentName"]);

            if (dr["DirectionId"] != DBNull.Value)
                ed.DirectionId = Convert.ToInt16(dr["DirectionId"]);

            if (dr["IpAddress"] != DBNull.Value)
                ed.IpAddress = Convert.ToString(dr["IpAddress"]);

            if (dr["PortNumber"] != DBNull.Value)
                ed.PortNumber = Convert.ToInt64(dr["PortNumber"]);

            if (dr["LoginId"] != DBNull.Value)
                ed.LoginId = Convert.ToString(dr["LoginId"]);

            if (dr["Password"] != DBNull.Value)
                ed.Password = Convert.ToString(dr["Password"]);

            if (dr["ChainageNumber"] != DBNull.Value)
            {
                ed.ChainageNumber = Convert.ToDecimal(dr["ChainageNumber"]);
                ed.ChainageName = SystemConstants.ConvertChainageName(ed.ChainageNumber);
            }

            if (dr["Latitude"] != DBNull.Value)
                ed.Latitude = Convert.ToDouble(dr["Latitude"]);

            if (dr["Longitude"] != DBNull.Value)
                ed.Longitude = Convert.ToDouble(dr["Longitude"]);

            if (dr["MacAddress"] != DBNull.Value)
                ed.MacAddress = Convert.ToString(dr["MacAddress"]);

            if (dr["ModelNumber"] != DBNull.Value)
                ed.ModelNumber = Convert.ToString(dr["ModelNumber"]);

            if (dr["SerialNumber"] != DBNull.Value)
                ed.SerialNumber = Convert.ToString(dr["SerialNumber"]);

            if (dr["ManufacturerDetail"] != DBNull.Value)
                ed.ManufacturerDetail = Convert.ToString(dr["ManufacturerDetail"]);

            if (dr["VendorDetail"] != DBNull.Value)
                ed.VendorDetail = Convert.ToString(dr["VendorDetail"]);

            if (dr["ManufacturerDate"] != DBNull.Value)
                ed.ManufacturerDate = Convert.ToDateTime(dr["ManufacturerDate"]);

            if (dr["PurchageDate"] != DBNull.Value)
                ed.PurchageDate = Convert.ToDateTime(dr["PurchageDate"]);

            if (dr["WarrantyExpireDate"] != DBNull.Value)
                ed.WarrantyExpireDate = Convert.ToDateTime(dr["WarrantyExpireDate"]);

            if (dr["OnLineStatus"] != DBNull.Value)
                ed.OnLineStatus = Convert.ToBoolean(dr["OnLineStatus"]);

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

            if (dr["EquipmentTypeId"] != DBNull.Value)
                ed.EquipmentTypeId = Convert.ToInt16(dr["EquipmentTypeId"]);

            if (dr["EquipmentTypeName"] != DBNull.Value)
                ed.EquipmentTypeName = Convert.ToString(dr["EquipmentTypeName"]);

            if (dr["EquipmentCategoryTypeId"] != DBNull.Value)
                ed.EquipmentCategoryTypeId = Convert.ToInt16(dr["EquipmentCategoryTypeId"]);

            if (dr["EquipmentConnectionTypeId"] != DBNull.Value)
                ed.EquipmentConnectionTypeId = Convert.ToInt16(dr["EquipmentConnectionTypeId"]);

            if (dr["EquipmentIconName"] != DBNull.Value)
                ed.EquipmentIconName = Convert.ToString(dr["EquipmentIconName"]);

            if (dr["ProtocolTypeId"] != DBNull.Value)
                ed.ProtocolTypeId = Convert.ToInt16(dr["ProtocolTypeId"]);

            if (dr["PhoneBookId"] != DBNull.Value)
                ed.PhoneBookId = Convert.ToInt64(dr["PhoneBookId"]);

            if (dr["ExtensionId"] != DBNull.Value)
                ed.ExtensionId = Convert.ToInt64(dr["ExtensionId"]);

            if (dr["ExtensionName"] != DBNull.Value)
                ed.ExtensionName = Convert.ToString(dr["ExtensionName"]);

            if (dr["ExtensionNumber"] != DBNull.Value)
                ed.ExtensionNumber = Convert.ToString(dr["ExtensionNumber"]);

            if (dr["PhoneTypeId"] != DBNull.Value)
                ed.PhoneTypeId = Convert.ToInt16(dr["PhoneTypeId"]);

            if (dr["PhoneTypeName"] != DBNull.Value)
                ed.PhoneTypeName = Convert.ToString(dr["PhoneTypeName"]);

            if (dr["PhoneStatusId"] != DBNull.Value)
                ed.PhoneStatusId = Convert.ToBoolean(dr["PhoneStatusId"]);

            if (dr["OnCallStatus"] != DBNull.Value)
                ed.OnCallStatus = Convert.ToBoolean(dr["OnCallStatus"]);



            ed.DataStatusName = Enum.GetName(typeof(CommonLibrary.Constants.DataStatusType), (CommonLibrary.Constants.DataStatusType)ed.DataStatus);
            ed.DirectionName = Enum.GetName(typeof(CommonLibrary.Constants.DirectionType), (CommonLibrary.Constants.DirectionType)ed.DirectionId);
            ed.EquipmentCategoryTypeName = Enum.GetName(typeof(CommonLibrary.Constants.EquipmentCategoryType), (SystemConstants.EquipmentCategoryType)ed.EquipmentCategoryTypeId);
            ed.EquipmentConnectionTypeName = Enum.GetName(typeof(CommonLibrary.Constants.EquipmentConnectionType), (SystemConstants.EquipmentConnectionType)ed.EquipmentConnectionTypeId);
            ed.ProtocolTypeName = Enum.GetName(typeof(CommonLibrary.Constants.ConnectionProtocolType), (CommonLibrary.Constants.ConnectionProtocolType)ed.ProtocolTypeId);
            ed.PhoneTypeName = Enum.GetName(typeof(SystemConstants.ConnectionProtocolType), (SystemConstants.ConnectionProtocolType)ed.PhoneTypeId);
            return ed;
        }

       
        #endregion
    }
}
