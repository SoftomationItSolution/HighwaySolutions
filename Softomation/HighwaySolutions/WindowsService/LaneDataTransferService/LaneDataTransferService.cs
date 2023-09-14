using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.ServiceProcess;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary;
using HighwaySoluations.Softomation.TMSSystemLibrary.BL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.SystemConfigurations;
using HighwaySoluations.Softomation.TMSSystemLibrary.SystemLogger;
using static HighwaySoluations.Softomation.CommonLibrary.Constants;
//using static HighwaySoluations.Softomation.TMSSystemLibrary.SystemConstants;
using System.Web.Script.Serialization;
using HighwaySoluations.Softomation.TMSSystemLibrary.MasterConfiguration;

namespace LaneDataTransferService
{
    public partial class LaneDataTransferService : ServiceBase
    {
        #region Globel Variable
        volatile int onstartCheckCount = 0;
        private volatile Boolean stopMasterDataCollectionsThread = false;
        private Thread MasterDataCollectionsThread;

        //private volatile Boolean stopLaneDataSyncThread = false;
        //private Thread LaneDataSyncThread;
        //private Thread SingleThread;
        //private volatile Boolean tokenGenerated = false;
        //UserManagementIL tokenData;
        LaneConfig laneConfiguration;
        ServerConfig serverConfig = null;
        HttpClient client = null;
        //static MessageQueue LaneMediaQueue;
        #region Log
        private Queue logQueue = new Queue();
        private Thread loggerThread;
        private volatile Boolean stopLoggerThread = false;
        #endregion

        #endregion
        static void Main()
        {
            ServiceBase[] ServicesToRun;
            ServicesToRun = new ServiceBase[]
            {
                new LaneDataTransferService()
            };
            ServiceBase.Run(ServicesToRun);
        }
        public LaneDataTransferService()
        {
            InitializeComponent();
            //dont forget to comment this line
            OnStart(new string[] { "LDS" }); //<== only for debugging
        }

        protected override void OnStart(string[] args)
        {
            #region Logger
            try
            {
                LogMessage("Starting LDS logger thread...");
                loggerThread = new Thread(new ThreadStart(this.LoggerThreadFunction));
                loggerThread.IsBackground = true;
                loggerThread.Start();
                LogMessage("The LDS logger has been started.");
            }
            catch (Exception)
            {
                //LogMessage("Error in starting PDSS logger thread function. PDSS cannot be started. " + ex.ToString());
            }
            #endregion

            #region Onstart multiple call check
            onstartCheckCount++;
            if (onstartCheckCount > 1)
            {
                LogMessage("Onstart called multiple time so stopping service.");
                this.Stop();
                return;
            }
            #endregion

            #region  ConfigFile
            try
            {
                LogMessage("ProjectName:" + SystemConstants.ProjectName);
                laneConfiguration = LaneConfig.Deserialize();
            }
            catch (Exception ex)
            {
                LogMessage("error in starting lane Configuration function. LDSS cannot be started. " + ex.Message.ToString() + " " + ex.Source.ToString() + " " + ex.StackTrace.ToString());
                this.Stop();
            }

            #endregion

            if (!string.IsNullOrEmpty(laneConfiguration.PlazaBaseAPI))
            {
                #region Master Data Sync
                try
                {
                    LogMessage("Starting MasterDataCollectionsThread logger thread...");
                    MasterDataCollectionsThread = new Thread(new ThreadStart(this.MasterDataCollectionsFunction));
                    MasterDataCollectionsThread.IsBackground = true;
                    MasterDataCollectionsThread.Start();
                    LogMessage("The MasterDataCollectionsThread logger has been started.");
                }
                catch (Exception ex)
                {
                    LogMessage("error in starting MasterDataCollectionsThread function. LDSS cannot be started. " + ex.Message.ToString() + " " + ex.Source.ToString() + " " + ex.StackTrace.ToString());
                }
                #endregion

                //#region Lane Data Sync
                //try
                //{
                //    LogMessage("Starting LaneDataSyncThread logger thread...");
                //    LaneDataSyncThread = new Thread(new ThreadStart(this.LaneDataSyncFunction));
                //    LaneDataSyncThread.IsBackground = true;
                //    LaneDataSyncThread.Start();
                //    LogMessage("The LaneDataSyncThread logger has been started.");
                //}
                //catch (Exception ex)
                //{
                //    LogMessage("error in starting LaneDataSyncThread function. LDSS cannot be started. " + ex.Message.ToString() + " " + ex.Source.ToString() + " " + ex.StackTrace.ToString());
                //}
                //#endregion

                //LaneMediaQueue = MessageQueuing.Create(MessageQueuing.LaneMediaQueueName.Replace("{ipaddress}", "."));
                //LaneMediaQueue.PeekCompleted += new PeekCompletedEventHandler(LaneMediaQueue_PeekCompleted);
                //LaneMediaQueue.BeginPeek();
                //LogMessage("Entry Lane Data queue listener has been attached.");
            }
            else
            {
                LogMessage("PlazaBaseAPI is not found.");
            }
        }

        protected override void OnStop()
        {
            try
            {
                Thread.Sleep(500);
                stopLoggerThread = true;
                if (loggerThread != null)
                {
                    if (loggerThread.IsAlive == true)
                    {
                        loggerThread.Abort();
                    }
                }
            }
            catch (Exception ex)
            {
                LogMessage("error in stoping loggerThread function. " + ex.Message.ToString() + " " + ex.Source.ToString() + " " + ex.StackTrace.ToString());
            }
        }

