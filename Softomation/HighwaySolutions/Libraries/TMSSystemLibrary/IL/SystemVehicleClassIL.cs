using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class SystemVehicleClassIL : CommonIL
    {
        Int16 systemVehicleClassId;
        String systemVehicleClassName;
        String systemVehicleClassDescription;
        Decimal permissibleWeight;
        String systemVehicleClassIds;
        String systemSubClassNames;
        short[] systemSubClassIdList;
       
        List<FasTagVehicleClassIL> systemSubClassList;

        public SystemVehicleClassIL()
        {
            systemVehicleClassId = 0;
            systemVehicleClassName = string.Empty;
            systemVehicleClassDescription = string.Empty;
            permissibleWeight = 0;
            systemVehicleClassIds = string.Empty;
            systemSubClassNames = string.Empty;
            systemSubClassList = new List<FasTagVehicleClassIL>();
        }

        public short SystemVehicleClassId { get => systemVehicleClassId; set => systemVehicleClassId = value; }
        public string SystemVehicleClassName { get => systemVehicleClassName; set => systemVehicleClassName = value; }
        public string SystemVehicleClassDescription { get => systemVehicleClassDescription; set => systemVehicleClassDescription = value; }
        public decimal PermissibleWeight { get => permissibleWeight; set => permissibleWeight = value; }
        public string SystemVehicleClassIds { get => systemVehicleClassIds; set => systemVehicleClassIds = value;}
        public string SystemSubClassNames { get => systemSubClassNames; set => systemSubClassNames = value;}
        public short[] SystemSubClassIdList
        {
            get => systemSubClassIdList; set => systemSubClassIdList = value;
        }
        public List<FasTagVehicleClassIL> SystemSubClassList{get => systemSubClassList; set => systemSubClassList = value;}
    }
}
