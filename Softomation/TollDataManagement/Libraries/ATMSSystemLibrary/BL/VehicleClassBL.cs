using System;
using System.Collections.Generic;
using Softomation.ATMSSystemLibrary.IL;
using Softomation.ATMSSystemLibrary.DL;

namespace Softomation.ATMSSystemLibrary.BL
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
        public static VehicleClassIL GetById(int classId)
        {
            try
            {
                return VehicleClassDL.GetById(classId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
