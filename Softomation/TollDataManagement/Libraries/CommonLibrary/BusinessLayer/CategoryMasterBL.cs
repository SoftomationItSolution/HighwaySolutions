using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class CategoryMasterBL
    {
        public static List<CategoryMasterIL> GetAll()
        {
            try
            {
                return CategoryMasterDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<CategoryMasterIL> GetAllActive()
        {
            try
            {
                return CategoryMasterDL.GetAllActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static CategoryMasterIL GetById(int EntryId)
        {
            try
            {
                return CategoryMasterDL.GetById(EntryId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
        }
    }
}
