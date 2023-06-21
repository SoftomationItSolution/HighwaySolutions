using System;
using System.Collections.Generic;
using Softomation.ATMSSystemLibrary.IL;
using Softomation.ATMSSystemLibrary.DL;

namespace Softomation.ATMSSystemLibrary.BL
{
    public class SystemBL
    {
        public static List<SystemIL> GetAll()
        {
            try
            {
                return SystemDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<SystemIL> GetActive()
        {
            try
            {
                return SystemDL.GetActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static SystemIL GetById(short ControlRoomId)
        {
            try
            {
                return SystemDL.GetById(ControlRoomId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
