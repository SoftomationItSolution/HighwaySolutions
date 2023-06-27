using System;

namespace Softomation.ATMSSystemLibrary.IL
{
    public class IncidentIL : CommonIL
    {
        String incidentId;
        String referenceNumber;
        Int16 incidentCategoryId;
        String incidentDescription;
        String incidentImagePath;
        String incidentVideoPath;
        String incidentAudioPath;
        Int16 directionId;
        Decimal chainageNumber;
        Decimal latitude;
        Decimal longitude;
        String vehiclePlateNumber;
        Int16 vehicleClassId;
        Int16 sourceSystemId;
        Int64 equipmentId;
        Int64 nearByVMSId;
        Int64 nearByPTZId;
        Int16 incidentGeneratedByTypeId;
        Int64 incidentGeneratedById;
        Int64 rejectedBy;
        String rejectionRemark;
        DateTime rejectionDateTime;
        Int64 approvedBy;
        String approvedRemark;
        DateTime approvedDateTime;
        Int64 assignedTo;
        DateTime assignedDateTime;
        Int64 resolvedBy;
        String resolvedRemark;
        DateTime resolvedDateTime;
        Int16 incidentStatusId;
        Decimal processPercentage;
        Int16 subCategoryId;
        String comments;
        Int16 sendStatus;

        public IncidentIL()
        {
            incidentId = string.Empty;
            referenceNumber = string.Empty;
            incidentCategoryId = 0;
            incidentDescription = string.Empty;
            incidentImagePath = string.Empty;
            incidentVideoPath = string.Empty;
            incidentAudioPath = string.Empty;
            directionId = 0;
            chainageNumber = 0;
            latitude = 0;
            longitude = 0;
            vehiclePlateNumber = string.Empty;
            vehicleClassId = 0;
            sourceSystemId = 0;
            equipmentId = 0;
            nearByVMSId = 0;
            nearByPTZId = 0;
            incidentGeneratedByTypeId = 0;
            incidentGeneratedById = 0;
            rejectedBy = 0;
            rejectionRemark = string.Empty;
            rejectionDateTime = DateTime.MinValue;
            approvedBy = 0;
            approvedRemark = string.Empty;
            approvedDateTime = DateTime.MinValue;
            assignedTo = 0;
            assignedDateTime = DateTime.MinValue;
            resolvedBy = 0;
            resolvedRemark = string.Empty;
            resolvedDateTime = DateTime.MinValue;
            incidentStatusId = 0;
            processPercentage = 0;
            subCategoryId = 0;
            comments = string.Empty;
            sendStatus = 0;
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

        public String ReferenceNumber
        {
            get
            {
                return referenceNumber;
            }

            set
            {
                referenceNumber = value;
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

        public Int64 RejectedBy
        {
            get
            {
                return rejectedBy;
            }

            set
            {
                rejectedBy = value;
            }
        }

        public String RejectionRemark
        {
            get
            {
                return rejectionRemark;
            }

            set
            {
                rejectionRemark = value;
            }
        }

        public DateTime RejectionDateTime
        {
            get
            {
                return rejectionDateTime;
            }

            set
            {
                rejectionDateTime = value;
            }
        }

        public Int64 ApprovedBy
        {
            get
            {
                return approvedBy;
            }

            set
            {
                approvedBy = value;
            }
        }

        public String ApprovedRemark
        {
            get
            {
                return approvedRemark;
            }

            set
            {
                approvedRemark = value;
            }
        }

        public DateTime ApprovedDateTime
        {
            get
            {
                return approvedDateTime;
            }

            set
            {
                approvedDateTime = value;
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

        public Int64 ResolvedBy
        {
            get
            {
                return resolvedBy;
            }

            set
            {
                resolvedBy = value;
            }
        }

        public String ResolvedRemark
        {
            get
            {
                return resolvedRemark;
            }

            set
            {
                resolvedRemark = value;
            }
        }

        public DateTime ResolvedDateTime
        {
            get
            {
                return resolvedDateTime;
            }

            set
            {
                resolvedDateTime = value;
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

        public Int16 SubCategoryId
        {
            get
            {
                return subCategoryId;
            }

            set
            {
                subCategoryId = value;
            }
        }

        public String Comments
        {
            get
            {
                return comments;
            }

            set
            {
                comments = value;
            }
        }

        public Int16 SendStatus
        {
            get
            {
                return sendStatus;
            }

            set
            {
                sendStatus = value;
            }
        }
    }
}
