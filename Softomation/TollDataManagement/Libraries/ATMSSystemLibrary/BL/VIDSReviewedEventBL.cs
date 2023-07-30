using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Softomation.ATMSSystemLibrary.DL;
using Softomation.ATMSSystemLibrary.IL;

namespace Softomation.ATMSSystemLibrary.BL
{
    public class VIDSReviewedEventBL
    {
        public static List<ResponseIL> ReviewUpdate(VIDSReviewedEventIL data)
        {
            try
            {
                return VIDSReviewedEventDL.ReviewUpdate(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
