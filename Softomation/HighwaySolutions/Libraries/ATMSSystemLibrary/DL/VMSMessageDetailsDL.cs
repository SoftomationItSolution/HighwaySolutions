using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DBA;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.DL
{
    internal class VMSMessageDetailsDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_VMSMessageDetails";
        #endregion

        internal static List<ResponseIL> InsertUpdate(VMSMessageDetailsIL ss)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_VMSMessageDetailsInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageId", DbType.Int32, ss.MessageId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentIds", DbType.String, ss.EquipmentIds, ParameterDirection.Input, 4000));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MediaPath", DbType.String, ss.MediaPath, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageTypeId", DbType.Int16, ss.MessageTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DisplayTimout", DbType.Int16, ss.DisplayTimout, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ValidTillDate", DbType.Date, ss.ValidTillDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageDetails", DbType.String, ss.MessageDetails, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, ss.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, ss.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, ss.ModifiedBy, ParameterDirection.Input));
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
        internal static List<VMSMessageDetailsIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<VMSMessageDetailsIL> crData = new List<VMSMessageDetailsIL>();
            try
            {
                string spName = "USP_VMSMessageDetailsGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    crData.Add(CreateObjectFromDataRow(dr));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return crData;
        }
        internal static VMSMessageDetailsIL GetById(Int32 MessageId)
        {
            DataTable dt = new DataTable();
            VMSMessageDetailsIL crData = new VMSMessageDetailsIL();
            try
            {
                string spName = "USP_VMSMessageDetailsGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageId", DbType.Int32, MessageId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    crData = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return crData;
        }
        #endregion

        #region Helper Methods
        private static VMSMessageDetailsIL CreateObjectFromDataRow(DataRow dr)
        {
            VMSMessageDetailsIL sysSet = new VMSMessageDetailsIL();

            if (dr["MessageId"] != DBNull.Value)
                sysSet.MessageId = Convert.ToInt16(dr["MessageId"]);

            if (dr["EquipmentIds"] != DBNull.Value)
                sysSet.EquipmentIds = Convert.ToString(dr["EquipmentIds"]);

            if (dr["MediaPath"] != DBNull.Value)
                sysSet.MediaPath = Convert.ToString(dr["MediaPath"]);

            if (dr["MessageTypeId"] != DBNull.Value)
                sysSet.MessageTypeId = Convert.ToInt16(dr["MessageTypeId"]);

            if (dr["DisplayTimout"] != DBNull.Value)
                sysSet.DisplayTimout = Convert.ToInt16(dr["DisplayTimout"]);

            if (dr["ValidTillDate"] != DBNull.Value)
            {
                sysSet.ValidTillDate = Convert.ToDateTime(dr["ValidTillDate"]);
                sysSet.ValidTillDateStamp = sysSet.ValidTillDate.ToString(Constants.DateFormat);
            }

            if (dr["MessageDetails"] != DBNull.Value)
                sysSet.MessageDetails = Convert.ToString(dr["MessageDetails"]);

            if (dr["DataStatus"] != DBNull.Value)
                sysSet.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            if (dr["CreatedDate"] != DBNull.Value)
                sysSet.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                sysSet.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                sysSet.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                sysSet.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (string.IsNullOrEmpty(sysSet.EquipmentIds))
                sysSet.EquipmentIds = "0";

            if (sysSet.EquipmentIds == "0")
                sysSet.EquipmentList = EquipmentDetailsDL.GetByTypeId(8);
            else
                sysSet.EquipmentList = EquipmentDetailsDL.GetByIds(sysSet.EquipmentIds);

            sysSet.MessageTypeName = Enum.GetName(typeof(SystemConstants.VmsMessageFormat), (SystemConstants.VmsMessageFormat)sysSet.MessageTypeId);
            sysSet.DataStatusName = Enum.GetName(typeof(Constants.DataStatusType), (Constants.DataStatusType)sysSet.DataStatus);
            return sysSet;
        }

        #endregion
    }
}
