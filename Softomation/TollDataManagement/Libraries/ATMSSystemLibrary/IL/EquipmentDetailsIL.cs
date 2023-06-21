using System;

namespace Softomation.ATMSSystemLibrary.IL
{
    public class EquipmentDetailsIL : EquipmentTypeIL
    {
        Int64 equipmentId;
        Int16 packageId;
        String packageName;
        Int16 controlRoomId;
        String controlRoomName;
        Int16 systemId;
        String systemName;
        String equipmentName;
        Int16 equipmentDirectionId;
        String equipmentDirectionName;
        String equipmentIP;
        Int64 equipmentPortNumber;
        String equipmentLoginId;
        String equipmentPassword;
        Decimal equipmentChainageNumber;
        String equipmentChainageName;
        Decimal equipmentLatitude;
        Decimal equipmentLongitude;
        String equipmentMacAddress;
        String equipmentModelNumber;
        String equipmentSerialNumber;
        String equipmentManufacturer;
        String equipmentVendorDetail;
        DateTime equipmentManufacturerDate;
        DateTime equipmentPurchageDate;
        DateTime equipmentWarrantyExpireDate;
        Boolean onLineStatus;

        public EquipmentDetailsIL()
        {
            equipmentId = 0;
            packageId = 0;
            packageName = string.Empty;
            controlRoomId = 0;
            controlRoomName = string.Empty;
            systemId = 0;
            systemName = string.Empty;
            equipmentName = string.Empty;
            equipmentDirectionId = 0;
            equipmentDirectionName = string.Empty;
            equipmentIP = string.Empty;
            equipmentPortNumber = 0;
            equipmentLoginId = string.Empty;
            equipmentPassword = string.Empty;
            equipmentChainageNumber = 0;
            equipmentChainageName = string.Empty;
            equipmentLatitude = 0;
            equipmentLongitude = 0;
            equipmentMacAddress = string.Empty;
            equipmentModelNumber = string.Empty;
            equipmentSerialNumber = string.Empty;
            equipmentManufacturer = string.Empty;
            equipmentVendorDetail = string.Empty;
            equipmentManufacturerDate = DateTime.Now;
            equipmentPurchageDate = DateTime.Now;
            equipmentWarrantyExpireDate = DateTime.Now;
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
        public Int16 PackageId
        {
            get
            {
                return packageId;
            }

            set
            {
                packageId = value;
            }
        }
        public String PackageName
        {
            get
            {
                return packageName;
            }

            set
            {
                packageName = value;
            }
        }
        public Int16 ControlRoomId
        {
            get
            {
                return controlRoomId;
            }

            set
            {
                controlRoomId = value;
            }
        }
        public String ControlRoomName
        {
            get
            {
                return controlRoomName;
            }

            set
            {
                controlRoomName = value;
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
        public String SystemName
        {
            get
            {
                return systemName;
            }

            set
            {
                systemName = value;
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
        public Int16 EquipmentDirectionId
        {
            get
            {
                return equipmentDirectionId;
            }

            set
            {
                equipmentDirectionId = value;
            }
        }
        public String EquipmentDirectionName
        {
            get
            {
                return equipmentDirectionName;
            }

            set
            {
                equipmentDirectionName = value;
            }
        }
        public String EquipmentIP
        {
            get
            {
                return equipmentIP;
            }

            set
            {
                equipmentIP = value;
            }
        }
        public Int64 EquipmentPortNumber
        {
            get
            {
                return equipmentPortNumber;
            }

            set
            {
                equipmentPortNumber = value;
            }
        }
        public String EquipmentLoginId
        {
            get
            {
                return equipmentLoginId;
            }

            set
            {
                equipmentLoginId = value;
            }
        }
        public String EquipmentPassword
        {
            get
            {
                return equipmentPassword;
            }

            set
            {
                equipmentPassword = value;
            }
        }
        public Decimal EquipmentChainageNumber
        {
            get
            {
                return equipmentChainageNumber;
            }

            set
            {
                equipmentChainageNumber = value;
            }
        }
        public String EquipmentChainageName
        {
            get
            {
                return equipmentChainageName;
            }

            set
            {
                equipmentChainageName = value;
            }
        }
        public Decimal EquipmentLatitude
        {
            get
            {
                return equipmentLatitude;
            }

            set
            {
                equipmentLatitude = value;
            }
        }
        public Decimal EquipmentLongitude
        {
            get
            {
                return equipmentLongitude;
            }

            set
            {
                equipmentLongitude = value;
            }
        }
        public String EquipmentMacAddress
        {
            get
            {
                return equipmentMacAddress;
            }

            set
            {
                equipmentMacAddress = value;
            }
        }
        public String EquipmentModelNumber
        {
            get
            {
                return equipmentModelNumber;
            }

            set
            {
                equipmentModelNumber = value;
            }
        }
        public String EquipmentSerialNumber
        {
            get
            {
                return equipmentSerialNumber;
            }

            set
            {
                equipmentSerialNumber = value;
            }
        }
        public String EquipmentManufacturer
        {
            get
            {
                return equipmentManufacturer;
            }

            set
            {
                equipmentManufacturer = value;
            }
        }
        public String EquipmentVendorDetail
        {
            get
            {
                return equipmentVendorDetail;
            }

            set
            {
                equipmentVendorDetail = value;
            }
        }
        public DateTime EquipmentManufacturerDate
        {
            get
            {
                return equipmentManufacturerDate;
            }

            set
            {
                equipmentManufacturerDate = value;
            }
        }
        public DateTime EquipmentPurchageDate
        {
            get
            {
                return equipmentPurchageDate;
            }

            set
            {
                equipmentPurchageDate = value;
            }
        }
        public DateTime EquipmentWarrantyExpireDate
        {
            get
            {
                return equipmentWarrantyExpireDate;
            }

            set
            {
                equipmentWarrantyExpireDate = value;
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
