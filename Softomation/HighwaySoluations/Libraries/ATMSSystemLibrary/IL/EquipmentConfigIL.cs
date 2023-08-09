using System;


namespace Softomation.ATMSSystemLibrary.IL
{
    public class EquipmentConfigIL : EquipmentDetailsIL
    {
        Int64 parentId;
        Int16 positionId;
        String positionName;
        Int16 laneNumberId;
        String laneNumberName;

        public EquipmentConfigIL()
        {
            parentId = 0;
            positionId = 0;
            positionName = string.Empty;
            laneNumberId = 0;
            laneNumberName = string.Empty;
        }
        public Int64 ParentId
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
        public Int16 PositionId
        {
            get
            {
                return positionId;
            }

            set
            {
                positionId = value;
            }
        }
        public String PositionName
        {
            get
            {
                return positionName;
            }

            set
            {
                positionName = value;
            }
        }
        public Int16 LaneNumberId
        {
            get
            {
                return laneNumberId;
            }

            set
            {
                laneNumberId = value;
            }
        }
        public String LaneNumberName
        {
            get
            {
                return laneNumberName;
            }

            set
            {
                laneNumberName = value;
            }
        }
    }
}
