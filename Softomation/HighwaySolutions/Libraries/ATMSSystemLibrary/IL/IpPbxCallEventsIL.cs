using System;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.IL
{
    public class IpPbxCallEventsIL
    {
        String callerName;
        String callerNumber;
        String callerIpAddress;
        Int16 callerTypeId;
        String callerTypeName;
        String calleeName;
        String calleeNumber;
        String calleeIpAddress;
        Int16 calleeTypeId;
        String calleeTypeName;
        String callerSession;
        String recordingFileName;
        DateTime startDateTime;
        String startDateTimeStamp;
        DateTime endDateTime;
        String endDateTimeStamp;
        Int32 callDuration;
        Int16 callStatusId;
        String callStatusName;

        public IpPbxCallEventsIL()
        {
            this.callerName = string.Empty;
            this.callerNumber = string.Empty;
            this.callerIpAddress = string.Empty;
            this.callerTypeId = 0;
            this.callerTypeName = string.Empty;
            this.calleeName = string.Empty;
            this.calleeNumber = string.Empty;
            this.calleeIpAddress = string.Empty;
            this.calleeTypeId = 0;
            this.calleeTypeName = string.Empty;
            this.callerSession = string.Empty;
            this.recordingFileName = string.Empty;
            this.startDateTime = DateTime.Now;
            this.startDateTimeStamp = string.Empty;
            this.endDateTime = DateTime.Now;
            this.endDateTimeStamp = string.Empty;
            this.callDuration = 0;
            this.callStatusId = 0;
            this.callStatusName = string.Empty;
        }

        public string CallerName
        {
            get => callerName; set => callerName = value;
        }
        public string CallerNumber
        {
            get => callerNumber; set => callerNumber = value;
        }
        public string CallerIpAddress
        {
            get => callerIpAddress; set => callerIpAddress = value;
        }
        public short CallerTypeId
        {
            get => callerTypeId; set => callerTypeId = value;
        }
        public string CallerTypeName
        {
            get => callerTypeName; set => callerTypeName = value;
        }
        public string CalleeName
        {
            get => calleeName; set => calleeName = value;
        }
        public string CalleeNumber
        {
            get => calleeNumber; set => calleeNumber = value;
        }
        public string CalleeIpAddress
        {
            get => calleeIpAddress; set => calleeIpAddress = value;
        }
        public short CalleeTypeId
        {
            get => calleeTypeId; set => calleeTypeId = value;
        }
        public string CalleeTypeName
        {
            get => calleeTypeName; set => calleeTypeName = value;
        }
        public string CallerSession
        {
            get => callerSession; set => callerSession = value;
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
    }
}
