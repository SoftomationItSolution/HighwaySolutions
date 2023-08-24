using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class ShiftTiminingBL
    {
        public static List<ShiftTiminingIL> GetAll()
        {
            try
            {
                return ShiftTiminingDL.GetAll();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<ShiftTiminingIL> GetActive()
        {
            try
            {
                return ShiftTiminingDL.GetActive();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static ShiftTiminingIL GetById(Int16 shiftId)
        {
            try
            {
                return ShiftTiminingDL.GetById(shiftId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
