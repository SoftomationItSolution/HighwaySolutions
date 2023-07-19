using System;
using System.Collections.Generic;

namespace Softomation.ATMSSystemLibrary.IL
{
    public class IncidentDetailsIL : IncidentStatusIL
    {
        String incidentId;
        Int16 incidentCategoryId;
        String incidentCategoryName;
        Int16 priorityId;
        String priorityName;
        String incidentDescription;
        String incidentImagePath;
        String incidentVideoPath;
        String incidentAudioPath;
        Int16 directionId;
        String directionName;
        Decimal chainageNumber;
        Decimal latitude;
        Decimal longitude;
        String vehiclePlateNumber;
        Int16 vehicleClassId;
        String vehicleClassName;
        Int16 sourceSystemId;
        String sourceSystemName;
        Int64 equipmentId;
        String equipmentName;
        Int64 nearByVMSId;
        Int64 nearByPTZId;
        Int16 incidentGeneratedByTypeId;
        String incidentGeneratedByTypeName;
        Int64 incidentGeneratedById;
        String incidentGeneratedByName;
        String assignedName;
        Int64 assignedTo;
        DateTime assignedDateTime;
        Decimal processPercentage;
        Int16 sendStatus;
        List<IncidentActionHistoryIL> actionHistoryDetails;

        public IncidentDetailsIL()
        {
            incidentId = string.Empty;
            incidentCategoryId = 0;
            incidentCategoryName = string.Empty;
            priorityId = 0;
            priorityName = string.Empty;
            incidentDescription = string.Empty;
            incidentImagePath = string.Empty;
            incidentVideoPath = string.Empty;
            incidentAudioPath = string.Empty;
            directionId = 0;
            directionName = string.Empty;
            chainageNumber = 0;
            latitude = 0;
            longitude = 0;
            vehiclePlateNumber = string.Empty;
            vehicleClassId = 0;
            vehicleClassName = string.Empty;
            sourceSystemId = 0;
            sourceSystemName = string.Empty;
            equipmentId = 0;
            equipmentName = string.Empty;
            nearByVMSId = 0;
            nearByPTZId = 0;
            incidentGeneratedByTypeId = 0;
            incidentGeneratedByTypeName = string.Empty;
            incidentGeneratedById = 0;
            incidentGeneratedByName = string.Empty;
            assignedName = string.Empty;
            assignedTo = 0;
            assignedDateTime = DateTime.MinValue;
            processPercentage = 0;
            sendStatus = 0;
            actionHistoryDetails = new List<IncidentActionHistoryIL>();
        }

        public String IncidentId
        {
            get
            {
                return incidentId;
            }

            set
            {
                incidentId = value;
            }
        }
        public Int16 IncidentCategoryId
        {
            get
            {
                return incidentCategoryId;
            }

            set
            {
                incidentCategoryId = value;
            }
        }
        public String IncidentCategoryName
        {
            get
            {
                return incidentCategoryName;
            }

            set
            {
                incidentCategoryName = value;
            }
        }
        public Int16 PriorityId
        {
            get
            {
                return priorityId;
            }

            set
            {
                priorityId = value;
            }
        }
        public String PriorityName
        {
            get
            {
                return priorityName;
            }

            set
            {
                priorityName = value;
            }
        }
        public String IncidentDescription
        {
            get
            {
                return incidentDescription;
            }

            set
            {
                incidentDescription = value;
            }
        }
        public String IncidentImagePath
        {
            get
            {
                return incidentImagePath;
            }

            set
            {
                incidentImagePath = value;
            }
        }
        public String IncidentVideoPath
        {
            get
            {
                return incidentVideoPath;
            }

            set
            {
                incidentVideoPath = value;
            }
        }
        public String IncidentAudioPath
        {
            get
            {
                return incidentAudioPath;
            }

            set
            {
                incidentAudioPath = value;
            }
        }
        public Int16 DirectionId
        {
            get
            {
                return directionId;
            }

            set
            {
                directionId = value;
            }
        }
        public String DirectionName
        {
            get
            {
                return directionName;
            }

            set
            {
                directionName = value;
            }
        }
        public Decimal ChainageNumber
        {
            get
            {
                return chainageNumber;
            }

            set
            {
                chainageNumber = value;
            }
        }
        public Decimal Latitude
        {
            get
            {
                return latitude;
            }

            set
            {
                latitude = value;
            }
        }
        public Decimal Longitude
        {
            get
            {
                return longitude;
            }

            set
            {
                longitude = value;
            }
        }
        public String VehiclePlateNumber
        {
            get
            {
                return vehiclePlateNumber;
            }

            set
            {
                vehiclePlateNumber = value;
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
        public Int16 SourceSystemId
        {
            get
            {
                return sourceSystemId;
            }

            set
            {
                sourceSystemId = value;
            }
        }
        public String SourceSystemName
        {
            get
            {
                return sourceSystemName;
            }

            set
            {
                sourceSystemName = value;
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
        public String EquipmentName
        {
            get
            {
                return equipmentName;
            }

            set
            {
                equipmentName = value;
            }
        }
        public Int64 NearByVMSId
        {
            get
            {
                return nearByVMSId;
            }

            set
            {
                nearByVMSId = value;
            }
        }
        public Int64 NearByPTZId
        {
            get
            {
                return nearByPTZId;
            }

            set
            {
                nearByPTZId = value;
            }
        }
        public Int16 IncidentGeneratedByTypeId
        {
            get
            {
                return incidentGeneratedByTypeId;
            }

            set
            {
                incidentGeneratedByTypeId = value;
            }
        }
        public String IncidentGeneratedByTypeName
        {
            get
            {
                return incidentGeneratedByTypeName;
            }

            set
            {
                incidentGeneratedByTypeName = value;
            }
        }
        public Int64 IncidentGeneratedById
        {
            get
            {
                return incidentGeneratedById;
            }

            set
            {
                incidentGeneratedById = value;
            }
        }
        public String IncidentGeneratedByName
        {
            get
            {
                return incidentGeneratedByName;
            }

            set
            {
                incidentGeneratedByName = value;
            }
        }
       
        public Int64 AssignedTo
        {
            get
            {
                return assignedTo;
            }

            set
            {
                assignedTo = value;
            }
        }
        public String AssignedName
        {
            get
            {
                return assignedName;
            }

            set
            {
                assignedName = value;
            }
        }
        public DateTime AssignedDateTime
        {
            get
            {
                return assignedDateTime;
            }

            set
            {
                assignedDateTime = value;
            }
        }
        public Decimal ProcessPercentage
        {
            get
            {
                return processPercentage;
            }

            set
            {
                processPercentage = value;
            }
        }
        public List<IncidentActionHistoryIL> ActionHistoryDetails
        {
            get
            {
                return actionHistoryDetails;
            }

            set
            {
                actionHistoryDetails = value;
            }
        }
    }
}
