using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class incidentMasterDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_IncidentMaster";
        #endregion

        internal incidentMasterDL()
        {
        }
        #region Insert Update

        internal static List<ResponceIL> InsertUpdate(IncidentIL incidentMaster)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_IncidentMasterInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, incidentMaster.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IncidentName", DbType.String, incidentMaster.IncidentName, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IncidentReportDate", DbType.DateTime, incidentMaster.IncidentReportDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IncidentDate", DbType.DateTime, incidentMaster.IncidentDate, ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IncidentCategoryId", DbType.Int16, incidentMaster.IncidentCategoryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IncidentRefNo", DbType.String, incidentMaster.IncidentRefNo, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IncidentSourceType", DbType.String, incidentMaster.IncidentSourceType, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IncidentSourceDevice", DbType.String, incidentMaster.IncidentSourceDevice, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@VehicleRegNo", DbType.String, incidentMaster.VehicleRegNo, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PersonName", DbType.String, incidentMaster.PersonName, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PhoneNo", DbType.String, incidentMaster.PhoneNo, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Comments", DbType.String, incidentMaster.Comments, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@IncidentLocation", DbType.String, incidentMaster.IncidentLocation, ParameterDirection.Input, 50));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Latitude", DbType.String, incidentMaster.IncidentLat, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@Longitude", DbType.String, incidentMaster.IncidentLong, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, incidentMaster.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, incidentMaster.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, incidentMaster.ModifiedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }
        #endregion

        #region Get Method
        internal static List<IncidentIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<IncidentIL> incident = new List<IncidentIL>();
            try
            {
                string spName = "USP_IncidentMasterGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    incident.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return incident;
        }
        internal static IncidentIL GetById(int EntryId)
        {
            DataTable dt = new DataTable();
            IncidentIL incident = new IncidentIL();
            try
            {
                string spName = "USP_IncidentMasterGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, EntryId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    incident = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return incident;
        }
        #endregion

        #region Helper Methods
        private static IncidentIL CreateObjectFromDataRow(DataRow dr)
        {
            IncidentIL data = new IncidentIL();
            if (dr["EntryId"] != DBNull.Value)
                data.EntryId = Convert.ToInt32(dr["EntryId"]);

            if (dr["IncidentName"] != DBNull.Value)
                data.IncidentName = Convert.ToString(dr["IncidentName"]);

            if (dr["IncidentReportDate"] != DBNull.Value)
                data.IncidentReportDate = Convert.ToDateTime(dr["IncidentReportDate"]);

            if (dr["IncidentDate"] != DBNull.Value)
                data.IncidentDate = Convert.ToDateTime(dr["IncidentDate"]);

            if (dr["IncidentCategoryId"] != DBNull.Value)
                data.IncidentCategoryId = Convert.ToInt32(dr["IncidentCategoryId"]);

            //if (dr["IncidentCategoryName"] != DBNull.Value)
            //    data.IncidentCategoryId = Convert.ToInt32(dr["IncidentCategoryName"]);

            if (dr["IncidentRefNo"] != DBNull.Value)
                data.IncidentRefNo = Convert.ToString(dr["IncidentRefNo"]);

            if (dr["IncidentSourceType"] != DBNull.Value)
                data.IncidentSourceType = Convert.ToString(dr["IncidentSourceType"]);

            if (dr["IncidentSourceDevice"] != DBNull.Value)
                data.IncidentSourceDevice = Convert.ToString(dr["IncidentSourceDevice"]);

            if (dr["VehicleRegNo"] != DBNull.Value)
                data.VehicleRegNo = Convert.ToString(dr["VehicleRegNo"]);

            if (dr["PersonName"] != DBNull.Value)
                data.PersonName = Convert.ToString(dr["PersonName"]);

            if (dr["PhoneNo"] != DBNull.Value)
                data.PhoneNo = Convert.ToString(dr["PhoneNo"]);

            if (dr["Comments"] != DBNull.Value)
                data.Comments = Convert.ToString(dr["Comments"]);

            if (dr["IncidentLocation"] != DBNull.Value)
                data.IncidentLocation = Convert.ToString(dr["IncidentLocation"]);

            if (dr["Latitude"] != DBNull.Value)
                data.IncidentLat = Convert.ToString(dr["Latitude"]);

            if (dr["Longitude"] != DBNull.Value)
                data.IncidentLong = Convert.ToString(dr["Longitude"]);

            if (dr["CreatedBy"] != DBNull.Value)
                data.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["CreatedDate"] != DBNull.Value)
                data.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                data.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                data.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["IncidentStatus"] != DBNull.Value)
                data.DataStatus = Convert.ToInt16(dr["IncidentStatus"]);
            if (data.DataStatus != 1)
                data.DataStatusName = "Inactive";
            return data;
        }

        #endregion
    }
}
