using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class VehicleClassBL
    {
        public static List<ResponceIL> InsertUpdate(VehicleClassIL vc)
        {
            try
            {
                return VehicleClassDL.InsertUpdate(vc);
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
                VehicleClassDL.MarkedDeleted();
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
                VehicleClassDL.DeletedData();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<ResponceIL> Update(VehicleClassIL vc)
        {
            try
            {
                return VehicleClassDL.Update(vc);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<ResponceIL> PInsertUpdate(VehicleClassIL vc)
        {
            try
            {
                return VehicleClassDL.PInsertUpdate(vc);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<VehicleClassIL> GetAll()
        {
            try
            {
                return VehicleClassDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<VehicleClassIL> GetActive()
        {
            try
            {
                return VehicleClassDL.GetActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static VehicleClassIL GetByClassId(int ClassId)
        {
            try
            {
                return VehicleClassDL.GetByClassId(ClassId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<VehicleClassIL> GetByClientId(int ClientId)
        {
            try
            {
                return VehicleClassDL.GetByClientId(ClientId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }


    }
}
