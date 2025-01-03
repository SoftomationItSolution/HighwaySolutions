﻿using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;
namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class ICDNotificationResponseBL
    {
        public static List<ResponseIL> Insert(ICDNotificationResponseIL ed)
        {
            try
            {
                return ICDNotificationResponseDL.Insert(ed);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
