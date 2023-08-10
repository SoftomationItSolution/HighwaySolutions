using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using HighwaySoluations.Softomation.TMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.DL
{
    internal class MenuManagementDL
    {
        #region Global Varialble
        static string tableName = "tbl_MenuMaster";
        #endregion
        
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
                        List<MenuManagementIL> Subfiltered = menus.FindAll(e => e.ParentId == item.MenuId);
                        if (Subfiltered.Count > 0)
                        {
                            UpdatedMenu = menus.Where(w => w.MenuId == item.MenuId).Select(s => { s.ChildCount = Convert.ToInt16(Subfiltered.Count); return s; }).ToList();
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

            if (dr["MenuId"] != DBNull.Value)
                menu.MenuId = Convert.ToInt64(dr["MenuId"]);

            if (dr["MenuName"] != DBNull.Value)
                menu.MenuName = Convert.ToString(dr["MenuName"]);

            if (dr["MenuURL"] != DBNull.Value)
                menu.MenuUrl = Convert.ToString(dr["MenuURL"]);

            if (dr["MenuIcon"] != DBNull.Value)
                menu.MenuIcon = Convert.ToString(dr["MenuIcon"]);

            if (dr["ParentId"] != DBNull.Value)
                menu.ParentId = Convert.ToInt16(dr["ParentId"]);

            if (dr["SystemId"] != DBNull.Value)
                menu.SystemId = Convert.ToInt16(dr["SystemId"]);

            if (dr["MennuAccess"] != DBNull.Value)
                menu.MennuAccess = Convert.ToInt16(dr["MennuAccess"]);

            if (dr["OderBy"] != DBNull.Value)
                menu.OderBy = Convert.ToInt16(dr["OderBy"]);

            if (dr["CreatedDate"] != DBNull.Value)
                menu.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);

            if (dr["CreatedBy"] != DBNull.Value)
                menu.CreatedBy = Convert.ToInt32(dr["CreatedBy"]);

            if (dr["ModifiedDate"] != DBNull.Value)
                menu.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);

            if (dr["ModifiedBy"] != DBNull.Value)
                menu.ModifiedBy = Convert.ToInt32(dr["ModifiedBy"]);

            menu.DataStatusName = Enum.GetName(typeof(SystemConstants.DataStatusType), (SystemConstants.DataStatusType)menu.DataStatus);

            return menu;
        }
        #endregion
    }
}
