using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class ICDViolationAuditDetailsRequestDL
    {
        #region Global Varialble
        static string tableName = "tbl_ICDRequestViolationAuditDetail";
        #endregion
        internal static List<ResponseIL> RequestProcess(ICDViolationAuditDetailsRequestIL ed)
        {
            List<ResponseIL> responses = null;

            try
            {
                string spName = "USP_ICDViolationAuditDetailsRequest";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ViolationAuditId", DbType.Int64, ed.ViolationAuditId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AuditTransactionId", DbType.Int64, ed.AuditTransactionId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ICDTrasactionId", DbType.String, ed.ICDTrasactionId, ParameterDirection.Input, 22));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageId", DbType.String, ed.MessageId, ParameterDirection.Input, 35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RequestDateTime", DbType.DateTime, ed.RequestDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionDateTime", DbType.DateTime, ed.TransactionDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ImageFirstName", DbType.String, ed.ImageFirstName, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ImageFirstPath", DbType.String, ed.ImageFirstPath, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ImageSecondName", DbType.String, ed.ImageSecondName, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ImageSecondPath", DbType.String, ed.ImageSecondPath, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ImageAVCFirstName", DbType.String, ed.ImageAVCFirstName, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ImageAVCFirstPath", DbType.String, ed.ImageAVCFirstPath, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ImageAVCSecondName", DbType.String, ed.ImageAVCSecondName, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ImageAVCSecondPath", DbType.String, ed.ImageAVCSecondPath, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DoubleWheelDetected", DbType.Boolean, ed.DoubleWheelDetected, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int64, ed.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneId", DbType.String, ed.LaneId, ParameterDirection.Input, 6));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AVC", DbType.String, ed.AVC, ParameterDirection.Input, 5));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MVC", DbType.String, ed.MVC, ParameterDirection.Input, 5));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AuditedVC", DbType.String, ed.AuditedVC, ParameterDirection.Input, 5));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ViolationAmount", DbType.Decimal, ed.ViolationAmount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ProcessedAmount", DbType.Decimal, ed.ProcessedAmount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ProcessedDate", DbType.DateTime, ed.ProcessedDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ImageReviewResult", DbType.Boolean, ed.ImageReviewResult, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ResponseCode", DbType.Int32, ed.ResponseCode, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ResponseResult", DbType.String, ed.ResponseResult, ParameterDirection.Input, 10));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ResponseDateTime", DbType.DateTime, ed.ResponseDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RequestStatusId", DbType.Int16, ed.RequestStatusId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageType", DbType.Boolean, ed.MessageType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IsImagesSended", DbType.Boolean, ed.IsImagesSended, ParameterDirection.Input));
                DataTable dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responses = ResponseIL.ConvertResponseList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
        }
        internal static List<ICDViolationAuditDetailsRequestIL> GetPendingRequest()
        {
            DataTable dt = new DataTable();
            List<ICDViolationAuditDetailsRequestIL> eds = new List<ICDViolationAuditDetailsRequestIL>();
            try
            {
                string spName = "USP_ICDViolationAuditDetailPendingRequest";
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

        #region Helper Methods
        private static ICDViolationAuditDetailsRequestIL CreateObjectFromDataRow(DataRow dr)
        {
            ICDViolationAuditDetailsRequestIL ed = new ICDViolationAuditDetailsRequestIL();

            if (dr["ViolationAuditId"] != DBNull.Value)
                ed.ViolationAuditId = Convert.ToInt64(dr["ViolationAuditId"]);

            if (dr["AuditDateTime"] != DBNull.Value)
                ed.AuditDateTime = Convert.ToDateTime(dr["AuditDateTime"]);

            if (dr["AVCClassId"] != DBNull.Value)
                ed.AVCClassId = Convert.ToInt16(dr["AVCClassId"]);

            if (dr["AVCNumberAxcel"] != DBNull.Value)
                ed.AVCNumberAxcel = Convert.ToInt16(dr["AVCNumberAxcel"]);

            if (dr["VehicleHeight"] != DBNull.Value)
                ed.VehicleHeight = Convert.ToDouble(dr["VehicleHeight"]);

            if (dr["VehicleLength"] != DBNull.Value)
                ed.VehicleLength = Convert.ToDouble(dr["VehicleLength"]);

            if (dr["DoubleWheelDetected"] != DBNull.Value)
                ed.DoubleWheelDetected = Convert.ToBoolean(dr["DoubleWheelDetected"]);

            if (dr["PlazaId"] != DBNull.Value)
                ed.PlazaId = Convert.ToInt64(dr["PlazaId"]);

            if (dr["LaneId"] != DBNull.Value)
                ed.LaneId = Convert.ToString(dr["LaneId"]);

            if (dr["ReaderReadTime"] != DBNull.Value)
                ed.ReaderReadTime = Convert.ToDateTime(dr["ReaderReadTime"]);

            if (dr["MessageId"] != DBNull.Value)
                ed.MessageId = Convert.ToString(dr["MessageId"]);

            if (dr["RequestDateTime"] != DBNull.Value)
                ed.RequestDateTime = Convert.ToDateTime(dr["RequestDateTime"]);

            if (dr["TransactionDateTime"] != DBNull.Value)
                ed.TransactionDateTime = Convert.ToDateTime(dr["TransactionDateTime"]);

            if (dr["ICDTrasactionId"] != DBNull.Value)
                ed.ICDTrasactionId = Convert.ToString(dr["ICDTrasactionId"]);

            if (dr["ImageFirstName"] != DBNull.Value)
                ed.ImageFirstName = Convert.ToString(dr["ImageFirstName"]);

            if (dr["ImageFirstPath"] != DBNull.Value)
                ed.ImageFirstPath = Convert.ToString(dr["ImageFirstPath"]);

            if (dr["ImageSecondName"] != DBNull.Value)
                ed.ImageSecondName = Convert.ToString(dr["ImageSecondName"]);

            if (dr["ImageSecondPath"] != DBNull.Value)
                ed.ImageSecondPath = Convert.ToString(dr["ImageSecondPath"]);

            if (dr["ImageAVCFirstName"] != DBNull.Value)
                ed.ImageAVCFirstName = Convert.ToString(dr["ImageAVCFirstName"]);

            if (dr["ImageAVCFirstPath"] != DBNull.Value)
                ed.ImageAVCFirstPath = Convert.ToString(dr["ImageAVCFirstPath"]);

            if (dr["ImageSecondName"] != DBNull.Value)
                ed.ImageAVCSecondName = Convert.ToString(dr["ImageAVCSecondName"]);

            if (dr["ImageAVCSecondPath"] != DBNull.Value)
                ed.ImageAVCSecondPath = Convert.ToString(dr["ImageAVCSecondPath"]);

            if (dr["AVC"] != DBNull.Value)
                ed.AVC = Convert.ToString(dr["AVC"]);

            if (dr["MVC"] != DBNull.Value)
                ed.MVC = Convert.ToString(dr["MVC"]);

            if (dr["AuditedVC"] != DBNull.Value)
                ed.AuditedVC = Convert.ToString(dr["AuditedVC"]);

            if (dr["ViolationAmount"] != DBNull.Value)
                ed.ViolationAmount = Convert.ToDecimal(dr["ViolationAmount"]);

            if (dr["ProcessedAmount"] != DBNull.Value)
                ed.ProcessedAmount = Convert.ToDecimal(dr["ProcessedAmount"]);

            if (dr["ProcessedDate"] != DBNull.Value)
                ed.ProcessedDate = Convert.ToDateTime(dr["ProcessedDate"]);

            if (dr["ImageReviewResult"] != DBNull.Value)
                ed.ImageReviewResult = Convert.ToBoolean(dr["ImageReviewResult"]);

            if (dr["ResponseCode"] != DBNull.Value)
                ed.ResponseCode = Convert.ToInt32(dr["ResponseCode"]);

            if (dr["ResponseResult"] != DBNull.Value)
                ed.ResponseResult = Convert.ToString(dr["ResponseResult"]);

            if (dr["ResponseDateTime"] != DBNull.Value)
                ed.ResponseDateTime = Convert.ToDateTime(dr["ResponseDateTime"]);

            if (dr["ErrorCode"] != DBNull.Value)
                ed.ErrorCode = Convert.ToInt32(dr["ErrorCode"]);

            if (dr["RequestStatusId"] != DBNull.Value)
                ed.RequestStatusId = Convert.ToInt16(dr["RequestStatusId"]);

            ed.RequestStatusName = Enum.GetName(typeof(SystemConstants.ICDRequestStatusType), (SystemConstants.ICDRequestStatusType)ed.RequestStatusId);
            return ed;
        }
        #endregion
    }
}