        #region Thread & Events
        private void MasterDataCollectionsFunction()
        {
            DateTime TheadStartTime = DateTime.MinValue;
            string resultJson = string.Empty;
            HttpResponseMessage response = null;
            //FareManagementIL fares = null;
            GenerateToken();
            while (!stopMasterDataCollectionsThread)
            {
                TimeSpan ts = DateTime.Now - TheadStartTime;
                //if (!string.IsNullOrEmpty(tokenData.LoginToken))
                //{
                //    TimeSpan ts1 = Convert.ToDateTime(tokenData.AccountExpiredDate) - DateTime.Now;
                   //if (ts1.TotalMinutes < 10)
                       // GenerateToken();
                    if (ts.TotalMinutes > laneConfiguration.MasterDataSynInterval)
                    {
                    if (serverConfig != null)
                    {
                        #region 01 - Get Master Config Details 
                        resultJson = string.Empty;
                        response = null;
                        try
                        {
                            client = new HttpClient();
                            client.BaseAddress = new Uri(laneConfiguration.PlazaBaseAPI);
                            //client.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenData.LoginToken);
                            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                            response = client.GetAsync(laneConfiguration.PlazaBaseAPI + "MasterConfigGet").Result;
                            if (response.IsSuccessStatusCode)
                            {
                                var JsonResponce = response.Content.ReadAsStringAsync().Result;
                                JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                                IntegrationResponseIL requestResponce = json_serializer.Deserialize<IntegrationResponseIL>(JsonResponce);
                                if (requestResponce.ResponseMessage.ToLower() == "success")
                                {
                                    #region Data Sync
                                    resultJson = SystemConstants.ParseJsonResponseObject(JsonResponce);
                                    if (!string.IsNullOrEmpty(resultJson))
                                    {
                                        //MasterConfigIL master = json_serializer.Deserialize<MasterConfigIL>(resultJson);
                                        //MasterConfigBL.InsertUpdate(master);
                                    }
                                    #endregion
                                }
                            }
                            else
                            {
                                LogMessage("MasterConfig API synchronization not working");
                            }

                        }
                        catch (Exception ex)
                        {
                            LogMessage("Error in MasterConfig sync : " + ex.Message.ToString());
                        }
                        finally
                        {
                            Thread.Sleep(100);
                        }
                        #endregion

                        #region 02 - Get System Setting Details 
                        resultJson = string.Empty;
                    response = null;
                    try
                    {
                        client = new HttpClient();
                        client.BaseAddress = new Uri(laneConfiguration.PlazaBaseAPI);
                        //client.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenData.LoginToken);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.GetAsync(laneConfiguration.PlazaBaseAPI + "SystemSettingGet").Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationResponseIL requestResponce = json_serializer.Deserialize<IntegrationResponseIL>(JsonResponce);
                            if (requestResponce.ResponseMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                resultJson = SystemConstants.ParseJsonResponseObject(JsonResponce);
                                if (!string.IsNullOrEmpty(resultJson))
                                {
                                    SystemSettingIL system = json_serializer.Deserialize<SystemSettingIL>(resultJson);
                                    SystemSettingBL.InsertUpdate(system);
                                }
                                #endregion
                            }
                        }
                        else
                        {
                            LogMessage("SystemSettingGet API synchronization not working");
                        }

                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in SystemSettingGet sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion

                    #region 03 - Get Vehicle Class Details 
                    resultJson = string.Empty;
                    response = null;
                    try
                    {
                        client = new HttpClient();
                        client.BaseAddress = new Uri(laneConfiguration.PlazaBaseAPI);
                        //client.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenData.LoginToken);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.GetAsync(laneConfiguration.PlazaBaseAPI + "SystemVehicleClassGetAll").Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationResponseIL requestResponce = json_serializer.Deserialize<IntegrationResponseIL>(JsonResponce);
                            if (requestResponce.ResponseMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                resultJson = SystemConstants.ParseJsonForResponseList(JsonResponce);
                                if (!string.IsNullOrEmpty(resultJson))
                                {
                                    List<SystemVehicleClassIL> vehicleClasses = json_serializer.Deserialize<List<SystemVehicleClassIL>>(resultJson);
                                    //if (vehicleClasses.Count > 0)
                                        //VehicleClassBL.DataMerge(vehicleClasses);
                                }
                                #endregion
                            }
                        }
                        else
                        {
                            LogMessage("VehicleClass API synchronization not working");
                        }

                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in VehicleClassGet sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion

                    #region 04 - Get Connection Type Details 
                    //resultJson = string.Empty;
                    //response = null;
                    //try
                    //{
                    //    client = new HttpClient();
                    //    client.BaseAddress = new Uri(laneConfigurationFile.PlazaBaseAPI);
                    //    client.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenData.LoginToken);
                    //    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    //    response = client.GetAsync(laneConfigurationFile.PlazaBaseAPI + "ConnectionTypeGet").Result;
                    //    if (response.IsSuccessStatusCode)
                    //    {
                    //        var JsonResponce = response.Content.ReadAsStringAsync().Result;
                    //        JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                    //        IntegrationResponseIL requestResponce = json_serializer.Deserialize<IntegrationResponseIL>(JsonResponce);
                    //        if (requestResponce.ResponseMessage.ToLower() == "success")
                    //        {
                    //            resultJson = Persistents.ParseJsonForResponseList(JsonResponce);
                    //            if (!string.IsNullOrEmpty(resultJson))
                    //            {
                    //                List<ConnectionTypeIL> connectionTypeList = json_serializer.Deserialize<List<ConnectionTypeIL>>(resultJson);
                    //                if (connectionTypeList.Count > 0)
                    //                    ConnectionTypeBL.DataMerge(connectionTypeList);
                    //            }
                    //        }
                    //    }
                    //    else
                    //    {
                    //        LogMessage("ConnectionType API synchronization not working");
                    //    }

                    //}
                    //catch (Exception ex)
                    //{
                    //    LogMessage("Error in ConnectionType sync : " + ex.Message.ToString());
                    //}
                    //finally
                    //{
                    //    Thread.Sleep(100);
                    //}
                    #endregion

                    #region 05 - Get Hardware Provider Details 
                    //resultJson = string.Empty;
                    //response = null;
                    //try
                    //{
                    //    client = new HttpClient();
                    //    client.BaseAddress = new Uri(laneConfigurationFile.PlazaBaseAPI);
                    //    client.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenData.LoginToken);
                    //    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    //    response = client.GetAsync(laneConfigurationFile.PlazaBaseAPI + "HardwareProviderGet").Result;
                    //    if (response.IsSuccessStatusCode)
                    //    {
                    //        var JsonResponce = response.Content.ReadAsStringAsync().Result;
                    //        JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                    //        IntegrationResponseIL requestResponce = json_serializer.Deserialize<IntegrationResponseIL>(JsonResponce);
                    //        if (requestResponce.ResponseMessage.ToLower() == "success")
                    //        {
                    //            #region Data Sync
                    //            resultJson = Persistents.ParseJsonForResponseList(JsonResponce);
                    //            if (!string.IsNullOrEmpty(resultJson))
                    //            {
                    //                List<HardwareProviderIL> providerList = json_serializer.Deserialize<List<HardwareProviderIL>>(resultJson);
                    //                if (providerList.Count > 0)
                    //                    HardwareProviderBL.DataMerge(providerList);
                    //            }
                    //            #endregion
                    //        }
                    //    }
                    //    else
                    //    {
                    //        LogMessage("HardwareProvider API synchronization not working");
                    //    }

                    //}
                    //catch (Exception ex)
                    //{
                    //    LogMessage("Error in HardwareProvider sync : " + ex.Message.ToString());
                    //}
                    //finally
                    //{
                    //    Thread.Sleep(100);
                    //}
                    #endregion

                    #region 06 - Get Hardware Type Details 
                    //resultJson = string.Empty;
                    //response = null;
                    //try
                    //{
                    //    client = new HttpClient();
                    //    client.BaseAddress = new Uri(laneConfigurationFile.PlazaBaseAPI);
                    //    client.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenData.LoginToken);
                    //    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    //    response = client.GetAsync(laneConfigurationFile.PlazaBaseAPI + "HardwareTypeGet").Result;
                    //    if (response.IsSuccessStatusCode)
                    //    {
                    //        var JsonResponce = response.Content.ReadAsStringAsync().Result;
                    //        JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                    //        IntegrationResponseIL requestResponce = json_serializer.Deserialize<IntegrationResponseIL>(JsonResponce);
                    //        if (requestResponce.ResponseMessage.ToLower() == "success")
                    //        {
                    //            #region Data Sync
                    //            resultJson = Persistents.ParseJsonForResponseList(JsonResponce);
                    //            if (!string.IsNullOrEmpty(resultJson))
                    //            {
                    //                List<HardwareTypeIL> hardwareType = json_serializer.Deserialize<List<HardwareTypeIL>>(resultJson);
                    //                if (hardwareType.Count > 0)
                    //                    HardwareTypeBL.DataMerge(hardwareType);
                    //            }
                    //            #endregion
                    //        }
                    //    }
                    //    else
                    //    {
                    //        LogMessage("HardwareType API synchronization not working");
                    //    }

                    //}
                    //catch (Exception ex)
                    //{
                    //    LogMessage("Error in HardwareType sync : " + ex.Message.ToString());
                    //}
                    //finally
                    //{
                    //    Thread.Sleep(100);
                    //}
                    #endregion

                    #region 07 - Get Hardware Details 
                    //resultJson = string.Empty;
                    //response = null;
                    //try
                    //{
                    //    client = new HttpClient();
                    //    client.BaseAddress = new Uri(laneConfigurationFile.PlazaBaseAPI);
                    //    client.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenData.LoginToken);
                    //    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    //    response = client.GetAsync(laneConfigurationFile.PlazaBaseAPI + "HardwareGet?IpAddress=" + laneConfigurationFile.LaneIPAddress + "").Result;
                    //    if (response.IsSuccessStatusCode)
                    //    {
                    //        var JsonResponce = response.Content.ReadAsStringAsync().Result;
                    //        JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                    //        IntegrationResponseIL requestResponce = json_serializer.Deserialize<IntegrationResponseIL>(JsonResponce);
                    //        if (requestResponce.ResponseMessage.ToLower() == "success")
                    //        {
                    //            #region Data Sync
                    //            resultJson = Persistents.ParseJsonForResponseList(JsonResponce);
                    //            if (!string.IsNullOrEmpty(resultJson))
                    //            {
                    //                List<HardwareManagementIL> hardware = json_serializer.Deserialize<List<HardwareManagementIL>>(resultJson);
                    //                if (hardware.Count > 0)
                    //                    HardwareManagementBL.DataMerge(hardware);
                    //            }
                    //            #endregion
                    //        }
                    //    }
                    //    else
                    //    {
                    //        LogMessage("Hardware API synchronization not working");
                    //    }

                    //}
                    //catch (Exception ex)
                    //{
                    //    LogMessage("Error in Hardware sync : " + ex.Message.ToString());
                    //}
                    //finally
                    //{
                    //    Thread.Sleep(100);
                    //}
                    #endregion

                    #region 08 - Get System Integrator Details 
                    resultJson = string.Empty;
                    response = null;
                    try
                    {
                        client = new HttpClient();
                        client.BaseAddress = new Uri(laneConfiguration.PlazaBaseAPI);
                        //client.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenData.LoginToken);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.GetAsync(laneConfiguration.PlazaBaseAPI + "SystemIntegratorGetAll").Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationResponseIL requestResponce = json_serializer.Deserialize<IntegrationResponseIL>(JsonResponce);
                            if (requestResponce.ResponseMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                resultJson = SystemConstants.ParseJsonForResponseList(JsonResponce);
                                if (!string.IsNullOrEmpty(resultJson))
                                {
                                    List<SystemIntegratorIL> systemIntegrators = json_serializer.Deserialize<List<SystemIntegratorIL>>(resultJson);
                                    if (systemIntegrators.Count > 0)
                                    {
                                        //foreach (SystemIntegratorIL si in systemIntegrators.Where(w => w.SystemIntegratorId != serverConfig.SystemIntegratorId))
                                        //{
                                        //    si.DataStatus = 0;
                                        //}
                                        //SystemIntegratorBL.DataMerge(systemIntegrators);
                                    }
                                }
                                #endregion
                            }
                        }
                        else
                        {
                            LogMessage("SystemIntegrator API synchronization not working");
                        }
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in SystemIntegrator sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion

                    #region 09 - Get Plaza Details 
                    resultJson = string.Empty;
                    response = null;
                    try
                    {
                        client = new HttpClient();
                        client.BaseAddress = new Uri(laneConfiguration.PlazaBaseAPI);
                        //client.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenData.LoginToken);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.GetAsync(laneConfiguration.PlazaBaseAPI + "PlazaGetAll").Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationResponseIL requestResponce = json_serializer.Deserialize<IntegrationResponseIL>(JsonResponce);
                            if (requestResponce.ResponseMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                resultJson = SystemConstants.ParseJsonForResponseList(JsonResponce);
                                if (!string.IsNullOrEmpty(resultJson))
                                {
                                    List<PlazaConfigurationIL> plazaList = json_serializer.Deserialize<List<PlazaConfigurationIL>>(resultJson);
                                    if (plazaList.Count > 0)
                                    {
                                        //foreach (PlazaConfigurationIL plaza in plazaList.Where(w => w.PlazaId != serverConfig.PlazaId))
                                        //{
                                        //    plaza.DataStatus = 0;
                                        //}
                                        //PlazaConfigurationBL.DataMerge(plazaList);
                                    }
                                }
                                #endregion
                            }
                        }
                        else
                        {
                            LogMessage("Plaza API synchronization not working");
                        }
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in Plaza sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion

                    #region 10 - Get Journey Details 
                    //resultJson = string.Empty;
                    //response = null;
                    //try
                    //{
                    //    client = new HttpClient();
                    //    client.BaseAddress = new Uri(laneConfigurationFile.PlazaBaseAPI);
                    //    client.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenData.LoginToken);
                    //    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    //    response = client.GetAsync(laneConfigurationFile.PlazaBaseAPI + "JourneyGet").Result;
                    //    if (response.IsSuccessStatusCode)
                    //    {
                    //        var JsonResponce = response.Content.ReadAsStringAsync().Result;
                    //        JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                    //        IntegrationResponseIL requestResponce = json_serializer.Deserialize<IntegrationResponseIL>(JsonResponce);
                    //        if (requestResponce.ResponseMessage.ToLower() == "success")
                    //        {
                    //            #region Data Sync
                    //            resultJson = Persistents.ParseJsonForResponseList(JsonResponce);
                    //            if (!string.IsNullOrEmpty(resultJson))
                    //            {
                    //                List<JourneyIL> journeyList = json_serializer.Deserialize<List<JourneyIL>>(resultJson);
                    //                if (journeyList.Count > 0)
                    //                    JourneyBL.DataMerge(journeyList);
                    //            }
                    //            #endregion
                    //        }
                    //    }
                    //    else
                    //    {
                    //        LogMessage("Journey API synchronization not working");
                    //    }

                    //}
                    //catch (Exception ex)
                    //{
                    //    LogMessage("Error in Journey sync : " + ex.Message.ToString());
                    //}
                    //finally
                    //{
                    //    Thread.Sleep(100);
                    //}
                    #endregion

                    #region 11 - Get Lane Type 
                    //resultJson = string.Empty;
                    //response = null;
                    //try
                    //{
                    //    client = new HttpClient();
                    //    client.BaseAddress = new Uri(laneConfigurationFile.PlazaBaseAPI);
                    //    client.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenData.LoginToken);
                    //    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    //    response = client.GetAsync(laneConfigurationFile.PlazaBaseAPI + "LaneTypeGet").Result;
                    //    if (response.IsSuccessStatusCode)
                    //    {
                    //        var JsonResponce = response.Content.ReadAsStringAsync().Result;
                    //        JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                    //        IntegrationResponseIL requestResponce = json_serializer.Deserialize<IntegrationResponseIL>(JsonResponce);
                    //        if (requestResponce.ResponseMessage.ToLower() == "success")
                    //        {
                    //            #region Data Sync
                    //            resultJson = Persistents.ParseJsonForResponseList(JsonResponce);
                    //            if (!string.IsNullOrEmpty(resultJson))
                    //            {
                    //                List<LaneTypeIL> laneTypeList = json_serializer.Deserialize<List<LaneTypeIL>>(resultJson);
                    //                if (laneTypeList.Count > 0)
                    //                    LaneTypeBL.DataMerge(laneTypeList);
                    //            }
                    //            #endregion
                    //        }
                    //    }
                    //    else
                    //    {
                    //        LogMessage("Lane API synchronization not working");
                    //    }

                    //}
                    //catch (Exception ex)
                    //{
                    //    LogMessage("Error in Lane sync : " + ex.Message.ToString());
                    //}
                    //finally
                    //{
                    //    Thread.Sleep(100);
                    //}
                    #endregion

                    #region 12 - Get Lane Used 
                    //resultJson = string.Empty;
                    //response = null;
                    //try
                    //{
                    //    client = new HttpClient();
                    //    client.BaseAddress = new Uri(laneConfigurationFile.PlazaBaseAPI);
                    //    client.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenData.LoginToken);
                    //    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    //    response = client.GetAsync(laneConfigurationFile.PlazaBaseAPI + "LaneUsedForGet").Result;
                    //    if (response.IsSuccessStatusCode)
                    //    {
                    //        var JsonResponce = response.Content.ReadAsStringAsync().Result;
                    //        JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                    //        IntegrationResponseIL requestResponce = json_serializer.Deserialize<IntegrationResponseIL>(JsonResponce);
                    //        if (requestResponce.ResponseMessage.ToLower() == "success")
                    //        {
                    //            #region Data Sync
                    //            resultJson = Persistents.ParseJsonForResponseList(JsonResponce);
                    //            if (!string.IsNullOrEmpty(resultJson))
                    //            {
                    //                List<LaneUsedIL> laneUsedList = json_serializer.Deserialize<List<LaneUsedIL>>(resultJson);
                    //                if (laneUsedList.Count > 0)
                    //                    LaneUsedBL.DataMerge(laneUsedList);
                    //            }
                    //            #endregion
                    //        }
                    //    }
                    //    else
                    //    {
                    //        LogMessage("Lane API synchronization not working");
                    //    }

                    //}
                    //catch (Exception ex)
                    //{
                    //    LogMessage("Error in Lane sync : " + ex.Message.ToString());
                    //}
                    //finally
                    //{
                    //    Thread.Sleep(100);
                    //}
                    #endregion

                    #region 13 - Get Lane Details 
                    //resultJson = string.Empty;
                    //response = null;
                    //try
                    //{
                    //    client = new HttpClient();
                    //    client.BaseAddress = new Uri(laneConfigurationFile.PlazaBaseAPI);
                    //    client.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenData.LoginToken);
                    //    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    //    response = client.GetAsync(laneConfigurationFile.PlazaBaseAPI + "LaneGet?IpAddress=" + laneConfigurationFile.LaneIPAddress + "").Result;
                    //    if (response.IsSuccessStatusCode)
                    //    {
                    //        var JsonResponce = response.Content.ReadAsStringAsync().Result;
                    //        JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                    //        IntegrationResponseIL requestResponce = json_serializer.Deserialize<IntegrationResponseIL>(JsonResponce);
                    //        if (requestResponce.ResponseMessage.ToLower() == "success")
                    //        {
                    //            #region Data Sync
                    //            resultJson = Persistents.ParseJsonResponseObject(JsonResponce);
                    //            if (!string.IsNullOrEmpty(resultJson))
                    //            {
                    //                LaneManagementIL lane = json_serializer.Deserialize<LaneManagementIL>(resultJson);
                    //                if (lane.LaneNumber > 0)
                    //                {
                    //                    List<LaneManagementIL> lanes = new List<LaneManagementIL>();
                    //                    lanes.Add(lane);
                    //                    LaneManagementBL.DataMerge(lanes);
                    //                }
                    //            }
                    //            #endregion
                    //        }
                    //    }
                    //    else
                    //    {
                    //        LogMessage("Lane API synchronization not working");
                    //    }

                    //}
                    //catch (Exception ex)
                    //{
                    //    LogMessage("Error in Lane sync : " + ex.Message.ToString());
                    //}
                    //finally
                    //{
                    //    Thread.Sleep(100);
                    //}
                    #endregion

                    #region 14 - Get Transection Type Details 
                    try
                    {
                        client = new HttpClient();
                        client.BaseAddress = new Uri(laneConfiguration.PlazaBaseAPI);
                        //client.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenData.LoginToken);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.GetAsync(laneConfiguration.PlazaBaseAPI + "TransactionTypeGetAll").Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationResponseIL requestResponce = json_serializer.Deserialize<IntegrationResponseIL>(JsonResponce);
                            if (requestResponce.ResponseMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                resultJson = SystemConstants.ParseJsonForResponseList(JsonResponce);
                                if (!string.IsNullOrEmpty(resultJson))
                                {
                                    List<TransactionTypeIL> transactionTypes = json_serializer.Deserialize<List<TransactionTypeIL>>(resultJson);
                                   // if (transactionTypes.Count > 0)
                                        //TransactionTypeBL.DataMerge(transactionTypes);
                                }
                                #endregion
                            }
                        }
                        else
                        {
                            LogMessage("TransectionType API synchronization not working");
                        }
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in TransectionType sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion

                    #region 15 - Get Payment Type Details 
                    resultJson = string.Empty;
                    response = null;
                    try
                    {
                        client = new HttpClient();
                        client.BaseAddress = new Uri(laneConfiguration.PlazaBaseAPI);
                        //client.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenData.LoginToken);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.GetAsync(laneConfiguration.PlazaBaseAPI + "PaymentMethodTypeGetAll").Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationResponseIL requestResponce = json_serializer.Deserialize<IntegrationResponseIL>(JsonResponce);
                            if (requestResponce.ResponseMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                resultJson = SystemConstants.ParseJsonForResponseList(JsonResponce);
                                if (!string.IsNullOrEmpty(resultJson))
                                {
                                    List<PaymentMethodTypeIL> paymentType = json_serializer.Deserialize<List<PaymentMethodTypeIL>>(resultJson);
                                    //if (paymentType.Count > 0)
                                        //PaymentTypeBL.DataMerge(paymentType);
                                }
                                #endregion
                            }
                        }
                        else
                        {
                            LogMessage("PaymentType API synchronization not working");
                        }
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in PaymentType sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion

                    #region 16 - Get Exempt Type Details 
                    resultJson = string.Empty;
                    response = null;
                    try
                    {
                        client = new HttpClient();
                        client.BaseAddress = new Uri(laneConfiguration.PlazaBaseAPI);
                        //client.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenData.LoginToken);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.GetAsync(laneConfiguration.PlazaBaseAPI + "ExemptTypeGetAll").Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationResponseIL requestResponce = json_serializer.Deserialize<IntegrationResponseIL>(JsonResponce);
                            if (requestResponce.ResponseMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                resultJson = SystemConstants.ParseJsonForResponseList(JsonResponce);
                                if (!string.IsNullOrEmpty(resultJson))
                                {
                                    List<ExemptTypeIL> exemptTypes = json_serializer.Deserialize<List<ExemptTypeIL>>(resultJson);
                                    //if (exemptTypes.Count > 0)
                                    //    ExemptTypeBL.DataMerge(exemptTypes);
                                }
                                #endregion
                            }
                        }
                        else
                        {
                            LogMessage("ExemptType API synchronization not working");
                        }
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in ExemptType sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion

                    #region 17 - Get MOP Mapping Details 
                    ////resultJson = string.Empty;
                    ////response = null;
                    ////try
                    ////{
                    ////    client = new HttpClient();
                    ////    client.BaseAddress = new Uri(laneConfigurationFile.PlazaBaseAPI);
                    ////    client.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenData.LoginToken);
                    ////    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    ////    response = client.GetAsync(laneConfigurationFile.PlazaBaseAPI + "MOPMappingGet").Result;
                    ////    if (response.IsSuccessStatusCode)
                    ////    {
                    ////        var JsonResponce = response.Content.ReadAsStringAsync().Result;
                    ////        JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                    ////        IntegrationResponseIL requestResponce = json_serializer.Deserialize<IntegrationResponseIL>(JsonResponce);
                    ////        if (requestResponce.ResponseMessage.ToLower() == "success")
                    ////        {
                    ////            #region Data Sync
                    ////            resultJson = Persistents.ParseJsonForResponseList(JsonResponce);
                    ////            if (!string.IsNullOrEmpty(resultJson))
                    ////            {
                    ////                List<MOPMappingIL> mopList = json_serializer.Deserialize<List<MOPMappingIL>>(resultJson);
                    ////                if (mopList.Count > 0)
                    ////                    MOPMappingBL.DataMerge(mopList);
                    ////            }
                    ////            #endregion
                    ////        }
                    ////    }
                    ////    else
                    ////    {
                    ////        LogMessage("MOPMappingGet API synchronization not working");
                    ////    }
                    ////}
                    ////catch (Exception ex)
                    ////{
                    ////    LogMessage("Error in MOPMappingGet sync : " + ex.Message.ToString());
                    ////}
                    ////finally
                    ////{
                    ////    Thread.Sleep(100);
                    ////}
                    #endregion

                    #region 18 - Get Shift Details 
                    resultJson = string.Empty;
                    response = null;
                    try
                    {
                        client = new HttpClient();
                        client.BaseAddress = new Uri(laneConfiguration.PlazaBaseAPI);
                        //client.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenData.LoginToken);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.GetAsync(laneConfiguration.PlazaBaseAPI + "ShiftDetailsGet").Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationResponseIL requestResponce = json_serializer.Deserialize<IntegrationResponseIL>(JsonResponce);
                            if (requestResponce.ResponseMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                resultJson = SystemConstants.ParseJsonForResponseList(JsonResponce);
                                if (!string.IsNullOrEmpty(resultJson))
                                {
                                    List<ShiftTiminingIL> shiftMaster = json_serializer.Deserialize<List<ShiftTiminingIL>>(resultJson);
                                    //if (shiftMaster.Count > 0)
                                    //    ShiftManagementBL.DataMerge(shiftMaster);
                                }
                                #endregion
                            }
                        }
                        else
                        {
                            LogMessage("Shift API synchronization not working");
                        }
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in Shift sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion

                    #region 19 - Get User Details 
                    resultJson = string.Empty;
                    response = null;
                    try
                    {
                        client = new HttpClient();
                        client.BaseAddress = new Uri(laneConfiguration.PlazaBaseAPI);
                        //client.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenData.LoginToken);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.GetAsync(laneConfiguration.PlazaBaseAPI + "UserConfigurationGetAll").Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationResponseIL requestResponce = json_serializer.Deserialize<IntegrationResponseIL>(JsonResponce);
                            if (requestResponce.ResponseMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                resultJson = SystemConstants.ParseJsonForResponseList(JsonResponce);
                                if (!string.IsNullOrEmpty(resultJson))
                                {
                                    List<SystemUserIL> userList = json_serializer.Deserialize<List<SystemUserIL>>(resultJson);
                                    //if (userList.Count > 0)
                                        //UserManagementBL.DataMerge(userList);
                                }
                                #endregion
                            }
                        }
                        else
                        {
                            LogMessage("User API synchronization not working");
                        }
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in User sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion

                    #region 20 - Get Fare Details 
                    #region 20.1 Current Date
                    //resultJson = string.Empty;
                    //response = null;
                    //fares = null;
                    //try
                    //{
                    //    FareDetailsIL fare = new FareDetailsIL();
                    //    fare.EffectiveDate = DateTime.Now;
                    //    resultJson = new JavaScriptSerializer().Serialize(fare);
                    //    client = new HttpClient();
                    //    client.BaseAddress = new Uri(laneConfigurationFile.PlazaBaseAPI);
                    //    client.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenData.LoginToken);
                    //    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    //    response = client.PostAsync(laneConfigurationFile.PlazaBaseAPI + "TollFareDetailsGet", new StringContent(resultJson, Encoding.UTF8, "application/json")).Result;
                    //    if (response.IsSuccessStatusCode)
                    //    {
                    //        var JsonResponce = response.Content.ReadAsStringAsync().Result;
                    //        JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                    //        IntegrationResponseIL requestResponce = json_serializer.Deserialize<IntegrationResponseIL>(JsonResponce);
                    //        if (requestResponce.ResponseMessage.ToLower() == "success")
                    //        {
                    //            #region Data Sync
                    //            fares = json_serializer.Deserialize<FareManagementIL>(Persistents.ParseJsonResponseObject(JsonResponce));
                    //            FareManagementBL.InsertUpdate(fares);
                    //            #endregion
                    //        }
                    //    }
                    //    else
                    //    {
                    //        LogMessage("Current TollFareDetailsGet API synchronization not working");
                    //    }
                    //}
                    //catch (Exception ex)
                    //{
                    //    LogMessage("Error in Current TollFareDetailsGet  sync : " + ex.Message.ToString());
                    //}
                    //finally
                    //{
                    //    Thread.Sleep(100);
                    //}
                    #endregion

                    #region 20.2 Future Date
                    ////resultJson = string.Empty;
                    ////response = null;
                    ////try
                    ////{
                    ////    FareDetailsIL fare = new FareDetailsIL();
                    ////    fare.EffectiveDate = DateTime.Now.AddDays(1);
                    ////    resultJson = new JavaScriptSerializer().Serialize(fare);
                    ////    client = new HttpClient();
                    ////    client.BaseAddress = new Uri(laneConfigurationFile.PlazaBaseAPI);
                    ////    client.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenData.LoginToken);
                    ////    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    ////    response = client.PostAsync(laneConfigurationFile.PlazaBaseAPI + "TollFareDetailsGet", new StringContent(resultJson, Encoding.UTF8, "application/json")).Result;
                    ////    if (response.IsSuccessStatusCode)
                    ////    {
                    ////        var JsonResponce = response.Content.ReadAsStringAsync().Result;
                    ////        JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                    ////        IntegrationResponseIL requestResponce = json_serializer.Deserialize<IntegrationResponseIL>(JsonResponce);
                    ////        if (requestResponce.ResponseMessage.ToLower() == "success")
                    ////        {
                    ////            #region Data Sync
                    ////            FareManagementIL Nextfares = json_serializer.Deserialize<FareManagementIL>(Persistents.ParseJsonResponseObject(JsonResponce));
                    ////            if (fares.EffectiveDate != Nextfares.EffectiveDate)
                    ////                FareManagementBL.InsertUpdate(Nextfares);
                    ////            #endregion
                    ////        }
                    ////    }
                    ////    else
                    ////    {
                    ////        LogMessage("Next TollFareDetailsGet API synchronization not working");
                    ////    }
                    ////}
                    ////catch (Exception ex)
                    ////{
                    ////    LogMessage("Error in Next TollFareDetailsGet  sync : " + ex.Message.ToString());
                    ////}
                    ////finally
                    ////{
                    ////    Thread.Sleep(100);
                    ////}
                    #endregion
                    #endregion

                    #region 21 Hardware Mapping 
                    ////try
                    ////{
                    ////    // HardwareManagementBL.Mapping();
                    ////}
                    ////catch (Exception ex)
                    ////{
                    ////    LogMessage("Error in Current Hardware Mapping  sync : " + ex.Message.ToString());
                    ////}
                    ////finally
                    ////{
                    ////    Thread.Sleep(100);
                    ////}
                    ////#endregion

                    ////#region 22 Class Mapping 
                    ////try
                    ////{
                    ////    VehicleClassBL.Mapping();
                    ////}
                    ////catch (Exception ex)
                    ////{
                    ////    LogMessage("Error in Current Class Mapping  sync : " + ex.Message.ToString());
                    ////}
                    ////finally
                    ////{
                    ////    Thread.Sleep(100);
                    ////}
                    #endregion
                     }
                }
                //}
                //else
                //{
                //    if (tokenGenerated)
                //        GenerateToken();
                //}
                Thread.Sleep(100);
            }
        }
        //private void LaneDataSyncFunction()
        //{
        //    DateTime TheadStartTime = DateTime.MinValue;
        //    string resultJson = string.Empty;
        //    HttpResponseMessage response = null;
        //    List<LaneTransactionIL> laneDataList = null;
        //    String Inputjson = string.Empty;
        //    HttpClient laneClient = null;
        //    while (!stopLaneDataSyncThread)
        //    {
        //        TimeSpan ts = DateTime.Now - TheadStartTime;
        //        if (tokenData != null)
        //        {
        //            if (!string.IsNullOrEmpty(tokenData.LoginToken))
        //            {
        //                TimeSpan ts1 = Convert.ToDateTime(tokenData.AccountExpiredDate) - DateTime.Now;
        //                if (ts1.TotalMinutes < 10)
        //                    GenerateToken();
        //                else
        //                {
        //                    laneDataList = LaneTransactionBL.GetLanePendingData();
        //                    foreach (LaneTransactionIL LaneData in laneDataList)
        //                    {
        //                        try
        //                        {

