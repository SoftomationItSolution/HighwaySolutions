using System;
using System.IO;
using System.Threading;
using System.Web.Script.Serialization;
using HighwaySoluations.Softomation.TMSSystemLibrary;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.MasterConfiguration
{
    public class LaneConfig
    {
        String laneIPAddress;
        String plazaIPAddress;
        String plazaBaseAPI;
        String apiPassword;
        String mediaHttpPath;
        String mediaPrefixPath;
        String mediaImagePath;
        String mediaCCHImagePath;
        String mediaVideoPath;
        String mediaAvcPath;
        Int16 plazaMode;
        Int32 plazaPort;
        Int16 masterDataSynInterval;
        Int16 lsdu;
        Int16 wimcharges;
        Int16 cchpopup;
        Int16 avc;
        Int16 loginrequest;
        Int16 processcch;
        Int16 simulationreq;
        Int16 exmwebcam;
        Int16 isClosedTolling;
        Int16 isSubClassReq;
      

        public LaneConfig()
        {
            this.laneIPAddress = string.Empty;
            this.plazaIPAddress = string.Empty;
            this.plazaBaseAPI = string.Empty;
            this.apiPassword = string.Empty;
            this.mediaHttpPath = string.Empty;
            this.mediaPrefixPath = string.Empty;
            this.mediaImagePath = string.Empty;
            this.mediaCCHImagePath = string.Empty;
            this.mediaVideoPath = string.Empty;
            this.mediaAvcPath = string.Empty;
            this.plazaMode = 0;
            this.plazaPort = 0;
            this.masterDataSynInterval = 10;
            this.lsdu = 0;
            this.wimcharges = 0;
            this.cchpopup = 0;
            this.avc = 0;
            this.loginrequest = 0;
            this.processcch = 0;
            this.simulationreq = 0;
            this.exmwebcam = 0;
            this.isClosedTolling = 0;
            this.isSubClassReq = 0;
           
        }

        public string LaneIPAddress { get => laneIPAddress; set => laneIPAddress = value; }
        public string PlazaIPAddress { get => plazaIPAddress; set => plazaIPAddress = value; }
        public string PlazaBaseAPI { get => plazaBaseAPI; set => plazaBaseAPI = value; }
        public string ApiPassword { get => apiPassword; set => apiPassword = value; }
        public string MediaHttpPath { get => mediaHttpPath; set => mediaHttpPath = value; }
        public string MediaPrefixPath { get => mediaPrefixPath; set => mediaPrefixPath = value; }
        public string MediaImagePath { get => mediaImagePath; set => mediaImagePath = value; }
        public string MediaCCHImagePath { get => mediaCCHImagePath; set => mediaCCHImagePath = value; }
        public string MediaVideoPath { get => mediaVideoPath; set => mediaVideoPath = value; }
        public string MediaAvcPath { get => mediaAvcPath; set => mediaAvcPath = value; }
        public short PlazaMode { get => plazaMode; set => plazaMode = value; }
        public int PlazaPort { get => plazaPort; set => plazaPort = value; }
        public short MasterDataSynInterval { get => masterDataSynInterval; set => masterDataSynInterval = value; }
        public short Lsdu { get => lsdu; set => lsdu = value; }
        public short WimCharges { get => wimcharges; set => wimcharges = value; }
        public short CCHPopup { get => cchpopup; set => cchpopup = value; }
        public short AVC { get => avc; set => avc = value; }
        public short LoginRequest { get => loginrequest; set => loginrequest = value; }
        public short ProcessCCH { get => processcch; set => processcch = value; }
        public short SimulationReq { get => simulationreq; set => simulationreq = value; }
        public short ExmWebCam { get => exmwebcam; set => exmwebcam = value; }
        public short IsClosedTolling { get => isClosedTolling; set => isClosedTolling = value; }
        public short IsSubClassReq { get => isSubClassReq; set => isSubClassReq = value; }

        public static LaneConfig Deserialize()
        {
            try
            {
                LaneConfig config = null;
                Int16 i = 0;
                while (i < 4)
                {
                    try
                    {
                        JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                        config = json_serializer.Deserialize<LaneConfig>(File.ReadAllText(SystemConstants.ProjectConfigDirectory + "LaneConfigMaster.json"));
                        i = 10;
                        break;
                    }
                    catch (Exception ex)
                    {
                        i++;
                        Thread.Sleep(100);
                    }
                }
                return config;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
