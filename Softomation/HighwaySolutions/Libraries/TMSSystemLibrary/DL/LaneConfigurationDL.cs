﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class LaneConfigurationDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_LaneConfiguration";
        #endregion

        internal static List<ResponseIL> InsertUpdate(LaneConfigurationIL lane)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_LaneInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneId", DbType.Int16, lane.LaneId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, lane.PlazaId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneNumber", DbType.Int16, lane.LaneNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneTypeId", DbType.Int16, lane.LaneTypeId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneDirectionId", DbType.Int16, lane.LaneDirectionId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneSystemIpAddress", DbType.String, lane.LaneSystemIpAddress, ParameterDirection.Input, 20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, lane.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, lane.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, lane.ModifiedBy, ParameterDirection.Input));
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
        internal static List<LaneConfigurationIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<LaneConfigurationIL> lanes = new List<LaneConfigurationIL>();
            try
            {
                string spName = "USP_LaneGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    lanes.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return lanes;

        }
        internal static List<LaneConfigurationIL> GetActive()
        {
            DataTable dt = new DataTable();
            List<LaneConfigurationIL> lanes = new List<LaneConfigurationIL>();
            try
            {
                lanes = GetAll();
                return lanes.FindAll(n => n.DataStatus == (short)CommonLibrary.Constants.DataStatusType.Active);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        internal static LaneConfigurationIL GetById(short LaneId)
        {
            DataTable dt = new DataTable();
            LaneConfigurationIL lane = new LaneConfigurationIL();
            try
            {
                string spName = "USP_LaneGetbyId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneId", DbType.Int32, LaneId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    lane = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return lane;
        }
        internal static LaneConfigurationIL GetByIpAddress(string LaneSystemIpAddress)
        {
            DataTable dt = new DataTable();
            LaneConfigurationIL lane = new LaneConfigurationIL();
            try
            {
                string spName = "USP_LaneGetbyIpAddress";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneSystemIpAddress", DbType.String, LaneSystemIpAddress, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    lane = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return lane;
        }
        internal static List<LaneConfigurationIL> GetByPlazaId(short PlazaId)
        {
            DataTable dt = new DataTable();
            List<LaneConfigurationIL> lanes = new List<LaneConfigurationIL>();
            try
            {
                string spName = "USP_LaneGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int32, PlazaId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    lanes.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return lanes;

        }
        #endregion

        #region Helper Methods
        private static LaneConfigurationIL CreateObjectFromDataRow(DataRow dr)
        {
            LaneConfigurationIL lane = new LaneConfigurationIL();

            if (dr["LaneId"] != DBNull.Value)
                lane.LaneId = Convert.ToInt16(dr["LaneId"]);

            if (dr["PlazaId"] != DBNull.Value)
                lane.PlazaId = Convert.ToInt16(dr["PlazaId"]);

            if (dr["SystemIntegratorId"] != DBNull.Value)
                lane.SystemIntegratorId = Convert.ToInt16(dr["SystemIntegratorId"]);

            if (dr["SystemIntegratorName"] != DBNull.Value)
                lane.SystemIntegratorName = Convert.ToString(dr["SystemIntegratorName"]);

            if (dr["PlazaName"] != DBNull.Value)
                lane.PlazaName = Convert.ToString(dr["PlazaName"]);

            if (dr["PlazaServerIpAddress"] != DBNull.Value)
                lane.PlazaServerIpAddress = Convert.ToString(dr["PlazaServerIpAddress"]);

            if (dr["PlazaZoneId"] != DBNull.Value)
                lane.PlazaZoneId = Convert.ToString(dr["PlazaZoneId"]);

            if (dr["ChainageNumber"] != DBNull.Value)
            {
                lane.ChainageNumber = Convert.ToDecimal(dr["ChainageNumber"]);
                lane.ChainageName = lane.ChainageNumber.ToString().Replace(".", "+");
            }

            if (dr["Latitude"] != DBNull.Value)
                lane.Latitude = Convert.ToDecimal(dr["Latitude"]);

            if (dr["Longitude"] != DBNull.Value)
                lane.Longitude = Convert.ToDecimal(dr["Longitude"]);

            if (dr["LaneNumber"] != DBNull.Value)
                lane.LaneNumber = Convert.ToInt16(dr["LaneNumber"]);

            if (dr["LaneTypeId"] != DBNull.Value)
                lane.LaneTypeId = Convert.ToInt16(dr["LaneTypeId"]);

            if (dr["LaneDirectionId"] != DBNull.Value)
                lane.LaneDirectionId = Convert.ToInt16(dr["LaneDirectionId"]);

            if (dr["LaneSystemIpAddress"] != DBNull.Value)
                lane.LaneSystemIpAddress = Convert.ToString(dr["LaneSystemIpAddress"]);

            if (dr["CreatedDate"] != DBNull.Value)
                lane.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                lane.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                lane.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                lane.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["DataStatus"] != DBNull.Value)
                lane.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            lane.DataStatusName = Enum.GetName(typeof(CommonLibrary.Constants.DataStatusType), (CommonLibrary.Constants.DataStatusType)lane.DataStatus);
            lane.LaneDirectionName = Enum.GetName(typeof(CommonLibrary.Constants.DirectionType), (CommonLibrary.Constants.DirectionType)lane.LaneDirectionId);
            lane.LaneTypeName = Enum.GetName(typeof(SystemConstants.LaneType), (SystemConstants.LaneType)lane.LaneTypeId);
            return lane;
        }
        #endregion
    }
}