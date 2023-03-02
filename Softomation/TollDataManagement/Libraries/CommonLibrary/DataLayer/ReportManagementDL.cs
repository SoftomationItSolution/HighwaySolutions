using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class ReportManagementDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_ReportCategory";
        #endregion

        #region Get Methods
        internal static List<ReportManagementIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<ReportManagementIL> reports = new List<ReportManagementIL>();
            try
            {
                string spName = "USP_ReportCategoryGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    reports.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return reports;

        }

        internal static List<ReportManagementIL> GetAllActive()
        {
            DataTable dt = new DataTable();
            List<ReportManagementIL> reports = new List<ReportManagementIL>();
            try
            {
                string spName = "USP_ReportCategoryGetAllActive";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    reports.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return reports;

        }

        internal static List<ReportManagementIL> GetAllParent()
        {
            DataTable dt = new DataTable();
            List<ReportManagementIL> reports = new List<ReportManagementIL>();
            try
            {
                string spName = "USP_ReportCategoryGetAllParent";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    reports.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return reports;

        }
        internal static List<ReportManagementIL> GetBySubCategory(int ParentId)
        {
            DataTable dt = new DataTable();
            List<ReportManagementIL> reports = new List<ReportManagementIL>();
            try
            {
                string spName = "USP_ReportCategoryGetByParentId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ParentId", DbType.Int32, ParentId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    reports.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return reports;

        }

        internal static List<ReportManagementIL> GetBySubCategoryActive(int ParentId)
        {
            DataTable dt = new DataTable();
            List<ReportManagementIL> reports = new List<ReportManagementIL>();
            try
            {
                string spName = "USP_ReportCategoryActiveGetByParentId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ParentId", DbType.Int32, ParentId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    reports.Add(CreateObjectFromDataRow(dr));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return reports;

        }
        internal static ReportManagementIL GetById(int EntryId)
        {
            DataTable dt = new DataTable();
            ReportManagementIL report = new ReportManagementIL();
            try
            {
                string spName = "USP_ReportCategoryGetId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, EntryId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    report = CreateObjectFromDataRow(dr);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return report;

        }
        #endregion

        #region Helper Methods
        private static ReportManagementIL CreateObjectFromDataRow(DataRow dr)
        {
            ReportManagementIL report = new ReportManagementIL();

            if (dr["EntryId"] != DBNull.Value)
                report.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["Category"] != DBNull.Value)
                report.CategoryName = Convert.ToString(dr["Category"]);

            if (dr["ParentId"] != DBNull.Value)
                report.ParentId = Convert.ToInt16(dr["ParentId"]);

            if (dr["OrderBy"] != DBNull.Value)
                report.OderBy = Convert.ToInt16(dr["OrderBy"]);

            if (dr["DataStatus"] != DBNull.Value)
                report.DataStatus = Convert.ToInt16(dr["DataStatus"]);
            return report;
        }
        #endregion
    }
}
