using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;



namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class LaneConfigBL
    {
        public static List<ResponseIL> SetUp(List<LaneConfigIL> config)
        {
            try
            {
                return LaneConfigDL.SetUp(config);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<LaneConfigIL> GetAll()
        {
            try
            {
                return LaneConfigDL.GetAll();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<LaneConfigIL> GetActive()
        {
            try
            {
                return LaneConfigDL.GetActive();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
