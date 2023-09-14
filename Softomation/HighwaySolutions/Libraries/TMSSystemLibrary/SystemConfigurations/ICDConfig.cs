using System;
using System.IO;
using System.Threading;
using System.Web.Script.Serialization;

namespace HighwaySoluations.Softomation.TMSSystemLibrary.SystemConfigurations
{
    public class ICDConfig
    {
        string icdVersion;
        string bankName;
        string requestQueryExceptionList;
        string requestSyncTime;
        string requestTagDetails;
        string requestCheckTransactionStatus;
        string requestTollPlazaHeartBeat;
        string requestPay;
        string requestViolationAuditDetailAPI;
        string requestCashApi;

        public ICDConfig()
        {
            icdVersion = string.Empty;
            bankName = string.Empty;
            requestQueryExceptionList = string.Empty;
            requestSyncTime = string.Empty;
            requestTagDetails = string.Empty;
            requestCheckTransactionStatus = string.Empty;
            requestTollPlazaHeartBeat = string.Empty;
            requestPay = string.Empty;
            requestViolationAuditDetailAPI = string.Empty;
            requestCashApi = string.Empty;
        }

        public String ICDVersion
        {
            get
            {
                return icdVersion;
            }

            set
            {
                icdVersion = value;
            }
        }

        public String BankName
        {
            get
            {
                return bankName;
            }

            set
            {
                bankName = value;
            }
        }

        public String RequestQueryExceptionList
        {
            get
            {
                return requestQueryExceptionList;
            }

            set
            {
                requestQueryExceptionList = value;
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

        public String RequestCheckTransactionStatus
        {
            get
            {
                return requestCheckTransactionStatus;
            }

            set
            {
                requestCheckTransactionStatus = value;
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

        public String RequestViolationAuditDetailAPI
        {
            get
            {
                return requestViolationAuditDetailAPI;
            }

            set
            {
                requestViolationAuditDetailAPI = value;
            }
        }

        public String RequestCashApi
        {
            get
            {
                return requestCashApi;
            }

            set
            {
                requestCashApi = value;
            }
        }

        public static ICDConfig Deserialize()
        {
            ICDConfig config = null;
            Int16 i = 0;
            while (i < 4)
            {
                try
                {
                    if (Directory.Exists(SystemConstants.ProjectConfigDirectory))
                    {
                        JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                        config = json_serializer.Deserialize<ICDConfig>(File.ReadAllText(SystemConstants.ProjectConfigDirectory + "ICDConfig.json"));

                        i = 10;

                    }
                    break;
                }
                catch (Exception ex)
                {
                    config = new ICDConfig();
                    i++;
                    Thread.Sleep(100);
                }
            }
            return config;
        }

        public static bool Serialize(ICDConfig config)
        {
            bool result = false;
            Int16 i = 0;
            while (i < 4)
            {
                try
                {
                    JavaScriptSerializer json_serializer = new JavaScriptSerializer();

                    var jsonString = json_serializer.Serialize(config);
                    if (File.Exists(SystemConstants.ProjectConfigDirectory + "ICDConfig.json"))
                    {
                        File.Delete(SystemConstants.ProjectConfigDirectory + "ICDConfig.json");
                    }
                    else
                    {
                        Directory.CreateDirectory(SystemConstants.ProjectConfigDirectory);
                    }

                    File.WriteAllText(SystemConstants.ProjectConfigDirectory + "ICDConfig.json", jsonString);
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
