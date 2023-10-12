using System;
using System.IO;
using System.Threading;
using System.Web.Script.Serialization;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.SystemConfigurations
{
    public class DataBaseConfig
    {
        public static DataBaseIL Deserialize()
        {
            DataBaseIL config = null;
            Int16 i = 0;
            while (i < 4)
            {
                try
                {
                    if (Directory.Exists(SystemConstants.ProjectConfigDirectory))
                    {
                        JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                        config = json_serializer.Deserialize<DataBaseIL>(File.ReadAllText(SystemConstants.ProjectConfigDirectory + "DBConfiguration.json"));
                        try
                        {
                            config.DBPassword = SystemConstants.Decrypt(config.DBPassword);
                        }
                        catch (Exception ex)
                        {
                        }
                        i = 10;

                    }
                    break;
                }
                catch (Exception)
                {
                    config = new DataBaseIL();
                    i++;
                    Thread.Sleep(100);
                }
            }
            return config;
        }
        public static bool Serialize(DataBaseIL config)
        {
            bool result = false;
            Int16 i = 0;
            while (i < 4)
            {
                try
                {
                    JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                    config.DBPassword = CommonLibrary.Constants.Encrypt(config.DBPassword);
                    var jsonString = json_serializer.Serialize(config);
                    if (File.Exists(SystemConstants.ProjectConfigDirectory + "DBConfiguration.json"))
                    {
                        File.Delete(SystemConstants.ProjectConfigDirectory + "DBConfiguration.json");
                    }
                    else
                    {
                        Directory.CreateDirectory(SystemConstants.ProjectConfigDirectory);
                    }

                    File.WriteAllText(SystemConstants.ProjectConfigDirectory + "DBConfiguration.json", jsonString);
                    i = 10;
                    result = true;
                    break;
                }
                catch (Exception ex)
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
