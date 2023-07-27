using System;

namespace Softomation.ATMSSystemLibrary.IL
{
    public class DataFilterIL
    {
        private Int16 controllRoomId;
        private String controlRoomList;
        private Int16 packageId;
        private String packageList;
        private Decimal chainageNumber;
        private String chainageList;
        private Int16 positionId;
        private String positionList;
        private Int16 eventId;
        private String eventList;
        private String locationName;
        private Int16 incidentTypeId;
        private String incidentList;
        private String incidentName;
        private Int16 directionId;
        private String directionList;
        private String directionName;
        private Int16 reportType;
        private String startDateTime;
        private String endDateTime;
        private String baseUrl;
        private String reportName;
        private String mediaUrl;
        private String filterQuery;
        private String reviewerId;
        private String reviewerName;
        private String menuId;
        private String menuName;
        private String reportFormatType;

        public DataFilterIL()
        {
            this.controllRoomId = 0;
            this.controlRoomList = string.Empty;
            this.packageId = 0;
            this.packageList = string.Empty;
            this.chainageNumber = 0;
            this.chainageList = string.Empty;
            this.positionId = 0;
            this.positionList = string.Empty;
            this.eventId = 0;
            this.eventList = string.Empty;
            this.incidentTypeId = 0;
            this.incidentList = string.Empty;
            this.IncidentName = string.Empty;
            this.directionId = 0;
            this.DirectionList = string.Empty;
            this.DirectionName = string.Empty;
            this.reportType = 0;
            this.endDateTime = String.Empty;
            this.startDateTime = String.Empty;
            this.baseUrl = String.Empty;
            this.mediaUrl = String.Empty;
            this.reportName = String.Empty;
            this.filterQuery = String.Empty;
            this.ReviewerId = string.Empty;
            this.ReviewerName = string.Empty;
            this.reportFormatType = string.Empty;
        }

        public short ControllRoomId
        {
            get => controllRoomId; set => controllRoomId = value;
        }
        public string ControlRoomList
        {
            get => controlRoomList; set => controlRoomList = value;
        }
        public short PackageId
        {
            get => packageId; set => packageId = value;
        }
        public string PackageList
        {
            get => packageList; set => packageList = value;
        }
        public decimal ChainageNumber
        {
            get => chainageNumber; set => chainageNumber = value;
        }
        public string ChainageList
        {
            get => chainageList; set => chainageList = value;
        }
        public short PositionId
        {
            get => positionId; set => positionId = value;
        }
        public string PositionList
        {
            get => positionList; set => positionList = value;
        }
        public short EventId
        {
            get => eventId; set => eventId = value;
        }
        public string EventList
        {
            get => eventList; set => eventList = value;
        }
        public short IncidentTypeId
        {
            get => incidentTypeId; set => incidentTypeId = value;
        }
        public string IncidentList
        {
            get => incidentList; set => incidentList = value;
        }
        public short DirectionId
        {
            get => directionId; set => directionId = value;
        }
        public short ReportType
        {
            get => reportType; set => reportType = value;
        }
        public string StartDateTime
        {
            get => startDateTime; set => startDateTime = value;
        }
        public string EndDateTime
        {
            get => endDateTime; set => endDateTime = value;
        }
        public string BaseUrl
        {
            get => baseUrl; set => baseUrl = value;
        }
        public string ReportName
        {
            get => reportName; set => reportName = value;
        }
        public string MediaUrl
        {
            get => mediaUrl; set => mediaUrl = value;
        }
        public string FilterQuery
        {
            get => filterQuery; set => filterQuery = value;
        }
        public string DirectionList
        {
            get => directionList; set => directionList = value;
        }
        public string ReviewerId
        {
            get => reviewerId; set => reviewerId = value;
        }
        public string ReviewerName
        {
            get => reviewerName; set => reviewerName = value;
        }
        public string DirectionName
        {
            get => directionName; set => directionName = value;
        }
        public string LocationName
        {
            get => locationName; set => locationName = value;
        }
        public string IncidentName
        {
            get => incidentName; set => incidentName = value;
        }
        public string MenuId
        {
            get => menuId; set => menuId = value;
        }
        public string MenuName
        {
            get => menuName; set => menuName = value;
        }
        public string ReportFormatType
        {
            get => reportFormatType; set => reportFormatType = value;
        }
    }
}