        //                            if (!string.IsNullOrEmpty(laneConfigurationFile.MediaImagePath))
        //                            {
        //                                LaneData.TransactionImage = laneConfigurationFile.MediaImagePath;
        //                                LaneData.TransactionImage = LaneData.TransactionImage.Replace("{ShiftNumner}", LaneData.ShiftNumber.ToString());
        //                                LaneData.TransactionImage = LaneData.TransactionImage.Replace("{LaneTransId}", LaneData.LaneTransId.ToString());
        //                                LaneData.TransactionImage = LaneData.TransactionImage.Replace("{ext}", "jpg");
        //                                LaneData.TransactionImage = laneConfigurationFile.MediaHttpPath + LaneData.TransactionImage;
        //                            }

        //                            if (!string.IsNullOrEmpty(laneConfigurationFile.MediaVideoPath))
        //                            {
        //                                LaneData.TransactionVideo = laneConfigurationFile.MediaVideoPath;
        //                                LaneData.TransactionVideo = LaneData.TransactionVideo.Replace("{ShiftNumner}", LaneData.ShiftNumber.ToString());
        //                                LaneData.TransactionVideo = LaneData.TransactionVideo.Replace("{LaneTransId}", LaneData.LaneTransId.ToString());
        //                                LaneData.TransactionVideo = LaneData.TransactionVideo.Replace("{ext}", "mp4");
        //                                LaneData.TransactionVideo = laneConfigurationFile.MediaHttpPath + LaneData.TransactionVideo;
        //                            }

