using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class EquipmentManufactureDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_EquipmentManufactureDetails";
        #endregion

        internal static List<ResponseIL> InsertUpdate(EquipmentManufactureIL eqMF)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_EquipmentManufactureInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentManufactureId", DbType.Int16, eqMF.EquipmentManufactureId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentManufactureName", DbType.String, eqMF.EquipmentManufactureName, ParameterDirection.Input,100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentManufactureAddress", DbType.String, eqMF.EquipmentManufactureAddress, ParameterDirection.Input,255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentManufactureEmailId", DbType.String, eqMF.EquipmentManufactureEmailId, ParameterDirection.Input,100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentManufactureMobile", DbType.String, eqMF.EquipmentManufactureMobileNumber, ParameterDirection.Input,20));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, eqMF.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, eqMF.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, eqMF.ModifiedBy, ParameterDirection.Input));
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
        internal static List<EquipmentManufactureIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<EquipmentManufactureIL> eqMFList = new List<EquipmentManufactureIL>();
            try
            {
                string spName = "USP_EquipmentManufactureGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    eqMFList.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return eqMFList;

        }
        internal static List<EquipmentManufactureIL> GetActive()
        {
            DataTable dt = new DataTable();
            List<EquipmentManufactureIL> eqMFList = new List<EquipmentManufactureIL>();
            try
            {
                eqMFList = GetAll();
                return eqMFList.FindAll(n => n.DataStatus == (short)CommonLibrary.Constants.DataStatusType.Active);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        internal static EquipmentManufactureIL GetById(short EquipmentManufactureId)
        {
            DataTable dt = new DataTable();
            EquipmentManufactureIL eqM = new EquipmentManufactureIL();
            try
            {
                string spName = "USP_EquipmentManufactureGetbyId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EquipmentManufactureId", DbType.Int32, EquipmentManufactureId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    eqM = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return eqM;
        }
        #endregion

        #region Helper Methods
        private static EquipmentManufactureIL CreateObjectFromDataRow(DataRow dr)
        {
            EquipmentManufactureIL eqM = new EquipmentManufactureIL();

            if (dr["EquipmentManufactureId"] != DBNull.Value)
                eqM.EquipmentManufactureId = Convert.ToInt16(dr["EquipmentManufactureId"]);

            if (dr["EquipmentManufactureName"] != DBNull.Value)
                eqM.EquipmentManufactureName = Convert.ToString(dr["EquipmentManufactureName"]);

            if (dr["EquipmentManufactureAddress"] != DBNull.Value)
                eqM.EquipmentManufactureAddress = Convert.ToString(dr["EquipmentManufactureAddress"]);

            if (dr["EquipmentManufactureEmailId"] != DBNull.Value)
                eqM.EquipmentManufactureEmailId = Convert.ToString(dr["EquipmentManufactureEmailId"]);

            if (dr["EquipmentManufactureMobile"] != DBNull.Value)
                eqM.EquipmentManufactureMobileNumber = Convert.ToString(dr["EquipmentManufactureMobile"]);

            if (dr["CreatedDate"] != DBNull.Value)
                eqM.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                eqM.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                eqM.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                eqM.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            if (dr["DataStatus"] != DBNull.Value)
                eqM.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            eqM.DataStatusName = Enum.GetName(typeof(CommonLibrary.Constants.DataStatusType), (CommonLibrary.Constants.DataStatusType)eqM.DataStatus);
            return eqM;
        }
        #endregion
    }
}
