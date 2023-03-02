using System;
using System.Collections.Generic;
using System.Data;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class VMSMessagingBL
    {
        public static List<ResponceIL> InsertUpdate(VMSMessagingIL vms)
        {
            try
            {
                return VMSMessagingDL.InsertUpdate(vms);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<VMSMessagingIL> GetAll()
        {
            try
            {
                return VMSMessagingDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static VMSMessagingIL GetbyId(int EntryId)
        {
            try
            {
                return VMSMessagingDL.GetbyId(EntryId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<VMSMessagingIL> GetActiveMessage()
        {
            try
            {
                return VMSMessagingDL.GetActiveMessage();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
