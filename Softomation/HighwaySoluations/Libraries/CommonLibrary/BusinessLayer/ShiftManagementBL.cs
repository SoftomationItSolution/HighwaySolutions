using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class ShiftManagementBL
    {
        public static List<ResponceIL> PInsertUpdate(ShiftManagementIL shifts)
        {
            try
            {
                return ShiftManagementDL.PInsertUpdate(shifts);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static void MarkedDeleted()
        {
            try
            {
                ShiftManagementDL.MarkedDeleted();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static void DeletedData()
        {
            try
            {
                ShiftManagementDL.DeletedData();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<ShiftManagementIL> GetAll()
        {
            try
            {
                return ShiftManagementDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static ShiftManagementIL GetById(short ShiftId)
        {
            try
            {
                return ShiftManagementDL.GetById(ShiftId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
