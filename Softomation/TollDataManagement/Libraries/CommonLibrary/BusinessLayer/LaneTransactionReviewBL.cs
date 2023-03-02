using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class LaneTransactionReviewBL
    {
        public static List<ResponceIL> Insert(LaneTransactionReviewIL review)
        {

            try
            {
                return LaneTransactionReviewDL.Insert(review);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<ResponceIL> Cancel(LaneTransactionReviewIL review)
        {

            try
            {
                return LaneTransactionReviewDL.Cancel(review);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<ResponceIL> Scrap(LaneTransactionReviewIL review)
        {

            try
            {
                return LaneTransactionReviewDL.Scrap(review);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static LaneTransactionReviewIL GetByEntryId(Int64 TransactionId)
        {

            try
            {
                return LaneTransactionReviewDL.GetByEntryId(TransactionId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static LaneTransactionReviewIL GetByExitId(Int64 TransactionId)
        {
            try
            {
                return LaneTransactionReviewDL.GetByExitId(TransactionId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
