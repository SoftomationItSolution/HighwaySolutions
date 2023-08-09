using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class SystemSettingBL
    {
        public static List<ResponseIL> InsertUpdate(SystemSettingIL ss)
        {
            try
            {
                return SystemSettingDL.InsertUpdate(ss);
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
