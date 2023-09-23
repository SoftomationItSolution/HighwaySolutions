using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class ICDLaneDetailsDL
    {
        #region Global Varialble
        static string tableName = "tbl_LaneConfiguration";
        #endregion

        internal static List<ICDLaneDetailsIL> GetByPlaza(short PlazaId)
        {
            DataTable dt = new DataTable();
            List<ICDLaneDetailsIL> lanes = new List<ICDLaneDetailsIL>();
            try
            {
                string spName = "USP_ICDLaneGetByPlazaId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PlazaId", DbType.Int16, PlazaId, ParameterDirection.Input));
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

        internal static ICDLaneDetailsIL GetByLane(short LaneId)
        {
            DataTable dt = new DataTable();
            ICDLaneDetailsIL lanes = new ICDLaneDetailsIL();
            try
            {
                string spName = "USP_ICDLaneGetByLaneId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@LaneId", DbType.Int16, LaneId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    lanes = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return lanes;

        }

        #region Helper Methods
        private static ICDLaneDetailsIL CreateObjectFromDataRow(DataRow dr)
        {
            ICDLaneDetailsIL lane = new ICDLaneDetailsIL();

            if (dr["PlazaId"] != DBNull.Value)
                lane.PlazaId = Convert.ToInt16(dr["PlazaId"]);

            if (dr["LaneId"] != DBNull.Value)
                lane.LaneId = Convert.ToInt16(dr["LaneId"]);

            if (dr["LaneNumber"] != DBNull.Value)
                lane.LaneNumber = Convert.ToString(dr["LaneNumber"]);

            if (dr["LaneDirectionId"] != DBNull.Value)
                lane.LaneDirectionId = Convert.ToInt16(dr["LaneDirectionId"]);

            if (dr["LaneStatusId"] != DBNull.Value)
                lane.LaneStatusId = Convert.ToInt16(dr["LaneStatusId"]);

            if (dr["LaneModeId"] != DBNull.Value)
                lane.LaneModeId = Convert.ToInt16(dr["LaneModeId"]);

            if (dr["LaneTypeId"] != DBNull.Value)
                lane.LaneTypeId = Convert.ToInt16(dr["LaneTypeId"]);

            if (dr["ReaderId"] != DBNull.Value)
                lane.ReaderId = Convert.ToInt16(dr["ReaderId"]);

            if (dr["ReaderName"] != DBNull.Value)
                lane.ReaderName = Convert.ToString(dr["ReaderName"]);

            lane.LaneStatusName = Enum.GetName(typeof(SystemConstants.ICDLaneStatusType), (SystemConstants.ICDLaneStatusType)lane.LaneStatusId);
            lane.LaneTypeName = Enum.GetName(typeof(SystemConstants.ICDLaneType), (SystemConstants.ICDLaneType)lane.LaneTypeId);
            lane.LaneModeName = Enum.GetName(typeof(SystemConstants.ICDLaneModeType), (SystemConstants.ICDLaneModeType)lane.LaneModeId);
            lane.LaneDirectionName = Enum.GetName(typeof(SystemConstants.ICDDirectionType), (SystemConstants.ICDDirectionType)lane.LaneDirectionId);
            return lane;
        }
        #endregion
    }
}
