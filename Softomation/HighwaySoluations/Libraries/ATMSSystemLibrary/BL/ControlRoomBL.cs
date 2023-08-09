using System;
using System.Collections.Generic;
using Softomation.ATMSSystemLibrary.IL;
using Softomation.ATMSSystemLibrary.DL;

namespace Softomation.ATMSSystemLibrary.BL
{
    public class ControlRoomBL
    {
        public static List<ResponseIL> InsertUpdate(ControlRoomIL cr)
        {

            try
            {
                return ControlRoomDL.InsertUpdate(cr);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<ControlRoomIL> GetAll()
        {
            try
            {
                return ControlRoomDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<ControlRoomIL> GetActive()
        {
            try
            {
                return ControlRoomDL.GetActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static ControlRoomIL GetById(int ControlRoomId)
        {
            try
            {
                return ControlRoomDL.GetById(ControlRoomId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
