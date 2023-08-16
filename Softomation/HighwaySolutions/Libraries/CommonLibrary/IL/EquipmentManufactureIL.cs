using System;

namespace HighwaySoluations.Softomation.CommonLibrary.IL
{
    public class EquipmentManufactureIL : CommonIL
    {

        Int32 equipmentManufactureId;
        String equipmentManufactureName;
        String equipmentManufactureAddress;
        String equipmentManufactureEmailId;
        String equipmentManufactureMobileNumber;

        public EquipmentManufactureIL()
        {
            equipmentManufactureId = 0;
            equipmentManufactureName = string.Empty;
            equipmentManufactureAddress = string.Empty;
            equipmentManufactureEmailId = string.Empty;
            equipmentManufactureMobileNumber = string.Empty;
        }

        public Int32 EquipmentManufactureId
        {
            get
            {
                return equipmentManufactureId;
            }

            set
            {
                equipmentManufactureId = value;
            }
        }
        public String EquipmentManufactureName
        {
            get
            {
                return equipmentManufactureName;
            }

            set
            {
                equipmentManufactureName = value;
            }
        }
        public String EquipmentManufactureAddress
        {
            get
            {
                return equipmentManufactureAddress;
            }

            set
            {
                equipmentManufactureAddress = value;
            }
        }
        public String EquipmentManufactureEmailId
        {
            get
            {
                return equipmentManufactureEmailId;
            }

            set
            {
                equipmentManufactureEmailId = value;
            }
        }
        public String EquipmentManufactureMobileNumber
        {
            get
            {
                return equipmentManufactureMobileNumber;
            }

            set
            {
                equipmentManufactureMobileNumber = value;
            }
        }
    }
}
