﻿using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
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
