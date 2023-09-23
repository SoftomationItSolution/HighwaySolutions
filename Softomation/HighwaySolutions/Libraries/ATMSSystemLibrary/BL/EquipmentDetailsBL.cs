using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
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
        public static List<EquipmentDetailsIL> DashboardGetAll()
        {
            try
            {
                return EquipmentDetailsDL.DashboardGetAll();
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
