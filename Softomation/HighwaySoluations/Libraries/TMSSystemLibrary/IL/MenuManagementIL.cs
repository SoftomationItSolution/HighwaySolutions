using System;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class MenuManagementIL : CommonIL
    {
        Int64 menuId;
        String menuName;
        String menuUrl;
        String menuIcon;
        Int64 parentId;
        Int16 systemId;
        Int16 mennuAccess;
        Int16 oderBy;
        Int16 childCount;
        public MenuManagementIL()
        {
            this.menuId = 0;
            this.menuName = String.Empty;
            this.menuUrl = String.Empty;
            this.menuIcon = String.Empty;
            this.parentId = 0;
            this.systemId = 0;
            this.mennuAccess = 0;
            this.oderBy = 0;
            this.childCount = 0;
        }
        public Int64 MenuId
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
        public String MenuName
        {
            get
            {
                return menuName;
            }

            set
            {
                menuName = value;
            }
        }

        public String MenuUrl
        {
            get
            {
                return menuUrl;
            }

            set
            {
                menuUrl = value;
            }
        }

        public String MenuIcon
        {
            get
            {
                return menuIcon;
            }

            set
            {
                menuIcon = value;
            }
        }

        public Int64 ParentId
        {
            get
            {
                return parentId;
            }

            set
            {
                parentId = value;
            }
        }
        public Int16 SystemId
        {
            get
            {
                return systemId;
            }

            set
            {
                systemId = value;
            }
        }

        public Int16 MennuAccess
        {
            get
            {
                return mennuAccess;
            }

            set
            {
                mennuAccess = value;
            }
        }

        public Int16 OderBy
        {
            get
            {
                return oderBy;
            }

            set
            {
                oderBy = value;
            }
        }



        public Int16 ChildCount
        {
            get
            {
                return childCount;
            }

            set
            {
                childCount = value;
            }
        }


    }
}
