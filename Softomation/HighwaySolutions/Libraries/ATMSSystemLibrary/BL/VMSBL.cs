using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class VMSBL
    {
        public static List<ResponseIL> InsertUpdate(VMSIL ss)
        {
            try
            {
                return VMSDL.InsertUpdate(ss);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<VMSIL> GetVMSMessage()
        {
            try
            {
                return VMSDL.GetVMSMessage();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static VMSIL GetById(int MessageId)
        {
            try
            {
                return VMSDL.GetById(MessageId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

    }
}
