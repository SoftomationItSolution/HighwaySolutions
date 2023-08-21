using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class FasTagVehicleClassBL
    {
        public static List<ResponseIL> InsertUpdate(FasTagVehicleClassIL data)
        {
            try
            {
                return FasTagVehicleClassDL.InsertUpdate(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<FasTagVehicleClassIL> GetAll()
        {
            try
            {
                return FasTagVehicleClassDL.GetAll();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<FasTagVehicleClassIL> GetActive()
        {
            try
            {
                return FasTagVehicleClassDL.GetActive();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static FasTagVehicleClassIL GetById(short FasTagVehicleClassId)
        {
            try
            {
                return FasTagVehicleClassDL.GetById(FasTagVehicleClassId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
