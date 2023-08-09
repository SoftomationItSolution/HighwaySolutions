using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class RolePermissionBL
    {
        public static List<ResponceIL> ImportData(RoleManagementIL role)
        {

            try
            {
                return RolePermissionDL.ImportData(role);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<RolePermissionIL> GetByRoleId(Int64 RoleId)
        {
            try
            {
                return RolePermissionDL.GetByRoleId(RoleId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static RolePermissionIL GetByEventId(RolePermissionIL rolePermission)
        {
            try
            {
                return RolePermissionDL.GetByEventId(rolePermission);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }


    }
}
