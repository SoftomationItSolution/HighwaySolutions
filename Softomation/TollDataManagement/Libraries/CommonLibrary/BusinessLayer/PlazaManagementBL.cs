using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class PlazaManagementBL
    {
        public static List<ResponceIL> InsertUpdate(PlazaManagementIL plaza)
        {
            try
            {
                return PlazaManagementDL.InsertUpdate(plaza);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<ResponceIL> PInsertUpdate(PlazaManagementIL plaza)
        {
            try
            {
                return PlazaManagementDL.PInsertUpdate(plaza);
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
                PlazaManagementDL.MarkedDeleted();
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
                PlazaManagementDL.DeletedData();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static void UpdatePendingList(Int16 PlazaId, Int64 LastTrsnId)
        {
            try
            {
                PlazaManagementDL.UpdatePendingList(PlazaId, LastTrsnId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<PlazaManagementIL> GetAll()
        {
            try
            {
                return PlazaManagementDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<PlazaManagementIL> GetActive()
        {
            try
            {
                return PlazaManagementDL.GetActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static PlazaManagementIL GetById(int PlazId)
        {
            try
            {
                return PlazaManagementDL.GetById(PlazId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static List<PlazaManagementIL> GetByClientId(int ClientId)
        {
            try
            {
                return PlazaManagementDL.GetByClientId(ClientId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static PlazaManagementIL GetByIP(String iPAddress)
        {
            try
            {
                return PlazaManagementDL.GetByIP(iPAddress);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

       
    }
}
