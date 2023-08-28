using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class ShiftStatusBL
    {
        public static List<ShiftStatusIL> GetAll()
        {
            try
            {
                return ShiftStatusDL.GetAll();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<ShiftStatusIL> GetClose()
        {
            try
            {
                return ShiftStatusDL.GetClose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<ShiftStatusIL> GetOpen()
        {
            try
            {
                return ShiftStatusDL.GetOpen();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
