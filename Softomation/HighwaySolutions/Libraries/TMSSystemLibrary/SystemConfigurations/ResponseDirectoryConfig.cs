using System;
using System.IO;
using System.Threading;
using System.Web.Script.Serialization;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.SystemConfigurations
{
    public class ResponseDirectoryConfig
    {
        string responsePay;
        string responseCheckTransaction;
        string responseQueryException;
        string responseSyncTime;
        string responseTagDetails;
        string responseTollPlazaHeartBeat;
        string responseVoilationAuditDetails;

        public ResponseDirectoryConfig()
        {
            this.responsePay = string.Empty;
            this.responseCheckTransaction = string.Empty;
            this.responseQueryException = string.Empty;
            this.responseSyncTime = string.Empty;
            this.responseTagDetails = string.Empty;
            this.responseTollPlazaHeartBeat = string.Empty;
            this.responseVoilationAuditDetails = string.Empty;
        }

        public String ResponsePay
        {
            get
            {
                return responsePay;
            }

            set
            {
                responsePay = value;
            }
        }

        public String ResponseCheckTransaction
        {
            get
            {
                return responseCheckTransaction;
            }

            set
            {
                responseCheckTransaction = value;
            }
        }

        public String ResponseQueryException
        {
            get
            {
                return responseQueryException;
            }

            set
            {
                responseQueryException = value;
            }
        }

        public String ResponseSyncTime
        {
            get
            {
                return responseSyncTime;
            }

            set
            {
                responseSyncTime = value;
            }
        }

        public String ResponseTagDetails
        {
            get
            {
                return responseTagDetails;
            }

            set
            {
                responseTagDetails = value;
            }
        }

        public String ResponseTollPlazaHeartBeat
        {
            get
            {
                return responseTollPlazaHeartBeat;
            }

            set
            {
                responseTollPlazaHeartBeat = value;
            }
        }

        public String ResponseVoilationAuditDetails
        {
            get
            {
                return responseVoilationAuditDetails;
            }

            set
            {
                responseVoilationAuditDetails = value;
            }
        }


        public static ResponseDirectoryConfig Deserialize()
        {
            ResponseDirectoryConfig config = null;
            Int16 i = 0;
            while (i < 4)
            {
                try
                {
                    if (Directory.Exists(SystemConstants.ProjectConfigDirectory))
                    {
                        JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                        config = json_serializer.Deserialize<ResponseDirectoryConfig>(File.ReadAllText(SystemConstants.ProjectConfigDirectory + "ResponseDirectoryConfig.json"));
                      
                        i = 10;

                    }
                    break;
                }
                catch (Exception)
                {
                    config = new ResponseDirectoryConfig();
                    i++;
                    Thread.Sleep(100);
                }
            }
            return config;
        }

        public static bool Serialize(ResponseDirectoryConfig config)
        {
            bool result = false;
            Int16 i = 0;
            while (i < 4)
            {
                try
                {
                    JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                    
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
