using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.CommonLibrary.IL;
namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class EquipmentDetailsDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_EquipmentDetails";
        #endregion

        internal static List<ResponseIL> InsertUpdate(EquipmentDetailsIL ed)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_EquipmentDetailsInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentId", DbType.Int64, ed.EquipmentId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, ed.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneId", DbType.Int16, ed.LaneId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentTypeId", DbType.Int16, ed.EquipmentTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ProtocolTypeId", DbType.Int16, ed.ProtocolTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentName", DbType.String, ed.EquipmentName.Trim(), ParameterDirection.Input, 200));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IpAddress", DbType.String, ed.IpAddress, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PortNumber", DbType.Int64, ed.PortNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LoginId", DbType.String, ed.LoginId, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Password", DbType.String, ed.Password, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MacAddress", DbType.String, ed.MacAddress, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModelNumber", DbType.String, ed.ModelNumber, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SerialNumber", DbType.String, ed.SerialNumber, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ManufactureId", DbType.String, ed.ManufactureId, ParameterDirection.Input, 100));
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
        internal static List<EquipmentDetailsIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<EquipmentDetailsIL> eds = new List<EquipmentDetailsIL>();
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
        internal static List<EquipmentDetailsIL> GetActive()
        {
            List<EquipmentDetailsIL> edlist = new List<EquipmentDetailsIL>();
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

        internal static EquipmentDetailsIL GetById(Int32 EquipmentId)
        {
            DataTable dt = new DataTable();
            EquipmentDetailsIL edData = new EquipmentDetailsIL();
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
        private static EquipmentDetailsIL CreateObjectFromDataRow(DataRow dr)
        {
            EquipmentDetailsIL ed = new EquipmentDetailsIL();

            if (dr["EquipmentId"] != DBNull.Value)
                ed.EquipmentId = Convert.ToInt64(dr["EquipmentId"]);

            if (dr["PlazaId"] != DBNull.Value)
                ed.PlazaId = Convert.ToInt16(dr["PlazaId"]);

            if (dr["PlazaName"] != DBNull.Value)
                ed.PlazaName = Convert.ToString(dr["PlazaName"]);

            if (dr["LaneId"] != DBNull.Value)
                ed.LaneId = Convert.ToInt16(dr["LaneId"]);

            if (dr["LaneNumber"] != DBNull.Value)
                ed.LaneNumber = Convert.ToInt16(dr["LaneNumber"]);

            if (dr["EquipmentName"] != DBNull.Value)
                ed.EquipmentName = Convert.ToString(dr["EquipmentName"]);

            if (dr["IpAddress"] != DBNull.Value)
                ed.IpAddress = Convert.ToString(dr["IpAddress"]);

            if (dr["PortNumber"] != DBNull.Value)
                ed.PortNumber = Convert.ToInt64(dr["PortNumber"]);

            if (dr["LoginId"] != DBNull.Value)
                ed.LoginId = Convert.ToString(dr["LoginId"]);

            if (dr["Password"] != DBNull.Value)
                ed.Password = Convert.ToString(dr["Password"]);

            if (dr["MacAddress"] != DBNull.Value)
                ed.MacAddress = Convert.ToString(dr["MacAddress"]);

            if (dr["ModelNumber"] != DBNull.Value)
                ed.ModelNumber = Convert.ToString(dr["ModelNumber"]);

            if (dr["SerialNumber"] != DBNull.Value)
                ed.SerialNumber = Convert.ToString(dr["SerialNumber"]);

            if (dr["ManufactureId"] != DBNull.Value)
                ed.ManufactureId = Convert.ToInt16(dr["ManufactureId"]);

            if (dr["ManufactureName"] != DBNull.Value)
                ed.ManufactureName = Convert.ToString(dr["ManufactureName"]);

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

            ed.DataStatusName = Enum.GetName(typeof(CommonLibrary.Constants.DataStatusType), (CommonLibrary.Constants.DataStatusType)ed.DataStatus);
            ed.EquipmentCategoryTypeName = Enum.GetName(typeof(CommonLibrary.Constants.EquipmentCategoryType), (CommonLibrary.Constants.EquipmentCategoryType)ed.EquipmentCategoryTypeId);
            ed.EquipmentConnectionTypeName = Enum.GetName(typeof(CommonLibrary.Constants.EquipmentConnectionType), (CommonLibrary.Constants.EquipmentConnectionType)ed.EquipmentConnectionTypeId);
            ed.ProtocolTypeName = Enum.GetName(typeof(CommonLibrary.Constants.ConnectionProtocolType), (CommonLibrary.Constants.ConnectionProtocolType)ed.ProtocolTypeId);
            return ed;
        }
        #endregion
    }
}
