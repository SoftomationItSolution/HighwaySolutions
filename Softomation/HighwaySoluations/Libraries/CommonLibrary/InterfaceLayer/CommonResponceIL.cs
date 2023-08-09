using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class LaneDataSyncResponce
    {
        Int64 crTransId;
        string responceMessage;
        public LaneDataSyncResponce()
        {
            crTransId = 0;
            this.responceMessage = string.Empty;
        }

        public Int64 CrTransId
        {
            get
            {
                return crTransId;
            }

            set
            {
                crTransId = value;
            }
        }

        public String ResponceMessage
        {
            get
            {
                return responceMessage;
            }

            set
            {
                responceMessage = value;
            }
        }
    }
}
