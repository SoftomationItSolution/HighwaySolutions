using System;
using System.Collections.Generic;
using System.Data;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class AVCVehicleClassBL
    {
      
        public static List<ResponceIL> ImportData(CommonIL common, DataTable ImportDT, string SessionId, System.String FileName)
        {

            try
            {
                return AVCVehicleClassDL.ImportData(common, ImportDT, SessionId, FileName);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<AVCVehicleClassIL> GetAll()
        {

            try
            {
                return AVCVehicleClassDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static AVCVehicleClassIL GetByClassId(int ClassId)
        {

            try
            {
                return AVCVehicleClassDL.GetByClassId(ClassId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<AVCVehicleClassIL> GetByClientId(int ClientId)
        {

            try
            {
                return AVCVehicleClassDL.GetByClientId(ClientId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


    }
}
