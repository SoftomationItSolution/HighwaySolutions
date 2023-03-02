using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class DevicesMasterBL
    {
        public static List<ResponceIL> InsertUpdate(DevicesMasterIL devicesMaster)
        {
            try
            {
                return DevicesMasterDL.InsertUpdate(devicesMaster);
            }
             catch (Exception ex)
            {

                throw ex;
            }
        }
        public static DevicesMasterIL GetById(int entryId)
        {
            try
            {
                return DevicesMasterDL.GetById(entryId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static DevicesMasterIL GetByIpAddress(String IpAddress)
        {
            try
            {
                return DevicesMasterDL.GetByIpAddress(IpAddress);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<DevicesMasterIL> GetAll()
        {
            try
            {
                return DevicesMasterDL.GetAll();
            }
             catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<DevicesMasterIL> GetAllActive()
        {
            try
            {
                return DevicesMasterDL.GetAllActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<DevicesMasterIL> GetByCategory(short CategoryId)
        {
            try
            {
                return DevicesMasterDL.GetByCategory(CategoryId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<DevicesMasterIL> GetByType(short DeviceTypeId)
        {
            try
            {
                return DevicesMasterDL.GetByType(DeviceTypeId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<DevicesMasterIL> GetByControlRoom(short ControlRoomId)
        {
            try
            {
                return DevicesMasterDL.GetByControlRoom(ControlRoomId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<DevicesMasterIL> GetByControlRoomActive(Int16 ControlRoomId)
        {
            try
            {
                return DevicesMasterDL.GetByControlRoomActive(ControlRoomId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<DevicesMasterIL> GetAllCoordinates(short ControlRoomId)
        {
            try
            {
                return DevicesMasterDL.GetAllCoordinates(ControlRoomId);
            }
             catch (Exception ex)
            {

                throw ex;
            }
        }

       
    }
}
