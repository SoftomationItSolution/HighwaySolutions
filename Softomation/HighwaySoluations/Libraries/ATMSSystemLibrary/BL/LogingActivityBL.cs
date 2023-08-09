using System;
using Softomation.ATMSSystemLibrary.DL;
using Softomation.ATMSSystemLibrary.IL;

namespace Softomation.ATMSSystemLibrary.BL
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
