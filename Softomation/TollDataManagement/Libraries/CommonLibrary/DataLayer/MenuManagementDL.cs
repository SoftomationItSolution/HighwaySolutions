using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.DataLayer
{
    internal class MenuManagementDL
    {
        #region Global Varialble
        static DataTable dt;
        static string tableName = "tbl_MenuMaster";
        #endregion

        internal static List<ResponceIL> PInsertUpdate(MenuManagementIL menu)
        {
            List<ResponceIL> responces = null;
            try
            {
                string spName = "USP_MenuInsertUpdate";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EntryId", DbType.Int32, menu.EntryId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MenuName", DbType.String, menu.MenuName.Trim(), ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MenuURL", DbType.String, menu.MenuUrl.Trim(), ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MenuIcon", DbType.String, menu.MenuIcon.Trim(), ParameterDirection.Input, 100));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@MennuAccess", DbType.Int16, menu.MennuAccess, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@OderBy", DbType.Int16, menu.OderBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ParentId", DbType.Int16, menu.ParentId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@EventId", DbType.Int16, menu.EventId, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@DataStatus", DbType.Int16, menu.DataStatus, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedBy", DbType.Int32, menu.CreatedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@CreatedDate", DbType.DateTime, menu.CreatedDate, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedBy", DbType.Int32, menu.ModifiedBy, ParameterDirection.Input));
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@ModifiedDate", DbType.DateTime, menu.ModifiedDate, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                responces = Constants.ConvertResponceList(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responces;
        }
        internal static void MarkedDeleted()
        {
            try
            {
                string spName = "USP_MenuMarkedDeleted";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        internal static void DeletedData()
        {
            try
            {
                string spName = "USP_MenuDeletedData";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                DBAccessor.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        #region Get Methods
        internal static List<MenuManagementIL> GetAll()
        {
            DataTable dt = new DataTable();
            List<MenuManagementIL> menus = new List<MenuManagementIL>();
            try
            {
                string spName = "USP_MenuGetAll";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    menus.Add(CreateObjectFromDataRow(dr));

                menus = UpdateChildCount(menus);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return menus;

        }
        internal static List<MenuManagementIL> GetByCCMenu()
        {
            DataTable dt = new DataTable();
            List<MenuManagementIL> menus = new List<MenuManagementIL>();
            try
            {
                string spName = "USP_MenuGetCC";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    menus.Add(CreateObjectFromDataRow(dr));

                menus = UpdateChildCount(menus);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return menus;
        }
        internal static List<MenuManagementIL> GetByPlazaMenu()
        {
            DataTable dt = new DataTable();
            List<MenuManagementIL> menus = new List<MenuManagementIL>();
            try
            {
                string spName = "USP_MenuGetPlaza";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    menus.Add(CreateObjectFromDataRow(dr));
                menus = UpdateChildCount(menus);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return menus;
        }
        internal static List<MenuManagementIL> GetByRoleId(int RoleId)
        {
            DataTable dt = new DataTable();
            List<MenuManagementIL> menus = new List<MenuManagementIL>();
            try
            {
                string spName = "USP_MenuGetByRoleId";
                DbCommand command = DBAccessor.GetStoredProcCommand(spName);
                command.Parameters.Add(DBAccessor.CreateDbParameter(ref command, "@RoleId", DbType.Int32, RoleId, ParameterDirection.Input));
                dt = DBAccessor.LoadDataSet(command, tableName).Tables[tableName];
                foreach (DataRow dr in dt.Rows)
                    menus.Add(CreateObjectFromDataRow(dr));
                menus = UpdateChildCount(menus);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return menus;

        }
        #endregion

        #region Helper Methods
        private static List<MenuManagementIL> UpdateChildCount(List<MenuManagementIL> menus)
        {
            try
            {
                List<MenuManagementIL> UpdatedMenu = new List<MenuManagementIL>();
                if (menus.Count > 0)
                {
                    List<MenuManagementIL> filtered = menus.FindAll(e => e.ParentId == 0);

                    foreach (MenuManagementIL item in filtered)
                    {
                        List<MenuManagementIL> Subfiltered = menus.FindAll(e => e.ParentId == item.EntryId);
                        if (Subfiltered.Count > 0)
                        {
                            UpdatedMenu = menus.Where(w => w.EntryId == item.EntryId).Select(s => { s.ChildCount = Convert.ToInt16(Subfiltered.Count); return s; }).ToList();
                        }
                    }
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }

            return menus;
        }
        private static MenuManagementIL CreateObjectFromDataRow(DataRow dr)
        {
            MenuManagementIL menu = new MenuManagementIL();

            if (dr["EntryId"] != DBNull.Value)
                menu.EntryId = Convert.ToInt64(dr["EntryId"]);

            if (dr["MenuName"] != DBNull.Value)
                menu.MenuName = Convert.ToString(dr["MenuName"]);

            if (dr["MenuURL"] != DBNull.Value)
                menu.MenuUrl = Convert.ToString(dr["MenuURL"]);

            if (dr["MenuIcon"] != DBNull.Value)
                menu.MenuIcon = Convert.ToString(dr["MenuIcon"]);

            if (dr["ParentId"] != DBNull.Value)
                menu.ParentId = Convert.ToInt16(dr["ParentId"]);

            if (dr["ParentId"] != DBNull.Value)
                menu.ParentId = Convert.ToInt16(dr["ParentId"]);

            if (dr["MennuAccess"] != DBNull.Value)
                menu.MennuAccess = Convert.ToInt16(dr["MennuAccess"]);

            if (dr["OderBy"] != DBNull.Value)
                menu.OderBy = Convert.ToInt16(dr["OderBy"]);

            if (dr["EventId"] != DBNull.Value)
                menu.EventId = Convert.ToInt16(dr["EventId"]);

            if (dr["DataStatus"] != DBNull.Value)
            {
                menu.DataStatus = Convert.ToInt16(dr["DataStatus"]);
                if (menu.DataStatus != 1)
                    menu.DataStatusName = "Inactive";
            }

            if (dr["CreatedDate"] != DBNull.Value)
                menu.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                menu.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                menu.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                menu.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            return menu;
        }
        #endregion
    }
}
