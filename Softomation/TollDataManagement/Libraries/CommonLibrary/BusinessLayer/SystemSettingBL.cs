using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class SystemSettingBL
    {
        public static List<ResponceIL> InsertUpdate(SystemSettingIL exemptType)
        {
            try
            {
                return SystemSettingDL.InsertUpdate(exemptType);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static SystemSettingIL GetSetting()
        {
            try
            {
                return SystemSettingDL.GetSetting();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
