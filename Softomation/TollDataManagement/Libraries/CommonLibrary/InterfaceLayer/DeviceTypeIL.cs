using System;
using System.Text;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class DeviceTypeIL : CategoryMasterIL
    {
        private Int16 categoryId;
        private String deviceTypeName;
        private String iconName;

        public DeviceTypeIL()
        {
            this.categoryId = 0;
            this.deviceTypeName = string.Empty;
            this.iconName = string.Empty;
        }
        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("categoryId = " + this.categoryId.ToString() + Environment.NewLine);
            sb.Append("deviceTypeName = " + this.deviceTypeName.ToString() + Environment.NewLine);
            sb.Append("iconName = " + this.iconName.ToString() + Environment.NewLine);
            return sb.ToString();
        }
        public Int16 CategoryId
        {
            get
            {
                return this.categoryId;
            }

            set
            {
                this.categoryId = value;
            }
        }
        public string DeviceTypeName
        {
            get
            {
                return this.deviceTypeName;
            }

            set
            {
                this.deviceTypeName = value;
            }
        }
        public string IconName
        {
            get
            {
                return this.iconName;
            }

            set
            {
                this.iconName = value;
            }
        }
    }
}
