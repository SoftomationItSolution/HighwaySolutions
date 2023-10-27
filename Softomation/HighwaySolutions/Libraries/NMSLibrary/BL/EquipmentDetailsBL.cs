using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.NMSSystemLibrary.IL;
using HighwaySoluations.Softomation.NMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.NMSSystemLibrary.BL
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
        public static List<EquipmentDetailsIL> GetBySystemId(Int16 SystemId)
        {
            try
            {
                return EquipmentDetailsDL.GetBySystemId(SystemId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<EquipmentDetailsIL> GetByTypeId(Int16 EquipmentTypeId)
        {
            try
            {
                return EquipmentDetailsDL.GetByTypeId(EquipmentTypeId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<EquipmentDetailsIL> GetByFilter(DataFilterIL data)
        {
            try
            {
                return EquipmentDetailsDL.GetByFilter(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
