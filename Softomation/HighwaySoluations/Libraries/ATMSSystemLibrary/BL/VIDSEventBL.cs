﻿using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using System;
using System.Collections.Generic;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class VIDSEventBL
    {
        public static List<VIDSEventIL> GetByHours(short hours)
        {
            try
            {
                return VIDSEventDL.GetByHours(hours);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<VIDSEventIL> GetPendingReviewByHours(short hours)
        {
            try
            {
                return VIDSEventDL.GetPendingReviewByHours(hours);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<VIDSEventIL> GetByFilter(DataFilterIL data)
        {
            try
            {
                return VIDSEventDL.GetByFilter(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}