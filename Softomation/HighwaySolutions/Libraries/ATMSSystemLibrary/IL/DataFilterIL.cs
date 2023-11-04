using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class DataFilterIL
    {
        Int16 systemId;
        Int16 reportId;
        private String systemFilterList;
        private String controlRoomFilterList;
        private String packageFilterList;
        private String chainageFilterList;
        private String positionFilterList;
        private String eventFilterList;
        private String vehicleClassFilterList;
        private String equipmentTypeFilterList;
        private String equipmentIdFilterList;
        private String incidentFilterList;
        private String incidentStatusList;
        private String directionFilterList;
        private String laneFilterList;
        private String priorityFilterList;
        private String reviewedFilterList;
        private String messageTypeIdFilterList;
        private String temperatureFilterList;
        private String humidityFilterList;
        private String visibilityFilterList;
        private String callTypeFilterList;
        private String plateNumber;
        private String startDateTime;
        private String endDateTime;
        Boolean isReviewedRequired;
        private String filterQuery;
        private List<MasterDataIL> systemDataList;
        private List<MasterDataIL> controlRoomDataList;
        private List<MasterDataIL> packageDataList;
        private List<MasterDataIL> chainageDataList;
        private List<MasterDataIL> incidentDataList;
        List<MasterDataIL> reportTypeList;
        List<MasterDataIL> vehicleTypeList;
        private String reviewedStatusList;
        

        public DataFilterIL()
        {
            this.systemId = 0;
            this.reportId = 0;
            this.systemFilterList = string.Empty;
            this.controlRoomFilterList = string.Empty;
            this.packageFilterList = string.Empty;
            this.chainageFilterList = string.Empty;
            this.positionFilterList = string.Empty;
            this.equipmentTypeFilterList = string.Empty;
            this.equipmentIdFilterList = string.Empty;
            this.eventFilterList = string.Empty;
            this.vehicleClassFilterList = string.Empty;
            this.incidentFilterList = string.Empty;
            this.incidentStatusList = string.Empty;
            this.directionFilterList = string.Empty;
            this.laneFilterList = string.Empty;
            this.priorityFilterList = string.Empty;
            this.reviewedFilterList = string.Empty;
            this.messageTypeIdFilterList = string.Empty;
            this.temperatureFilterList = string.Empty;
            this.humidityFilterList = string.Empty;
            this.visibilityFilterList = string.Empty;
            this.callTypeFilterList = string.Empty;
            this.plateNumber = string.Empty;
            this.startDateTime = string.Empty;
            this.endDateTime = string.Empty;
            this.isReviewedRequired = false;
            this.filterQuery = string.Empty;

            systemDataList = new List<MasterDataIL>();
            controlRoomDataList = new List<MasterDataIL>();
            packageDataList = new List<MasterDataIL>();
            chainageDataList = new List<MasterDataIL>();
            incidentDataList = new List<MasterDataIL>();
            reportTypeList = new List<MasterDataIL>();
            vehicleTypeList = new List<MasterDataIL>();
            this.reviewedStatusList = string.Empty;
        }
        public short SystemId
        {
            get => systemId; set => systemId = value;
        }
        public short ReportId
        {
            get => reportId; set => reportId = value;
        }
        public string SystemFilterList
        {
            get => systemFilterList; set => systemFilterList = value;
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
        public string EquipmentTypeFilterList
        {
            get => equipmentTypeFilterList; set => equipmentTypeFilterList = value;
        }
        public string EquipmentIdFilterList
        {
            get => equipmentIdFilterList; set => equipmentIdFilterList = value;
        }
        public string EventFilterList
        {
            get => eventFilterList; set => eventFilterList = value;
        }
        public string VehicleClassFilterList
        {
            get => vehicleClassFilterList; set => vehicleClassFilterList = value;
        }
        public string IncidentFilterList
        {
            get => incidentFilterList; set => incidentFilterList = value;
        }
        public string IncidentStatusList
        {
            get => incidentStatusList; set => incidentStatusList = value;
        }
        public string PriorityFilterList
        {
            get => priorityFilterList; set => priorityFilterList = value;
        }
        public string DirectionFilterList
        {
            get => directionFilterList; set => directionFilterList = value;
        }
        public string LaneFilterList
        {
            get => laneFilterList; set => laneFilterList = value;
        }
        public string ReviewedFilterList
        {
            get => reviewedFilterList; set => reviewedFilterList = value;
        }
        public string MessageTypeIdFilterList
        {
            get => messageTypeIdFilterList; set => messageTypeIdFilterList = value;
        }
        public string TemperatureFilterList
        {
            get => temperatureFilterList; set => temperatureFilterList = value;
        }
        public string HumidityFilterList
        {
            get => humidityFilterList; set => humidityFilterList = value;
        }
        public string VisibilityFilterList
        {
            get => visibilityFilterList; set => visibilityFilterList = value;
        }
        public string CallTypeFilterList
        {
            get => callTypeFilterList; set => callTypeFilterList = value;
        }
        public string PlateNumber
        {
            get => plateNumber; set => plateNumber = value;
        }
        public string StartDateTime
        {
            get => startDateTime; set => startDateTime = value;
        }
        public string EndDateTime
        {
            get => endDateTime; set => endDateTime = value;
        }
        public bool IsReviewedRequired
        {
            get => isReviewedRequired; set => isReviewedRequired = value;
        }
        public string FilterQuery
        {
            get => filterQuery; set => filterQuery = value;
        }
        public List<MasterDataIL> SystemDataList
        {
            get
            {
                return systemDataList;
            }

            set
            {
                systemDataList = value;
            }
        }
        public List<MasterDataIL> ControlRoomDataList
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
        public List<MasterDataIL> PackageDataList
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
        public List<MasterDataIL> ChainageDataList
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
        public List<MasterDataIL> IncidentDataList
        {
            get
            {
                return incidentDataList;
            }

            set
            {
                incidentDataList = value;
            }
        }
        public List<MasterDataIL> ReportTypeList
        {
            get
            {
                return reportTypeList;
            }

            set
            {
                reportTypeList = value;
            }
        }
        public List<MasterDataIL> VehicleTypeList
        {
            get
            {
                return vehicleTypeList;
            }

            set
            {
                vehicleTypeList = value;
            }
        }
        public string ReviewedStatusList
        {
            get
            {
                return reviewedStatusList;
            }

            set
            {
                reviewedStatusList = value;
            }
        }

       
    }


    
}
