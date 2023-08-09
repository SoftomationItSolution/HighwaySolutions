using System;
using System.Collections.Generic;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class RoleManagementIL : CommonIL
    {
        Int64 roleId;
        String roleName;
        List<RolePermissionIL> rolePermission;

        public RoleManagementIL()
        {
            this.roleId = 0;
            this.roleName = string.Empty;
            this.rolePermission = new List<RolePermissionIL>();
        }
        public Int64 RoleId
        {
            get
            {
                return roleId;
            }

            set
            {
                roleId = value;
            }
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
