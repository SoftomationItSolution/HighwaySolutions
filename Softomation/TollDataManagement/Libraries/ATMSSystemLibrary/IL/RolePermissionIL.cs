using System;

namespace Softomation.ATMSSystemLibrary.IL
{
    public class RolePermissionIL : CommonIL
    {
        Int32 menuId;
        Int32 roleId;
        Int16 dataView;
        Int16 dataAdd;
        Int16 dataUpdate;

        public RolePermissionIL()
        {
            this.menuId = 0;
            this.roleId = 0;
            this.dataView = 1;
            this.dataAdd = 2;
            this.dataUpdate = 2;
        }

        public Int32 MenuId
        {
            get
            {
                return menuId;
            }

            set
            {
                menuId = value;
            }
        }
        public Int32 RoleId
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
        public Int16 DataView
        {
            get
            {
                return dataView;
            }

            set
            {
                dataView = value;
            }
        }
        public Int16 DataAdd
        {
            get
            {
                return dataAdd;
            }

            set
            {
                dataAdd = value;
            }
        }
        public Int16 DataUpdate
        {
            get
            {
                return dataUpdate;
            }

            set
            {
                dataUpdate = value;
            }
        }
    }
}
