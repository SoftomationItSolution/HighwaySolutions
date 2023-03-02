using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class ReportManagementBL
    {
        public static List<ReportManagementIL> GetAll()
        {

            try
            {
                return ReportManagementDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<ReportManagementIL> GetAllActive()
        {
            try
            {
                return ReportManagementDL.GetAllActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static List<ReportManagementIL> GetAllParent()
        {
            try
            {
                return ReportManagementDL.GetAllParent();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<ReportManagementIL> GetBySubCategory(int ParentId)
        {
            try
            {
                return ReportManagementDL.GetBySubCategory(ParentId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<ReportManagementIL> GetBySubCategoryActive(int ParentId)
        {
            try
            {
                return ReportManagementDL.GetBySubCategoryActive(ParentId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static ReportManagementIL GetById(int EntryId)
        {
            try
            {
                return ReportManagementDL.GetById(EntryId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
