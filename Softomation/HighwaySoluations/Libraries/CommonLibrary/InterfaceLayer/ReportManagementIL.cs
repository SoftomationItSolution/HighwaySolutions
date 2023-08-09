using System;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class ReportManagementIL : CommonIL
    {
        String categoryName;
        Int16 parentId;
        Int16 oderBy;
        public ReportManagementIL()
        {
            this.categoryName = String.Empty;
            this.parentId = 0;
            this.oderBy = 0;
        }

        public String CategoryName
        {
            get
            {
                return categoryName;
            }

            set
            {
                categoryName = value;
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
    }
}