        //                            if (!string.IsNullOrEmpty(laneConfigurationFile.MediaAvcPath))
        //                            {
        //                                LaneData.TransactionAVCImage = laneConfigurationFile.MediaAvcPath;
        //                                LaneData.TransactionAVCImage = LaneData.TransactionAVCImage.Replace("{ShiftNumner}", LaneData.ShiftNumber.ToString());
        //                                LaneData.TransactionAVCImage = LaneData.TransactionAVCImage.Replace("{LaneTransId}", LaneData.LaneTransId.ToString());
        //                                LaneData.TransactionAVCImage = LaneData.TransactionAVCImage.Replace("{ext}", "jpg");
        //                                LaneData.TransactionAVCImage = laneConfigurationFile.MediaHttpPath + LaneData.TransactionAVCImage;
        //                            }

        //                            if (!string.IsNullOrEmpty(laneConfigurationFile.MediaCCHImagePath))
        //                            {
        //                                LaneData.TransactionFullImage = laneConfigurationFile.MediaCCHImagePath;
        //                                LaneData.TransactionFullImage = LaneData.TransactionFullImage.Replace("{ShiftNumner}", LaneData.ShiftNumber.ToString());
        //                                LaneData.TransactionFullImage = LaneData.TransactionFullImage.Replace("{LaneTransId}", LaneData.LaneTransId.ToString());
        //                                LaneData.TransactionFullImage = LaneData.TransactionFullImage.Replace("{ext}", "jpg");
        //                                LaneData.TransactionFullImage = laneConfigurationFile.MediaHttpPath + LaneData.TransactionFullImage;
        //                            }

