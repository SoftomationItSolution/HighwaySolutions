using System;
using System.Collections.Generic;
using System.Data;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class CashFlowConfigurationBL
    {
        public static List<ResponceIL> InsertUpdate(CashFlowConfigurationIL cashFlow)
        {

            try
            {
                return CashFlowConfigurationDL.InsertUpdate(cashFlow);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<ResponceIL> ValidateTCLogin(CashFlowConfigurationIL cashFlow)
        {

            try
            {
                return CashFlowConfigurationDL.ValidateTCLogin(cashFlow);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static void StartStopShift(CashFlowConfigurationIL cashFlow)
        {

            try
            {
                CashFlowConfigurationDL.StartStopShift(cashFlow);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<ResponceIL> Clearance(CashFlowConfigurationIL cashFlow)
        {

            try
            {
                return CashFlowConfigurationDL.Clearance(cashFlow);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<ResponceIL> Finish(CashFlowConfigurationIL cashFlow)
        {

            try
            {
                return CashFlowConfigurationDL.Finish(cashFlow);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<CashFlowConfigurationIL> GetAll()
        {

            try
            {
                return CashFlowConfigurationDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<CashFlowConfigurationIL> GetAllPending()
        {

            try
            {
                return CashFlowConfigurationDL.GetAllPending();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static CashFlowConfigurationIL GetByReceiptNumber(String ReceiptNumber)
        {

            try
            {
                return CashFlowConfigurationDL.GetByReceiptNumber(ReceiptNumber);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static CashFlowConfigurationIL GetById(Int64 CashFlowId)
        {

            try
            {
                return CashFlowConfigurationDL.GetById(CashFlowId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<CashFlowConfigurationIL> CashDepositGetByOpenShift(Int64 ShiftMasterId)
        {

            try
            {
                return CashFlowConfigurationDL.CashDepositGetByOpenShift(ShiftMasterId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<CashFlowConfigurationIL> GetAllPendingByUserId(Int64 userId)
        {
            try
            {
                return CashFlowConfigurationDL.GetAllPendingByUserId(userId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static DataSet CashUPReport(DataFilterIL data)
        {
            try
            {
                return CashFlowConfigurationDL.CashUPReport(data);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static DataTable UserClearanceDetailReport(DataFilterIL data)
        {
            try
            {
                return CashFlowConfigurationDL.UserClearanceDetailReport(data);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
