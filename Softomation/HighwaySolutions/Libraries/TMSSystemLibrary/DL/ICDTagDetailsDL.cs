using System;
using System.Text;
using System.Data;
using System.Linq;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class ICDTagDetailsDL
    {
        #region Global Varialble
        static string tableName = "tbl_ICDTagDetailsResponse";
        #endregion

        internal static List<ResponseIL> Insert(ICDTagDetailsIL ed)
        {
            List<ResponseIL> responses = null;

            try
            {
                string spName = "USP_ICDTagDetailsResponseInsert";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MessageId", DbType.String, ed.MessageId, ParameterDirection.Input, 35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@OrganizationId", DbType.String, ed.OrganizationId, ParameterDirection.Input, 4));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionHeadDatetime", DbType.DateTime, ed.TransactionHeadDatetime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ApiVersion", DbType.String, ed.ApiVersion, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionId", DbType.String, ed.TransactionId, ParameterDirection.Input, 22));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionNote", DbType.String, ed.TransactionNote, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionOrganizationId", DbType.String, ed.TransactionOrganizationId, ParameterDirection.Input, 36));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionReferenceId", DbType.String, ed.TransactionReferenceId, ParameterDirection.Input, 35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionReferenceURL", DbType.String, ed.TransactionReferenceURL, ParameterDirection.Input, 35));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionDateTime", DbType.DateTime, ed.TransactionDateTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionType", DbType.String, ed.TransactionType, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ResponseCode", DbType.Int32, ed.ResponseCode, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ResponseResult", DbType.String, ed.ResponseResult, ParameterDirection.Input, 10));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SuccessRequestCount", DbType.Int32, ed.SuccessRequestCount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TotalRequestCount", DbType.Int32, ed.TotalRequestCount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ResponseTime", DbType.DateTime, ed.ResponseTime, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionErrorCode", DbType.Int32, ed.TransactionErrorCode, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TagId", DbType.String, ed.TagId, ParameterDirection.Input,50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TID", DbType.String, ed.TID, ParameterDirection.Input,50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehicleRegistrationNumber", DbType.String, ed.VehicleRegistrationNumber, ParameterDirection.Input,50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TransactionVehicleClass", DbType.String, ed.TransactionVehicleClass, ParameterDirection.Input,5));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@TagStatus", DbType.String, ed.TagStatus, ParameterDirection.Input,1));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehicleErrorCode", DbType.Int32, ed.VehicleErrorCode, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IsCommercialVehicle", DbType.Boolean, ed.IsCommercialVehicle, ParameterDirection.Input));
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
