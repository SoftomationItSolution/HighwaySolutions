using System;
using System.Collections.Generic;
using System.Data;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class VidsBL
    {
        public static List<ResponceIL> InsertUpdate(VidsIL vids)
        {
            try
            {
                return VidsDL.InsertUpdate(vids);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<VidsIL> GetLatest()
        {
            try
            {
                return VidsDL.GetLatest();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static VidsIL GetbyId(int EntryId)
        {
            try
            {
                return VidsDL.GetbyId(EntryId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
