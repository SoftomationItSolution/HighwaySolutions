using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class SystemVehicleClassBL
    {
        public static List<ResponseIL> InsertUpdate(SystemVehicleClassIL data)
        {
            try
            {
                return SystemVehicleClassDL.InsertUpdate(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<SystemVehicleClassIL> GetAll()
        {
            try
            {
                return SystemVehicleClassDL.GetAll();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<SystemVehicleClassIL> GetActive()
        {
            try
            {
                return SystemVehicleClassDL.GetActive();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static SystemVehicleClassIL GetById(short SystemVehicleClassId)
        {
            try
            {
                return SystemVehicleClassDL.GetById(SystemVehicleClassId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
