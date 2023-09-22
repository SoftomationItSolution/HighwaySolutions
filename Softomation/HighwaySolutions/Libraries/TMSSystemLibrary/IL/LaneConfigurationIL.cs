using System;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class LaneConfigurationIL : PlazaConfigurationIL
    {
        Int16 laneId;
        Int16 laneNumber;
        String laneName;
        Int16 laneTypeId;
        String laneTypeName;
        Int16 lanePositionId;
        String lanePositionName;
        Int16 lanePointId;
        String lanePointName;
        Int16 laneDirectionId;
        String laneDirectionName;
        Int16 laneStatusId;
        String laneStatusName;
        Int16 laneModeId;
        String laneModeName;
        String laneSystemIpAddress;

        public LaneConfigurationIL()
        {
            this.laneId = 0;
            this.laneNumber = 0;
            this.laneName = string.Empty;
            this.laneTypeId = 0;
            this.laneTypeName = string.Empty;
            this.lanePositionId = 0;
            this.lanePositionName = string.Empty;
            this.lanePointId = 0;
            this.lanePointName = string.Empty;
            this.laneDirectionId = 0;
            this.laneDirectionName = string.Empty;
            this.laneStatusId = 0;
            this.laneStatusName = string.Empty;
            this.laneModeId = 0;
            this.laneModeName = string.Empty;
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
        public string LaneName
        {
            get => laneName; set => laneName = value;
        }
        public short LaneTypeId
        {
            get => laneTypeId; set => laneTypeId = value;
        }
        public string LaneTypeName
        {
            get => laneTypeName; set => laneTypeName = value;
        }
        public short LanePositionId
        {
            get => lanePositionId; set => lanePositionId = value;
        }
        public string LanePositionName
        {
            get => lanePositionName; set => lanePositionName = value;
        }
        public short LanePointId
        {
            get => lanePointId; set => lanePointId = value;
        }
        public string LanePointName
        {
            get => lanePointName; set => lanePointName = value;
        }
        public short LaneDirectionId
        {
            get => laneDirectionId; set => laneDirectionId = value;
        }
        public string LaneDirectionName
        {
            get => laneDirectionName; set => laneDirectionName = value;
        }
        public short LaneStatusId
        {
            get => laneStatusId; set => laneStatusId = value;
        }
        public string LaneStatusName
        {
            get => laneStatusName; set => laneStatusName = value;
        }
        public short LaneModeId
        {
            get => laneModeId; set => laneModeId = value;
        }
        public string LaneModeName
        {
            get => laneModeName; set => laneModeName = value;
        }
        public string LaneSystemIpAddress
        {
            get => laneSystemIpAddress; set => laneSystemIpAddress = value;
        }
       
    }
}
