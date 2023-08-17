using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class TransactionTypeBL
    {
        public static List<ResponseIL> SetUp(List<TransactionTypeIL> types)
        {
            try
            {
                return TransactionTypeDL.SetUp(types);
            }
            catch (Exception ex)
            {
                throw ex;
            }
           
        }
        public static List<TransactionTypeIL> GetAll()
        {
            try
            {
                return TransactionTypeDL.GetAll();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public static List<TransactionTypeIL> GetActive()
        {
            try
            {
                return TransactionTypeDL.GetActive();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}
