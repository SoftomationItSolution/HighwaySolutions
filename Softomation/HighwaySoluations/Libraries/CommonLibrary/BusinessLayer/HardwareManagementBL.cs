using System;
using System.Collections.Generic;
using System.Data;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class HardwareManagementBL
    {
        public static List<ResponceIL> InsertUpdate(HardwareManagementIL hardware)
        {

            try
            {
                return HardwareManagementDL.InsertUpdate(hardware);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<ResponceIL> PInsertUpdate(HardwareManagementIL hardware)
        {

            try
            {
                return HardwareManagementDL.PInsertUpdate(hardware);
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
                HardwareManagementDL.MarkedDeleted();
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
                HardwareManagementDL.DeletedData();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
      
        public static List<HardwareManagementIL> GetAll()
        {

            try
            {
                return HardwareManagementDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static DataTable GetAllTest()
        {

            try
            {
                return HardwareManagementDL.GetAllTest();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static HardwareManagementIL GetById(int PlazId)
        {

            try
            {
                return HardwareManagementDL.GetById(PlazId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<HardwareManagementIL> GetByClientId(int ClientId)
        {

            try
            {
                return HardwareManagementDL.GetByClientId(ClientId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<HardwareManagementIL> GetByClientPlazaId(HardwareManagementIL haredware)
        {

            try
            {
                return HardwareManagementDL.GetByClientPlazaId(haredware);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<HardwareManagementIL> GetByLaneNumber(HardwareManagementIL lane)
        {

            try
            {
                return HardwareManagementDL.GetByLaneNumber(lane);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


    }
}
