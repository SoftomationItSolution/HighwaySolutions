using System;
using System.Collections.Generic;
using System.Data;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class HardwareProviderBL
    {
        public static List<ResponceIL> PInsertUpdate(HardwareProviderIL hardwareType)
        {
            try
            {
                return HardwareProviderDL.PInsertUpdate(hardwareType);
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
                HardwareProviderDL.MarkedDeleted();
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
                HardwareProviderDL.DeletedData();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<HardwareProviderIL> GetAll()
        {
            try
            {
                return HardwareProviderDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<HardwareProviderIL> GetActive()
        {
            try
            {
                return HardwareProviderDL.GetActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static HardwareProviderIL GetById(int HardwareTypeId)
        {
            try
            {
                return HardwareProviderDL.GetById(HardwareTypeId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
