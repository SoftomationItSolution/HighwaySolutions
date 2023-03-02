using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class ShiftLaneDetailsIL
    {
        Int64 shfitDetailId;
        Int64 lastTransId;
        Int16 laneNumber;

        public ShiftLaneDetailsIL()
        {
            this.shfitDetailId = 0;
            this.lastTransId = 0;
            this.laneNumber = 0;
        }

        public Int64 ShfitDetailId
        {
            get
            {
                return shfitDetailId;
            }

            set
            {
                shfitDetailId = value;
            }
        }

        public Int64 LastTransId
        {
            get
            {
                return lastTransId;
            }

            set
            {
                lastTransId = value;
            }
        }

        public Int16 LaneNumber
        {
            get
            {
                return laneNumber;
            }

            set
            {
                laneNumber = value;
            }
        }
    }
}
