﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.IdentityModel.Tokens.Jwt;
using System.IO;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Text.RegularExpressions;
using Microsoft.IdentityModel.Tokens;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.CommonLibrary;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary
{
    public class SystemConstants: Constants
    {
        #region Project Config
        public static string DriveLetter = "C";
        public static string ProjectName = "ATMSv1";
        public static string ProjectConfigRoot = DriveLetter + @":\ProjectConfig\";
        public static string ProjectConfigDirectory = ProjectConfigRoot + ProjectName + @"\MasterConfig\";
        public static string ProjectConfigKey = DriveLetter + @":\ProjectConfig\" + ProjectName + @"\MasterConfig\Key\";
        public static string Version = "1.0.0.1";
        #endregion

        #region Enum
        public enum VIDSEquipmentPositionType
        {
            Entry = 1,
            Exit = 2,
            MainCarriageway = 3,
            ParkingSpot = 4
        }
        public enum ATCCEquipmentPositionType
        {
            Entry = 1,
            Exit = 2,
        }
        public enum VMSEquipmentPositionType
        {
            Entry = 1,
            Exit = 2,
        }
        public enum HighwayLaneNumber
        {
            Lane_0 = 0,
            Lane_1 = 1,
            Lane_2 = 2,
            Lane_3 = 3,
            Lane_4 = 4,
            Lane_5 = 5,
            Lane_6 = 6,
            Lane_7 = 7,
            Lane_8 = 8
        }

        public enum SystemMasterType
        {
            ADAS = 1,
            ATCC = 2,
            ECS = 3,
            FMS = 4,
            TMCS = 5,
            VIDS = 6,
            VMS = 7,
            VSDS = 8,
            Weather = 9,
            IMS = 10,
            Config = 11,
            TTMS = 12,
            RMS = 13,
            NMS = 14,
            Challan = 15,
            CRS = 16,
            MRCS = 17
        }
       
        
        public enum AppUserType
        {
            SysAdmin = 0,
            Administrator = 1,
            Enforcement = 2,
            Operater = 3,
            Commuters = 4,
            PetrollingTeam = 5
        }
       
        public enum IncidentGeneratedByType
        {
            SysAdmin = 0,
            Administrator = 1,
            Enforcement = 2,
            Operater = 3,
            Commuters = 4,
            PetrollingTeam = 5,
            Auto = 6
        }
        public enum VmsMessageFormat
        {
            None = 0,
            Text = 1,
            Image = 2
        }
        public enum VmsMessageType
        {
            None = 0,
            Static = 1,
            Scroll = 2
        }
        public enum ChallanType
        {
            None = 0,
            OverSpeed = 1,
            SectionOverSpeed = 2,
            WrongLane = 3,
            LaneOverspeed = 4,
            WrongwayParking = 5,
            WrongwayDriving = 6
        }
        #endregion

        #region Methods
        public static bool BulkCopy(DataTable dt, string table)
        {
            try
            {
                bool error = true;
                SqlConnection con = (SqlConnection)DBAccessor.CreateConnection();
                con.Open();
                using (SqlBulkCopy bulcopy = new SqlBulkCopy(con))
                {
                    bulcopy.DestinationTableName = table;
                    try
                    {
                        bulcopy.WriteToServer(dt);
                        con.Dispose();
                    }
                    catch (Exception ex)
                    {
                        con.Dispose();
                        error = false;
                        throw ex;
                    }
                    return error;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion
    }

   
}