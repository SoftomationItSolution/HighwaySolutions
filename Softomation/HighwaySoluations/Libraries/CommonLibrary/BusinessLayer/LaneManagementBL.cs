using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class LaneManagementBL
    {
        public static List<ResponceIL> InsertUpdate(LaneManagementIL lane)
        {

            try
            {
                return LaneManagementDL.InsertUpdate(lane);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<ResponceIL> PInsertUpdate(LaneManagementIL lane)
        {

            try
            {
                return LaneManagementDL.PInsertUpdate(lane);

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
                LaneManagementDL.MarkedDeleted();
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
                LaneManagementDL.DeletedData();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<LaneManagementIL> GetAll()
        {

            try
            {
                return LaneManagementDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<LaneManagementIL> GetByLaneType(Int16 LaneType)
        {

            try
            {
                return LaneManagementDL.GetByLaneType(LaneType);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<LaneManagementIL> GetByLaneTypeActive(Int16 LaneType)
        {

            try
            {
                return LaneManagementDL.GetByLaneTypeActive(LaneType);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static LaneManagementIL GetById(int EntryId)
        {

            try
            {
                return LaneManagementDL.GetById(EntryId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<LaneManagementIL> GetByPlazaId(int PlazaId)
        {

            try
            {
                return LaneManagementDL.GetByPlazaId(PlazaId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<LaneManagementIL> GetByPlazaIdActive(int PlazaId)
        {

            try
            {
                return LaneManagementDL.GetByPlazaIdActive(PlazaId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<LaneManagementIL> GetByClientPlazaId(LaneManagementIL lane)
        {

            try
            {
                return LaneManagementDL.GetByClientPlazaId(lane);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<LaneManagementIL> GetByClientPlazaIdActive(LaneManagementIL lane)
        {

            try
            {
                return LaneManagementDL.GetByClientPlazaIdActive(lane);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
      
        public static LaneManagementIL GetByLaneNumber(LaneManagementIL lane)
        {

            try
            {
                return LaneManagementDL.GetByLaneNumber(lane);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<LaneManagementIL> GetByClientId(Int32 clientId)
        {

            try
            {
                return LaneManagementDL.GetByClientId(clientId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<LaneManagementIL> GetByClientIdActive(Int32 clientId)
        {

            try
            {
                return LaneManagementDL.GetByClientIdActive(clientId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static LaneManagementIL GetByIpAddress(String laneIP)
        {
            try
            {
                return LaneManagementDL.GetByIpAddress(laneIP);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
