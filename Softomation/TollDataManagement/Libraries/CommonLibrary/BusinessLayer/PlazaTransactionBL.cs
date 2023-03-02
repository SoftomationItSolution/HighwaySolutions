using System;
using System.Collections.Generic;
using System.Data;
using Softomation.DMS.Libraries.CommonLibrary.DataLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;

namespace Softomation.DMS.Libraries.CommonLibrary.BusinessLayer
{
    public class PlazaTransactionBL
    {
        public static PlazaTransactionIL EntryInsert(LaneTransactionIL laneTrans)
        {

            try
            {
                return PlazaTransactionDL.EntryInsert(laneTrans);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static PlazaTransactionIL ExitInsert(LaneTransactionIL laneTrans)
        {

            try
            {
                return PlazaTransactionDL.ExitInsert(laneTrans);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        public static PlazaTransactionIL GetByEntryId(Int64 EntryId)
        {
            try
            {
                return PlazaTransactionDL.GetByEntryId(EntryId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static PlazaTransactionIL GetByExitId(Int64 EntryId)
        {
            try
            {
                return PlazaTransactionDL.GetByExitId(EntryId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static DataTable PendingPlazaTransList()
        {
            try
            {
                return PlazaTransactionDL.PendingPlazaTransList();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static List<PlazaTransactionIL> GetEntryPendingDataByPlaza(Int16 PlazaId, Int64 LastSyncId)
        {
            try
            {
                return PlazaTransactionDL.GetEntryPendingDataByPlaza(PlazaId, LastSyncId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
