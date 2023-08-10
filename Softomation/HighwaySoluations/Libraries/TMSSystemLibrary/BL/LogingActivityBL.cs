using System;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class LogingActivityBL
    {
        public static void Insert(LogingActivityIL activity)
        {
            try
            {
                LogingActivityDL.Insert(activity);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static void Update(LogingActivityIL activity)
        {
            try
            {
                LogingActivityDL.Update(activity);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}
