using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class EquipmentTypeBL
    {
        public static List<EquipmentTypeIL> GetAll()
        {
            try
            {
                return EquipmentTypeDL.GetAll();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<EquipmentTypeIL> GetActive()
        {
            try
            {
                return EquipmentTypeDL.GetActive();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
