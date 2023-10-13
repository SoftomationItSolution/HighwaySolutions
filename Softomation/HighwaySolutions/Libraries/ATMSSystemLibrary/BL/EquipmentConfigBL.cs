using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class EquipmentConfigBL
    {

        public static List<ResponseIL> SetUp(List<EquipmentConfigIL> config)
        {
            try
            {
                return EquipmentConfigDL.SetUp(config);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

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

        public static List<EquipmentConfigIL> GetActive()
        {
            try
            {
                return EquipmentConfigDL.GetActive();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}
