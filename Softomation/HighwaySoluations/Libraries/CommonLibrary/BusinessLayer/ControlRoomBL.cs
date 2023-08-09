using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class ControlRoomBL
    {
        public static List<ResponceIL> InsertUpdate(ControlRoomIL controlRoom)
        {
            try
            {
                return ControlRoomDL.InsertUpdate(controlRoom);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static ControlRoomIL GetById(int entryId)
        {
            try
            {
                return ControlRoomDL.GetById(entryId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<ControlRoomIL> GetByUserId(Int64 UserId)
        {
            try
            {
                return ControlRoomDL.GetByUserId(UserId);
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
    }
}
