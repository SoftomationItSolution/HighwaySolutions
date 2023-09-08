using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;



namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class VSDSLaneConfigBL
    {
        public static List<ResponseIL> SetUp(List<VSDSLaneConfigIL> config)
        {
            try
            {
                return VSDSLaneConfigDL.SetUp(config);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<VSDSLaneConfigIL> GetAll()
        {
            try
            {
                return VSDSLaneConfigDL.GetAll();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<VSDSLaneConfigIL> GetActive()
        {
            try
            {
                return VSDSLaneConfigDL.GetActive();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
