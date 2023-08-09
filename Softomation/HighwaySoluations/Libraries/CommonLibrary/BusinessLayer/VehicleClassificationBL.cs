using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class VehicleClassificationBL
    {
        public static List<ResponceIL> InsertUpdate(VehicleClassificationIL vc)
        {
            try
            {
                return VehicleClassificationDL.InsertUpdate(vc);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<VehicleClassificationIL> GetAll()
        {
            try
            {
                return VehicleClassificationDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<VehicleClassificationIL> GetActive()
        {
            try
            {
                return VehicleClassificationDL.GetActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static VehicleClassificationIL GetById(short EntryId)
        {
            try
            {
                return VehicleClassificationDL.GetById(EntryId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        
    }
}
