using System;
using System.Collections.Generic;
using Softomation.ATMSSystemLibrary.DL;
using Softomation.ATMSSystemLibrary.IL;

namespace Softomation.ATMSSystemLibrary.BL
{
    public class EquipmentConfigBL
    {
        public static List<EquipmentConfigIL> GetBySystemId(short SystemId)
        {
            try
            {
                return EquipmentConfigDL.GetBySystemId(SystemId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
