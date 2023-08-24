using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class FloatTransactionsTypeBL
    {
        public static List<FloatTransactionsTypeIL> GetAll()
        {
            try
            {
                return FloatTransactionsTypeDL.GetAll();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<FloatTransactionsTypeIL> GetActive()
        {
            try
            {
                return FloatTransactionsTypeDL.GetActive();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