        //                            var serializer = new JavaScriptSerializer() { MaxJsonLength = 86753090 };
        //                            Inputjson = serializer.Serialize(LaneData);
        //                            LogMessage("Lane Data" + Inputjson);
        //                            laneClient = new HttpClient();
        //                            laneClient.BaseAddress = new Uri(laneConfigurationFile.PlazaBaseAPI);
        //                            laneClient.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenData.LoginToken);
        //                            laneClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
        //                            response = laneClient.PostAsync(laneConfigurationFile.PlazaBaseAPI + "LaneTranscation", new StringContent(Inputjson, Encoding.UTF8, "application/json")).Result;
        //                            if (response.IsSuccessStatusCode)
        //                            {
        //                                try
        //                                {
        //                                    var JsonResponce = response.Content.ReadAsStringAsync().Result;
        //                                    JavaScriptSerializer json_serializer = new JavaScriptSerializer();
        //                                    LaneDataSyncResponse requestResponce = json_serializer.Deserialize<LaneDataSyncResponse>(JsonResponce);
        //                                    if (requestResponce.ServerTransId > 0)
        //                                    {
        //                                        //LaneData.LaneType = 2;
        //                                        LaneData.LaneType = 1;
        //                                        LaneTransactionBL.MarkedTransfer(LaneData, 0);
        //                                    }
        //                                    else
        //                                    {
        //                                        LogMessage("Faild to send Data Pakcet : " + JsonResponce);
        //                                    }
        //                                }
        //                                catch (Exception ex)
        //                                {
        //                                    LogMessage("Error to send LaneDataSyncFunction sync : " + ex.Message.ToString());
        //                                    LogMessage("Lane Data Pakcet : " + Inputjson);
        //                                }
        //                            }
        //                            else
        //                            {
        //                                LogMessage("Unable to send Lane Data Pakcet : " + response.StatusCode);
        //                            }
        //                        }
        //                        catch (Exception ex)
        //                        {
        //                            LogMessage("Error in LaneDataSyncFunction : " + ex.Message.ToString());
        //                            LogMessage("Lane Data Pakcet : " + Inputjson);
        //                        }
        //                    }
        //                }
        //            }
        //            else
        //            {
        //                GenerateToken();
        //            }
        //        }
        //        Thread.Sleep(100);
        //    }
        //}


