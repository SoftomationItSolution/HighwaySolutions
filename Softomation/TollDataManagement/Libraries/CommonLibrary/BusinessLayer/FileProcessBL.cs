using System;
using System.Collections.Generic;
using System.Data;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class FileProcessBL
    {

        public static void ImportData(DataTable dtblacklistdetail, String sessionId)
        {
            try
            {
                FileProcessDL.ImportData(dtblacklistdetail,sessionId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static void Insert(String sessionId)
        {
            try
            {
                FileProcessDL.Insert(sessionId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
