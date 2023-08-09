using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class MasterConfigBL
    {
        public static List<ResponceIL> InsertUpdate(MasterConfigIL config)
        {
            try
            {
                return MasterConfigDL.InsertUpdate(config);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static MasterConfigIL GetConfig()
        {
            try
            {
                return MasterConfigDL.GetConfig();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
