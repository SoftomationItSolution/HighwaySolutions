using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.BL
{
    public class ICDLaneDetailsBL
    {
        public static List<ICDLaneDetailsIL> GetByPlaza(short PlazaId)
        {
            try
            {
                return ICDLaneDetailsDL.GetByPlaza(PlazaId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static ICDLaneDetailsIL GetByLane(short LaneId)
        {
            try
            {
                return ICDLaneDetailsDL.GetByLane(LaneId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
