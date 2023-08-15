using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class VehicleClassBL
    {
        public static List<ResponseIL> InsertUpdate(VehicleClassIL data)
        {
            try
            {
                return VehicleClassDL.InsertUpdate(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<VehicleClassIL> GetAll()
        {
            try
            {
                return VehicleClassDL.GetAll();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<VehicleClassIL> GetActive()
        {
            try
            {
                return VehicleClassDL.GetActive();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static VehicleClassIL GetById(short VehicleClassId)
        {
            try
            {
                return VehicleClassDL.GetById(VehicleClassId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
