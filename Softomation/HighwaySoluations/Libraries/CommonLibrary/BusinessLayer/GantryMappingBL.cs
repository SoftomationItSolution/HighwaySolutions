using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class GantryMappingBL
    {
        public static List<ResponceIL> InsertUpdate(GantryMappingIL user)
        {
            try
            {
                return GantryMappingDL.InsertUpdate(user);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static List<ResponceIL> ValidateInsertUpdate(GantryMappingIL user)
        {
            try
            {
                return GantryMappingDL.ValidateInsertUpdate(user);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static List<GantryMappingIL> GetAll()
        {
            try
            {
                return GantryMappingDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static List<GantryMappingIL> GetByGantryId(short GantryId)
        {
            try
            {
                return GantryMappingDL.GetByGantryId(GantryId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
