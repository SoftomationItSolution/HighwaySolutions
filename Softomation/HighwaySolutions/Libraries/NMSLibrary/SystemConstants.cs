using System;
using System.Net;
using System.Net.NetworkInformation;
using HighwaySoluations.Softomation.CommonLibrary;
using HighwaySoluations.Softomation.NMSSystemLibrary.IL;

namespace HighwaySoluations.Softomation.NMSSystemLibrary
{
    public class SystemConstants : Constants
    {
        #region Project Config
        public static string DriveLetter = "C";
        public static string ProjectName = "NMSv1";
        public static string ProjectConfigRoot = DriveLetter + @":\ProjectConfig\";
        public static string ProjectConfigDirectory = ProjectConfigRoot + ProjectName + @"\MasterConfig\";
        public static string ProjectLogDirectory = ProjectConfigRoot + ProjectName + @"\log\";
        public static string ProjectConfigKey = DriveLetter + @":\ProjectConfig\" + ProjectName + @"\MasterConfig\Key\";
        public static string Version = "1.0.0.1";
        #endregion

        #region Enum
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


        #endregion

        #region Methods

        public static bool ValidateIP(string ipaddress)
        {
            bool result = false;
            try
            {
                if (!string.IsNullOrEmpty(ipaddress))
                {
                    IPAddress ip;
                    result = IPAddress.TryParse(ipaddress, out ip);
                }
            }
            catch (Exception)
            {
                result = false;
            }
            return result;

        }
        public static IMCPStatusIL CheckStatusByIMCP(IMCPStatusIL impcStatus)
        {
            try
            {
                Ping myPing = new Ping();
                PingReply reply = myPing.Send(impcStatus.IpAddress, impcStatus.Timeout);
                if (reply != null)
                {
                    impcStatus.StatusId = (short)reply.Status;
                    impcStatus.Latency = reply.RoundtripTime;
                    if (impcStatus.StatusId == 0)
                        impcStatus.OnLineStatus = true;
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
            impcStatus.StatusName = Enum.GetName(typeof(IPStatus), (IPStatus)impcStatus.StatusId);
            return impcStatus;
        }


        #endregion
    }
}
