using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class TransactionTypeBL
    {
        public static List<ResponceIL> InsertUpdate(TransactionTypeIL transactionType)
        {
            try
            {
                return TransactionTypeDL.InsertUpdate(transactionType);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<ResponceIL> PInsertUpdate(TransactionTypeIL transactionType)
        {
            try
            {
                return TransactionTypeDL.PInsertUpdate(transactionType);
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
                TransactionTypeDL.MarkedDeleted();
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
                TransactionTypeDL.DeletedData();
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

        public static TransactionTypeIL GetById(int RoleId)
        {
            try
            {
                return TransactionTypeDL.GetById(RoleId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }


    }
}
