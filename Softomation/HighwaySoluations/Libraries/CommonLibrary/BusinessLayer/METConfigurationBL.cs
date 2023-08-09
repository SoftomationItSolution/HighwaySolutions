using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
   public class METConfigurationBL
    {
        public static List<ResponceIL> InsertUpdate(METConfigurationIL metEvent)
        {
            try
            {
                return METConfigurationDL.InsertUpdate(metEvent);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static METConfigurationIL GetConfiguration()
        {
            try
            {
                return METConfigurationDL.GetConfiguration();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
