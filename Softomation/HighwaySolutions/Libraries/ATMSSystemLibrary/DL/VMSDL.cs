using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.CommonLibrary;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.DL
{
    internal class VMSDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_SystemSetting";
        #endregion

        internal static List<ResponseIL> InsertUpdate(VMSIL ss)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_WeatherConfigInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageId", DbType.Int32, ss.MessageId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VmsIds", DbType.Decimal, ss.VmsIds, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MediaPath", DbType.Decimal, ss.MediaPath, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FormatId", DbType.Decimal, ss.FormatId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DisplayTimout", DbType.Decimal, ss.DisplayTimout, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ValidTillDate", DbType.DateTime, ss.ValidTillDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@NodeDetails", DbType.Decimal, ss.NodeDetails, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@StyleDetails", DbType.Decimal, ss.StyleDetails, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CssDetails", DbType.Decimal, ss.CssDetails, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageDetails", DbType.Decimal, ss.MessageDetails, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, ss.CreatedBy, ParameterDirection.Input));
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
        internal static List<VMSIL> GetVMSMessage()
        {
            DataTable dt = new DataTable();
            List<VMSIL> crData = new List<VMSIL>();
            try
            {
                string spName = "USP_ManualMessageGetAll";
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

        #endregion

        #region Helper Methods
        private static VMSIL CreateObjectFromDataRow(DataRow dr)
        {
            VMSIL sysSet = new VMSIL();

            if (dr["MessageId"] != DBNull.Value)
                sysSet.MessageId = Convert.ToInt16(dr["MessageId"]);

            if (dr["VmsIds"] != DBNull.Value)
                sysSet.VmsIds = Convert.ToString(dr["VmsIds"]);

            if (dr["MediaPath"] != DBNull.Value)
                sysSet.MediaPath = Convert.ToString(dr["MediaPath"]);

            if (dr["FormatId"] != DBNull.Value)
                sysSet.FormatId = Convert.ToInt16(dr["FormatId"]);

            if (dr["DisplayTimout"] != DBNull.Value)
                sysSet.DisplayTimout = Convert.ToInt16(dr["DisplayTimout"]);

            if (dr["ValidTillDate"] != DBNull.Value)
            {
                sysSet.ValidTillDate = Convert.ToDateTime(dr["ValidTillDate"]);
                sysSet.ValidTillDateTimeStamp = sysSet.ValidTillDate.ToString(Constants.DateTimeFormatTxnFormat);
            }

            if (dr["NodeDetails"] != DBNull.Value)
                sysSet.NodeDetails = Convert.ToString(dr["NodeDetails"]);

            if (dr["StyleDetails"] != DBNull.Value)
                sysSet.StyleDetails = Convert.ToString(dr["StyleDetails"]);

            if (dr["CssDetails"] != DBNull.Value)
                sysSet.CssDetails = Convert.ToString(dr["CssDetails"]);

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

            if (string.IsNullOrEmpty(sysSet.VmsIds))
                sysSet.VmsIds = "0";

            //if (sysSet.VmsIds == "0")
            //    sysSet.VmsList = EquipmentDetailsDL.GetActive();
            //else
            //    sysSet.VmsList = EquipmentDetailsDL.GetById(sysSet.VmsIds);

            sysSet.FormatName = Enum.GetName(typeof(SystemConstants.VmsMessageFormat), (SystemConstants.VmsMessageFormat)sysSet.FormatId);
            sysSet.DataStatusName = Enum.GetName(typeof(Constants.DataStatusType), (SystemConstants.DataStatusType)sysSet.DataStatus);
            return sysSet;
        }
        private static WeatherDataIL CreateObjectweatherFromDataRow(DataRow dr)
        {
            WeatherDataIL sysSet = new WeatherDataIL();

            if (dr["TransactionId"] != DBNull.Value)
                sysSet.TransactionId = Convert.ToInt64(dr["TransactionId"]);

            if (dr["EquipmentName"] != DBNull.Value)
                sysSet.EquipmentName = Convert.ToString(dr["EquipmentName"]);

            if (dr["AirTemperature"] != DBNull.Value)
                sysSet.AirTemperature = Convert.ToDecimal(dr["AirTemperature"]);

            if (dr["HumidityRH"] != DBNull.Value)
                sysSet.HumidityRH = Convert.ToDecimal(dr["HumidityRH"]);

            if (dr["HumidityAH"] != DBNull.Value)
                sysSet.HumidityAH = Convert.ToDecimal(dr["HumidityAH"]);

            if (dr["Visibility"] != DBNull.Value)
                sysSet.Visibility = Convert.ToDecimal(dr["Visibility"]);

            if (dr["WindDirectionValue"] != DBNull.Value)
                sysSet.WindDirectionValue = Convert.ToDecimal(dr["WindDirectionValue"]);

            if (dr["WindSpeedValue"] != DBNull.Value)
                sysSet.WindSpeedValue = Convert.ToDecimal(dr["WindSpeedValue"]);

            if (dr["RainValue"] != DBNull.Value)
                sysSet.RainValue = Convert.ToDecimal(dr["RainValue"]);

            if (dr["WindSpeedMeasurement"] != DBNull.Value)
                sysSet.WindSpeedMeasurement = Convert.ToString(dr["WindSpeedMeasurement"]);

            if (dr["RainMeasurement"] != DBNull.Value)
                sysSet.RainMeasurement = Convert.ToString(dr["RainMeasurement"]);

            if (dr["EventDate"] != DBNull.Value)
            {
                sysSet.EventDate = Convert.ToDateTime(dr["EventDate"]);
                sysSet.EventDateTimestamp = sysSet.EventDate.ToString(Constants.DateTimeFormatClient);
            }
            return sysSet;
        }
        #endregion
    }
}
