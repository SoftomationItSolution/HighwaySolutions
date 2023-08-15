using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class SystemIntegratorBL
    {
        public static List<ResponseIL> InsertUpdate(SystemIntegratorIL siManagement)
        {

            try
            {
                return SystemIntegratorDL.InsertUpdate(siManagement);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static bool DataMerge(List<SystemIntegratorIL> systemIntegrators)
        {
            try
            {
                return SystemIntegratorDL.DataMerge(systemIntegrators);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<SystemIntegratorIL> GetAll()
        {

            try
            {
                return SystemIntegratorDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<SystemIntegratorIL> GetActive()
        {

            try
            {
                return SystemIntegratorDL.GetActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static SystemIntegratorIL GetById(short SystemIntegratorId)
        {

            try
            {
                return SystemIntegratorDL.GetById(SystemIntegratorId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
