using System;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.IL
{
    public class ICDSyncTimeDetailsIL:ICDCommonIL
    {
        Int64 requestSyncTimeId;
        DateTime bankServerDateTime;
        public ICDSyncTimeDetailsIL()
        {
            requestSyncTimeId = 0;
            bankServerDateTime = DateTime.Now;
        }
        public Int64 RequestSyncTimeId
        {
            get
            {
                return requestSyncTimeId;
            }

            set
            {
                requestSyncTimeId = value;
            }
        }
        public DateTime BankServerDateTime
        {
            get
            {
                return bankServerDateTime;
            }

            set
            {
                bankServerDateTime = value;
            }
        }
    }
}
