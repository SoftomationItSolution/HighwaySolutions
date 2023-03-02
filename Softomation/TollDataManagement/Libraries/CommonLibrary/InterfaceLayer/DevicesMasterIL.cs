using System;
using System.Text;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class DevicesMasterIL : CommonIL
    {
        Int16 controlRoomId;
        String controlRoomName;
        Int16 categoryId;
        String categoryName;
        Int16 deviceTypeId;
        String deviceTypeName;
        String deviceName;
        Int16 direction;
        String directionName;
        String ipAddress;
        Int16 portNumber;
        String deviceLoginId;
        String devicePassword;
        String latitude;
        String longitude;
        String modelNumber;
        String manufacturer;
        String vendor;
        DateTime manufacturerDate;
        DateTime purchageDate;
        DateTime warrantyExpireDate;
        Int16 gantryId;
        String gantryName;
        Int16 laneNumber;
        Int16 onLineStatus;
        String iconName;
        String remark;
        Int16 connectionTypeId;
        String connectionType;
        public DevicesMasterIL()
        {
            this.controlRoomId = 0;
            this.controlRoomName = string.Empty;
            this.categoryId = 0;
            this.categoryName = string.Empty;
            this.deviceTypeId = 0;
            this.deviceTypeName = string.Empty;
            this.deviceName = string.Empty;
            this.direction = 0;
            this.directionName = string.Empty;
            this.ipAddress = string.Empty;
            this.portNumber = 0;
            this.deviceLoginId = string.Empty;
            this.devicePassword = string.Empty;
            this.latitude = string.Empty;
            this.longitude = string.Empty;
            this.modelNumber = string.Empty;
            this.manufacturer = string.Empty;
            this.vendor = string.Empty;
            this.purchageDate = DateTime.Now;
            this.manufacturerDate = DateTime.Now;
            this.warrantyExpireDate = DateTime.Now;
            this.gantryId = 0;
            this.gantryName = string.Empty;
            this.laneNumber = 0;
            this.onLineStatus = 0;
            this.iconName = string.Empty;
            this.remark = string.Empty;
            this.connectionTypeId = 0;
            this.connectionType = string.Empty;
        }
        public short ControlRoomId
        {
            get => controlRoomId; set => controlRoomId = value;
        }
        public string ControlRoomName
        {
            get => controlRoomName; set => controlRoomName = value;
        }
        public short CategoryId
        {
            get => categoryId; set => categoryId = value;
        }
        public string CategoryName
        {
            get => categoryName; set => categoryName = value;
        }
        public short DeviceTypeId
        {
            get => deviceTypeId; set => deviceTypeId = value;
        }
        public string DeviceTypeName
        {
            get => deviceTypeName; set => deviceTypeName = value;
        }
        public string DeviceName
        {
            get => deviceName; set => deviceName = value;
        }
        public short Direction
        {
            get => direction; set => direction = value;
        }
        public string DirectionName
        {
            get => directionName; set => directionName = value;
        }
        public string IpAddress
        {
            get => ipAddress; set => ipAddress = value;
        }
        public short PortNumber
        {
            get => portNumber; set => portNumber = value;
        }
        public string DeviceLoginId
        {
            get => deviceLoginId; set => deviceLoginId = value;
        }
        public string DevicePassword
        {
            get => devicePassword; set => devicePassword = value;
        }
        public string Latitude
        {
            get => latitude; set => latitude = value;
        }
        public string Longitude
        {
            get => longitude; set => longitude = value;
        }
        public string ModelNumber
        {
            get => modelNumber; set => modelNumber = value;
        }
        public string Manufacturer
        {
            get => manufacturer; set => manufacturer = value;
        }
        public string Vendor
        {
            get => vendor; set => vendor = value;
        }
        public DateTime WarrantyExpireDate
        {
            get => warrantyExpireDate; set => warrantyExpireDate = value;
        }
        public DateTime ManufacturerDate
        {
            get => manufacturerDate; set => manufacturerDate = value;
        }
        public DateTime PurchageDate
        {
            get => purchageDate; set => purchageDate = value;
        }
        public short GantryId
        {
            get => gantryId; set => gantryId = value;
        }

        public string GantryName
        {
            get => gantryName; set => gantryName = value;
        }
        public short LaneNumber
        {
            get => laneNumber; set => laneNumber = value;
        }
        public short OnLineStatus
        {
            get => onLineStatus; set => onLineStatus = value;
        }
        public string IconName
        {
            get => iconName; set => iconName = value;
        }
        public string Remark
        {
            get => remark; set => remark = value;
        }
        public Int16 ConnectionTypeId
        {
            get => connectionTypeId;
            set => connectionTypeId=value; 
        }
        public String ConnectionType
        {
            get => connectionType;
            set =>connectionType = value;
        }
        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("categoryId = " + this.categoryId.ToString() + Environment.NewLine);
            sb.Append("controlRoomId = " + this.controlRoomId.ToString() + Environment.NewLine);
            sb.Append("deviceTypeId = " + this.deviceTypeId.ToString() + Environment.NewLine);
            sb.Append("deviceName = " + this.deviceName.ToString() + Environment.NewLine);
            sb.Append("direction = " + this.direction.ToString() + Environment.NewLine);
            sb.Append("ipAddress = " + this.ipAddress.ToString() + Environment.NewLine);
            sb.Append("portNumber = " + this.portNumber.ToString() + Environment.NewLine);
            sb.Append("deviceLoginId = " + this.deviceLoginId.ToString() + Environment.NewLine);
            sb.Append("devicePassword = " + this.devicePassword.ToString() + Environment.NewLine);
            sb.Append("latitude = " + this.latitude.ToString() + Environment.NewLine);
            sb.Append("longitude = " + this.longitude.ToString() + Environment.NewLine);
            sb.Append("modelNumber = " + this.modelNumber.ToString() + Environment.NewLine);
            sb.Append("manufacturer = " + this.manufacturer.ToString() + Environment.NewLine);
            sb.Append("warrantyExpireDate = " + this.warrantyExpireDate.ToString() + Environment.NewLine);
            sb.Append("onLineStatus = " + this.onLineStatus.ToString() + Environment.NewLine);
            sb.Append("iconName = " + this.iconName.ToString() + Environment.NewLine);
            sb.Append("remark = " + this.remark.ToString() + Environment.NewLine);
            sb.Append("connectionTypeId = " + this.connectionTypeId.ToString() + Environment.NewLine);
            sb.Append("connectionType = " + this.connectionType.ToString() + Environment.NewLine);
            return sb.ToString();
        }
    }
}
