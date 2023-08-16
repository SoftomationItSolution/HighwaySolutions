using System;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class LaneConfigurationIL : PlazaConfigurationIL
    {
        Int16 laneId;
        Int16 laneNumber;
        Int16 laneTypeId;
        String laneTypeName;
        Int16 laneDirectionId;
        String laneDirectionName;
        String laneSystemIpAddress;


        public LaneConfigurationIL()
        {
            this.laneId = 0;
            this.laneNumber = 0;
            this.laneTypeId = 0;
            this.laneTypeName = string.Empty;
            this.laneDirectionId = 0;
            this.laneDirectionName = string.Empty;
            this.laneSystemIpAddress = string.Empty;
        }

        public short LaneId
        {
            get => laneId; set => laneId = value;
        }
        public short LaneNumber
        {
            get => laneNumber; set => laneNumber = value;
        }
        public short LaneTypeId
        {
            get => laneTypeId; set => laneTypeId = value;
        }
        public string LaneTypeName
        {
            get => laneTypeName; set => laneTypeName = value;
        }
        public short LaneDirectionId
        {
            get => laneDirectionId; set => laneDirectionId = value;
        }
        public string LaneDirectionName
        {
            get => laneDirectionName; set => laneDirectionName = value;
        }
        public string LaneSystemIpAddress
        {
            get => laneSystemIpAddress; set => laneSystemIpAddress = value;
        }
    }
}
