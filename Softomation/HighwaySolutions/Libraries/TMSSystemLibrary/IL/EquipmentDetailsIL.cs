using System;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class EquipmentDetailsIL : EquipmentTypeIL
    {
        Int64 equipmentId;
        Int16 plazaId;
        String plazaName;
        Int16 laneId;
        Int16 laneNumber;
        String equipmentName;
        Int16 protocolTypeId;
        String protocolTypeName;
        String ipAddress;
        Int64 portNumber;
        String loginId;
        String password;
        Int32 manufactureId;
        String manufactureName;
        String macAddress;
        String modelNumber;
        String serialNumber;
        DateTime manufacturerDate;
        DateTime purchageDate;
        DateTime warrantyExpireDate;
        Boolean onLineStatus;

        public EquipmentDetailsIL()
        {
            equipmentId = 0;
            plazaId = 0;
            plazaName = string.Empty;
            laneId = 0;
            laneNumber = 0;
            equipmentName = string.Empty;
            protocolTypeId = 0;
            protocolTypeName = string.Empty;
            ipAddress = string.Empty;
            portNumber = 0;
            loginId = string.Empty;
            password = string.Empty;
            macAddress = string.Empty;
            modelNumber = string.Empty;
            serialNumber = string.Empty;
            manufactureId = 0;
            manufactureName = string.Empty;
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
        public Int16 PlazaId
        {
            get
            {
                return plazaId;
            }

            set
            {
                plazaId = value;
            }
        }
        public String PlazaName
        {
            get
            {
                return plazaName;
            }

            set
            {
                plazaName = value;
            }
        }
        public Int16 LaneId
        {
            get
            {
                return laneId;
            }

            set
            {
                laneId = value;
            }
        }
        public Int16 LaneNumber
        {
            get
            {
                return laneNumber;
            }

            set
            {
                laneNumber = value;
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
        public Int32 ManufactureId
        {
            get
            {
                return manufactureId;
            }

            set
            {
                manufactureId = value;
            }
        }
        public String ManufactureName
        {
            get
            {
                return manufactureName;
            }

            set
            {
                manufactureName = value;
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
