using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class ClientManagementBL
    {

        public static List<ResponceIL> InsertUpdate(ClientManagementIL clientManagement)
        {

            try
            {
                return ClientManagementDL.InsertUpdate(clientManagement);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<ResponceIL> PInsertUpdate(ClientManagementIL clientManagement)
        {

            try
            {
                return ClientManagementDL.PInsertUpdate(clientManagement);
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
                ClientManagementDL.MarkedDeleted();
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
                ClientManagementDL.DeletedData();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<ClientManagementIL> GetAll()
        {

            try
            {
                return ClientManagementDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<ClientManagementIL> GetActive()
        {

            try
            {
                return ClientManagementDL.GetActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static ClientManagementIL GetById(int ClientId)
        {

            try
            {
                return ClientManagementDL.GetById(ClientId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


    }
}
