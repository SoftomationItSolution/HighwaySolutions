using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Softomation.ATMSSystemLibrary.DL;
using Softomation.ATMSSystemLibrary.IL;

namespace Softomation.ATMSSystemLibrary.BL
{
    public class RolePermissionBL
    {
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

        public static RolePermissionIL GetByMenuId(RolePermissionIL rolePermission)
        {
            try
            {
                return RolePermissionDL.GetByMenuId(rolePermission);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
