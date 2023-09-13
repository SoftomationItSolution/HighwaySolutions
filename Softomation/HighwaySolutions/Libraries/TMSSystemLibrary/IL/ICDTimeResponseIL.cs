using System;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class ICDTimeResponseIL:ICDCommonIL
    {
        DateTime serverDateTime;
        public ICDTimeResponseIL()
        {
            serverDateTime = DateTime.Now;
        }
        public DateTime ServerDateTime
        {
            get
            {
                return serverDateTime;
            }

            set
            {
                serverDateTime = value;
            }
        }

    }
}
