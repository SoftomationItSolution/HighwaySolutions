using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;
namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class LaneTransactionDL
    {
        #region Global Varialble
        static string tableName = "tbl_LaneTransaction";
        #endregion

        internal static List<ResponseIL> Insert(LaneTransactionIL lane)
        {
            List<ResponseIL> responses = null;
            try
            {

                string spName = "USP_LaneTransactionInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MasterTransactionId", DbType.Int64, lane.MasterTransactionId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaTransactionId", DbType.Int64, lane.PlazaTransactionId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneTransactionId", DbType.Int64, lane.LaneTransactionId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SystemIntegratorId", DbType.Int16, lane.SystemIntegratorId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@JourneyId", DbType.Int32, lane.JourneyId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, lane.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneId", DbType.Int16, lane.LaneId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneTypeId", DbType.Int16, lane.LaneTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneStatusId", DbType.Int16, lane.LaneStatusId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneDirectionId", DbType.Int16, lane.LaneDirectionId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftId", DbType.Int16, lane.ShiftId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlateNumber", DbType.String, lane.PlateNumber, ParameterDirection.Input,10));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehicleClassId", DbType.Int16, lane.VehicleClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehicleSubClassId", DbType.Int16, lane.VehicleSubClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehicleAvcClassId", DbType.Int16, lane.VehicleAvcClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionTypeId", DbType.Int16, lane.TransactionTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PaymentTypeId", DbType.Int16, lane.PaymentTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ExemptTypeId", DbType.Int16, lane.ExemptTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ExemptSubTypeId", DbType.Int16, lane.ExemptSubTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ExemptSubTypeId", DbType.Int16, lane.ExemptSubTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReceiptNumber", DbType.String, lane.ReceiptNumber, ParameterDirection.Input,50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SmartCardNumber", DbType.String, lane.SmartCardNumber, ParameterDirection.Input,20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TagClassId", DbType.Int16, lane.TagClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TagPlateNumber", DbType.String, lane.TagPlateNumber, ParameterDirection.Input,10));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TagId", DbType.String, lane.TagId, ParameterDirection.Input,24));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TagEPC", DbType.String, lane.TagEPC, ParameterDirection.Input,24));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TagReadDateTime", DbType.DateTime2, lane.TagReadDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TagReadBy", DbType.Int16, lane.TagReadBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PermissibleVehicleWeight", DbType.Decimal, lane.PermissibleVehicleWeight, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ActualVehicleWeight", DbType.Decimal, lane.ActualVehicleWeight, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@OverWeightAmount", DbType.Decimal, lane.OverWeightAmount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TagPenaltyAmount", DbType.Decimal, lane.TagPenaltyAmount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionAmount", DbType.Decimal, lane.TransactionAmount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionDateTime", DbType.DateTime2, lane.TransactionDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionFrontImage", DbType.String, lane.TransactionFrontImage, ParameterDirection.Input,255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionBackImage", DbType.String, lane.TransactionBackImage, ParameterDirection.Input,255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionAvcImage", DbType.String, lane.TransactionAvcImage, ParameterDirection.Input,255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionVideo", DbType.String, lane.TransactionVideo, ParameterDirection.Input,255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ExemptionProofImage", DbType.String, lane.ExemptionProofImage, ParameterDirection.Input,255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DestinationPlazaId", DbType.Int16, lane.DestinationPlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int64, lane.UserId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LoginId", DbType.String, lane.LoginId, ParameterDirection.Input,10));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReturnJourney", DbType.Boolean, lane.ReturnJourney, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ExcessJourney", DbType.Boolean, lane.ExcessJourney, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@BarrierAutoClose", DbType.Boolean, lane.BarrierAutoClose, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TowVehicle", DbType.Boolean, lane.TowVehicle, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FleetTranscation", DbType.Boolean, lane.FleetTranscation, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FleetCount", DbType.Int16, lane.FleetCount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionStatus", DbType.Boolean, lane.TransactionStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedRequired", DbType.Boolean, lane.ReveiwedRequired, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReceivedDateTime", DbType.Boolean, lane.ReceivedDateTime, ParameterDirection.Input));
                DataTable dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responses = ResponseIL.ConvertResponseList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
        }

        internal static List<LaneTransactionIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<LaneTransactionIL> laneList = new List<LaneTransactionIL>();
            try
            {
                string spName = "USP_LaneTransactionGetALL";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    laneList.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return laneList;

        }

        #region Helper Methods
        private static LaneTransactionIL CreateObjectFromDataRow(DataRow dr)
        {
            LaneTransactionIL ld = new LaneTransactionIL();

            if (dr["MasterTransactionId"] != DBNull.Value)
                ld.MasterTransactionId = Convert.ToInt64(dr["MasterTransactionId"]);

            if (dr["PlazaTransactionId"] != DBNull.Value)
                ld.PlazaTransactionId = Convert.ToInt64(dr["PlazaTransactionId"]);

            if (dr["LaneTransactionId"] != DBNull.Value)
                ld.LaneTransactionId = Convert.ToInt64(dr["LaneTransactionId"]);

            if (dr["SystemIntegratorId"] != DBNull.Value)
                ld.SystemIntegratorId = Convert.ToInt16(dr["SystemIntegratorId"]);

            if (dr["JourneyId"] != DBNull.Value)
                ld.JourneyId = Convert.ToInt16(dr["JourneyId"]);

            if (dr["PlazaId"] != DBNull.Value)
                ld.PlazaId = Convert.ToInt16(dr["PlazaId"]);

            if (dr["PlazaName"] != DBNull.Value)
                ld.PlazaName = Convert.ToString(dr["PlazaName"]);

            if (dr["LaneId"] != DBNull.Value)
                ld.LaneId = Convert.ToInt16(dr["LaneId"]);

            if (dr["LaneNumber"] != DBNull.Value)
                ld.LaneNumber = "Lane-" + Convert.ToString(dr["LaneNumber"]);

           

            if (dr["LaneTypeId"] != DBNull.Value)
                ld.LaneTypeId = Convert.ToInt16(dr["LaneTypeId"]);

            if (dr["LaneStatusId"] != DBNull.Value)
                    ld.LaneStatusId = Convert.ToBoolean(dr["LaneStatusId"]);

            if (dr["LaneDirectionId"] != DBNull.Value)
                ld.LaneDirectionId = Convert.ToInt16(dr["LaneDirectionId"]);
            if (dr["ShiftId"] != DBNull.Value)
            {
                ld.ShiftId = Convert.ToInt16(dr["ShiftId"]);
                ld.ShiftNumber = "Shift-" + Convert.ToString(dr["ShiftId"]);
            }
            if (dr["PlateNumber"] != DBNull.Value)
                ld.PlateNumber = Convert.ToString(dr["PlateNumber"]);

            if (dr["VehicleClassId"] != DBNull.Value)
                ld.VehicleClassId = Convert.ToInt16(dr["VehicleClassId"]);

            if (dr["VehicleSubClassId"] != DBNull.Value)
                ld.VehicleSubClassId = Convert.ToInt16(dr["VehicleSubClassId"]);

            if (dr["VehicleAvcClassId"] != DBNull.Value)
                ld.VehicleAvcClassId = Convert.ToInt16(dr["VehicleAvcClassId"]);

            if (dr["TransactionTypeId"] != DBNull.Value)
                ld.TransactionTypeId = Convert.ToInt16(dr["TransactionTypeId"]);

            if (dr["PaymentTypeId"] != DBNull.Value)
                ld.PaymentTypeId = Convert.ToInt16(dr["PaymentTypeId"]);

            if (dr["ExemptTypeId"] != DBNull.Value)
                ld.ExemptTypeId = Convert.ToInt16(dr["ExemptTypeId"]);

            if (dr["ExemptSubTypeId"] != DBNull.Value)
                ld.ExemptSubTypeId = Convert.ToInt16(dr["ExemptSubTypeId"]);
            
            if (dr["ReceiptNumber"] != DBNull.Value)
                ld.ReceiptNumber = Convert.ToString(dr["ReceiptNumber"]);

            if (dr["SmartCardNumber"] != DBNull.Value)
                ld.SmartCardNumber = Convert.ToString(dr["SmartCardNumber"]);

            if (dr["TagClassId"] != DBNull.Value)
                ld.TagClassId = Convert.ToInt16(dr["TagClassId"]);

            if (dr["TagPlateNumber"] != DBNull.Value)
                ld.TagPlateNumber = Convert.ToString(dr["TagPlateNumber"]);

            if (dr["TagId"] != DBNull.Value)
                ld.TagId = Convert.ToString(dr["TagId"]);

            if (dr["TagEPC"] != DBNull.Value)
                ld.TagEPC = Convert.ToString(dr["TagEPC"]);

            if (dr["TagReadDateTime"] != DBNull.Value)
                ld.TagReadDateTime = Convert.ToDateTime(dr["TagReadDateTime"]);

            if (dr["TagReadBy"] != DBNull.Value)
                ld.TagReadBy = Convert.ToInt16(dr["TagReadBy"]);

            if (dr["PermissibleVehicleWeight"] != DBNull.Value)
                ld.PermissibleVehicleWeight = Convert.ToDecimal(dr["PermissibleVehicleWeight"]);

            if (dr["ActualVehicleWeight"] != DBNull.Value)
                ld.ActualVehicleWeight = Convert.ToDecimal(dr["ActualVehicleWeight"]);

            if (dr["OverWeightAmount"] != DBNull.Value)
                ld.OverWeightAmount = Convert.ToDecimal(dr["OverWeightAmount"]);

            if (dr["TagPenaltyAmount"] != DBNull.Value)
                ld.TagPenaltyAmount = Convert.ToDecimal(dr["TagPenaltyAmount"]);

            if (dr["TransactionAmount"] != DBNull.Value)
                ld.TransactionAmount = Convert.ToDecimal(dr["TransactionAmount"]);

            if (dr["TransactionDateTime"] != DBNull.Value)
            {
                ld.TransactionDateTime = Convert.ToDateTime(dr["TransactionDateTime"]);
                ld.TransactionDateTimeStamp = ld.TransactionDateTime.ToString(CommonLibrary.Constants.DateTimeFormat24H);
            }

            if (dr["TransactionFrontImage"] != DBNull.Value)
                ld.TransactionFrontImage = Convert.ToString(dr["TransactionFrontImage"]);
            
            if (dr["TransactionBackImage"] != DBNull.Value)
                ld.TransactionBackImage = Convert.ToString(dr["TransactionBackImage"]);

            if (dr["TransactionAvcImage"] != DBNull.Value)
                ld.TransactionAvcImage = Convert.ToString(dr["TransactionAvcImage"]);

            if (dr["TransactionVideo"] != DBNull.Value)
                ld.TransactionVideo = Convert.ToString(dr["TransactionVideo"]);

            if (dr["ExemptionProofImage"] != DBNull.Value)
                ld.ExemptionProofImage = Convert.ToString(dr["ExemptionProofImage"]);

            if (dr["ExemptionProofImage"] != DBNull.Value)
                ld.ExemptionProofImage = Convert.ToString(dr["ExemptionProofImage"]);

            if (dr["DestinationPlazaId"] != DBNull.Value)
                ld.DestinationPlazaId = Convert.ToInt16(dr["DestinationPlazaId"]);
            
            if (dr["UserId"] != DBNull.Value)
                ld.UserId = Convert.ToInt64(dr["UserId"]);

            if (dr["LoginId"] != DBNull.Value)
                ld.LoginId = Convert.ToString(dr["LoginId"]);

            if (dr["ReturnJourney"] != DBNull.Value)
                ld.ReturnJourney = Convert.ToBoolean(dr["ReturnJourney"]);

            if (dr["ExcessJourney"] != DBNull.Value)
                ld.ExcessJourney = Convert.ToBoolean(dr["ExcessJourney"]);

            if (dr["BarrierAutoClose"] != DBNull.Value)
                ld.BarrierAutoClose = Convert.ToBoolean(dr["BarrierAutoClose"]);

            if (dr["TowVehicle"] != DBNull.Value)
                ld.TowVehicle = Convert.ToBoolean(dr["TowVehicle"]);

            if (dr["FleetTranscation"] != DBNull.Value)
                ld.FleetTranscation = Convert.ToBoolean(dr["FleetTranscation"]);

            if (dr["FleetCount"] != DBNull.Value)
                ld.FleetCount = Convert.ToInt16(dr["FleetCount"]);

            if (dr["TransactionStatus"] != DBNull.Value)
                ld.TransactionStatus = Convert.ToBoolean(dr["TransactionStatus"]);

            if (dr["ReveiwedRequired"] != DBNull.Value)
                ld.ReveiwedRequired = Convert.ToBoolean(dr["ReveiwedRequired"]);

            if (dr["ReveiwedStatus"] != DBNull.Value)
                ld.ReveiwedStatus = Convert.ToBoolean(dr["ReveiwedStatus"]);

            //if (dr["ReveiwedPlateNumber"] != DBNull.Value)
            //    ld.ReveiwedPlateNumber = Convert.ToBoolean(dr["ReveiwedPlateNumber"]);

            return ld;
        }
        #endregion
    }
}
