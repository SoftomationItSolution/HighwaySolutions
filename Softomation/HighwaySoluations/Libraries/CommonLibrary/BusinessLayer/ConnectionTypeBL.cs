using System;
using System.Collections.Generic;
using System.Data;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class ConnectionTypeBL
    {
        public static List<ResponceIL> PInsertUpdate(ConnectionTypeIL hardwareType)
        {

            try
            {
                return ConnectionTypeDL.PInsertUpdate(hardwareType);
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
                ConnectionTypeDL.MarkedDeleted();
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
                ConnectionTypeDL.DeletedData();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
      
        public static List<ConnectionTypeIL> GetAll()
        {
            try
            {
                return ConnectionTypeDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<ConnectionTypeIL> GetActive()
        {
            try
            {
                return ConnectionTypeDL.GetActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static ConnectionTypeIL GetById(int ConnectionTypeId)
        {
            try
            {
                return ConnectionTypeDL.GetById(ConnectionTypeId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
