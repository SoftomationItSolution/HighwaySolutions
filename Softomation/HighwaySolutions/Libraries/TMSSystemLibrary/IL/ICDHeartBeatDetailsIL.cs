using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class ICDHeartBeatDetailsIL : ICDCommonIL
    {
        Int64 requestHeartBeatId;
        string transactionId;
        string note;
        string refId;
        string refUrl;
        string orgTransactionId;
        ICDPlazaDetailsIL plazaDetail;
        List<ICDLaneDetailsIL> laneDetails;
        
        public ICDHeartBeatDetailsIL()
        {
            requestHeartBeatId = 0;
            transactionId = string.Empty;
            note = string.Empty;
            refId = string.Empty;
            refUrl = string.Empty;
            orgTransactionId = string.Empty;
            plazaDetail = new ICDPlazaDetailsIL();
            laneDetails = new List<ICDLaneDetailsIL>();
        }
       
        public Int64 RequestHeartBeatId
        {
            get
            {
                return requestHeartBeatId;
            }

            set
            {
                requestHeartBeatId = value;
            }
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
        public ICDPlazaDetailsIL PlazaDetail
        {
            get
            {
                return plazaDetail;
            }

            set
            {
                plazaDetail = value;
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
