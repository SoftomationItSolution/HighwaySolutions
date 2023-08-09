using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
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
