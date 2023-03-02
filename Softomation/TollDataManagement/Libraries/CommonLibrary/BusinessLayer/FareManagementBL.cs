using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class FareManagementBL
    {
        public static List<ResponceIL> InsertUpdate(FareManagementIL fare)
        {

            try
            {
                return FareManagementDL.InsertUpdate(fare);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<ResponceIL> PInsertUpdate(FareManagementIL fare)
        {

            try
            {
                return FareManagementDL.PInsertUpdate(fare);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static FareManagementIL GetAllByClientId(FareManagementIL fare)
        {

            try
            {
                return FareManagementDL.GetAllByClientId(fare);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static FareManagementIL GetAllByDate(FareManagementIL fare)
        {

            try
            {
                return FareManagementDL.GetAllByDate(fare);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static FareDetailsIL GetFareByJourney(FareDetailsIL fare)
        {

            try
            {
                return FareManagementDL.GetFareByJourney(fare);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<FareManagementIL> GetAll()
        {

            try
            {
                return FareManagementDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        
    }
}
