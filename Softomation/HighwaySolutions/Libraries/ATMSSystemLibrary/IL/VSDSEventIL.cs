using System;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class VSDSEventIL : PackageIL
    {
        String transactionId;
        Int64 equipmentId;
        Int16 eventTypeId;
        String eventTypeName;
        DateTime eventDate;
        String eventDateStamp;
        Int16 laneNumber;
        String laneName;
        String plateNumber;
        Int16 vehicleClassId;
        String vehicleClassName;
        String plateImageUrl;
        String vehicleImageUrl;
        String vehicleVideoUrl;
        Decimal cameraSpeed;
        Decimal radarSpeed;
        Decimal allowedSpeed;
        Decimal ocrConfidencelevel;
        Decimal classConfidencelevel;
        String plateFontColor;
        String plateBackColor;
        String vehicleColor;
        Int16 vehicleDirectionId;
        String vehicleDirectionName;
        Boolean isPlateVisible;
        Boolean isFaultyPlate;
        Boolean isStandardPlate;
        Boolean isWrongDirection;
        Boolean isReviewedRequired;
        Boolean isRestiredVehicle;
        public VSDSEventIL()
        {
            this.transactionId = string.Empty;
            this.equipmentId = 0;
            this.eventTypeId = 0;
            this.eventTypeName = string.Empty;
            this.eventDate = DateTime.MinValue;
            this.eventDateStamp = string.Empty;
            this.laneNumber = 0;
            this.laneName = string.Empty;
            this.plateNumber = string.Empty;
            this.vehicleClassId = 0;
            this.vehicleClassName = string.Empty;
            this.plateImageUrl = string.Empty;
            this.vehicleImageUrl = string.Empty;
            this.vehicleVideoUrl = string.Empty;
            this.cameraSpeed = 0;
            this.radarSpeed = 0;
            this.allowedSpeed = 0;
            this.ocrConfidencelevel = 0;
            this.classConfidencelevel = 0;
            this.plateFontColor = string.Empty;
            this.plateBackColor = string.Empty;
            this.vehicleColor = string.Empty;
            this.vehicleDirectionId = 0;
            this.vehicleDirectionName = string.Empty;
            this.isPlateVisible = false;
            this.isFaultyPlate = false;
            this.isStandardPlate = false;
            this.isWrongDirection = false;
            this.isReviewedRequired = false;
            this.isRestiredVehicle = false;
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
        public DateTime EventDate
        {
            get
            {
                return eventDate;
            }

            set
            {
                eventDate = value;
            }
        }
        public String EventDateStamp
        {
            get
            {
                return eventDateStamp;
            }

            set
            {
                eventDateStamp = value;
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
        public Decimal VehicleSpeed
        {
            get
            {
                return cameraSpeed;
            }

            set
            {
                cameraSpeed = value;
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
        public String VehicleImageUrl
        {
            get
            {
                return vehicleImageUrl;
            }

            set
            {
                vehicleImageUrl = value;
            }
        }
        public String VehicleVideoUrl
        {
            get
            {
                return vehicleVideoUrl;
            }

            set
            {
                vehicleVideoUrl = value;
            }
        }
        public Decimal CameraSpeed
        {
            get
            {
                return cameraSpeed;
            }

            set
            {
                cameraSpeed = value;
            }
        }
        public Decimal RadarSpeed
        {
            get
            {
                return radarSpeed;
            }

            set
            {
                radarSpeed = value;
            }
        }
        public Decimal AllowedSpeed
        {
            get
            {
                return allowedSpeed;
            }

            set
            {
                allowedSpeed = value;
            }
        }
        public Decimal OcrConfidencelevel
        {
            get
            {
                return ocrConfidencelevel;
            }

            set
            {
                ocrConfidencelevel = value;
            }
        }
        public Decimal ClassConfidencelevel
        {
            get
            {
                return classConfidencelevel;
            }

            set
            {
                classConfidencelevel = value;
            }
        }
        public String PlateFontColor
        {
            get
            {
                return plateFontColor;
            }

            set
            {
                plateFontColor = value;
            }
        }
        public String PlateBackColor
        {
            get
            {
                return plateBackColor;
            }

            set
            {
                plateBackColor = value;
            }
        }
        public String VehicleColor
        {
            get
            {
                return vehicleColor;
            }

            set
            {
                vehicleColor = value;
            }
        }
        public Int16 VehicleDirectionId
        {
            get
            {
                return vehicleDirectionId;
            }

            set
            {
                vehicleDirectionId = value;
            }
        }
        public String VehicleDirectionName
        {
            get
            {
                return vehicleDirectionName;
            }

            set
            {
                vehicleDirectionName = value;
            }
        }
        public Boolean IsPlateVisible
        {
            get
            {
                return isPlateVisible;
            }

            set
            {
                isPlateVisible = value;
            }
        }
        public Boolean IsFaultyPlate
        {
            get
            {
                return isFaultyPlate;
            }

            set
            {
                isFaultyPlate = value;
            }
        }
        public Boolean IsStandardPlate
        {
            get
            {
                return isStandardPlate;
            }

            set
            {
                isStandardPlate = value;
            }
        }
        public Boolean IsWrongDirection
        {
            get
            {
                return isWrongDirection;
            }

            set
            {
                isWrongDirection = value;
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
        public Boolean IsRestiredVehicle
        {
            get
            {
                return isRestiredVehicle;
            }

            set
            {
                isRestiredVehicle = value;
            }
        }
    }
}
