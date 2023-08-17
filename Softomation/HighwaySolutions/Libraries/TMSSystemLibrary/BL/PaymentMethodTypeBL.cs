using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class PaymentMethodTypeBL
    {
        public static List<ResponseIL> SetUp(List<PaymentMethodTypeIL> types)
        {
            try
            {
                return PaymentMethodTypeDL.SetUp(types);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public static List<PaymentMethodTypeIL> GetAll()
        {
            try
            {
                return PaymentMethodTypeDL.GetAll();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public static List<PaymentMethodTypeIL> GetActive()
        {
            try
            {
                return PaymentMethodTypeDL.GetActive();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}
