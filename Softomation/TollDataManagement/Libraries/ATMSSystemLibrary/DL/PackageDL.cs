using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using Softomation.ATMSSystemLibrary.DBA;
using Softomation.ATMSSystemLibrary.IL;


namespace Softomation.ATMSSystemLibrary.DL
{
    internal class PackageDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_PackageDetails";
        #endregion

        internal static List<ResponseIL> InsertUpdate(PackageIL role)
        {
            List<ResponseIL> responses = null;
            try
            {
                string spName = "USP_PackageInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PackageId", DbType.Int32, role.PackageId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PackageName", DbType.String, role.PackageName.Trim(), ParameterDirection.Input, 200));
                
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, role.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@UserId", DbType.Int32, role.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CDateTime", DbType.DateTime, DateTime.Now, ParameterDirection.Input));
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
        internal static List<PackageIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<PackageIL> crs = new List<PackageIL>();
            try
            {
                string spName = "USP_PackageGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    crs.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return crs;

        }
        internal static List<PackageIL> GetActive()
        {
            List<PackageIL> crlist = new List<PackageIL>();
            try
            {
                crlist = GetAll();
                return crlist.FindAll(n => n.DataStatus == (short)Constants.DataStatus.Active);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        internal static PackageIL GetById(Int32 PackageId)
        {
            DataTable dt = new DataTable();
            PackageIL crData = new PackageIL();
            try
            {
                string spName = "USP_PackageGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@PackageId", DbType.Int32, PackageId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    crData = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return crData;
        }
        #endregion

        #region Helper Methods
        private static PackageIL CreateObjectFromDataRow(DataRow dr)
        {
            PackageIL cr = new PackageIL();

            if (dr["PackageId"] != DBNull.Value)
                cr.PackageId = Convert.ToInt16(dr["PackageId"]);

            if (dr["PackageName"] != DBNull.Value)
                cr.PackageName = Convert.ToString(dr["PackageName"]);

            if (dr["ControlRoomId"] != DBNull.Value)
                cr.ControlRoomId = Convert.ToInt64(dr["ControlRoomId"]);

            if (dr["ControlRoomName"] != DBNull.Value)
                cr.ControlRoomName = Convert.ToString(dr["ControlRoomName"]);

            if (dr["StartChainageNumber"] != DBNull.Value)
                cr.StartChainageNumber = Convert.ToDecimal(dr["StartChainageNumber"]);

            if (dr["EndChainageNumber"] != DBNull.Value)
                cr.EndChainageNumber = Convert.ToDecimal(dr["EndChainageNumber"]);

            if (dr["StartLatitude"] != DBNull.Value)
                cr.StartLatitude = Convert.ToDecimal(dr["StartLatitude"]);

            if (dr["EndLatitude"] != DBNull.Value)
                cr.EndLatitude = Convert.ToDecimal(dr["EndLatitude"]);

            if (dr["StartLongitude"] != DBNull.Value)
                cr.StartLongitude = Convert.ToDecimal(dr["StartLongitude"]);

            if (dr["EndLongitude"] != DBNull.Value)
                cr.EndLongitude = Convert.ToDecimal(dr["EndLongitude"]);

            if (dr["DataStatus"] != DBNull.Value)
                cr.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            if (dr["CreatedDate"] != DBNull.Value)
                cr.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                cr.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                cr.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                cr.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            cr.DataStatusName = Enum.GetName(typeof(Constants.DataStatus), (Constants.DataStatus)cr.DataStatus);

            return cr;
        }
        #endregion
    }
}
