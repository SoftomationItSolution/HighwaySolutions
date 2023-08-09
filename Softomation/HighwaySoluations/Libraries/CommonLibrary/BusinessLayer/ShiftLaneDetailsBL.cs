using System;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class ShiftLaneDetailsBL
    {
        public static void ShfitLaneDetailsInsert(ShiftLaneDetailsIL shift)
        {
            try
            {
                ShiftLaneDetailsDL.ShfitLaneDetailsInsert(shift);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static void ShfitLaneDetailsClose(ShiftLaneDetailsIL shift)
        {
            try
            {
                ShiftLaneDetailsDL.ShfitLaneDetailsClose(shift);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static ShiftLaneDetailsIL GetAllByStatus(ShiftLaneDetailsIL shift)
        {
            try
            {
                return ShiftLaneDetailsDL.GetAllByStatus(shift);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
