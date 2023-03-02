using System;
using System.Collections.Generic;
using System.Data;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class LaneAccessPermissionBL
    {
        public static void Insert(LaneAccessPermissionIL events)
        {
            try
            {
                LaneAccessPermissionDL.Insert(events);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static void Update(LaneAccessPermissionIL events)
        {
            try
            {
                LaneAccessPermissionDL.Update(events);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static void MarkasTransfer(LaneAccessPermissionIL events)
        {
            try
            {
                LaneAccessPermissionDL.MarkasTransfer(events);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<LaneAccessPermissionIL> GetRequestPending()
        {
            try
            {
                return LaneAccessPermissionDL.GetRequestPending();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<LaneAccessPermissionIL> GetTransferPending()
        {
            try
            {
                return LaneAccessPermissionDL.GetTransferPending();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
