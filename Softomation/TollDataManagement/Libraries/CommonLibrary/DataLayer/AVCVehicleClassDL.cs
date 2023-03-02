using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class AVCVehicleClassDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_AVCClass";
        #endregion


        internal static List<ResponceIL> InsertUpdate(AVCVehicleClassIL avc)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_AVCVehicleClassInsertUpdate";
                //DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, avc.EntryId, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, avc.ClientId, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaName", DbType.String, avc.PlazaName, ParameterDirection.Input, 100));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaServerIpAddress", DbType.String, avc.PlazaServerIpAddress, ParameterDirection.Input, 20));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataSendAPI", DbType.String, avc.DataSendAPI, ParameterDirection.Input, 200));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataReceiveAPI", DbType.String, avc.DataReceiveAPI, ParameterDirection.Input, 200));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FTPPath", DbType.String, avc.FTPPath, ParameterDirection.Input, 200));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FTPLoginId", DbType.String, avc.FTPLoginId, ParameterDirection.Input, 20));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FTPPassword", DbType.String, avc.FTPPassword, ParameterDirection.Input, 20));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, avc.DataStatus, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, avc.CreatedBy, ParameterDirection.Input));
                //command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CDateTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                //dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }

        internal static List<ResponceIL> PInsertUpdate(AVCVehicleClassIL avc)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_AVCInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int16, avc.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AvcClassId", DbType.Int16, avc.AvcClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AvcClassName", DbType.String, avc.AvcClassName, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AvcClassDescription", DbType.String, avc.AvcClassDescription, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MinAxleCount", DbType.Int16, avc.MinAxleCount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MaxAxleCount", DbType.Int16, avc.MaxAxleCount, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MinHeight", DbType.Decimal, avc.MinHeight, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MaxHeight", DbType.Decimal, avc.MaxHeight, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MinWidth", DbType.Decimal, avc.MinWidth, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MaxWidth", DbType.Decimal, avc.MaxWidth, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MinLength", DbType.Decimal, avc.MinLength, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MaxLength", DbType.Decimal, avc.MaxLength, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, avc.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, avc.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, avc.CreatedDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, avc.ModifiedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, avc.ModifiedDate, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }

        internal static List<ResponceIL> ImportData(CommonIL common, DataTable ImportDT, string SessionId, String fileName)
        {
            List<ResponceIL> responces = null;

            DataColumn NewColumnSessionId = new DataColumn("SessionId", typeof(System.String));
            NewColumnSessionId.DefaultValue = SessionId;
            ImportDT.Columns.Add(NewColumnSessionId);
            if (BulkCopy(ImportDT, "tbl_TempImportClass"))
            {
                string spName = "USP_AVCVehicleClassUpload";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FileName", DbType.String, fileName, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SessionId", DbType.String, SessionId, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int32, common.ClientId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, common.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, common.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CDateTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }

            return responces;
        }

        #region Get Methods
        internal static List<AVCVehicleClassIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<AVCVehicleClassIL> avcClassess = new List<AVCVehicleClassIL>();
            try
            {
                string spName = "USP_AVCVehicleClassGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    avcClassess.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return avcClassess;

        }

        internal static AVCVehicleClassIL GetByClassId(Int32 ClassId)
        {
            DataTable dt = new DataTable();
            AVCVehicleClassIL avc = new AVCVehicleClassIL();
            try
            {
                string spName = "USP_AVCVehicleClassGetbyClassId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@AvcClassId", DbType.Int32, ClassId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    avc = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return avc;
        }

        internal static List<AVCVehicleClassIL> GetByClientId(Int32 ClientId)
        {
            DataTable dt = new DataTable();
            List<AVCVehicleClassIL> avcClassess = new List<AVCVehicleClassIL>();
            try
            {
                string spName = "USP_AVCVehicleClassGetbyClientId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ClientId", DbType.Int16, ClientId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    avcClassess.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return avcClassess;
        }
        #endregion

        #region Helper Methods

        private static bool BulkCopy(DataTable dt, string table)
        {
            bool error = true;
            SqlConnection con = (SqlConnection)DBAccessor.CreateConnection();
            con.Open();
            using (SqlBulkCopy bulcopy = new SqlBulkCopy(con))
            {
                bulcopy.DestinationTableName = table;
                try
                {
                    bulcopy.WriteToServer(dt);
                    con.Dispose();
                }
                catch (Exception ex)
                {
                    con.Dispose();
                    error = false;
                    throw ex;
                }
                return error;
            }
        }
        private static AVCVehicleClassIL CreateObjectFromDataRow(DataRow dr)
        {
            AVCVehicleClassIL acvClass = new AVCVehicleClassIL();
            if (dr["ClientId"] != DBNull.Value)
                acvClass.ClientId = Convert.ToInt16(dr["ClientId"]);

            if (dr["ClientName"] != DBNull.Value)
                acvClass.ClientName = Convert.ToString(dr["ClientName"]);

            if (dr["AvcClassId"] != DBNull.Value)
                acvClass.AvcClassId = Convert.ToInt16(dr["AvcClassId"]);

            if (dr["AvcClassName"] != DBNull.Value)
                acvClass.AvcClassName = Convert.ToString(dr["AvcClassName"]);

            if (dr["AvcClassDescription"] != DBNull.Value)
                acvClass.AvcClassDescription = Convert.ToString(dr["AvcClassDescription"]);

            if (dr["MinAxleCount"] != DBNull.Value)
                acvClass.MinAxleCount = Convert.ToInt16(dr["MinAxleCount"]);

            if (dr["MaxAxleCount"] != DBNull.Value)
                acvClass.MaxAxleCount = Convert.ToInt16(dr["MaxAxleCount"]);

            if (dr["MinHeight"] != DBNull.Value)
                acvClass.MinHeight = Convert.ToDecimal(dr["MinHeight"]);

            if (dr["MaxHeight"] != DBNull.Value)
                acvClass.MaxHeight = Convert.ToDecimal(dr["MaxHeight"]);

            if (dr["MinWidth"] != DBNull.Value)
                acvClass.MinWidth = Convert.ToDecimal(dr["MinWidth"]);

            if (dr["MaxWidth"] != DBNull.Value)
                acvClass.MaxWidth = Convert.ToDecimal(dr["MaxWidth"]);

            if (dr["MinLength"] != DBNull.Value)
                acvClass.MinLength = Convert.ToDecimal(dr["MinLength"]);

            if (dr["MaxLength"] != DBNull.Value)
                acvClass.MaxLength = Convert.ToDecimal(dr["MaxLength"]);

            if (dr["CreatedDate"] != DBNull.Value)
                acvClass.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                acvClass.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                acvClass.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                acvClass.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["DataStatus"] != DBNull.Value)
            {
                acvClass.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (acvClass.DataStatus != 1)
                    acvClass.DataStatusName = "Inactive";
            }
            return acvClass;
        }
        #endregion
    }
}
