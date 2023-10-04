using System;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class ATCCEventIL : PackageIL
    {
        String transactionId;
        Int64 equipmentId;
        Int16 positionId;
        String positionName;
        DateTime eventDate;
        String eventDateStamp;
        Int16 laneNumber;
        String laneName;
        String plateNumber;
        Int16 vehicleClassId;
        String vehicleClassName;
        String vehicleImageUrl;
        String vehicleVideoUrl;
        Decimal classConfidencelevel;
        String vehicleColor;
        Int16 vehicleDirectionId;
        String vehicleDirectionName;
        Boolean isWrongDirection;
        Boolean isReviewedRequired;
        Boolean isRestiredVehicle;
        public ATCCEventIL()
        {
            this.transactionId = string.Empty;
            this.equipmentId = 0;
            this.positionId = 0;
            this.positionName = string.Empty;
            this.eventDate = DateTime.MinValue;
            this.eventDateStamp = string.Empty;
            this.laneNumber = 0;
            this.laneName = string.Empty;
            this.plateNumber = string.Empty;
            this.vehicleClassId = 0;
            this.vehicleClassName = string.Empty;
            this.vehicleImageUrl = string.Empty;
            this.vehicleVideoUrl = string.Empty;
            this.classConfidencelevel = 0;
            this.vehicleColor = string.Empty;
            this.vehicleDirectionId = 0;
            this.vehicleDirectionName = string.Empty;
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
