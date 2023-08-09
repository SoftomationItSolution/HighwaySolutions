using System;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class RolePermissionIL : MenuManagementIL
    {
        Int32 roleId;
        Int16 dataView;
        Int16 dataAdd;
        Int16 dataUpdate;

        public RolePermissionIL()
        {
            this.roleId = 0;
            this.dataView = 1;
            this.dataAdd = 2;
            this.dataUpdate = 2;
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
