using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class PlazaTransactionReviewBL
    {
        public static PlazaTransactionReviewIL Insert(LaneTransactionReviewIL review)
        {
            try
            {
                return PlazaTransactionReviewDL.Insert(review);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }


    }
}
