using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class ICDNotificationResponseDL
    {
        #region Global Varialble
        static string tableName = "tbl_ICDNotificationHeader";
        #endregion

        internal static List<ResponseIL> Insert(ICDNotificationResponseIL ed)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_ICDNotificationHeaderInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageId", DbType.String, ed.MessageId, ParameterDirection.Input,35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@OrganizationId", DbType.String, ed.OrganizationId, ParameterDirection.Input,4));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionHeadDateTime", DbType.DateTime, ed.TransactionHeadDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ApiVersion", DbType.String, ed.ApiVersion, ParameterDirection.Input,10));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionDateTime", DbType.DateTime, ed.TransactionDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionType", DbType.String, ed.TransactionType, ParameterDirection.Input,20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionReferenceURL", DbType.String, ed.TransactionReferenceURL, ParameterDirection.Input,35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionReferenceId", DbType.String, ed.TransactionReferenceId, ParameterDirection.Input,35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionOrganizationId", DbType.String, ed.TransactionOrganizationId, ParameterDirection.Input,36));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionNote", DbType.String, ed.TransactionNote, ParameterDirection.Input,50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionId", DbType.String, ed.TransactionId, ParameterDirection.Input,22));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@NotifyDateTime", DbType.DateTime, ed.NotifyDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@NotifyResult", DbType.String, ed.NotifyResult, ParameterDirection.Input,20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@NotifyPlazaId", DbType.String, ed.NotifyPlazaId, ParameterDirection.Input,6));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@NotifyNPCIErrCode", DbType.Decimal, ed.NotifyNPCIErrCode, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TagID", DbType.String, ed.TagId, ParameterDirection.Input,32));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TID", DbType.String, ed.TID, ParameterDirection.Input,32));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehicleRegistrationNumber", DbType.String, ed.VehicleRegistrationNumber, ParameterDirection.Input,20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionVehicleClass", DbType.String, ed.TransactionVehicleClass, ParameterDirection.Input,5));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IsCommercialVehicle", DbType.Boolean, ed.IsCommercialVehicle, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Tollfare", DbType.Decimal, ed.Tollfare, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FareType", DbType.String, ed.FareType, ParameterDirection.Input,20));
                DataTable dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responses = ResponseIL.ConvertResponseList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responses;
        }
    }
}
