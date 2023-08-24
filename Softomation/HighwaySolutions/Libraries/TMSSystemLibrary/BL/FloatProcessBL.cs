using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class FloatProcessBL
    {
        public static List<ResponseIL> InsertUpdate(FloatProcessIL fp)
        {
            try
            {
                return FloatProcessDL.InsertUpdate(fp);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<FloatProcessIL> GetAll()
        {
            try
            {
                return FloatProcessDL.GetAll();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
