using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class RoleManagementBL
    {

        public static List<ResponceIL> InsertUpdate(RoleManagementIL role)
        {

            try
            {
                return RoleManagementDL.InsertUpdate(role);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<ResponceIL> PInsertUpdate(RoleManagementIL role)
        {
            try
            {
                return RoleManagementDL.PInsertUpdate(role);
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
                RoleManagementDL.MarkedDeleted();
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
                RoleManagementDL.DeletedData();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<RoleManagementIL> GetAll()
        {
            try
            {
                return RoleManagementDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<RoleManagementIL> GetActive()
        {
            try
            {
                return RoleManagementDL.GetActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static RoleManagementIL GetById(int RoleId)
        {
            try
            {
                return RoleManagementDL.GetById(RoleId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static List<RoleManagementIL> GetByClientPlazaId(UserManagementIL user)
        {
            try
            {
                return RoleManagementDL.GetByClientPlazaId(user);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }


    }
}
