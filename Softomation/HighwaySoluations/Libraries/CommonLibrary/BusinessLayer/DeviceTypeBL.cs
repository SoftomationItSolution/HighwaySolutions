using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class DeviceTypeBL
    {
        public static List<DeviceTypeIL> GetAll()
        {
            try
            {
                return DeviceTypeDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<DeviceTypeIL> GetAllActive()
        {
            try
            {
                return DeviceTypeDL.GetAllActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<DeviceTypeIL> GetAllActiveByCatId(Int16 CategoryId)
        {
            try
            {
                return DeviceTypeDL.GetAllActiveByCatId(CategoryId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static DeviceTypeIL GetById(int EntryId)
        {
            try
            {
                return DeviceTypeDL.GetById(EntryId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
