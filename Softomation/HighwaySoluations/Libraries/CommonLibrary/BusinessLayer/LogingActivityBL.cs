using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class LogingActivityBL
    {
        public static void InsertUpdate(LogingActivityIL activity)
        {
            try
            {
                LogingActivityDL.InsertUpdate(activity);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
