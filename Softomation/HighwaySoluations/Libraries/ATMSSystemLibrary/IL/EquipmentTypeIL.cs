using System;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class EquipmentTypeIL : CommonIL
    {
        short equipmentTypeId;
        string equipmentTypeName;
        short equipmentCategoryTypeId;
        string equipmentCategoryTypeName;
        short equipmentConnectionTypeId;
        string equipmentConnectionTypeName;
        string equipmentIconName;

        public EquipmentTypeIL()
        {
            equipmentTypeId = 0;
            equipmentTypeName = string.Empty;
            equipmentCategoryTypeId = 0;
            equipmentCategoryTypeName = string.Empty;
            equipmentConnectionTypeId = 0;
            equipmentConnectionTypeName = string.Empty;
            equipmentIconName = string.Empty;
        }

        public Int16 EquipmentTypeId
        {
            get
            {
                return equipmentTypeId;
            }

            set
            {
                equipmentTypeId = value;
            }
        }
        
        public String EquipmentTypeName
        {
            get
            {
                return equipmentTypeName;
            }

            set
            {
                equipmentTypeName = value;
            }
        }

        public Int16 EquipmentCategoryTypeId
        {
            get
            {
                return equipmentCategoryTypeId;
            }

            set
            {
                equipmentCategoryTypeId = value;
            }
        }

        public String EquipmentCategoryTypeName
        {
            get
            {
                return equipmentCategoryTypeName;
            }

            set
            {
                equipmentCategoryTypeName = value;
            }
        }

        public Int16 EquipmentConnectionTypeId
        {
            get
            {
                return equipmentConnectionTypeId;
            }

            set
            {
                equipmentConnectionTypeId = value;
            }
        }

        public String EquipmentConnectionTypeName
        {
            get
            {
                return equipmentConnectionTypeName;
            }

            set
            {
                equipmentConnectionTypeName = value;
            }
        }

        public String EquipmentIconName
        {
            get
            {
                return equipmentIconName;
            }

            set
            {
                equipmentIconName = value;
            }
        }
    }
}
