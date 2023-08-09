using System;
using System.Collections.Generic;
using Softomation.ATMSSystemLibrary.DL;
using Softomation.ATMSSystemLibrary.IL;

namespace Softomation.ATMSSystemLibrary.BL
{
    public class RolePermissionBL
    {

        public static List<ResponseIL> ImportData(RoleManagementIL roles)
        {
            try
            {
                return RolePermissionDL.ImportData(roles);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<RolePermissionIL> GetByRoleId(Int64 roleId)
        {
            try
            {
                return RolePermissionDL.GetByRoleId(roleId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static RolePermissionIL GetByMenu(RolePermissionIL rolePermission)
        {
            try
            {
                return RolePermissionDL.GetByMenu(rolePermission);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}
