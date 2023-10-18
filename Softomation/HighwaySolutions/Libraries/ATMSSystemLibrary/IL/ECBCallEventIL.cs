using System;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class ECBCallEventIL : PackageIL
    {
        Int64 callerId;
        Int64 calleeId;
        String callerIpAddress;
        String calleeIpAddress;
        String callerNumber;
        String calleeNumber;
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
            this.calleeId = 0;
            this.callerIpAddress = string.Empty;
            this.calleeIpAddress = string.Empty;
            this.callerNumber = string.Empty;
            this.calleeNumber = string.Empty;
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

        public long CallerId
        {
            get => callerId; set => callerId = value;
        }
        public long CalleeId
        {
            get => calleeId; set => calleeId = value;
        }
        public string CallerIpAddress
        {
            get => callerIpAddress; set => callerIpAddress = value;
        }
        public string CalleeIpAddress
        {
            get => calleeIpAddress; set => calleeIpAddress = value;
        }
        public string CallerNumber
        {
            get => callerNumber; set => callerNumber = value;
        }
        public string CalleeNumber
        {
            get => calleeNumber; set => calleeNumber = value;
        }
        public long OperatorId
        {
            get => operatorId; set => operatorId = value;
        }
        public string OperatorLoginId
        {
            get => operatorLoginId; set => operatorLoginId = value;
        }
        public string EventId
        {
            get => eventId; set => eventId = value;
        }
        public string RecordingFileName
        {
            get => recordingFileName; set => recordingFileName = value;
        }
        public DateTime StartDateTime
        {
            get => startDateTime; set => startDateTime = value;
        }
        public string StartDateTimeStamp
        {
            get => startDateTimeStamp; set => startDateTimeStamp = value;
        }
        public DateTime EndDateTime
        {
            get => endDateTime; set => endDateTime = value;
        }
        public string EndDateTimeStamp
        {
            get => endDateTimeStamp; set => endDateTimeStamp = value;
        }
        public int CallDuration
        {
            get => callDuration; set => callDuration = value;
        }
        public short CallStatusId
        {
            get => callStatusId; set => callStatusId = value;
        }
        public string CallStatusName
        {
            get => callStatusName; set => callStatusName = value;
        }
        public short CallTypeId
        {
            get => callTypeId; set => callTypeId = value;
        }
        public string CallTypeName
        {
            get => callTypeName; set => callTypeName = value;
        }
        public short SystemProviderId
        {
            get => systemProviderId; set => systemProviderId = value;
        }
        public string IncidentId
        {
            get => incidentId; set => incidentId = value;
        }
        public short IncidentStatusId
        {
            get => incidentStatusId; set => incidentStatusId = value;
        }
    }
}
