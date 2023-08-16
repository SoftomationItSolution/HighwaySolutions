using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class EquipmentDetailsBL
    {
        public static List<ResponseIL> InsertUpdate(EquipmentDetailsIL ed)
        {

            try
            {
                return EquipmentDetailsDL.InsertUpdate(ed);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<EquipmentDetailsIL> GetAll()
        {
            try
            {
                return EquipmentDetailsDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<EquipmentDetailsIL> GetActive()
        {
            try
            {
                return EquipmentDetailsDL.GetActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static EquipmentDetailsIL GetById(int EquipmentId)
        {
            try
            {
                return EquipmentDetailsDL.GetById(EquipmentId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
