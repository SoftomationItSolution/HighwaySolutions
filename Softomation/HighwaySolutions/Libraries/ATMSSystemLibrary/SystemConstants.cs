using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Device.Location;
using HighwaySoluations.Softomation.CommonLibrary;
using HighwaySoluations.Softomation.ATMSSystemLibrary.DBA;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary
{
    public class SystemConstants: Constants
    {
        #region Project Config
        public static string DriveLetter = "C";
        public static string ProjectName = "ATMSv1";
        public static string ProjectConfigRoot = DriveLetter + @":\ProjectConfig\";
        public static string ProjectConfigDirectory = ProjectConfigRoot + ProjectName + @"\MasterConfig\";
        public static string ProjectLogDirectory = ProjectConfigRoot + ProjectName + @"\log\";
        public static string ProjectConfigKey = DriveLetter + @":\ProjectConfig\" + ProjectName + @"\MasterConfig\Key\";
        public static string Version = "1.0.0.1";
        #endregion

        #region Enum
        public enum PhoneType
        {
            Operator = 1,
            RoadSide = 2,
            GsmGateway = 3,
            Patrolling = 4,
            Commuters = 5,
        }
        public enum VehicleDirectionType
        {
            Front = 1,
            Rear = 2
        }
        public enum ECSCallType
        {
            Incomming = 26,
            Outgoing = 27,
            Missed = 28,
            Rejected = 29
        }
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
        public enum EquipmentMasterType
        {
            PTZCamera = 1,
            ECB = 2,
            LPU = 3,
            MET = 4,
            Radar = 5,
            Sensor = 6,
            SpeedDisplay = 7,
            VMS = 8,
            Light = 9,
            Blinker = 10,
            DataStorage = 11,
            IpPhone = 12,
            JoyStick = 13,
            Server = 14,
            VideoWall = 15,
            WorkStation = 16,
            NetworkSwitch = 17,
            Tablet = 18,
            UPS = 19,
            HooterAlarmWithBeacon = 20,
            GPSDevice = 21,
            BodyCam = 22,
            DashCam = 23,
            Other = 24,
            VIDSCamera = 25,
            ANPRCamera = 26,
            MotionDetectionCamera = 27,
            MediaConverter = 28,
            VehicleFrontCamera = 29,
            VehicleRearCamera = 30,
            MRCS = 31,
            ATCCCamera = 32,
            Printer = 33,
            NVR = 34,
            Firewall_Router = 35,
        }

        public enum AppUserType
        {
            SysAdmin = 0,
            Administrator = 1,
            Enforcement = 2,
            Operater = 3,
            Commuters = 4,
            PatrollingTeam= 5
        }
       
        public enum IncidentGeneratedByType
        {
            SysAdmin = 0,
            Administrator = 1,
            Enforcement = 2,
            Operater = 3,
            Commuters = 4,
            PatrollingTeam = 5,
            Auto = 6
        }
        public enum VmsMessageFormat
        {
            None = 0,
            Text = 1,
            Image = 2,
            Video =3
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

        public static double GeoDifference(double sLatitude, double sLongitude, double eLatitude, double eLongitude)
        {
            try
            {
                var sCoord = new GeoCoordinate(sLatitude, sLongitude);
                var eCoord = new GeoCoordinate(eLatitude, eLongitude);
                return sCoord.GetDistanceTo(eCoord);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static string GetCentralGeoCoordinate(List<GeoCoordinateIL> geoCoordinates)
        {
            GeoCoordinateIL data = new GeoCoordinateIL();
            if (geoCoordinates.Count == 1)
            {
                data.Latitude = geoCoordinates[0].Latitude;
                data.Longitude = geoCoordinates[0].Longitude;
                return string.Format("{0},{1}", data.Latitude.ToString(), data.Longitude.ToString());
            }

            double x = 0;
            double y = 0;
            double z = 0;

            foreach (var geoCoordinate in geoCoordinates)
            {
                var latitude = Convert.ToDouble(geoCoordinate.Latitude) * Math.PI / 180;
                var longitude = Convert.ToDouble(geoCoordinate.Longitude) * Math.PI / 180;

                x += Math.Cos(latitude) * Math.Cos(longitude);
                y += Math.Cos(latitude) * Math.Sin(longitude);
                z += Math.Sin(latitude);
            }

            var total = geoCoordinates.Count;

            x = x / total;
            y = y / total;
            z = z / total;

            var centralLongitude = Math.Atan2(y, x);
            var centralSquareRoot = Math.Sqrt(x * x + y * y);
            var centralLatitude = Math.Atan2(z, centralSquareRoot);

            data.Latitude = Convert.ToDouble(centralLatitude * 180 / Math.PI);
            data.Longitude = Convert.ToDouble(centralLongitude * 180 / Math.PI);

            return string.Format("{0},{1}", data.Latitude.ToString(), data.Longitude.ToString());
        }

        public static string ConvertChainageName(Decimal ChainageNumber)
        {

            return string.Format("{0:0.000}", ChainageNumber);
        }
        #endregion
    }
}
