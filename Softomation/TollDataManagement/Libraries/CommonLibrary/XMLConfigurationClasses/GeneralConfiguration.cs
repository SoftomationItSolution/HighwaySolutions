using System;

namespace Softomation.DMS.Libraries.CommonLibrary.XMLConfigurationClasses
{
    public class GeneralConfiguration
    {
        #region Variable
        string databaseServer;
        string databaseName;
        string databaseUser;
        string databasePassword;
        string serverBaseAPIUrl;
        string apiKey;
        #endregion

        #region Constructor
        public GeneralConfiguration()
        {
            this.databaseServer = String.Empty;
            this.databaseName = String.Empty;
            this.databaseUser = String.Empty;
            this.databasePassword = String.Empty;
            this.serverBaseAPIUrl = String.Empty;
            this.apiKey = String.Empty;
        }
        #endregion

        #region Property
        public String DatabaseServer
        {
            get { return this.databaseServer; }
            set { this.databaseServer = value; }
        }
        public String DatabaseName
        {
            get { return this.databaseName; }
            set { this.databaseName = value; }
        }
        public String DatabaseUser
        {
            get { return this.databaseUser; }
            set { this.databaseUser = value; }
        }
        public String DatabasePassword
        {
            get { return this.databasePassword; }
            set { this.databasePassword = value; }
        }
        public String ServerBaseAPIUrl
        {
            get { return this.serverBaseAPIUrl; }
            set { this.serverBaseAPIUrl = value; }
        }

        public String ApiKey
        {
            get { return this.apiKey; }
            set { this.apiKey = value; }
        }

        #endregion

        #region Helper
        public static GeneralConfiguration Deserialize()
        {
            GeneralConfiguration config = (GeneralConfiguration)Serialization.Serialization.Deserialize(typeof(GeneralConfiguration), Constants.projectConfigDirectory + "GeneralConfiguration.xml");
            return config;
        }

        public static void Serialize(GeneralConfiguration config)
        {
            Serialization.Serialization.Serialize(typeof(GeneralConfiguration), Constants.projectConfigDirectory + "GeneralConfiguration.xml", config);
        }
        #endregion
    }
}
