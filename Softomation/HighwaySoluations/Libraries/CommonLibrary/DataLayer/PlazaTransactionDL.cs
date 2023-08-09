using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class PlazaTransactionDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_LaneTransaction";
        #endregion

        internal static PlazaTransactionIL EntryInsert(LaneTransactionIL laneTrans)
        {
            PlazaTransactionIL plazaData = new PlazaTransactionIL();
            try
            {

                string spName = "USP_LaneTransactionEntryInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaTransId", DbType.Int64, laneTrans.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int16, laneTrans.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, laneTrans.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneNumber", DbType.Int16, laneTrans.LaneNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneType", DbType.Int16, laneTrans.LaneType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneUsed", DbType.Int16, laneTrans.LaneUsed, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftId", DbType.Int16, laneTrans.ShiftId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int16, laneTrans.TCUserId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlateNumber", DbType.String, laneTrans.PlateNumber.ToUpper().Trim(), ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MappingClassId", DbType.Int16, laneTrans.MappingClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AVCClassId", DbType.Int16, laneTrans.AvcClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IHMCLClassId", DbType.Int16, laneTrans.IhmclClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionTypeId", DbType.Int16, laneTrans.TransactionTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PaymentTypeId", DbType.Int16, laneTrans.PaymentTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ExemptTypeId", DbType.Int16, laneTrans.ExemptTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReferenceNumber", DbType.String, laneTrans.ReferenceNumber.ToUpper().Trim(), ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionAmount", DbType.Decimal, laneTrans.TransactionAmount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionTimeStamp", DbType.DateTime, laneTrans.TransactionTimeStamp, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionImage", DbType.String, laneTrans.TransactionImage, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionVideo", DbType.String, laneTrans.TransactionVideo, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedRequired", DbType.Int16, laneTrans.ReveiwedRequired, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReferenceTransactionId", DbType.Int64, laneTrans.ReferenceTransactionId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Chargeable", DbType.Int16, laneTrans.Chargeable, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Overweight", DbType.Int16, laneTrans.Overweight, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Penalty", DbType.Int16, laneTrans.Penalty, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@JourneyType", DbType.Int16, laneTrans.JourneyType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedStatus", DbType.Int16, laneTrans.ReveiwedStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionStatus", DbType.Int16, laneTrans.TransactionStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TowVehicle", DbType.Int16, laneTrans.TowVehicle, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    plazaData = CreateObjectFromDataRow(dr);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return plazaData;
        }
        internal static PlazaTransactionIL ExitInsert(LaneTransactionIL laneTrans)
        {
            PlazaTransactionIL plazaData = new PlazaTransactionIL();
            try
            {

                string spName = "USP_LaneTransactionExitInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaTransId", DbType.Int64, laneTrans.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int16, laneTrans.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, laneTrans.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneNumber", DbType.Int16, laneTrans.LaneNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneType", DbType.Int16, laneTrans.LaneType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneUsed", DbType.Int16, laneTrans.LaneUsed, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ShiftId", DbType.Int16, laneTrans.ShiftId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int16, laneTrans.TCUserId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlateNumber", DbType.String, laneTrans.PlateNumber.ToUpper().Trim(), ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MappingClassId", DbType.Int16, laneTrans.MappingClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AVCClassId", DbType.Int16, laneTrans.AvcClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IHMCLClassId", DbType.Int16, laneTrans.IhmclClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionTypeId", DbType.Int16, laneTrans.TransactionTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PaymentTypeId", DbType.Int16, laneTrans.PaymentTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ExemptTypeId", DbType.Int16, laneTrans.ExemptTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReferenceNumber", DbType.String, laneTrans.ReferenceNumber.ToUpper().Trim(), ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionAmount", DbType.Decimal, laneTrans.TransactionAmount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionTimeStamp", DbType.DateTime, laneTrans.TransactionTimeStamp, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionImage", DbType.String, laneTrans.TransactionImage, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionVideo", DbType.String, laneTrans.TransactionVideo, ParameterDirection.Input, 255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedRequired", DbType.Int16, laneTrans.ReveiwedRequired, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReferenceTransactionId", DbType.Int64, laneTrans.ReferenceTransactionId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Chargeable", DbType.Int16, laneTrans.Chargeable, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Overweight", DbType.Int16, laneTrans.Overweight, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Penalty", DbType.Int16, laneTrans.Penalty, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@JourneyType", DbType.Int16, laneTrans.JourneyType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReveiwedStatus", DbType.Int16, laneTrans.ReveiwedStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionStatus", DbType.Int16, laneTrans.TransactionStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TowVehicle", DbType.Int16, laneTrans.TowVehicle, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    plazaData = CreateObjectFromDataRow(dr);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return plazaData;
        }

        #region Get Methods
        internal static PlazaTransactionIL GetByEntryId(Int64 EntryId)
        {
            PlazaTransactionIL laneData = new PlazaTransactionIL();
            try
            {
                string spName = "USP_LaneTransactionEntryGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int64, EntryId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    laneData = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return laneData;
        }
        internal static PlazaTransactionIL GetByExitId(Int64 EntryId)
        {
            PlazaTransactionIL laneData = new PlazaTransactionIL();
            try
            {
                string spName = "USP_LaneTransactionExitGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int64, EntryId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    laneData = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return laneData;
        }
        internal static List<PlazaTransactionIL> GetEntryPendingDataByPlaza(Int16 PlazaId,Int64 LastSyncId)
        {
            List<PlazaTransactionIL> laneData = new List<PlazaTransactionIL>();
            try
            {
                string spName = "USP_LaneTransactionEntryGetByPlazaId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LastSyncId", DbType.Int64, LastSyncId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    laneData.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return laneData;
        }
        internal static DataTable PendingPlazaTransList()
        {
            try
            {
                string spName = "USP_PendingPlazaTransList";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;
        }
        #endregion

        #region Helper Methods
        private static PlazaTransactionIL CreateObjectFromDataRow(DataRow dr)
        {
            PlazaTransactionIL lane = new PlazaTransactionIL();

            if (dr["EntryId"] != DBNull.Value)
                lane.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["PlazaTransId"] != DBNull.Value)
                lane.PlazaTransId = Convert.ToInt64(dr["PlazaTransId"]);

            if (dr["ClientId"] != DBNull.Value)
                lane.ClientId = Convert.ToInt16(dr["ClientId"]);

            if (dr["PlazaId"] != DBNull.Value)
                lane.PlazaId = Convert.ToInt16(dr["PlazaId"]);

            if (dr["LaneNumber"] != DBNull.Value)
                lane.LaneNumber = Convert.ToInt16(dr["LaneNumber"]);

            if (dr["LaneType"] != DBNull.Value)
                lane.LaneType = Convert.ToInt16(dr["LaneType"]);

            if (dr["ShiftId"] != DBNull.Value)
                lane.ShiftId = Convert.ToInt16(dr["ShiftId"]);

            if (dr["UserId"] != DBNull.Value)
                lane.TCUserId = Convert.ToInt64(dr["UserId"]);

            if (dr["PlateNumber"] != DBNull.Value)
                lane.PlateNumber = Convert.ToString(dr["PlateNumber"]);

            if (dr["MappingClassId"] != DBNull.Value)
                lane.MappingClassId = Convert.ToInt16(dr["MappingClassId"]);

            if (dr["AVCClassId"] != DBNull.Value)
                lane.AvcClassId = Convert.ToInt16(dr["AVCClassId"]);

            if (dr["IHMCLClassId"] != DBNull.Value)
                lane.IhmclClassId = Convert.ToInt16(dr["IHMCLClassId"]);

            if (dr["TransactionTypeId"] != DBNull.Value)
                lane.TransactionTypeId = Convert.ToInt16(dr["TransactionTypeId"]);

            if (dr["PaymentTypeId"] != DBNull.Value)
                lane.PaymentTypeId = Convert.ToInt16(dr["PaymentTypeId"]);

            if (dr["ExemptTypeId"] != DBNull.Value)
                lane.ExemptTypeId = Convert.ToInt16(dr["ExemptTypeId"]);

            if (dr["ReferenceNumber"] != DBNull.Value)
                lane.ReferenceNumber = Convert.ToString(dr["ReferenceNumber"]);

            if (dr["TransactionAmount"] != DBNull.Value)
                lane.TransactionAmount = Convert.ToDecimal(dr["TransactionAmount"]);

            if (dr["TransactionTimeStamp"] != DBNull.Value)
                lane.TransactionTimeStamp = Convert.ToDateTime(dr["TransactionTimeStamp"]);

            if (dr["TransactionImage"] != DBNull.Value)
                lane.TransactionImage = Convert.ToString(dr["TransactionImage"]);

            if (dr["TransactionVideo"] != DBNull.Value)
                lane.TransactionVideo = Convert.ToString(dr["TransactionVideo"]);

            if (dr["ReferenceTransactionId"] != DBNull.Value)
                lane.ReferenceTransactionId = Convert.ToInt64(dr["ReferenceTransactionId"]);

            if (dr["ReveiwedRequired"] != DBNull.Value)
                lane.ReveiwedRequired = Convert.ToInt16(dr["ReveiwedRequired"]);

            if (dr["ReveiwedStatus"] != DBNull.Value)
                lane.ReveiwedStatus = Convert.ToInt16(dr["ReveiwedStatus"]);

            if (dr["Chargeable"] != DBNull.Value)
                lane.Chargeable = Convert.ToInt16(dr["Chargeable"]);

            if (dr["TowVehicle"] != DBNull.Value)
                lane.TowVehicle = Convert.ToInt16(dr["TowVehicle"]);

            if (dr["JourneyType"] != DBNull.Value)
                lane.JourneyType = Convert.ToInt16(dr["JourneyType"]);

            if (dr["Overweight"] != DBNull.Value)
                lane.Overweight = Convert.ToInt16(dr["Overweight"]);

            if (dr["Penalty"] != DBNull.Value)
                lane.Penalty = Convert.ToInt16(dr["Penalty"]);

            if (dr["TransactionStatus"] != DBNull.Value)
                lane.TransactionStatus = Convert.ToInt16(dr["TransactionStatus"]);
            return lane;
        }
        private static LaneTransactionIL CreateObjectForDisplayFromDataRow(DataRow dr)
        {
            LaneTransactionIL lane = new LaneTransactionIL();

            if (dr["EntryId"] != DBNull.Value)
                lane.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["MasterId"] != DBNull.Value)
                lane.MasterId = Convert.ToInt64(dr["MasterId"]);

            if (dr["LaneTransId"] != DBNull.Value)
                lane.LaneTransId = Convert.ToInt64(dr["LaneTransId"]);

            if (dr["ClientId"] != DBNull.Value)
                lane.ClientId = Convert.ToInt16(dr["ClientId"]);

            if (dr["ClientName"] != DBNull.Value)
                lane.ClientName = Convert.ToString(dr["ClientName"]);

            if (dr["PlazaId"] != DBNull.Value)
                lane.PlazaId = Convert.ToInt16(dr["PlazaId"]);

            if (dr["PlazaName"] != DBNull.Value)
                lane.PlazaName = Convert.ToString(dr["PlazaName"]);

            if (dr["LaneNumber"] != DBNull.Value)
                lane.LaneNumber = Convert.ToInt16(dr["LaneNumber"]);

            if (dr["LaneType"] != DBNull.Value)
                lane.LaneType = Convert.ToInt16(dr["LaneType"]);

            if (dr["LaneTypeName"] != DBNull.Value)
                lane.LaneTypeName = Convert.ToString(dr["LaneTypeName"]);

            if (dr["ShiftId"] != DBNull.Value)
                lane.ShiftId = Convert.ToInt16(dr["ShiftId"]);

            if (dr["UserId"] != DBNull.Value)
                lane.TCUserId = Convert.ToInt64(dr["UserId"]);

            if (dr["LoginId"] != DBNull.Value)
                lane.TCLoginId = Convert.ToString(dr["LoginId"]);

            if (dr["PlateNumber"] != DBNull.Value)
                lane.PlateNumber = Convert.ToString(dr["PlateNumber"]);

            if (dr["MappingClassId"] != DBNull.Value)
                lane.MappingClassId = Convert.ToInt16(dr["MappingClassId"]);

            if (dr["MappingClassName"] != DBNull.Value)
                lane.MappingClassName = Convert.ToString(dr["MappingClassName"]);

            if (dr["AVCClassId"] != DBNull.Value)
                lane.AvcClassId = Convert.ToInt16(dr["AVCClassId"]);

            if (dr["AVCClassName"] != DBNull.Value)
                lane.AvcClassName = Convert.ToString(dr["AVCClassName"]);

            if (dr["TransactionTypeId"] != DBNull.Value)
                lane.TransactionTypeId = Convert.ToInt16(dr["TransactionTypeId"]);

            if (dr["TransactionTypeName"] != DBNull.Value)
                lane.TransactionTypeName = Convert.ToString(dr["TransactionTypeName"]);

            if (dr["ExemptTypeId"] != DBNull.Value)
                lane.ExemptTypeId = Convert.ToInt16(dr["ExemptTypeId"]);

            if (dr["ExemptTypeName"] != DBNull.Value)
                lane.ExemptTypeName = Convert.ToString(dr["ExemptTypeName"]);

            if (dr["ReferenceNumber"] != DBNull.Value)
                lane.ReferenceNumber = Convert.ToString(dr["ReferenceNumber"]);

            if (dr["TransactionAmount"] != DBNull.Value)
                lane.TransactionAmount = Convert.ToDecimal(dr["TransactionAmount"]);

            if (dr["TransactionTimeStamp"] != DBNull.Value)
                lane.TransactionTimeStamp = Convert.ToDateTime(dr["TransactionTimeStamp"]);

            if (dr["TransactionImage"] != DBNull.Value)
                lane.TransactionImage = Convert.ToString(dr["TransactionImage"]);

            if (dr["TransactionVideo"] != DBNull.Value)
                lane.TransactionVideo = Convert.ToString(dr["TransactionVideo"]);

            if (dr["ReferenceTransactionId"] != DBNull.Value)
                lane.ReferenceTransactionId = Convert.ToInt64(dr["ReferenceTransactionId"]);

            if (dr["ReveiwedStatus"] != DBNull.Value)
                lane.ReveiwedStatus = Convert.ToInt16(dr["ReveiwedStatus"]);

            return lane;
        }
        private static LaneTransactionIL CreateObjectFromDataRowForUnreviewFilter(DataRow dr)
        {
            LaneTransactionIL lane = new LaneTransactionIL();

            if (dr["EntryId"] != DBNull.Value)
                lane.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["LaneNumber"] != DBNull.Value)
                lane.LaneNumber = Convert.ToInt16(dr["LaneNumber"]);

            if (dr["ShiftId"] != DBNull.Value)
                lane.ShiftId = Convert.ToInt16(dr["ShiftId"]);

            if (dr["UserId"] != DBNull.Value)
                lane.TCUserId = Convert.ToInt64(dr["UserId"]);

            if (dr["LoginId"] != DBNull.Value)
                lane.TCLoginId = Convert.ToString(dr["LoginId"]);

            if (dr["PlateNumber"] != DBNull.Value)
                lane.PlateNumber = Convert.ToString(dr["PlateNumber"]);

            if (dr["MappingClassId"] != DBNull.Value)
                lane.MappingClassId = Convert.ToInt16(dr["MappingClassId"]);

            if (dr["MappingClassName"] != DBNull.Value)
                lane.MappingClassName = Convert.ToString(dr["MappingClassName"]);

            if (dr["AVCClassId"] != DBNull.Value)
                lane.AvcClassId = Convert.ToInt16(dr["AVCClassId"]);

            if (dr["AVCClassName"] != DBNull.Value)
                lane.AvcClassName = Convert.ToString(dr["AVCClassName"]);

            if (dr["TransactionTypeId"] != DBNull.Value)
                lane.TransactionTypeId = Convert.ToInt16(dr["TransactionTypeId"]);

            if (dr["TransactionTypeName"] != DBNull.Value)
                lane.TransactionTypeName = Convert.ToString(dr["TransactionTypeName"]);

            if (dr["ExemptTypeId"] != DBNull.Value)
                lane.ExemptTypeId = Convert.ToInt16(dr["ExemptTypeId"]);

            if (dr["ExemptTypeName"] != DBNull.Value)
                lane.ExemptTypeName = Convert.ToString(dr["ExemptTypeName"]);

            if (dr["TransactionAmount"] != DBNull.Value)
                lane.TransactionAmount = Convert.ToDecimal(dr["TransactionAmount"]);

            if (dr["TransactionTimeStamp"] != DBNull.Value)
                lane.TransactionTimeStamp = Convert.ToDateTime(dr["TransactionTimeStamp"]);

            if (dr["TransactionImage"] != DBNull.Value)
                lane.TransactionImage = Convert.ToString(dr["TransactionImage"]);

            if (dr["TransactionVideo"] != DBNull.Value)
                lane.TransactionVideo = Convert.ToString(dr["TransactionVideo"]);

            return lane;
        }
        #endregion
    }
}
