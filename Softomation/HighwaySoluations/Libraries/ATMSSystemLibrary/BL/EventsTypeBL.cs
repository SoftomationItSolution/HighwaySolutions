using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;
using System.Data.Common;
using System.Data;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class EventsTypeBL
    {
        public static List<ResponseIL> SetUp(List<EventsTypeIL> types)
        {
            try
            {
                return EventsTypeDL.SetUp(types);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public static List<EventsTypeIL> GetAll()
        {
            try
            {
                return EventsTypeDL.GetAll();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public static List<EventsTypeIL> GetActive()
        {
            try
            {
                return EventsTypeDL.GetActive();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<EventsTypeIL> GetBySystemId(Int16 SystemId)
        {
            try
            {
                return EventsTypeDL.GetBySystemId(SystemId);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}
