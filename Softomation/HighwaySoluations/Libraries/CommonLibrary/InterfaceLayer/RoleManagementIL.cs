using System;
using System.Collections.Generic;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class RoleManagementIL : CommonIL
    {
        String roleName;
        List<RolePermissionIL> rolePermission;

        public RoleManagementIL()
        {
            this.roleName = string.Empty;
            this.rolePermission = new List<RolePermissionIL>();
        }
        public String RoleName
        {
            get => roleName; set => roleName = value;
        }

        public List<RolePermissionIL> RolePermission
        {
            get
            {
                return rolePermission;
            }

            set
            {
                rolePermission = value;
            }
        }
    }
}
