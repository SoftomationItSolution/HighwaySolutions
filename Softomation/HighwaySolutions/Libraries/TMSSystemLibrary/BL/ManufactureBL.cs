using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;


namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class ManufactureBL
    {
        public static List<ResponseIL> InsertUpdate(ManufactureIL eqMF)
        {
            try
            {
                return ManufactureDL.InsertUpdate(eqMF);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<ManufactureIL> GetAll()
        {
            try
            {
                return ManufactureDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<ManufactureIL> GetActive()
        {
            try
            {
                return ManufactureDL.GetActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static ManufactureIL GetById(short ManufactureId)
        {
            try
            {
                return ManufactureDL.GetById(ManufactureId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
