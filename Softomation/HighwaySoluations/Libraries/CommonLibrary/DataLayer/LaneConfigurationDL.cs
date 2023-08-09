using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class LaneConfigurationDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_LaneConfiguration";
        #endregion
        internal static List<ResponceIL> InsertUpdate(LaneConfigurationIL lane)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_LaneInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, lane.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ControlRoomId", DbType.Int32, lane.ControlRoomId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@GantryId", DbType.Int32, lane.GantryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneNumber", DbType.Int16, lane.LaneNumber, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneDirection", DbType.Int16, lane.LaneDirection, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, lane.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, lane.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, lane.ModifiedBy, ParameterDirection.Input));
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

        internal static List<LaneConfigurationIL> GetAllActive()
        {
            DataTable dt = new DataTable();
            List<LaneConfigurationIL> lanes = new List<LaneConfigurationIL>();
            try
            {
                string spName = "USP_LaneGetAllActive";
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
        internal static LaneConfigurationIL GetById(Int32 LaneId)
        {
            DataTable dt = new DataTable();
            LaneConfigurationIL lane = new LaneConfigurationIL();
            try
            {
                string spName = "USP_LaneGetbyId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, LaneId, ParameterDirection.Input));
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

        internal static List<LaneConfigurationIL> GetByGantryIdActive(Int32 GantryId)
        {
            DataTable dt = new DataTable();
            List<LaneConfigurationIL> lanes = new List<LaneConfigurationIL>();
            try
            {
                string spName = "USP_LaneGetByGantryIdActive";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@GantryId", DbType.Int32, GantryId, ParameterDirection.Input));
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

            if (dr["EntryId"] != DBNull.Value)
                lane.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["ControlRoomId"] != DBNull.Value)
                lane.ControlRoomId = Convert.ToInt16(dr["ControlRoomId"]);

            if (dr["ControlRoomName"] != DBNull.Value)
                lane.ControlRoomName = Convert.ToString(dr["ControlRoomName"]);

            if (dr["GantryId"] != DBNull.Value)
                lane.GantryId = Convert.ToInt16(dr["GantryId"]);

            if (dr["GantryName"] != DBNull.Value)
                lane.GantryName = Convert.ToString(dr["GantryName"]);

            if (dr["LaneNumber"] != DBNull.Value)
                lane.LaneNumber = Convert.ToInt16(dr["LaneNumber"]);

            if (dr["LaneDirection"] != DBNull.Value)
            {
                lane.LaneDirection = Convert.ToInt16(dr["LaneDirection"]);
                if (lane.LaneDirection == 1)
                    lane.LaneDirectionName = "LHS";
                else
                    lane.LaneDirectionName = "RHS";
            }
            if (dr["CreatedDate"] != DBNull.Value)
                lane.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                lane.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                lane.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                lane.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);
            if (dr["DataStatus"] != DBNull.Value)
            {
                lane.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (lane.DataStatus != 1)
                    lane.DataStatusName = "Inactive";
            }
            return lane;
        }
        #endregion
    }
}
