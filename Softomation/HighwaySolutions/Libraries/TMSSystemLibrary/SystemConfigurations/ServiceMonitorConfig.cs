using System;
using System.IO;
using System.Threading;
using System.Web.Script.Serialization;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.SystemConfigurations
{
    public class ServiceMonitorConfig
    {
        public static ServiceMonitorIL Deserialize()
        {
            ServiceMonitorIL config = null;
            Int16 i = 0;
            while (i < 4)
            {
                try
                {
                    if (Directory.Exists(SystemConstants.ProjectConfigDirectory))
                    {
                        JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                        config = json_serializer.Deserialize<ServiceMonitorIL>(File.ReadAllText(SystemConstants.ProjectConfigDirectory + "ServiceMonitorConfig.json"));
                        i = 10;

                    }
                    break;
                }
                catch (Exception)
                {
                    config = new ServiceMonitorIL();
                    i++;
                    Thread.Sleep(100);
                }
            }
            return config;
        }
        public static bool Serialize(ServiceMonitorIL config)
        {
            bool result = false;
            Int16 i = 0;
            while (i < 4)
            {
                try
                {
                    JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                    var jsonString = json_serializer.Serialize(config);
                    if (File.Exists(SystemConstants.ProjectConfigDirectory + "ServiceMonitorConfig.json"))
                    {
                        File.Delete(SystemConstants.ProjectConfigDirectory + "ServiceMonitorConfig.json");
                    }
                    else
                    {
                        Directory.CreateDirectory(SystemConstants.ProjectConfigDirectory);
                    }

                    File.WriteAllText(SystemConstants.ProjectConfigDirectory + "ServiceMonitorConfig.json", jsonString);
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
