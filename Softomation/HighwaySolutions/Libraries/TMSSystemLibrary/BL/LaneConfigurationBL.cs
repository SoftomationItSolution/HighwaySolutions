using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
   public class LaneConfigurationBL
    {
        public static List<ResponseIL> InsertUpdate(LaneConfigurationIL plaza)
        {
            try
            {
                return LaneConfigurationDL.InsertUpdate(plaza);
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
        public static List<LaneConfigurationIL> GetActive()
        {
            try
            {
                return LaneConfigurationDL.GetActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static LaneConfigurationIL GetById(short PlazaId)
        {
            try
            {
                return LaneConfigurationDL.GetById(PlazaId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static LaneConfigurationIL GetByIpAddress(string IpAddress)
        {
            try
            {
                return LaneConfigurationDL.GetByIpAddress(IpAddress);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
