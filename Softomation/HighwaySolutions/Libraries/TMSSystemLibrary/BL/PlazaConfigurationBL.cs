using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class PlazaConfigurationBL
    {
        public static List<ResponseIL> InsertUpdate(PlazaConfigurationIL plaza)
        {
            try
            {
                return PlazaConfigurationDL.InsertUpdate(plaza);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static bool DataMerge(List<PlazaConfigurationIL> plazaList)
        {
            try
            {
                return PlazaConfigurationDL.DataMerge(plazaList);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<PlazaConfigurationIL> GetAll()
        {
            try
            {
                return PlazaConfigurationDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<PlazaConfigurationIL> GetActive()
        {
            try
            {
                return PlazaConfigurationDL.GetActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static PlazaConfigurationIL GetById(short PlazaId)
        {
            try
            {
                return PlazaConfigurationDL.GetById(PlazaId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
