using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class DenominationBL
    {
        public static List<ResponceIL> PInsertUpdate(DenominationIL denomination)
        {

            try
            {
                return DenominationDL.PInsertUpdate(denomination);
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
                DenominationDL.MarkedDeleted();
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
                DenominationDL.DeletedData();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<DenominationIL> GetAll()
        {

            try
            {
                return DenominationDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<DenominationIL> GetCashAllotment(long cashFlowId)
        {

            try
            {
                return DenominationDL.GetCashAllotment(cashFlowId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<DenominationIL> GetCashDeposit(long CashFlowId, long ClearanceId)
        {

            try
            {
                return DenominationDL.GetCashDeposit(CashFlowId, ClearanceId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
