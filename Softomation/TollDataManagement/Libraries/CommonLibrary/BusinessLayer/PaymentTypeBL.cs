using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class PaymentTypeBL
    {
        public static List<ResponceIL> PInsertUpdate(PaymentTypeIL exemptType)
        {
            try
            {
                return PaymentTypeDL.PInsertUpdate(exemptType);
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
                PaymentTypeDL.MarkedDeleted();
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
                PaymentTypeDL.DeletedData();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<PaymentTypeIL> GetAll()
        {
            try
            {
                return PaymentTypeDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
