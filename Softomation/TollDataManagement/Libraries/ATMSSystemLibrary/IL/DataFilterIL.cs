using System;
using System.Collections.Generic;

namespace Softomation.ATMSSystemLibrary.IL
{
    public class DataFilterIL
    {
        Int16 systemId;
        private String controlRoomFilterList;
        private String packageFilterList;
        private String chainageFilterList;
        private String positionFilterList;
        private String eventFilterList;
        private String incidentFilterList;
        private String directionFilterList;
        private String startDateTime;
        private String endDateTime;
        private String filterQuery;
        private List<MasterData> controlRoomDataList;
        private List<MasterData> packageDataList;
        private List<MasterData> chainageDataList;

        public DataFilterIL()
        {
            this.systemId = 0;
            this.controlRoomFilterList = string.Empty;
            this.packageFilterList = string.Empty;
            this.chainageFilterList = string.Empty;
            this.positionFilterList = string.Empty;
            this.eventFilterList = string.Empty;
            this.incidentFilterList = string.Empty;
            this.directionFilterList = string.Empty;
            this.endDateTime = string.Empty;
            this.startDateTime = string.Empty;
            this.filterQuery = string.Empty;
           
            controlRoomDataList = new List<MasterData>();
            packageDataList = new List<MasterData>();
            chainageDataList = new List<MasterData>();
        }
        public short SystemId
        {
            get => systemId; set => systemId = value;
        }
        public string ControlRoomFilterList
        {
            get => controlRoomFilterList; set => controlRoomFilterList = value;
        }
        public string PackageFilterList
        {
            get => packageFilterList; set => packageFilterList = value;
        }
        public string ChainageFilterList
        {
            get => chainageFilterList; set => chainageFilterList = value;
        }
        public string PositionFilterList
        {
            get => positionFilterList; set => positionFilterList = value;
        }
        public string EventFilterList
        {
            get => eventFilterList; set => eventFilterList = value;
        }
        public string IncidentFilterList
        {
            get => incidentFilterList; set => incidentFilterList = value;
        }
        public string DirectionFilterList
        {
            get => directionFilterList; set => directionFilterList = value;
        }
        public string StartDateTime
        {
            get => startDateTime; set => startDateTime = value;
        }
        public string EndDateTime
        {
            get => endDateTime; set => endDateTime = value;
        }
        public string FilterQuery
        {
            get => filterQuery; set => filterQuery = value;
        }

        public List<MasterData> ControlRoomDataList
        {
            get
            {
                return controlRoomDataList;
            }

            set
            {
                controlRoomDataList = value;
            }
        }
        public List<MasterData> PackageDataList
        {
            get
            {
                return packageDataList;
            }

            set
            {
                packageDataList = value;
            }
        }
        public List<MasterData> ChainageDataList
        {
            get
            {
                return chainageDataList;
            }

            set
            {
                chainageDataList = value;
            }
        }
    }


    public class MasterData
    {
        Int64 dataId;
        String dataName;
        Int64 parentId;
        Decimal minValue;
        Decimal maxValue;

       public MasterData()
        {
            dataId = 0;
            dataName = string.Empty;
            parentId = 0;
            minValue = 0;
            maxValue = 0;
        }

        public Int64 DataId
        {
            get
            {
                return dataId;
            }

            set
            {
                dataId = value;
            }
        }

        public String DataName
        {
            get
            {
                return dataName;
            }

            set
            {
                dataName = value;
            }
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

        public Decimal MinValue
        {
            get
            {
                return minValue;
            }

            set
            {
                minValue = value;
            }
        }

        public Decimal MaxValue
        {
            get
            {
                return maxValue;
            }

            set
            {
                maxValue = value;
            }
        }
    }
}
