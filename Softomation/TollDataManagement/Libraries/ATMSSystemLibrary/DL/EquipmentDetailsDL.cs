using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using Softomation.ATMSSystemLibrary.DBA;
using Softomation.ATMSSystemLibrary.IL;

namespace Softomation.ATMSSystemLibrary.DL
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
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ControlRoomId", DbType.Int16, ed.ControlRoomId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentTypeId", DbType.Int16, ed.EquipmentTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentName", DbType.String, ed.EquipmentName.Trim(), ParameterDirection.Input, 200));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentDirectionId", DbType.Int16, ed.EquipmentDirectionId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentIP", DbType.String, ed.EquipmentIP, ParameterDirection.Input,20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentPortNumber", DbType.Int64, ed.EquipmentPortNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentLoginId", DbType.String, ed.EquipmentLoginId, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentPassword", DbType.String, ed.EquipmentPassword, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentChainageNumber", DbType.Decimal, ed.EquipmentChainageNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentLatitude", DbType.Decimal, ed.EquipmentLatitude, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentLongitude", DbType.Decimal, ed.EquipmentLongitude, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentMacAddress", DbType.String, ed.EquipmentMacAddress, ParameterDirection.Input,100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentModelNumber", DbType.String, ed.EquipmentModelNumber, ParameterDirection.Input,100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentSerialNumber", DbType.String, ed.EquipmentSerialNumber, ParameterDirection.Input,100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentManufacturer", DbType.String, ed.EquipmentManufacturer, ParameterDirection.Input,100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentVendorDetail", DbType.String, ed.EquipmentVendorDetail, ParameterDirection.Input,100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentManufacturerDate", DbType.Date, ed.EquipmentManufacturerDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentPurchageDate", DbType.Date, ed.EquipmentPurchageDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentWarrantyExpireDate", DbType.Date, ed.EquipmentWarrantyExpireDate, ParameterDirection.Input));
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
                return edlist.FindAll(n => n.DataStatus == (short)Constants.DataStatus.Active);
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

            if (dr["ControlRoomId"] != DBNull.Value)
                ed.ControlRoomId = Convert.ToInt16(dr["ControlRoomId"]);

            if (dr["ControlRoomName"] != DBNull.Value)
                ed.ControlRoomName = Convert.ToString(dr["ControlRoomName"]);

            

            if (dr["EquipmentName"] != DBNull.Value)
                ed.EquipmentName = Convert.ToString(dr["EquipmentName"]);

            if (dr["EquipmentDirectionId"] != DBNull.Value)
                ed.EquipmentDirectionId = Convert.ToInt16(dr["EquipmentDirectionId"]);

            if (dr["EquipmentIP"] != DBNull.Value)
                ed.EquipmentIP = Convert.ToString(dr["EquipmentIP"]);

            if (dr["EquipmentPortNumber"] != DBNull.Value)
                ed.EquipmentPortNumber = Convert.ToInt64(dr["EquipmentPortNumber"]);

            if (dr["EquipmentLoginId"] != DBNull.Value)
                ed.EquipmentLoginId = Convert.ToString(dr["EquipmentLoginId"]);

            if (dr["EquipmentPassword"] != DBNull.Value)
                ed.EquipmentPassword = Convert.ToString(dr["EquipmentPassword"]);

            if (dr["EquipmentChainageNumber"] != DBNull.Value)
            {
                ed.EquipmentChainageNumber = Convert.ToDecimal(dr["EquipmentChainageNumber"]);
                ed.EquipmentChainageName = ed.EquipmentChainageNumber.ToString().Replace(".", "+");
            }

            if (dr["EquipmentLatitude"] != DBNull.Value)
                ed.EquipmentLatitude = Convert.ToDecimal(dr["EquipmentLatitude"]);

            if (dr["EquipmentLongitude"] != DBNull.Value)
                ed.EquipmentLongitude = Convert.ToDecimal(dr["EquipmentLongitude"]);

            if (dr["EquipmentMacAddress"] != DBNull.Value)
                ed.EquipmentMacAddress = Convert.ToString(dr["EquipmentMacAddress"]);

            if (dr["EquipmentModelNumber"] != DBNull.Value)
                ed.EquipmentModelNumber = Convert.ToString(dr["EquipmentModelNumber"]);

            if (dr["EquipmentSerialNumber"] != DBNull.Value)
                ed.EquipmentSerialNumber = Convert.ToString(dr["EquipmentSerialNumber"]);

            if (dr["EquipmentManufacturer"] != DBNull.Value)
                ed.EquipmentManufacturer = Convert.ToString(dr["EquipmentManufacturer"]);

            if (dr["EquipmentVendorDetail"] != DBNull.Value)
                ed.EquipmentVendorDetail = Convert.ToString(dr["EquipmentVendorDetail"]);

            if (dr["EquipmentManufacturerDate"] != DBNull.Value)
                ed.EquipmentManufacturerDate = Convert.ToDateTime(dr["EquipmentManufacturerDate"]);

            if (dr["EquipmentPurchageDate"] != DBNull.Value)
                ed.EquipmentPurchageDate = Convert.ToDateTime(dr["EquipmentPurchageDate"]);

            if (dr["EquipmentWarrantyExpireDate"] != DBNull.Value)
                ed.EquipmentWarrantyExpireDate = Convert.ToDateTime(dr["EquipmentWarrantyExpireDate"]);

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

            ed.DataStatusName = Enum.GetName(typeof(Constants.DataStatus), (Constants.DataStatus)ed.DataStatus);
            ed.EquipmentDirectionName = Enum.GetName(typeof(Constants.DirectionType), (Constants.DirectionType)ed.EquipmentDirectionId);
            ed.EquipmentCategoryTypeName = Enum.GetName(typeof(Constants.EquipmentCategoryType), (Constants.EquipmentCategoryType)ed.EquipmentCategoryTypeId);
            ed.EquipmentConnectionTypeName = Enum.GetName(typeof(Constants.EquipmentConnectionType), (Constants.EquipmentConnectionType)ed.EquipmentConnectionTypeId);
            return ed;
        }
        #endregion
    }
}
