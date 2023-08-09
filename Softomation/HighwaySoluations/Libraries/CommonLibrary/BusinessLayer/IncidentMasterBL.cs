using System;
using System.Collections.Generic;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class IncidentMasterBL
    {
        public static List<ResponceIL> InsertUpdate(IncidentIL incidentMaster)
        {
            try
            {
                return incidentMasterDL.InsertUpdate(incidentMaster);
            }
             catch (Exception ex)
            {

                throw ex;
            }
        }
        public static IncidentIL GetById(int entryId)
        {
            try
            {
                return incidentMasterDL.GetById(entryId);
            }
             catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<IncidentIL> GetAll()
        {
            try
            {
                return incidentMasterDL.GetAll();
            }
             catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
