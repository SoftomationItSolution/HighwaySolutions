﻿using System;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.BL
{
    public class VMSMessageDetailsBL
    {
        public static List<ResponseIL> InsertUpdate(VMSMessageDetailsIL ss)
        {
            try
            {
                return VMSMessageDetailsDL.InsertUpdate(ss);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<VMSMessageDetailsIL> GetAll()
        {
            try
            {
                return VMSMessageDetailsDL.GetAll();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static VMSMessageDetailsIL GetById(int MessageId)
        {
            try
            {
                return VMSMessageDetailsDL.GetById(MessageId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<VMSMessageDetailsIL> GetByFilter(DataFilterIL data)
        {
            try
            {
                return VMSMessageDetailsDL.GetByFilter(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
