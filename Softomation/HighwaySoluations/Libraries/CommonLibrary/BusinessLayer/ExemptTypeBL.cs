using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class ExemptTypeBL
    {
        public static List<ResponceIL> InsertUpdate(ExemptTypeIL exemptType)
        {
            try
            {
                return ExemptTypeDL.InsertUpdate(exemptType);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<ResponceIL> PInsertUpdate(ExemptTypeIL exemptType)
        {

            try
            {
                return ExemptTypeDL.PInsertUpdate(exemptType);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static void MarkedDeleted()
        {
            try
            {
                ExemptTypeDL.MarkedDeleted();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static void DeletedData()
        {
            try
            {
                ExemptTypeDL.DeletedData();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<ExemptTypeIL> GetAll()
        {

            try
            {
                return ExemptTypeDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<ExemptTypeIL> GetActive()
        {

            try
            {
                return ExemptTypeDL.GetActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static ExemptTypeIL GetById(int RoleId)
        {

            try
            {
                return ExemptTypeDL.GetById(RoleId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


    }
}
