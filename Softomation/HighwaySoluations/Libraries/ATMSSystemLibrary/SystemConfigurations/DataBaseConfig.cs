using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.IO;
using System.Text.Json;
using System.Threading;
using System.Web.Script.Serialization;

namespace HighwaySoluations.Softomation.ATMSSystemLibrary.SystemConfigurations
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
        }
        #endregion

        #region Property
        [Required]
        [DisplayName("Database Provider:")]
        public short DataBaseProvider
        {
            get => dataBaseProvider; set => dataBaseProvider = value;
        }
        [Required]
        [DisplayName("Database Server:")]
        public string DBServerName
        {
            get => dbServername; set => dbServername = value;
        }
        [Required]
        [DisplayName("Database Name:")]
        public string DBName
        {
            get => dbName; set => dbName = value;
        }
        [Required]
        [DisplayName("Database Username:")]
        public string DBLogin
        {
            get => dbLogin; set => dbLogin = value;
        }
        [Required]
        [DisplayName("Database Password:")]
        public string DBPassword
        {
            get => dbPassword; set => dbPassword = value;
        }
        [Required]
        [DisplayName("Database Poolsize:")]
        public string PoolSize
        {
            get => poolSize; set => poolSize = value;
        }
        [Required]
        [DisplayName("Database Timeout:")]
        public string Timeout
        {
            get => timeout; set => timeout = value;
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
                    try
                    {
                        config.DBPassword = Constants.Decrypt(config.DBPassword);
                    }
                    catch (Exception)
                    {
                    }
                    i = 10;
                    break;
                }
                catch (Exception)
                {
                    config=new DataBaseConfig();
                    i++;
                    Thread.Sleep(100);
                }
            }
            return config;
        }

        public static bool Serialize(DataBaseConfig config)
        {
            bool result = false;
            Int16 i = 0;
            while (i < 4)
            {
                try
                {
                    config.DBPassword = Constants.Encrypt(config.DBPassword);
                    var jsonString = JsonSerializer.Serialize(config, new JsonSerializerOptions { WriteIndented = true });
                    if (File.Exists(Constants.ProjectConfigDirectory + "DBConfiguration.json"))
                    {
                        File.Delete(Constants.ProjectConfigDirectory + "DBConfiguration.json");
                    }
                    else
                    {
                        Directory.CreateDirectory(Constants.ProjectConfigDirectory);
                    }
                    JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                    File.WriteAllText(Constants.ProjectConfigDirectory + "DBConfiguration.json", jsonString);
                    i = 10;
                    result = true;
                    break;
                }
                catch (Exception)
                {
                    result = false;
                    i++;
                    Thread.Sleep(100);
                }


            }
            return result;
        }
    }
}