        //private void LaneMediaQueue_PeekCompleted(object sender, PeekCompletedEventArgs e)
        //{
        //    MessageQueue laneMediaData = (MessageQueue)sender;
        //    Message laneMediaMsg = (Message)laneMediaData.EndPeek(e.AsyncResult);
        //    JavaScriptSerializer json_serializer = new JavaScriptSerializer() { MaxJsonLength = 86753090 };
        //    Lane_txns item = null;
        //    LaneTransactionIL laneData;
        //    MOPMappingIL moptype = null;
        //    try
        //    {
        //        laneMediaMsg.Formatter = new BinaryMessageFormatter();
        //        if (laneMediaMsg != null)
        //        {
        //            if (laneMediaMsg.Body != null)
        //            {
        //                var Inputjson1 = laneMediaMsg.Body.ToString();
        //                #region Process 1
        //                try
        //                {
        //                    laneData = json_serializer.Deserialize<LaneTransactionIL>(Inputjson1);
        //                    if (Directory.Exists(laneData.TransactionImage))
        //                    {
        //                        File.Delete(laneData.TransactionImage);
        //                    }
        //                    else
        //                    {
        //                        LogMessage("Directory not found " + laneData.TransactionImage.ToString());
        //                    }
        //                }
        //                catch (Exception ex)
        //                {

