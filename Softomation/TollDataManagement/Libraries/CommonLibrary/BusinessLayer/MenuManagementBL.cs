using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class MenuManagementBL
    {

        public static List<ResponceIL> PInsertUpdate(MenuManagementIL menu)
        {
            try
            {
                return MenuManagementDL.PInsertUpdate(menu);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static void MarkedDeleted()
        {
            try
            {
                MenuManagementDL.MarkedDeleted();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static void DeletedData()
        {
            try
            {
                MenuManagementDL.DeletedData();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<MenuManagementIL> GetAll()
        {
            try
            {
                return MenuManagementDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static List<MenuManagementIL> GetByRoleId(int RoleId)
        {
            try
            {
                return MenuManagementDL.GetByRoleId(RoleId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<MenuManagementIL> GetByCCMenu()
        {
            try
            {
                return MenuManagementDL.GetByCCMenu();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<MenuManagementIL> GetByPlazaMenu()
        {
            try
            {
                return MenuManagementDL.GetByPlazaMenu();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }


    }
}
