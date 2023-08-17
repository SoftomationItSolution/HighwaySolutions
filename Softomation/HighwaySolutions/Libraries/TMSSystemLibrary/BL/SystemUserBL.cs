using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class SystemUserBL
    {
        public static List<ResponseIL> InsertUpdate(SystemUserIL user)
        {
            try
            {
               
                return SystemUserDL.InsertUpdate(user);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<ResponseIL> UpdatePassword(SystemUserIL user)
        {
            try
            {
                return SystemUserDL.UpdatePassword(user);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static List<ResponseIL> UserProfileChange(SystemUserIL user)
        {
            try
            {
                return SystemUserDL.UserProfileChange(user);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<SystemUserIL> GetAll()
        {
            try
            {
                return SystemUserDL.GetAll();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<SystemUserIL> GetActive()
        {
            try
            {
                return SystemUserDL.GetActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static SystemUserIL GetById(int EntryId)
        {
            try
            {
                return SystemUserDL.GetById(EntryId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static SystemUserIL GetByLoginId(SystemUserIL login)
        {
            try
            {
                return SystemUserDL.GetByLoginId(login);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static List<SystemUserIL> GetByUserType(short UserTypeId)
        {
            try
            {
                return SystemUserDL.GetByUserType(UserTypeId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<SystemUserIL> GetBySystemUserType(short UserTypeId, short SystemId)
        {
            try
            {
                return SystemUserDL.GetBySystemUserType(UserTypeId, SystemId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

       
    }
}
