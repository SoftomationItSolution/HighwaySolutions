using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.DL
{
    internal class ReportMasterDL
    {
        #region Global Varialble
        static string tableName = "tbl_ReportMaster";
        #endregion

        #region Get Methods
        internal static List<ReportMasterIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<ReportMasterIL> reportList = new List<ReportMasterIL>();
            try
            {
                string spName = "USP_ReportMasterGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    reportList.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return reportList;

        }
        internal static List<ReportMasterIL> GetActive()
        {
            List<ReportMasterIL> reportlst = new List<ReportMasterIL>();
            try
            {
                reportlst = GetAll();
                return reportlst.FindAll(n => n.DataStatus == (short)Constants.DataStatusType.Active);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        internal static ReportMasterIL GetById(short ReportId)
        {
            DataTable dt = new DataTable();
            ReportMasterIL smData = new ReportMasterIL();
            try
            {
                string spName = "USP_ReportMasterGetById";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReportId", DbType.Int32, ReportId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    smData = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return smData;

        }
        internal static ReportMasterIL GetByName(String ReportName)
        {
            DataTable dt = new DataTable();
            ReportMasterIL smData = new ReportMasterIL();
            try
            {
                string spName = "USP_ReportMasterGetByName";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReportName", DbType.String, ReportName, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    smData = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return smData;

        }
        internal static List<ReportMasterIL> GetByIds(String ReportIds)
        {
            DataTable dt = new DataTable();
            List<ReportMasterIL> smData = new List<ReportMasterIL>();
            try
            {
                string spName = "USP_ReportMasterGetByIds";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ReportIds", DbType.String, ReportIds, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    smData.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return smData;

        }
        #endregion

        #region Helper Methods
        private static ReportMasterIL CreateObjectFromDataRow(DataRow dr)
        {
            ReportMasterIL report = new ReportMasterIL();

            if (dr["ReportId"] != DBNull.Value)
                report.ReportId = Convert.ToInt16(dr["ReportId"]);

            if (dr["ReportName"] != DBNull.Value)
                report.ReportName = Convert.ToString(dr["ReportName"]);

            if (dr["ParentId"] != DBNull.Value)
                report.ParentId = Convert.ToInt16(dr["ParentId"]);

            if (dr["OrderBy"] != DBNull.Value)
                report.OrderBy = Convert.ToInt16(dr["OrderBy"]);

            if (dr["DataStatus"] != DBNull.Value)
                report.DataStatus = Convert.ToInt16(dr["DataStatus"]);

            if (dr["CreatedDate"] != DBNull.Value)
                report.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                report.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                report.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                report.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            report.DataStatusName = Enum.GetName(typeof(Constants.DataStatusType), (Constants.DataStatusType)report.DataStatus);
            return report;
        }
        #endregion
    }
}
