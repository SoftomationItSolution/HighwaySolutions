using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class CashFlowDepositBL
    {
        public static List<CashFlowDepositIL> CashDepositGetByCashId(long cashFlowId)
        {

            try
            {
                return CashFlowDepositDL.CashDepositGetByCashId(cashFlowId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static CashFlowDepositIL CashDepositGetById(long EntryId)
        {

            try
            {
                return CashFlowDepositDL.CashDepositGetById(EntryId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static CashFlowDepositIL CashDepositGetByReceipt(string ReceiptNumber)
        {

            try
            {
                return CashFlowDepositDL.CashDepositGetByReceipt(ReceiptNumber);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
