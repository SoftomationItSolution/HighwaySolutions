using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class UserManagementBL
    {
        public static List<ResponceIL> InsertUpdate(UserManagementIL user)
        {
            try
            {
                return UserManagementDL.InsertUpdate(user);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<ResponceIL> PInsertUpdate(UserManagementIL user)
        {
            try
            {
                return UserManagementDL.PInsertUpdate(user);
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
                UserManagementDL.MarkedDeleted();
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
                UserManagementDL.DeletedData();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static void UpdatePassword(UserManagementIL user)
        {
            try
            {
                UserManagementDL.UpdatePassword(user);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<UserManagementIL> GetAll()
        {
            try
            {
                return UserManagementDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<UserManagementIL> GetActive()
        {
            try
            {
                return UserManagementDL.GetActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<UserManagementIL> GetAllLaneUsers()
        {
            try
            {
                return UserManagementDL.GetAllLaneUsers();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<UserManagementIL> GetAllLaneUsersActive()
        {
            try
            {
                return UserManagementDL.GetAllLaneUsersActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static UserManagementIL GetById(int UserId)
        {
            try
            {
                return UserManagementDL.GetById(UserId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static UserManagementIL GetByLoginId(UserManagementIL login)
        {
            try
            {
                return UserManagementDL.GetByLoginId(login);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static List<UserManagementIL> GetByClientPlazaId(UserManagementIL user)
        {
            try
            {
                return UserManagementDL.GetByClientPlazaId(user);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<UserManagementIL> GetByClientPlazaIdActive(UserManagementIL user)
        {
            try
            {
                return UserManagementDL.GetByClientPlazaIdActive(user);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static List<UserManagementIL> GetByClientId(Int32 clientId)
        {
            try
            {
                return UserManagementDL.GetByClientId(clientId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<UserManagementIL> GetByClientIdActive(Int32 clientId)
        {
            try
            {
                return UserManagementDL.GetByClientIdActive(clientId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        #region Lane Integration
        public static List<UserManagementIL> SharedLaneUsers()
        {
            try
            {
                return UserManagementDL.SharedLaneUsers();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }


        #endregion


    }
}
