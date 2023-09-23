using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using Softomation.CommonLibraries.InterfaceLayer;
using Softomation.ECSLibraries.DataLayer;
using Softomation.ECSLibraries.InterfaceLayer;
using System;
using System.Collections.Generic;
namespace Softomation.ECSLibraries.BusinessLayer
{
    public class PhoneEventsBL
    {
        public static List<ResponseIL> EventsInsert(PhoneEventsIL pEvent)
        {
            try
            {
                return PhoneEventsDL.EventsInsert(pEvent);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<PhoneEventsIL> GetRecent(int ControllRoomId)
        {
            try
            {
                return PhoneEventsDL.GetRecent(ControllRoomId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