        //                    LogMessage("Error in delete : " + ex.Message.ToString());
        //                }
        //                #endregion

        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        LogMessage("Other Plaza Entry Lane queue Message error." + ex.Message.ToString() + " " + ex.Source.ToString() + " " + ex.StackTrace.ToString());
        //    }
        //    finally
        //    {
        //        laneMediaData.Receive();
        //        LaneMediaQueue.BeginPeek();
        //    }
        //}
        #endregion

        #region Use HelpMethod
        private void GenerateToken()
        {
            #region Generate Token
            //try
            //{
            //    client = new HttpClient();
            //    client.BaseAddress = new Uri(laneConfiguration.PlazaBaseAPI);
            //    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            //    UserManagementIL user = new UserManagementIL();
            //    user.LoginId = "serviceUser";
            //    user.LoginPassword = SystemConstants.Decrypt(laneConfiguration.ApiPassword);
            //    string Inputjson = new JavaScriptSerializer().Serialize(user);
            //    client = new HttpClient();
            //    client.BaseAddress = new Uri(laneConfiguration.PlazaBaseAPI);
            //    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            //    HttpResponseMessage response = client.PostAsync(laneConfiguration.PlazaBaseAPI + "GenerateToken", new StringContent(Inputjson, Encoding.UTF8, "application/json")).Result;
            //    if (response.IsSuccessStatusCode)
            //    {
            //        var JsonResponce = response.Content.ReadAsStringAsync().Result;
            //        JavaScriptSerializer json_serializer = new JavaScriptSerializer();
            //        IntegrationResponseIL requestResponce = json_serializer.Deserialize<IntegrationResponseIL>(JsonResponce);
            //        if (requestResponce.ResponseMessage.ToLower() == "success")
            //        {
            //            string resultJson = SystemConstants.ParseJsonResponseObject(JsonResponce);
            //            tokenData = json_serializer.Deserialize<UserManagementIL>(resultJson);
            //        }
            //        else
            //        {
            //            LogMessage("Plaza API synchronization not working");
            //        }
            //    }
            //    else
            //    {
            //        LogMessage("Plaza API GenerateToken not working");
            //    }

            //}
            //catch (Exception ex)
            //{
            //    LogMessage("Error in Plaza sync GenerateToken : " + ex.Message.ToString());
            //}
            //finally
            //{
            //    tokenGenerated = true;
            //}
            #endregion

            #region Get Server Config
            //if (!string.IsNullOrEmpty(tokenData.LoginToken))
            //{
                client = new HttpClient();
                client.BaseAddress = new Uri(laneConfiguration.PlazaBaseAPI);
                //client.DefaultRequestHeaders.Add("Authorization", "Bearer " + tokenData.LoginToken);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                HttpResponseMessage response = client.GetAsync(laneConfiguration.PlazaBaseAPI + "ServerConfigGet").Result;
                if (response.IsSuccessStatusCode)
                {
                    var JsonResponce = response.Content.ReadAsStringAsync().Result;
                    JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                    IntegrationResponseIL requestResponce = json_serializer.Deserialize<IntegrationResponseIL>(JsonResponce);
                    if (requestResponce.ResponseMessage.ToLower() == "success")
                    {
                        string resultJson = SystemConstants.ParseJsonResponseObject(JsonResponce);
                        serverConfig = json_serializer.Deserialize<ServerConfig>(resultJson);
                    }
                }
                else
                {
                    LogMessage("ServerConfigGet API synchronization not working");
                }
            //}
            #endregion
        }

        #region Log Methods
        private void LogMessage(String message)
        {
            logQueue.Enqueue(Environment.NewLine + "A.T. " + DateTime.Now.ToString("hh:mm:ss.FFFF tt") + ": " + message);
        }
        private void LoggerThreadFunction()
        {
            stopLoggerThread = false;

            while (!stopLoggerThread)
            {
                try
                {
                    WriteMessageFromQueue();
                }
                catch (Exception ex)
                {

                }
                finally
                {
                    Thread.Sleep(50);
                }
            }
        }
        private void WriteMessageFromQueue()
        {
            if (logQueue.Count > 0)
            {
                String message = (String)logQueue.Dequeue();

                LogMaster.Write(message, ErrorLogModule.LaneDataTranService);
            }
        }
        #endregion

        #endregion
    }
}
