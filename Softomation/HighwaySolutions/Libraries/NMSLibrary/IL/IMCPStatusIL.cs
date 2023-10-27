using System;

namespace HighwaySoluations.Softomation.NMSSystemLibrary.IL
{
    public class IMCPStatusIL: EquipmentDetailsIL
    {
        short statusId;
        string statusName;
        long latency;
        int timeout;

        public IMCPStatusIL()
        {
            statusId = 0;
            statusName = string.Empty;
            latency = -1;
            timeout = 1000;
        }

        public Int16 StatusId
        {
            get
            {
                return statusId;
            }

            set
            {
                statusId = value;
            }
        }
        public Int64 Latency
        {
            get
            {
                return latency;
            }

            set
            {
                latency = value;
            }
        }
        public String StatusName
        {
            get
            {
                return statusName;
            }

            set
            {
                statusName = value;
            }
        }
        public Int32 Timeout
        {
            get
            {
                return timeout;
            }

            set
            {
                timeout = value;
            }
        }
    }
}
