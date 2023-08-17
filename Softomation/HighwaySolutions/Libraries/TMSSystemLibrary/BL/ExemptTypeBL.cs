using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;
using HighwaySoluations.Softomation.CommonLibrary.IL;


namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class ExemptTypeBL
    {
        public static List<ResponseIL> SetUp(List<ExemptTypeIL> types)
        {
            try
            {
                return ExemptTypeDL.SetUp(types);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public static List<ExemptTypeIL> GetAll()
        {
            try
            {
                return ExemptTypeDL.GetAll();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public static List<ExemptTypeIL> GetActive()
        {
            try
            {
                return ExemptTypeDL.GetActive();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}
