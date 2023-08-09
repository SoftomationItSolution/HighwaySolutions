using System;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class ECBCallEventsIL : CommonIL
    {
        private String callerControlRoomName;
        private String caller;
        private Int64 callerId;
        private String calleeControlRoomName;
        private String callee;
        private Int64 calleeId;
        private String sessionId;
        private String recordingFileName;
        private DateTime startDateTime;
        private DateTime endDateTime;
        private Int16 callDuration;
        private Int16 callTypeId;
        private String callTypeName;
        private Int16 callStatusId;
        private String callStatusName;
        public ECBCallEventsIL()
        {
            this.callerControlRoomName = String.Empty;
            this.caller = String.Empty;
            this.callerId = 0;
            this.calleeControlRoomName = String.Empty;
            this.callee = String.Empty;
            this.calleeId = 0;
            this.sessionId = String.Empty;
            this.recordingFileName = String.Empty;
            this.startDateTime = DateTime.Now;
            this.endDateTime = DateTime.Now;
            this.callDuration = 0;
            this.callTypeId = 0;
            this.callTypeName = String.Empty;
            this.callStatusId = 0;
            this.callStatusName = String.Empty;
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
        public String Caller
        {
            get
            {
                return caller;
            }

            set
            {
                caller = value;
            }
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
        public String Callee
        {
            get
            {
                return callee;
            }

            set
            {
                callee = value;
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
        public String SessionId
        {
            get
            {
                return sessionId;
            }

            set
            {
                sessionId = value;
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
        public Int16 CallDuration
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
    }
}
