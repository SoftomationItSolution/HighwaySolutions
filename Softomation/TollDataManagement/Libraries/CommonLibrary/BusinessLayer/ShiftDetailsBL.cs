using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class ShiftDetailsBL
    {

        public static List<ResponceIL> ShiftClose(ShiftDetailsIL shift)
        {
            try
            {
                return ShiftDetailsDL.ShiftClose(shift);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<ShiftDetailsIL> GetAll()
        {
            try
            {
                return ShiftDetailsDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static List<ShiftDetailsIL> GetAllByStatus(Int16 Status)
        {
            try
            {
                return ShiftDetailsDL.GetAllByStatus(Status);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static ShiftDetailsIL GetAllByShiftId(ShiftDetailsIL shift)
        {
            try
            {
                return ShiftDetailsDL.GetAllByShiftId(shift);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
