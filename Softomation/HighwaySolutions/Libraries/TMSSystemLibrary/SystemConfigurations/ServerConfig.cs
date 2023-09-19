using System;
using System.IO;
using System.Threading;
using System.Web.Script.Serialization;
using HighwaySoluations.Softomation.TMSSystemLibrary;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.MasterConfiguration
{
    public class ServerConfig
    {
        #region Variable
        String serverIP;
        Int32 serverPort;
        Int16 apiPort;
        String apiPath;
        String apiKey;
        String prefixPath;
        Int32 systemIntegratorId;
        Int32 plazaId;
        Int32 clientId;
        Int32 projectId;
        Int16 meragingHours;
        String mediaPath;
        String mediaHttpPath;
        #endregion

        #region Constructor
        public ServerConfig()
        {
            this.serverIP = String.Empty;
            this.serverPort = 6060;
            this.apiPort = 6060;
            this.apiPath = String.Empty;
            this.apiKey = String.Empty;
            this.prefixPath = String.Empty;
            this.systemIntegratorId = 0;
            this.plazaId = 0;
            this.clientId = 0;
            this.projectId = 0;
            this.meragingHours = 0;
            this.mediaPath = String.Empty;
            this.mediaHttpPath = String.Empty;
        }
        #endregion

        #region Property
        public string ServerIP { get => serverIP; set => serverIP = value; }
        public int ServerPort { get => serverPort; set => serverPort = value; }
        public short ApiPort { get => apiPort; set => apiPort = value; }
        public string ApiPath { get => apiPath; set => apiPath = value; }
        public string ApiKey { get => apiKey; set => apiKey = value; }
        public string PrefixPath { get => prefixPath; set => prefixPath = value; }
        public int SystemIntegratorId { get => systemIntegratorId; set => systemIntegratorId = value; }
        public int PlazaId { get => plazaId; set => plazaId = value; }
        public int ClientId { get => clientId; set => clientId = value; }
        public int ProjectId { get => projectId; set => projectId = value; }
        public short MeragingHours { get => meragingHours; set => meragingHours = value; }
        public string MediaPath { get => mediaPath; set => mediaPath = value; }
        public string MediaHttpPath { get => mediaHttpPath; set => mediaHttpPath = value; }
        #endregion

        #region Helper
        public static ServerConfig Deserialize()
        {
            try
            {
                ServerConfig serverconfig = null;
                Int16 i = 0;
                while (i < 4)
                {
                    try
                    {
                        JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                        serverconfig = json_serializer.Deserialize<ServerConfig>(File.ReadAllText(SystemConstants.ProjectConfigDirectory + "ServerConfigMaster.json"));
                        i = 10;
                        break;
                    }
                    catch (Exception)
                    {
                        i++;
                        Thread.Sleep(100);
                    }
                }
                return serverconfig;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static void Serialize(ServerConfig configuration)
        {
            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
            var EntryInputjson = new JavaScriptSerializer().Serialize(configuration);
        }
        #endregion
    }
}
