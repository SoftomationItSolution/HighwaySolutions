using System;
using System.Collections.Generic;
using System.Data;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class IHMCLVehicleClassBL
    {


        public static List<ResponceIL> Update(IHMCLVehicleClassIL ihmcl)
        {

            try
            {
                return IHMCLVehicleClassDL.Update(ihmcl);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<ResponceIL> ImportData(CommonIL common, DataTable ImportDT, string SessionId, System.String FileName)
        {

            try
            {
                return IHMCLVehicleClassDL.ImportData(common, ImportDT, SessionId, FileName);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<IHMCLVehicleClassIL> GetAll()
        {

            try
            {
                return IHMCLVehicleClassDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static IHMCLVehicleClassIL GetByClassId(int ClassId)
        {

            try
            {
                return IHMCLVehicleClassDL.GetByClassId(ClassId);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


    }
}
