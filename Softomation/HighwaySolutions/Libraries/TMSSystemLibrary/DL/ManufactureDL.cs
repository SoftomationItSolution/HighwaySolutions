using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class ManufactureDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_ManufactureDetails";
        #endregion

        internal static List<ResponseIL> InsertUpdate(ManufactureIL eqMF)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_ManufactureInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ManufactureId", DbType.Int16, eqMF.ManufactureId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ManufactureName", DbType.String, eqMF.ManufactureName, ParameterDirection.Input,100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ManufactureAddress", DbType.String, eqMF.ManufactureAddress, ParameterDirection.Input,255));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ManufactureEmailId", DbType.String, eqMF.ManufactureEmailId, ParameterDirection.Input,100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ManufactureMobileNumber", DbType.String, eqMF.ManufactureMobileNumber, ParameterDirection.Input,20));
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
        internal static List<ManufactureIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<ManufactureIL> eqMFList = new List<ManufactureIL>();
            try
            {
                string spName = "USP_ManufactureGetAll";
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
        internal static List<ManufactureIL> GetActive()
        {
            DataTable dt = new DataTable();
            List<ManufactureIL> eqMFList = new List<ManufactureIL>();
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
        internal static ManufactureIL GetById(short ManufactureId)
        {
            DataTable dt = new DataTable();
            ManufactureIL eqM = new ManufactureIL();
            try
            {
                string spName = "USP_ManufactureGetbyId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ManufactureId", DbType.Int32, ManufactureId, ParameterDirection.Input));
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
        private static ManufactureIL CreateObjectFromDataRow(DataRow dr)
        {
            ManufactureIL eqM = new ManufactureIL();

            if (dr["ManufactureId"] != DBNull.Value)
                eqM.ManufactureId = Convert.ToInt16(dr["ManufactureId"]);

            if (dr["ManufactureName"] != DBNull.Value)
                eqM.ManufactureName = Convert.ToString(dr["ManufactureName"]);

            if (dr["ManufactureAddress"] != DBNull.Value)
                eqM.ManufactureAddress = Convert.ToString(dr["ManufactureAddress"]);

            if (dr["ManufactureEmailId"] != DBNull.Value)
                eqM.ManufactureEmailId = Convert.ToString(dr["ManufactureEmailId"]);

            if (dr["ManufactureMobileNumber"] != DBNull.Value)
                eqM.ManufactureMobileNumber = Convert.ToString(dr["ManufactureMobileNumber"]);

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
