﻿using System;
using System.Collections.Generic;
using Softomation.ATMSSystemLibrary.IL;
using Softomation.ATMSSystemLibrary.DL;

namespace Softomation.ATMSSystemLibrary.BL
{
    public class PackageBL
    {
        public static List<ResponseIL> InsertUpdate(PackageIL cr)
        {

            try
            {
                return PackageDL.InsertUpdate(cr);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static List<PackageIL> GetAll()
        {
            try
            {
                return PackageDL.GetAll();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static List<PackageIL> GetActive()
        {
            try
            {
                return PackageDL.GetActive();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static PackageIL GetById(int PackageId)
        {
            try
            {
                return PackageDL.GetById(PackageId);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}