using System;
using System.Collections.Generic;
using Softomation.ATMSSystemLibrary.IL;
using Softomation.ATMSSystemLibrary.DL;

namespace Softomation.ATMSSystemLibrary.BL
{
    public class UserManagementBL
    {
        public static List<ResponseIL> InsertUpdate(UserManagementIL user)
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
        public static UserManagementIL GetById(int EntryId)
        {
            try
            {
                return UserManagementDL.GetById(EntryId);
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
        public static List<UserManagementIL> GetBySystemId(int SystemId)
        {
            try
            {
                return UserManagementDL.GetBySystemId(SystemId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
