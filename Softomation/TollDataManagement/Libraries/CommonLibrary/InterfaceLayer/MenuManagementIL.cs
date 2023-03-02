using System;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class MenuManagementIL : CommonIL
    {
        String menuName;
        String menuUrl;
        String menuIcon;
        Int16 parentId;
        Int16 mennuAccess;
        Int16 oderBy;
        Int16 eventId;
        Int16 childCount;
        public MenuManagementIL()
        {
            this.menuName = String.Empty;
            this.menuUrl = String.Empty;
            this.menuIcon = String.Empty;
            this.parentId = 0;
            this.mennuAccess = 0;
            this.oderBy = 0;
            this.eventId = 0;
            this.childCount = 0;
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

        public Int16 ParentId
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

        public Int16 EventId
        {
            get
            {
                return eventId;
            }

            set
            {
                eventId = value;
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
