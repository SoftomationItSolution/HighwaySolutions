using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class SystemSettingBL
    {
        public static List<ResponseIL> InsertUpdate(SystemSettingIL setting)
        {
            try
            {
                return SystemSettingDL.InsertUpdate(setting);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static SystemSettingIL Get()
        {
            try
            {
                return SystemSettingDL.Get();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
