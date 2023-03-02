using System;

namespace Softomation.DMS.Libraries.CommonLibrary.XMLConfigurationClasses
{
    public class LaneConfiguration
    {
        #region Variable
        String localIP;
        String plazaIP;
        Int32 plazaPort;
        Int16 apiPort;
        String apiPath;
        String apiKey;
        String prefixPath;
        #endregion

        #region Constructor
        public LaneConfiguration()
        {
            this.localIP = String.Empty;
            this.plazaIP = String.Empty;
            this.plazaPort = 6060;
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
        public String PlazaIP
        {
            get
            {
                return this.plazaIP;
            }
            set
            {
                this.plazaIP = value;
            }
        }
        public Int32 PlazaPort
        {
            get
            {
                return this.plazaPort;
            }
            set
            {
                this.plazaPort = value;
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
        public static LaneConfiguration Deserialize()
        {
            LaneConfiguration config = (LaneConfiguration)Serialization.Serialization.Deserialize(typeof(LaneConfiguration), Constants.projectConfigDirectory + "LaneConfiguration.xml");
            return config;
        }

        public static void Serialize(LaneConfiguration config)
        {
            Serialization.Serialization.Serialize(typeof(LaneConfiguration), Constants.projectConfigDirectory + "LaneConfiguration.xml", config);
        }
        #endregion
    }
}
