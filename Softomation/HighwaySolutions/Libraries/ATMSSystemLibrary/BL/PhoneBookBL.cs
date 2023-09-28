using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class PhoneBookBL
    {
        public static List<ResponseIL> InsertUpdate(PhoneBookIL ed)
        {

            try
            {
                return PhoneBookDL.InsertUpdate(ed);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        
        public static List<PhoneBookIL> GetAll()
        {
            try
            {
                return PhoneBookDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<PhoneBookIL> GetActive()
        {
            try
            {
                return PhoneBookDL.GetActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static PhoneBookIL GetById(int EquipmentId)
        {
            try
            {
                return PhoneBookDL.GetById(EquipmentId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

       

       
    }
}
