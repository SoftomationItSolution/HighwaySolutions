using System;
using System.IO;
using System.Threading;
using System.Web.Script.Serialization;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.SystemConfigurations
{
    public class RequestDirectoryConfig
    {
        string requestPay;
        string requestCheckTransaction;
        string requestQueryException;
        string requestSyncTime;
        string requestTagDetails;
        string requestTollPlazaHeartBeat;
        string requestVoilationAuditDetails;

        public RequestDirectoryConfig()
        {
            this.requestPay = string.Empty;
            this.requestCheckTransaction = string.Empty;
            this.requestQueryException = string.Empty;
            this.requestSyncTime = string.Empty;
            this.requestTagDetails = string.Empty;
            this.requestTollPlazaHeartBeat = string.Empty;
            this.requestVoilationAuditDetails = string.Empty;
        }

        public String RequestPay
        {
            get
            {
                return requestPay;
            }

            set
            {
                requestPay = value;
            }
        }

        public String RequestCheckTransaction
        {
            get
            {
                return requestCheckTransaction;
            }

            set
            {
                requestCheckTransaction = value;
            }
        }

        public String RequestQueryException
        {
            get
            {
                return requestQueryException;
            }

            set
            {
                requestQueryException = value;
            }
        }

        public String RequestSyncTime
        {
            get
            {
                return requestSyncTime;
            }

            set
            {
                requestSyncTime = value;
            }
        }

        public String RequestTagDetails
        {
            get
            {
                return requestTagDetails;
            }

            set
            {
                requestTagDetails = value;
            }
        }

        public String RequestTollPlazaHeartBeat
        {
            get
            {
                return requestTollPlazaHeartBeat;
            }

            set
            {
                requestTollPlazaHeartBeat = value;
            }
        }

        public String RequestVoilationAuditDetails
        {
            get
            {
                return requestVoilationAuditDetails;
            }

            set
            {
                requestVoilationAuditDetails = value;
            }
        }

        public static RequestDirectoryConfig Deserialize()
        {
            RequestDirectoryConfig config = null;
            Int16 i = 0;
            while (i < 4)
            {
                try
                {
                    if (Directory.Exists(SystemConstants.ProjectConfigDirectory))
                    {
                        JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                        config = json_serializer.Deserialize<RequestDirectoryConfig>(File.ReadAllText(SystemConstants.ProjectConfigDirectory + "RequestDirectoryConfig.json"));

                        i = 10;

                    }
                    break;
                }
                catch (Exception)
                {
                    config = new RequestDirectoryConfig();
                    i++;
                    Thread.Sleep(100);
                }
            }
            return config;
        }

        public static bool Serialize(RequestDirectoryConfig config)
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
