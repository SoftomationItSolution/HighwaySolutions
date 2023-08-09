using System;

namespace Softomation.DMS.Libraries.CommonLibrary.XMLConfigurationClasses
{
    public class PlazaConfiguration
    {
        #region Variable
        String localIP;
        String serverIP;
        Int32 serverPort;
        Int16 apiPort;
        String apiPath;
        String apiKey;
        String prefixPath;
        #endregion

        #region Constructor
        public PlazaConfiguration()
        {
            this.localIP = String.Empty;
            this.serverIP = String.Empty;
            this.serverPort = 6060;
            this.apiPort = 6060;
            this.apiPath = String.Empty;
            this.apiKey = String.Empty;
            this.prefixPath = String.Empty;
        }
        #endregion

        #region Property
        public String LocalIP
        {
            get { return this.localIP; }
            set { this.localIP = value; }
        }
        public String ServerIP
        {
            get
            {
                return this.serverIP;
            }
            set
            {
                this.serverIP = value;
            }
        }
        public Int32 ServerPort
        {
            get
            {
                return this.serverPort;
            }
            set
            {
                this.serverPort = value;
            }
        }
        public Int16 ApiPort
        {
            get
            {
                return this.apiPort;
            }
            set
            {
                this.apiPort = value;
            }
        }
        public String ApiPath
        {
            get
            {
                return this.apiPath;
            }
            set
            {
                this.apiPath = value;
            }
        }
        public String ApiKey
        {
            get
            {
                return this.apiKey;
            }
            set
            {
                this.apiKey = value;
            }
        }

        public String PrefixPath
        {
            get
            {
                return prefixPath;
            }

            set
            {
                prefixPath = value;
            }
        }
        #endregion

        #region Helper
        public static PlazaConfiguration Deserialize()
        {
            PlazaConfiguration config = (PlazaConfiguration)Serialization.Serialization.Deserialize(typeof(PlazaConfiguration), Constants.projectConfigDirectory + "PlazaConfiguration.xml");
            return config;
        }

        public static void Serialize(PlazaConfiguration config)
        {
            Serialization.Serialization.Serialize(typeof(PlazaConfiguration), Constants.projectConfigDirectory + "PlazaConfiguration.xml", config);
        }
        #endregion
    }
}
