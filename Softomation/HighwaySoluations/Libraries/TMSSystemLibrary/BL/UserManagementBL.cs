using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
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
        public static List<ResponseIL> UpdatePassword(UserManagementIL user)
        {
            try
            {
                return UserManagementDL.UpdatePassword(user);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static List<ResponseIL> UserProfileChange(UserManagementIL user)
        {
            try
            {
                return UserManagementDL.UserProfileChange(user);
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

        public static List<UserManagementIL> GetByUserType(short UserTypeId)
        {
            try
            {
                return UserManagementDL.GetByUserType(UserTypeId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<UserManagementIL> GetBySystemUserType(short UserTypeId, short SystemId)
        {
            try
            {
                return UserManagementDL.GetBySystemUserType(UserTypeId, SystemId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

       
    }
}
