using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class ICDHeartBeatDetailsIL: ICDCommonIL
    {
        string transactionId;
        string note;
        string refId;
        string refUrl;
        string orgTransactionId;
        int acquirerId;

        List<ICDLaneDetailsIL> laneDetails;
        public ICDHeartBeatDetailsIL()
        {
            transactionId=string.Empty;
            note = string.Empty;
            refId = string.Empty;
            refUrl = string.Empty;
            orgTransactionId = string.Empty;
            acquirerId = 0;
            laneDetails = new List<ICDLaneDetailsIL>();
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
        public String Note
        {
            get
            {
                return note;
            }

            set
            {
                note = value;
            }
        }
        public String RefId
        {
            get
            {
                return refId;
            }

            set
            {
                refId = value;
            }
        }
        public String RefUrl
        {
            get
            {
                return refUrl;
            }

            set
            {
                refUrl = value;
            }
        }
        public String OrgTransactionId
        {
            get
            {
                return orgTransactionId;
            }

            set
            {
                orgTransactionId = value;
            }
        }
        public int AcquirerId
        {
            get
            {
                return acquirerId;
            }

            set
            {
                acquirerId = value;
            }
        }
        public List<ICDLaneDetailsIL> LaneDetails
        {
            get
            {
                return laneDetails;
            }

            set
            {
                laneDetails = value;
            }
        }
    }
}
