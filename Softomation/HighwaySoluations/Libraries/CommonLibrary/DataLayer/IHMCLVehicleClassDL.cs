using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class IHMCLVehicleClassDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_IHMCLClass";
        #endregion


        internal static List<ResponceIL> InsertUpdate(IHMCLVehicleClassIL avc)
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

        internal static List<ResponceIL> Update(IHMCLVehicleClassIL ihmcl)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_IHMCLClassUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IHMCLClassId", DbType.Int16, ihmcl.IHMCLClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IHMCLClassName", DbType.String, ihmcl.IHMCLClassName, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IHMCLClassDescription", DbType.String, ihmcl.IHMCLClassDescription, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehicleWeight", DbType.Decimal, ihmcl.VehicleWeight, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, ihmcl.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, ihmcl.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CDateTime", DbType.DateTime, ihmcl.CreatedDate, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }

        internal static List<ResponceIL> PInsertUpdate(IHMCLVehicleClassIL ihmcl)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_IHMCLInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IHMCLClassId", DbType.Int16, ihmcl.IHMCLClassId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IHMCLClassName", DbType.String, ihmcl.IHMCLClassName, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IHMCLClassDescription", DbType.String, ihmcl.IHMCLClassDescription, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehicleWeight", DbType.Decimal, ihmcl.VehicleWeight, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, ihmcl.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, ihmcl.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, ihmcl.CreatedDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, ihmcl.ModifiedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, ihmcl.ModifiedDate, ParameterDirection.Input));
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
                string spName = "USP_IHMCLVehicleClassUpload";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@FileName", DbType.String, fileName, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@SessionId", DbType.String, SessionId, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, common.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, common.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CDateTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }

            return responces;
        }

        #region Get Methods
        internal static List<IHMCLVehicleClassIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<IHMCLVehicleClassIL> avcClassess = new List<IHMCLVehicleClassIL>();
            try
            {
                string spName = "USP_IHMCLVehicleClassGetAll";
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

        internal static IHMCLVehicleClassIL GetByClassId(Int32 ClassId)
        {
            DataTable dt = new DataTable();
            IHMCLVehicleClassIL avc = new IHMCLVehicleClassIL();
            try
            {
                string spName = "USP_IHMCLVehicleClassGetbyClassId";
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
                    bulcopy.ColumnMappings.Add(0, 0);
                    bulcopy.ColumnMappings.Add(1, 1);
                    bulcopy.ColumnMappings.Add(2, 2);
                    bulcopy.ColumnMappings.Add(3, 3);
                    bulcopy.ColumnMappings.Add(4, 4);
                    bulcopy.ColumnMappings.Add(5, 13);
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
        private static IHMCLVehicleClassIL CreateObjectFromDataRow(DataRow dr)
        {
            IHMCLVehicleClassIL acvClass = new IHMCLVehicleClassIL();

            if (dr["IHMCLClassId"] != DBNull.Value)
                acvClass.IHMCLClassId = Convert.ToInt16(dr["IHMCLClassId"]);

            if (dr["IHMCLClassName"] != DBNull.Value)
                acvClass.IHMCLClassName = Convert.ToString(dr["IHMCLClassName"]);

            if (dr["IHMCLClassDescription"] != DBNull.Value)
                acvClass.IHMCLClassDescription = Convert.ToString(dr["IHMCLClassDescription"]);

            if (dr["IHMCLVehicleWeight"] != DBNull.Value)
                acvClass.VehicleWeight = Convert.ToDecimal(dr["IHMCLVehicleWeight"]);

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
