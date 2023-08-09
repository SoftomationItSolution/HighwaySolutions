using System;

namespace Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer
{
    public class LaneManagementIL : CommonIL
    {
        
        String plazaIp;
        Int16 laneNumber;
        Int16 laneTypeId;
        String laneTypeName;
        Int16 laneForId;
        String laneForName;
        Int16 laneDirection;
        String direction;
        String laneName;
        String laneIP;
        public LaneManagementIL()
        {
           
            
            this.plazaIp = string.Empty;
            this.laneNumber = 0;
            this.laneTypeId = 0;
            this.laneTypeName = string.Empty;
            this.laneForId = 0;
            this.laneForName = string.Empty;
            this.laneDirection = 0;
            this.direction = string.Empty;
            this.laneName = string.Empty;
            this.laneIP = string.Empty;
        }
        public String PlazaIp
        {
            get
            {
                return plazaIp;
            }

            set
            {
                plazaIp = value;
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

        public Int16 LaneTypeId
        {
            get
            {
                return laneTypeId;
            }

            set
            {
                laneTypeId = value;
            }
        }

        public String LaneTypeName
        {
            get
            {
                return laneTypeName;
            }

            set
            {
                laneTypeName = value;
            }
        }

        public Int16 LaneForId
        {
            get
            {
                return laneForId;
            }

            set
            {
                laneForId = value;
            }
        }

        public String LaneForName
        {
            get
            {
                return laneForName;
            }

            set
            {
                laneForName = value;
            }
        }

        public Int16 LaneDirection
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

        public String Direction
        {
            get
            {
                return direction;
            }

            set
            {
                direction = value;
            }
        }

        public String LaneName
        {
            get
            {
                return laneName;
            }

            set
            {
                laneName = value;
            }
        }

        public String LaneIP
        {
            get
            {
                return laneIP;
            }

            set
            {
                laneIP = value;
            }
        }
    }
}
