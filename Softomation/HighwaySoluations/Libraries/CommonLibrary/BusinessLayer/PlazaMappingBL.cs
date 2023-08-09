using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class PlazaMappingBL
    {
        public static List<ResponceIL> InsertUpdate(PlazaMappingIL user)
        {
            try
            {
                return PlazaMappingDL.InsertUpdate(user);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static List<ResponceIL> ValidateInsertUpdate(PlazaMappingIL user)
        {
            try
            {
                return PlazaMappingDL.ValidateInsertUpdate(user);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static List<PlazaMappingIL> GetAll()
        {
            try
            {
                return PlazaMappingDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static List<PlazaMappingIL> GetByPlazaId(int PlazId)
        {
            try
            {
                return PlazaMappingDL.GetByPlazaId(PlazId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
