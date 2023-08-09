using System;

namespace Softomation.ATMSSystemLibrary.IL
{
    public class VIDSEventIL: PackageIL
    {
        String transactionId;
        Int64 equipmentId;
        Int16 positionId;
        String positionName;
        Int16 eventTypeId;
        String eventTypeName;
        DateTime eventStartDate;
        String eventStartDateStamp;
        DateTime eventEndDate;
        String eventEndDateStamp;
        Int16 eventDuration;
        Int16 laneNumber;
        String laneName;
        Decimal vehicleSpeed;
        Int16 vehicleClassId;
        String vehicleClassName;
        String plateNumber;
        String plateImageUrl;
        String eventImageUrl;
        String eventVideoUrl;
        Int16 incidentStatusId;
        String incidentStatusName;
        Boolean isReviewedRequired;

        public VIDSEventIL()
        {
            this.transactionId = string.Empty;
            this.equipmentId = 0;
            this.positionId = 0;
            this.positionName = string.Empty;
            this.eventTypeId = 0;
            this.eventTypeName = string.Empty;
            this.eventStartDate = DateTime.MinValue;
            this.eventStartDateStamp = string.Empty;
            this.eventEndDate = DateTime.MinValue;
            this.eventEndDateStamp = string.Empty;
            this.eventDuration = 0;
            this.laneNumber = 0;
            this.laneName = string.Empty;
            this.vehicleSpeed = 0;
            this.vehicleClassId = 0;
            this.vehicleClassName = string.Empty;
            this.plateNumber = string.Empty;
            this.plateImageUrl = string.Empty;
            this.eventImageUrl = string.Empty;
            this.eventVideoUrl = string.Empty;
            this.incidentStatusId = 0;
            this.incidentStatusName = string.Empty;
            isReviewedRequired = false;
        }

        public String TransactionId
        {
            get
            {
                return transactionId;
            }

            set
            {
                transactionId = value;
            }
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
        public Int16 EventTypeId
        {
            get
            {
                return eventTypeId;
            }

            set
            {
                eventTypeId = value;
            }
        }
        public String EventTypeName
        {
            get
            {
                return eventTypeName;
            }

            set
            {
                eventTypeName = value;
            }
        }
        public DateTime EventStartDate
        {
            get
            {
                return eventStartDate;
            }

            set
            {
                eventStartDate = value;
            }
        }
        public String EventStartDateStamp
        {
            get
            {
                return eventStartDateStamp;
            }

            set
            {
                eventStartDateStamp = value;
            }
        }
        public DateTime EventEndDate
        {
            get
            {
                return eventEndDate;
            }

            set
            {
                eventEndDate = value;
            }
        }
        public String EventEndDateStamp
        {
            get
            {
                return eventEndDateStamp;
            }

            set
            {
                eventEndDateStamp = value;
            }
        }
        public Int16 EventDuration
        {
            get
            {
                return eventDuration;
            }

            set
            {
                eventDuration = value;
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

        public String LaneName
        {
            get
            {
                return laneName;
            }

            set
            {
                laneName = value;
            }
        }
        public Decimal VehicleSpeed
        {
            get
            {
                return vehicleSpeed;
            }

            set
            {
                vehicleSpeed = value;
            }
        }
        public Int16 VehicleClassId
        {
            get
            {
                return vehicleClassId;
            }

            set
            {
                vehicleClassId = value;
            }
        }
        public String VehicleClassName
        {
            get
            {
                return vehicleClassName;
            }

            set
            {
                vehicleClassName = value;
            }
        }
        public String PlateNumber
        {
            get
            {
                return plateNumber;
            }

            set
            {
                plateNumber = value;
            }
        }
        public String PlateImageUrl
        {
            get
            {
                return plateImageUrl;
            }

            set
            {
                plateImageUrl = value;
            }
        }
        public String EventImageUrl
        {
            get
            {
                return eventImageUrl;
            }

            set
            {
                eventImageUrl = value;
            }
        }
        public String EventVideoUrl
        {
            get
            {
                return eventVideoUrl;
            }

            set
            {
                eventVideoUrl = value;
            }
        }
        public Int16 IncidentStatusId
        {
            get
            {
                return incidentStatusId;
            }

            set
            {
                incidentStatusId = value;
            }
        }
        public String IncidentStatusName
        {
            get
            {
                return incidentStatusName;
            }

            set
            {
                incidentStatusName = value;
            }
        }
        public Boolean IsReviewedRequired
        {
            get
            {
                return isReviewedRequired;
            }

            set
            {
                isReviewedRequired = value;
            }
        }
    }
}
