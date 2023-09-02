using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class LaneTransactionBL
    {
        public static List<ResponseIL> Insert(LaneTransactionIL lane)
        {
            try
            {
                return LaneTransactionDL.Insert(lane);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<LaneTransactionIL> GetAll()
        {
            try
            {
                return LaneTransactionDL.GetAll();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<LaneTransactionIL> GetLatest()
        {
            try
            {
                return LaneTransactionDL.GetLatest();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<LaneTransactionIL> GetUnReviewedLatest()
        {
            try
            {
                return LaneTransactionDL.GetUnReviewedLatest();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<LaneTransactionIL> GetByFilter(DataFilterIL data)
        {
            try
            {
                return LaneTransactionDL.GetByFilter(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        
    }
}
