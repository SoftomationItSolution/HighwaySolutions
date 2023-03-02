using System;
using System.Text;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class CategoryMasterIL : CommonIL
    {
        private String categoryName;

        public CategoryMasterIL()
        {
            this.categoryName = string.Empty;
        }
        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("companyName = " + this.categoryName.ToString() + Environment.NewLine);
            return sb.ToString();
        }

        public string CategoryName
        {
            get
            {
                return this.categoryName;
            }

            set
            {
                this.categoryName = value;
            }
        }
    }
}
