using System;
using System.Collections.Generic;
using System.Data;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class LiveSystemBL
    {
        public static void SystemProcessingInsert(LiveSystemIL events)
        {
            try
            {
                LiveSystemDL.SystemProcessingInsert(events);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static void SystemTransactionInsert(LiveSystemIL events)
        {
            try
            {
                LiveSystemDL.SystemTransactionInsert(events);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static void SystemAVCTransactionInsert(LiveSystemIL events)
        {
            try
            {
                LiveSystemDL.SystemAVCTransactionInsert(events);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static DataTable GetLiveStatus()
        {
            try
            {
                return LiveSystemDL.GetLiveStatus();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static DataTable GetLiveStatusByLane(Int16 LaneNumber)
        {
            try
            {
                return LiveSystemDL.GetLiveStatusByLane(LaneNumber);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
