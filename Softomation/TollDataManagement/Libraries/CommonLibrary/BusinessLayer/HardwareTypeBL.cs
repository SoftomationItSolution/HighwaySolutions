using System;
using System.Collections.Generic;
using System.Data;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;
namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class HardwareTypeBL
    {
        public static List<ResponceIL> PInsertUpdate(HardwareTypeIL hardwareType)
        {
            try
            {
                return HardwareTypeDL.PHardwareTypesUpdate(hardwareType);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static void MarkedDeleted()
        {
            try
            {
                HardwareTypeDL.MarkedDeleted();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static void DeletedData()
        {
            try
            {
                HardwareTypeDL.DeletedData();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<HardwareTypeIL> GetAll()
        {
            try
            {
                return HardwareTypeDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<HardwareTypeIL> GetActive()
        {
            try
            {
                return HardwareTypeDL.GetActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static HardwareTypeIL GetById(int HardwareTypeId)
        {
            try
            {
                return HardwareTypeDL.GetById(HardwareTypeId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
