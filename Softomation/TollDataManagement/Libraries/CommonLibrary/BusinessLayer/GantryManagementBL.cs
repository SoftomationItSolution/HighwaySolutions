using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class GantryManagementBL
    {
        public static List<ResponceIL> InsertUpdate(GantryManagementIL devicesMaster)
        {
            try
            {
                return GantryManagementDL.InsertUpdate(devicesMaster);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static GantryManagementIL GetById(int entryId)
        {
            try
            {
                return GantryManagementDL.GetById(entryId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<GantryManagementIL> GetAll()
        {
            try
            {
                return GantryManagementDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<GantryManagementIL> GetAllActive()
        {
            try
            {
                return GantryManagementDL.GetAllActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
