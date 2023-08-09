using System;
using System.Collections.Generic;
using System.Data;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;


namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class LiveEventsBL
    {

        public static void DefaultInsert()
        {
            try
            {
                LiveEventsDL.DefaultInsert();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static void Insert(LiveEventsIL events)
        {
            try
            {
                LiveEventsDL.Insert(events);
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
                return LiveEventsDL.GetLiveStatus();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static Object GetLiveStatusByLane(Int16 LaneNumber)
        {
            try
            {
                return LiveEventsDL.GetLiveStatusByLane(LaneNumber);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static Object LiveOutputDeveiceByLane(Int16 LaneNumber)
        {
            try
            {
                return LiveEventsDL.LiveOutputDeveiceByLane(LaneNumber);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
