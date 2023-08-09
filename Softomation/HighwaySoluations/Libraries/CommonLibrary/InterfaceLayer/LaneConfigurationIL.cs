using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class LaneConfigurationIL : GantryManagementIL
    {
        Int16 gantryId;
        Int16 laneNumber;
        Int16 laneDirection;
        String laneDirectionName;
        public LaneConfigurationIL()
        {
            this.gantryId = 0;
            this.laneNumber = 0;
            this.laneDirection = 0;
            this.laneDirectionName = string.Empty;
        }
        public short GantryId
        {
            get
            {
                return gantryId;
            }

            set
            {
                gantryId = value;
            }
        }
        public short LaneNumber
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
        public short LaneDirection
        {
            get
            {
                return laneDirection;
            }

            set
            {
                laneDirection = value;
            }
        }
        public string LaneDirectionName
        {
            get
            {
                return laneDirectionName;
            }

            set
            {
                laneDirectionName = value;
            }
        }
    }
}
