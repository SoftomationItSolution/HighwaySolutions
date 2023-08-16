using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;


namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class EquipmentManufactureBL
    {
        public static List<ResponseIL> InsertUpdate(EquipmentManufactureIL eqMF)
        {
            try
            {
                return EquipmentManufactureDL.InsertUpdate(eqMF);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<EquipmentManufactureIL> GetAll()
        {
            try
            {
                return EquipmentManufactureDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<EquipmentManufactureIL> GetActive()
        {
            try
            {
                return EquipmentManufactureDL.GetActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static EquipmentManufactureIL GetById(short EquipmentManufactureId)
        {
            try
            {
                return EquipmentManufactureDL.GetById(EquipmentManufactureId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
