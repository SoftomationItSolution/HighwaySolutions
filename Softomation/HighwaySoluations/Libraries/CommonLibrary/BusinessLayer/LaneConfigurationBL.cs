using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class LaneConfigurationBL
    {
        public static List<ResponceIL> InsertUpdate(LaneConfigurationIL lane)
        {

            try
            {
                return LaneConfigurationDL.InsertUpdate(lane);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<LaneConfigurationIL> GetAll()
        {

            try
            {
                return LaneConfigurationDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static LaneConfigurationIL GetById(int EntryId)
        {

            try
            {
                return LaneConfigurationDL.GetById(EntryId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<LaneConfigurationIL> GetByGantryIdActive(int GantryId)
        {
            try
            {
                return LaneConfigurationDL.GetByGantryIdActive(GantryId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
