﻿using System;
using System.Collections.Generic;
using Softomation.ATMSSystemLibrary.IL;
using Softomation.ATMSSystemLibrary.DL;

namespace Softomation.ATMSSystemLibrary.BL
{
    public class EquipmentDetailsBL
    {
        public static List<ResponseIL> InsertUpdate(EquipmentDetailsIL ed)
        {

            try
            {
                return EquipmentDetailsDL.InsertUpdate(ed);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<EquipmentDetailsIL> GetAll()
        {
            try
            {
                return EquipmentDetailsDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<EquipmentDetailsIL> GetActive()
        {
            try
            {
                return EquipmentDetailsDL.GetActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static EquipmentDetailsIL GetById(int EquipmentId)
        {
            try
            {
                return EquipmentDetailsDL.GetById(EquipmentId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}