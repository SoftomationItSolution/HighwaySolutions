using System;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class ECBCallEventIL: CommonIL
    {
        Int64 callerId;
        String callerIpAddress;
        String callerNumber;
        Int16 callerPackageId;
        String callerPackageName;
        Int64 callerControlRoomId;
        String callerControlRoomName;
        Decimal callerChainageNumber;
        String callerChainageName;
        Double callerLatitude;
        Double callerLongitude;
        Int16 callerDirectionId;
        String callerDirectionName;

        Int64 calleeId;
        String calleeIpAddress;
        String calleeNumber;
        Int16 calleePackageId;
        String calleePackageName;
        Int64 calleeControlRoomId;
        String calleeControlRoomName;
        Decimal calleeChainageNumber;
        String calleeChainageName;
        Double calleeLatitude;
        Double calleeLongitude;
        Int16 calleeDirectionId;
        String calleeDirectionName;

        Int64 operatorId;
        String operatorLoginId;
        String eventId;
        String recordingFileName;
        DateTime startDateTime;
        String startDateTimeStamp;
        DateTime endDateTime;
        String endDateTimeStamp;
        Int32 callDuration;
        Int16 callStatusId;
        String callStatusName;
        Int16 callTypeId;
        String callTypeName;
        Int16 systemProviderId;
        String incidentId;
        Int16 incidentStatusId;
        public ECBCallEventIL()
        {
            this.callerId = 0;
            this.callerIpAddress = string.Empty;
            this.callerNumber = string.Empty;
            this.callerPackageId = 0;
            this.callerPackageName = string.Empty;
            this.callerControlRoomId = 0;
            this.callerControlRoomName = string.Empty;
            this.callerChainageNumber = 0;
            this.callerChainageName = string.Empty;
            this.callerLatitude = 0;
            this.callerLongitude = 0;
            this.callerDirectionId = 0;
            this.callerDirectionName = string.Empty;

            this.calleeId = 0;
            this.calleeIpAddress = string.Empty;
            this.calleeNumber = string.Empty;
            this.calleePackageId = 0;
            this.calleePackageName = string.Empty;
            this.calleeControlRoomId = 0;
            this.calleeControlRoomName = string.Empty;
            this.calleeChainageNumber = 0;
            this.calleeChainageName = string.Empty;
            this.calleeLatitude = 0;
            this.calleeLongitude = 0;
            this.calleeDirectionId = 0;
            this.calleeDirectionName = string.Empty;


            this.operatorId = 0;
            this.operatorLoginId = string.Empty;
            this.eventId = string.Empty;
            this.recordingFileName = string.Empty;
            this.startDateTime = DateTime.Now;
            this.startDateTimeStamp = string.Empty;
            this.endDateTime = DateTime.Now;
            this.endDateTimeStamp = string.Empty;
            this.callDuration = 0;
            this.callStatusId = 0;
            this.callStatusName = string.Empty;
            this.callTypeId = 0;
            this.callTypeName = string.Empty;
            this.systemProviderId = 0;
            this.incidentId = string.Empty;
            this.incidentStatusId = 0;
        }

        public Int64 CallerId
        {
            get
            {
                return callerId;
            }

            set
            {
                callerId = value;
            }
        }
        public String CallerIpAddress
        {
            get
            {
                return callerIpAddress;
            }

            set
            {
                callerIpAddress = value;
            }
        }
        public String CallerNumber
        {
            get
            {
                return callerNumber;
            }

            set
            {
                callerNumber = value;
            }
        }
        public Int16 CallerPackageId
        {
            get
            {
                return callerPackageId;
            }

            set
            {
                callerPackageId = value;
            }
        }
        public String CallerPackageName
        {
            get
            {
                return callerPackageName;
            }

            set
            {
                callerPackageName = value;
            }
        }
        public Int64 CallerControlRoomId
        {
            get
            {
                return callerControlRoomId;
            }

            set
            {
                callerControlRoomId = value;
            }
        }
        public String CallerControlRoomName
        {
            get
            {
                return callerControlRoomName;
            }

            set
            {
                callerControlRoomName = value;
            }
        }
        public Decimal CallerChainageNumber
        {
            get
            {
                return callerChainageNumber;
            }

            set
            {
                callerChainageNumber = value;
            }
        }
        public String CallerChainageName
        {
            get
            {
                return callerChainageName;
            }

            set
            {
                callerChainageName = value;
            }
        }
        public Double CallerLatitude
        {
            get
            {
                return callerLatitude;
            }

            set
            {
                callerLatitude = value;
            }
        }
        public Double CallerLongitude
        {
            get
            {
                return callerLongitude;
            }

            set
            {
                callerLongitude = value;
            }
        }
        public Int16 CallerDirectionId
        {
            get
            {
                return callerDirectionId;
            }

            set
            {
                callerDirectionId = value;
            }
        }
        public String CallerDirectionName
        {
            get
            {
                return callerDirectionName;
            }

            set
            {
                callerDirectionName = value;
            }
        }
        public Int64 CalleeId
        {
            get
            {
                return calleeId;
            }

            set
            {
                calleeId = value;
            }
        }
        public String CalleeIpAddress
        {
            get
            {
                return calleeIpAddress;
            }

            set
            {
                calleeIpAddress = value;
            }
        }
        public String CalleeNumber
        {
            get
            {
                return calleeNumber;
            }

            set
            {
                calleeNumber = value;
            }
        }
        public Int16 CalleePackageId
        {
            get
            {
                return calleePackageId;
            }

            set
            {
                calleePackageId = value;
            }
        }
        public String CalleePackageName
        {
            get
            {
                return calleePackageName;
            }

            set
            {
                calleePackageName = value;
            }
        }
        public Int64 CalleeControlRoomId
        {
            get
            {
                return calleeControlRoomId;
            }

            set
            {
                calleeControlRoomId = value;
            }
        }
        public String CalleeControlRoomName
        {
            get
            {
                return calleeControlRoomName;
            }

            set
            {
                calleeControlRoomName = value;
            }
        }
        public Decimal CalleeChainageNumber
        {
            get
            {
                return calleeChainageNumber;
            }

            set
            {
                calleeChainageNumber = value;
            }
        }
        public String CalleeChainageName
        {
            get
            {
                return calleeChainageName;
            }

            set
            {
                calleeChainageName = value;
            }
        }
        public Double CalleeLatitude
        {
            get
            {
                return calleeLatitude;
            }

            set
            {
                calleeLatitude = value;
            }
        }
        public Double CalleeLongitude
        {
            get
            {
                return calleeLongitude;
            }

            set
            {
                calleeLongitude = value;
            }
        }
        public Int16 CalleeDirectionId
        {
            get
            {
                return calleeDirectionId;
            }

            set
            {
                calleeDirectionId = value;
            }
        }
        public String CalleeDirectionName
        {
            get
            {
                return calleeDirectionName;
            }

            set
            {
                calleeDirectionName = value;
            }
        }
        public Int64 OperatorId
        {
            get
            {
                return operatorId;
            }

            set
            {
                operatorId = value;
            }
        }
        public String OperatorLoginId
        {
            get
            {
                return operatorLoginId;
            }

            set
            {
                operatorLoginId = value;
            }
        }
        public String EventId
        {
            get
            {
                return eventId;
            }

            set
            {
                eventId = value;
            }
        }
        public String RecordingFileName
        {
            get
            {
                return recordingFileName;
            }

            set
            {
                recordingFileName = value;
            }
        }
        public DateTime StartDateTime
        {
            get
            {
                return startDateTime;
            }

            set
            {
                startDateTime = value;
            }
        }
        public String StartDateTimeStamp
        {
            get
            {
                return startDateTimeStamp;
            }

            set
            {
                startDateTimeStamp = value;
            }
        }
        public DateTime EndDateTime
        {
            get
            {
                return endDateTime;
            }

            set
            {
                endDateTime = value;
            }
        }
        public String EndDateTimeStamp
        {
            get
            {
                return endDateTimeStamp;
            }

            set
            {
                endDateTimeStamp = value;
            }
        }
        public Int32 CallDuration
        {
            get
            {
                return callDuration;
            }

            set
            {
                callDuration = value;
            }
        }
        public Int16 CallStatusId
        {
            get
            {
                return callStatusId;
            }

            set
            {
                callStatusId = value;
            }
        }
        public String CallStatusName
        {
            get
            {
                return callStatusName;
            }

            set
            {
                callStatusName = value;
            }
        }
        public Int16 CallTypeId
        {
            get
            {
                return callTypeId;
            }

            set
            {
                callTypeId = value;
            }
        }
        public String CallTypeName
        {
            get
            {
                return callTypeName;
            }

            set
            {
                callTypeName = value;
            }
        }
        public Int16 SystemProviderId
        {
            get
            {
                return systemProviderId;
            }

            set
            {
                systemProviderId = value;
            }
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
    }
}
