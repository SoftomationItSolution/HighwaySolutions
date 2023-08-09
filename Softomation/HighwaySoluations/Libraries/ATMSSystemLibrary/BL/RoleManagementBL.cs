using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class RoleManagementBL
    {
        public static List<ResponseIL> InsertUpdate(RoleManagementIL role)
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
    }
}
