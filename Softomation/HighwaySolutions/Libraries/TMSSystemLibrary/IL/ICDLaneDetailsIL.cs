using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class ICDLaneDetailsIL
    {
        Int16 plazaId;
        Int16 laneId;
        string laneNumber;
        Int16 laneDirectionId;
        string laneDirectionName;
        Int16 laneStatusId;
        string laneStatusName;
        Int16 laneModeId;
        string laneModeName;
        Int16 laneTypeId;
        string laneTypeName;
        Int64 readerId;
        string readerName;

        public ICDLaneDetailsIL()
        {
            plazaId = 0;
            laneId = 0;
            laneNumber = string.Empty;
            laneDirectionId = 0;
            laneDirectionName = string.Empty;
            laneStatusId = 0;
            laneStatusName = string.Empty;
            laneModeId = 0;
            laneModeName = string.Empty;
            laneTypeId = 0;
            laneTypeName = string.Empty;
            readerId = 0;
            readerName = string.Empty;
        }
        public Int16 PlazaId
        {
            get
            {
                return plazaId;
            }

            set
            {
                plazaId = value;
            }
        }
        public Int16 LaneId
        {
            get
            {
                return laneId;
            }

            set
            {
                laneId = value;
            }
        }
        public String LaneNumber
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
        public Int16 LaneDirectionId
        {
            get
            {
                return laneDirectionId;
            }

            set
            {
                laneDirectionId = value;
            }
        }
        public String LaneDirectionName
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
        public Int64 ReaderId
        {
            get
            {
                return readerId;
            }

            set
            {
                readerId = value;
            }
        }
        public String ReaderName
        {
            get
            {
                return readerName;
            }

            set
            {
                readerName = value;
            }
        }
        public Int16 LaneStatusId
        {
            get
            {
                return laneStatusId;
            }

            set
            {
                laneStatusId = value;
            }
        }
        public String LaneStatusName
        {
            get
            {
                return laneStatusName;
            }

            set
            {
                laneStatusName = value;
            }
        }
        public Int16 LaneModeId
        {
            get
            {
                return laneModeId;
            }

            set
            {
                laneModeId = value;
            }
        }
        public String LaneModeName
        {
            get
            {
                return laneModeName;
            }

            set
            {
                laneModeName = value;
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
    }
}
