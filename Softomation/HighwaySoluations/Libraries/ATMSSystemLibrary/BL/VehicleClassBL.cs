using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class VehicleClassBL
    {
        public static List<ResponseIL> InsertUpdate(VehicleClassIL vc)
        {
            try
            {
                return VehicleClassDL.InsertUpdate(vc);
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
        public static VehicleClassIL GetById(int ClassId)
        {
            try
            {
                return VehicleClassDL.GetById(ClassId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
