using System;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.NMSSystemLibrary.IL
{
    public class EquipmentDetailsIL : EquipmentTypeIL
    {
        Int64 equipmentId;
        String equipmentName;
        Int16 protocolTypeId;
        String protocolTypeName;
        String ipAddress;
        Int64 portNumber;
        String loginId;
        String password;
        Double latitude;
        Double longitude;
        String macAddress;
        String modelNumber;
        String serialNumber;
        String manufacturer;
        String vendorDetail;
        DateTime manufacturerDate;
        DateTime purchageDate;
        DateTime warrantyExpireDate;
        Boolean onLineStatus;

        public EquipmentDetailsIL()
        {
            equipmentId = 0;
            equipmentName = string.Empty;
            protocolTypeId = 0;
            protocolTypeName = string.Empty;
            ipAddress = string.Empty;
            portNumber = 0;
            loginId = string.Empty;
            password = string.Empty;
            latitude = 0;
            longitude = 0;
            macAddress = string.Empty;
            modelNumber = string.Empty;
            serialNumber = string.Empty;
            manufacturer = string.Empty;
            vendorDetail = string.Empty;
            manufacturerDate = DateTime.Now;
            purchageDate = DateTime.Now;
            warrantyExpireDate = DateTime.Now;
            onLineStatus = true;
        }

        public Int64 EquipmentId
        {
            get
            {
                return equipmentId;
            }

            set
            {
                equipmentId = value;
            }
        }
        public String EquipmentName
        {
            get
            {
                return equipmentName;
            }

            set
            {
                equipmentName = value;
            }
        }
        public Int16 ProtocolTypeId
        {
            get
            {
                return protocolTypeId;
            }

            set
            {
                protocolTypeId = value;
            }
        }
        public String ProtocolTypeName
        {
            get
            {
                return protocolTypeName;
            }

            set
            {
                protocolTypeName = value;
            }
        }
        public String IpAddress
        {
            get
            {
                return ipAddress;
            }

            set
            {
                ipAddress = value;
            }
        }
        public Int64 PortNumber
        {
            get
            {
                return portNumber;
            }

            set
            {
                portNumber = value;
            }
        }
        public String LoginId
        {
            get
            {
                return loginId;
            }

            set
            {
                loginId = value;
            }
        }
        public String Password
        {
            get
            {
                return password;
            }

            set
            {
                password = value;
            }
        }
        public double Latitude
        {
            get
            {
                return latitude;
            }

            set
            {
                latitude = value;
            }
        }
        public double Longitude
        {
            get
            {
                return longitude;
            }

            set
            {
                longitude = value;
            }
        }
        public String MacAddress
        {
            get
            {
                return macAddress;
            }

            set
            {
                macAddress = value;
            }
        }
        public String ModelNumber
        {
            get
            {
                return modelNumber;
            }

            set
            {
                modelNumber = value;
            }
        }
        public String SerialNumber
        {
            get
            {
                return serialNumber;
            }

            set
            {
                serialNumber = value;
            }
        }
        public String ManufacturerDetail
        {
            get
            {
                return manufacturer;
            }

            set
            {
                manufacturer = value;
            }
        }
        public String VendorDetail
        {
            get
            {
                return vendorDetail;
            }

            set
            {
                vendorDetail = value;
            }
        }
        public DateTime ManufacturerDate
        {
            get
            {
                return manufacturerDate;
            }

            set
            {
                manufacturerDate = value;
            }
        }
        public DateTime PurchageDate
        {
            get
            {
                return purchageDate;
            }

            set
            {
                purchageDate = value;
            }
        }
        public DateTime WarrantyExpireDate
        {
            get
            {
                return warrantyExpireDate;
            }

            set
            {
                warrantyExpireDate = value;
            }
        }
        public Boolean OnLineStatus
        {
            get
            {
                return onLineStatus;
            }

            set
            {
                onLineStatus = value;
            }
        }
    }
}
