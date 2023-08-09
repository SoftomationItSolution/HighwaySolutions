using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class MenuManagementBL
    {
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
    }
}
