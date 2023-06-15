using System;
using System.IO;
using System.Threading;
using System.Web.Script.Serialization;

namespace Softomation.ATMSSystemLibrary.SystemConfigurations
{
    public class DataBaseConfig
    {
        #region Variable
        short dataBaseProvider;
        string dbServername;
        string dbName;
        string dbLogin;
        string dbPassword;
        string poolSize;
        string timeout;
        string serverBaseAPIUrl;
        string apiKey;
        #endregion

        #region Constructor
        public DataBaseConfig()
        {
            this.dataBaseProvider = 2;
            this.dbServername = String.Empty;
            this.dbName = String.Empty;
            this.dbLogin = String.Empty;
            this.dbPassword = String.Empty;
            this.poolSize = String.Empty;
            this.timeout = String.Empty;
            this.serverBaseAPIUrl = String.Empty;
            this.apiKey = String.Empty;
        }
        #endregion

        #region Property
        public short DataBaseProvider
        {
            get => dataBaseProvider; set => dataBaseProvider = value;
        }
        public string DBServerName
        {
            get => dbServername; set => dbServername = value;
        }
        public string DBName
        {
            get => dbName; set => dbName = value;
        }
        public string DBLogin
        {
            get => dbLogin; set => dbLogin = value;
        }
        public string DBPassword
        {
            get => dbPassword; set => dbPassword = value;
        }
        public string PoolSize
        {
            get => poolSize; set => poolSize = value;
        }
        public string Timeout
        {
            get => timeout; set => timeout = value;
        }
        public string ServerBaseAPIUrl
        {
            get => serverBaseAPIUrl; set => serverBaseAPIUrl = value;
        }
        public string ApiKey
        {
            get => apiKey; set => apiKey = value;
        }

        #endregion

        public static DataBaseConfig Deserialize()
        {
            DataBaseConfig config = null;
            Int16 i = 0;
            while (i < 4)
            {
                try
                {
                    JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                    config = json_serializer.Deserialize<DataBaseConfig>(File.ReadAllText(Constants.ProjectConfigDirectory + "DBConfiguration.json"));
                    i = 10;
                    break;
                }
                catch (Exception)
                {
                    i++;
                    Thread.Sleep(100);
                }
            }
            return config;
        }
    }
}
