using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Messaging;
using System.Net.Http;
using System.Net.Http.Headers;
using System.ServiceProcess;
using System.Text;
using System.Threading;
using System.Web.Script.Serialization;
using Softomation.DMS.Libraries.CommonLibrary;
using Softomation.DMS.Libraries.CommonLibrary.BusinessLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;
using Softomation.DMS.Libraries.CommonLibrary.Json;
using Softomation.DMS.Libraries.CommonLibrary.MSMQ;
using Softomation.DMS.Libraries.CommonLibrary.XMLConfigurationClasses;

namespace PlazaDataSynchronization
{
    public partial class DataSynchronizationService : ServiceBase
    {
        #region Globel Variable
        volatile int onstartCheckCount = 0;
        private Queue logQueue = new Queue();
        private Thread loggerThread;
        private Thread CSDataCollectionsThread;
        private Thread ServerStatusThread;
        private Thread EntryLaneSyncThread;
        private Thread ExitLaneSyncThread;
        private Thread ReviewLaneSyncThread;
        private Thread PendingLaneSyncThread;
        private volatile Boolean stopEntryLaneSync = false;
        private volatile Boolean stopExitLaneSync = false;
        private volatile Boolean stopReviewLaneSync = false;
        private volatile Boolean stopPendingLaneSync = false;

        private volatile Boolean stopLoggerThread = false;
        private volatile Boolean StopDataCollectionsThread = false;
        private volatile Boolean StopServerStatusThread = false;
        private volatile Boolean CheckServerPort = false;
        GeneralConfiguration generalConfigFile;
        PlazaConfiguration plazaConfigurationFile;
        PlazaManagementIL plazaConfiguration;
        ClientManagementIL clientConfiguration;
        string PlazaIP = string.Empty;
        string BaseURL = string.Empty;
        string Inputjson = string.Empty;
        string EntryInputjson = string.Empty;
        string ExitInputjson = string.Empty;
        string ReviewInputjson = string.Empty;
        HttpResponseMessage response = null;
        HttpResponseMessage Entryresponse = null;
        HttpResponseMessage Exitresponse = null;
        HttpResponseMessage Reviewresponse = null;
        HttpClient client = null;
        HttpClient Entryclient = null;
        HttpClient Exitclient = null;
        HttpClient Reviewclient = null;
        Int16 ApplicationType = 1;
        private MessageQueue PlazaEntryLaneDataQueue;
        private MessageQueue PlazaExitLaneDataQueue;
        private MessageQueue PlazaFailedQueue;

        #endregion

        #region Main Finction
        static void Main()
        {
            ServiceBase[] ServicesToRun;
            ServicesToRun = new ServiceBase[]
            {
                new DataSynchronizationService()
            };
            ServiceBase.Run(ServicesToRun);
        }
        public DataSynchronizationService()
        {
            InitializeComponent();

            //dont forget to comment this line
            //OnStart(new string[] { "PDSS" }); //<== only for debugging
        }
        #endregion

        #region Events
        protected override void OnStart(string[] args)
        {
            bool ServiceStatus = false;
            try
            {
                LogMessage("Starting PDSS logger thread...");
                loggerThread = new Thread(new ThreadStart(this.LoggerThreadFunction));
                loggerThread.IsBackground = true;
                loggerThread.Start();
                LogMessage("The PDSS logger has been started.");
                ServiceStatus = true;
            }
            catch (Exception)
            {
                //LogMessage("Error in starting PDSS logger thread function. PDSS cannot be started. " + ex.ToString());
            }

            #region Onstart multiple call check
            onstartCheckCount++;
            if (onstartCheckCount > 1)
            {
                LogMessage("Onstart called multiple time so stopping service.");
                this.Stop();
                return;
            }
            #endregion
            if (ServiceStatus)
            {
                try
                {
                    generalConfigFile = GeneralConfiguration.Deserialize();
                    plazaConfigurationFile = PlazaConfiguration.Deserialize();
                    LogMessage("Get General Config Files");
                    List<string> LocalIps = Constants.GetLocalIPAddressList();
                    List<string> filtered = LocalIps.FindAll(e => e == plazaConfigurationFile.LocalIP);
                    if (filtered.Count == 0)
                    {
                        ServiceStatus = false;
                        LogMessage("Unable to Local IP not matched, PDSS cannot be started. ");
                    }
                    else
                    {
                        PlazaIP = plazaConfigurationFile.LocalIP;
                        BaseURL = "http://" + plazaConfigurationFile.ServerIP + ":" + plazaConfigurationFile.ApiPort + "/" + plazaConfigurationFile.ApiPath + "/";
                        LogMessage("PlazaIP " + PlazaIP);
                        LogMessage("BaseURL " + BaseURL);
                        plazaConfiguration = PlazaManagementBL.GetByIP(PlazaIP);
                        clientConfiguration = ClientManagementBL.GetById(plazaConfiguration.ClientId);
                    }

                }
                catch (Exception ex)
                {
                    ServiceStatus = false;
                    LogMessage("Unable to get generalFileConfig, PDSS cannot be started. " + ex.ToString());
                }

                if (ServiceStatus)
                {

                    try
                    {
                        LogMessage("Starting ServerStatusThread logger thread...");
                        ServerStatusThread = new Thread(new ThreadStart(this.ServerStatusFunction));
                        ServerStatusThread.IsBackground = true;
                        ServerStatusThread.Start();
                        LogMessage("The ServerStatusThread logger has been started.");
                    }
                    catch (Exception ex)
                    {
                        LogMessage("error in starting ServerStatusThread function. PDSS cannot be started. " + ex.ToString());
                    }

                    try
                    {
                        LogMessage("Starting CSDataCollectionsThread logger thread...");
                        CSDataCollectionsThread = new Thread(new ThreadStart(this.CSDataCollectionsFunction));
                        CSDataCollectionsThread.IsBackground = true;
                        CSDataCollectionsThread.Start();
                        LogMessage("The CSDataCollectionsThread logger has been started.");
                    }
                    catch (Exception ex)
                    {
                        LogMessage("error in starting CSDataCollectionsThread function. PDSS cannot be started. " + ex.ToString());
                    }


                    try
                    {
                        LogMessage("Starting EntryLaneSyncThread logger thread...");
                        EntryLaneSyncThread = new Thread(new ThreadStart(this.EntryLaneSyncFunction));
                        EntryLaneSyncThread.IsBackground = true;
                        EntryLaneSyncThread.Start();
                        LogMessage("The EntryLaneSyncThread logger has been started.");
                    }
                    catch (Exception ex)
                    {
                        LogMessage("error in starting EntryLaneSyncThread function. PDSS cannot be started. " + ex.ToString());
                    }

                    try
                    {
                        LogMessage("Starting ExitLaneSyncThread logger thread...");
                        ExitLaneSyncThread = new Thread(new ThreadStart(this.ExitLaneSyncFunction));
                        ExitLaneSyncThread.IsBackground = true;
                        ExitLaneSyncThread.Start();
                        LogMessage("The ExitLaneSyncThread logger has been started.");
                    }
                    catch (Exception ex)
                    {
                        LogMessage("error in starting ExitLaneSyncThread function. PDSS cannot be started. " + ex.ToString());
                    }

                    try
                    {
                        LogMessage("Starting ReviewLaneSyncThread logger thread...");
                        ReviewLaneSyncThread = new Thread(new ThreadStart(this.ReviewLaneSyncFunction));
                        ReviewLaneSyncThread.IsBackground = true;
                        ReviewLaneSyncThread.Start();
                        LogMessage("The ReviewLaneSyncThread logger has been started.");
                    }
                    catch (Exception ex)
                    {
                        LogMessage("error in starting ReviewLaneSyncThread function. PDSS cannot be started. " + ex.ToString());
                    }


                    try
                    {
                        LogMessage("Starting PendingLaneSyncThread logger thread...");
                        PendingLaneSyncThread = new Thread(new ThreadStart(this.PendingLaneSyncFunction));
                        PendingLaneSyncThread.IsBackground = true;
                        PendingLaneSyncThread.Start();
                        LogMessage("The PendingLaneSyncThread logger has been started.");
                    }
                    catch (Exception ex)
                    {
                        LogMessage("error in starting PendingLaneSyncThread function. PDSS cannot be started. " + ex.ToString());
                    }

                    #region Entry Lane Data Queue
                    try
                    {
                        this.PlazaEntryLaneDataQueue = MSMQConfiguration.Create(MSMQConfiguration.PlazaEntryLaneDataQueueName.Replace("{ipaddress}", "."));
                        PlazaEntryLaneDataQueue.PeekCompleted += new PeekCompletedEventHandler(PlazaEntryLaneDataQueue_PeekCompleted);
                        PlazaEntryLaneDataQueue.BeginPeek();
                        LogMessage("Entry Lane Data queue listener has been attached.");
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Failed to Entry Lane Data queue listener. " + ex.Message);
                    }
                    #endregion

                    #region Exit Lane Data Queue
                    try
                    {
                        this.PlazaExitLaneDataQueue = MSMQConfiguration.Create(MSMQConfiguration.PlazaExitLaneDataQueueName.Replace("{ipaddress}", "."));
                        PlazaExitLaneDataQueue.PeekCompleted += new PeekCompletedEventHandler(PlazaExitLaneDataQueue_PeekCompleted);
                        PlazaExitLaneDataQueue.BeginPeek();
                        LogMessage("Exit Lane Data queue listener has been attached.");
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Failed to Exit Lane Data queue listener. " + ex.Message);
                    }
                    #endregion
                    try
                    {
                        this.PlazaFailedQueue = MSMQConfiguration.Create(MSMQConfiguration.PlazaFailedLaneDataQueueName.Replace("{ipaddress}", "."));
                    }
                    catch (Exception ex)
                    {

                        LogMessage("Failed to create FailedQueue. " + ex.Message);
                    }



                }
            }
        }

        protected override void OnStop()
        {

            try
            {
                PlazaEntryLaneDataQueue.PeekCompleted -= new PeekCompletedEventHandler(PlazaEntryLaneDataQueue_PeekCompleted);
                PlazaExitLaneDataQueue.PeekCompleted -= new PeekCompletedEventHandler(PlazaExitLaneDataQueue_PeekCompleted);
            }
            catch (Exception ex)
            {

                LogMessage("error to stop MSQM : " + ex.Message.ToString());
            }

            try
            {
                stopEntryLaneSync = true;
                Thread.Sleep(500);
                if (EntryLaneSyncThread != null)
                {
                    if (EntryLaneSyncThread.IsAlive == true)
                    {
                        EntryLaneSyncThread.Abort();
                    }
                }
            }
            catch (Exception ex)
            {
                LogMessage("error in storping EntryLaneSyncThread function. " + ex.ToString());
            }
            try
            {
                stopExitLaneSync = true;
                Thread.Sleep(500);
                if (ExitLaneSyncThread != null)
                {
                    if (ExitLaneSyncThread.IsAlive == true)
                    {
                        ExitLaneSyncThread.Abort();
                    }
                }
            }
            catch (Exception ex)
            {
                LogMessage("error in storping ExitLaneSyncThread function. " + ex.ToString());
            }
            try
            {
                stopReviewLaneSync = true;
                Thread.Sleep(500);
                if (ReviewLaneSyncThread != null)
                {
                    if (ReviewLaneSyncThread.IsAlive == true)
                    {
                        ReviewLaneSyncThread.Abort();
                    }
                }
            }
            catch (Exception ex)
            {
                LogMessage("error in storping ReviewLaneSyncThread function. " + ex.ToString());
            }
            try
            {
                StopServerStatusThread = true;
                Thread.Sleep(500);
                if (ServerStatusThread != null)
                {
                    if (ServerStatusThread.IsAlive == true)
                    {
                        ServerStatusThread.Abort();
                    }
                }
            }
            catch (Exception ex)
            {
                LogMessage("error in storping ServerStatusThread function. " + ex.ToString());
            }
            try
            {
                StopDataCollectionsThread = true;
                Thread.Sleep(500);
                if (CSDataCollectionsThread != null)
                {
                    if (CSDataCollectionsThread.IsAlive == true)
                    {
                        CSDataCollectionsThread.Abort();
                    }
                }
            }
            catch (Exception ex)
            {

                LogMessage("error in storping CSDataCollectionsThread function. " + ex.ToString());
            }

            try
            {
                stopPendingLaneSync = true;
                Thread.Sleep(500);
                if (PendingLaneSyncThread != null)
                {
                    if (PendingLaneSyncThread.IsAlive == true)
                    {
                        PendingLaneSyncThread.Abort();
                    }
                }
            }
            catch (Exception ex)
            {

                LogMessage("error in storping PendingLaneSyncThread function. " + ex.ToString());
            }

            try
            {
                stopLoggerThread = true;
                Thread.Sleep(100);
                if (loggerThread != null)
                {
                    if (loggerThread.IsAlive == true)
                    {
                        loggerThread.Abort();
                    }
                }
            }
            catch (Exception)
            {


            }
        }
        #endregion

        #region Thread & Events
        private void CSDataCollectionsFunction()
        {
            while (!StopDataCollectionsThread)
            {
                if (CheckServerPort)
                {
                    #region 01 Get Plaza Details
                    try
                    {
                        client = new HttpClient();
                        client.BaseAddress = new Uri(BaseURL);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.GetAsync(BaseURL + "GetPlazaDetails").Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationRequestResponce requestResponce = json_serializer.Deserialize<IntegrationRequestResponce>(JsonResponce);
                            if (requestResponce.ResponceMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                List<PlazaManagementIL> plazas = json_serializer.Deserialize<List<PlazaManagementIL>>(Constants.ParseJsonForResponce(JsonResponce));
                                if (plazas.Count > 0)
                                {

                                    PlazaManagementBL.MarkedDeleted();
                                    foreach (PlazaManagementIL item in plazas)
                                    {
                                        PlazaManagementBL.PInsertUpdate(item);
                                    }
                                    PlazaManagementBL.DeletedData();

                                }
                                #endregion
                            }
                            LogMessage("Plaza synchronization " + requestResponce.ResponceMessage);
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
                    plazaConfiguration = PlazaManagementBL.GetByIP(PlazaIP);
                    #endregion

                    #region 02 Get Client Details
                    try
                    {
                        client = new HttpClient();
                        client.BaseAddress = new Uri(BaseURL);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.GetAsync(BaseURL + "GetClientDetails").Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationRequestResponce requestResponce = json_serializer.Deserialize<IntegrationRequestResponce>(JsonResponce);
                            if (requestResponce.ResponceMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                List<ClientManagementIL> clients = json_serializer.Deserialize<List<ClientManagementIL>>(Constants.ParseJsonForResponce(JsonResponce));
                                if (clients.Count > 0)
                                {

                                    ClientManagementBL.MarkedDeleted();
                                    foreach (ClientManagementIL item in clients)
                                    {
                                        ClientManagementBL.PInsertUpdate(item);
                                    }
                                    ClientManagementBL.DeletedData();

                                }
                                #endregion
                            }
                            LogMessage("Client synchronization " + requestResponce.ResponceMessage);
                        }
                        else
                        {
                            LogMessage("Client API not working");
                        }

                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in Client sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    clientConfiguration = ClientManagementBL.GetById(plazaConfiguration.ClientId);
                    #endregion

                    #region 03 Get Lane Details
                    try
                    {
                        LaneManagementIL lane = new LaneManagementIL();
                        lane.ClientId = plazaConfiguration.ClientId;
                        lane.PlazaId = Convert.ToInt32(plazaConfiguration.EntryId);
                        Inputjson = new JavaScriptSerializer().Serialize(lane);
                        client = new HttpClient();
                        client.BaseAddress = new Uri(BaseURL);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.PostAsync(BaseURL + "GetLaneDetails", new StringContent(Inputjson, Encoding.UTF8, "application/json")).Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationRequestResponce requestResponce = json_serializer.Deserialize<IntegrationRequestResponce>(JsonResponce);
                            if (requestResponce.ResponceMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                List<LaneManagementIL> lanes = json_serializer.Deserialize<List<LaneManagementIL>>(Constants.ParseJsonForResponce(JsonResponce));
                                if (lanes.Count > 0)
                                {
                                    LaneManagementBL.MarkedDeleted();
                                    foreach (LaneManagementIL item in lanes)
                                    {
                                        LaneManagementBL.PInsertUpdate(item);
                                    }
                                    LaneManagementBL.DeletedData();

                                }
                                #endregion
                            }
                            LogMessage("Lane synchronization " + requestResponce.ResponceMessage);
                        }
                        else
                        {
                            LogMessage("Lane API synchronization not working");
                        }

                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in lane sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion

                    #region 04 Get Hardware Connection Type Details
                    try
                    {
                        client = new HttpClient();
                        client.BaseAddress = new Uri(BaseURL);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.GetAsync(BaseURL + "GetConnectionType").Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationRequestResponce requestResponce = json_serializer.Deserialize<IntegrationRequestResponce>(JsonResponce);
                            if (requestResponce.ResponceMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                List<ConnectionTypeIL> ConnectionTypes = json_serializer.Deserialize<List<ConnectionTypeIL>>(Constants.ParseJsonForResponce(JsonResponce));
                                if (ConnectionTypes.Count > 0)
                                {
                                    ConnectionTypeBL.MarkedDeleted();
                                    foreach (ConnectionTypeIL item in ConnectionTypes)
                                    {
                                        ConnectionTypeBL.PInsertUpdate(item);
                                    }
                                    ConnectionTypeBL.DeletedData();

                                }
                                #endregion
                            }
                            LogMessage("Connection Type synchronization " + requestResponce.ResponceMessage);
                        }
                        else
                        {
                            LogMessage("Connection Type API synchronization not working");
                        }
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in Hardware Connection Type sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion

                    #region 05 Get Hardware Type Details
                    try
                    {
                        client = new HttpClient();
                        client.BaseAddress = new Uri(BaseURL);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.GetAsync(BaseURL + "GetHardwareType").Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationRequestResponce requestResponce = json_serializer.Deserialize<IntegrationRequestResponce>(JsonResponce);
                            if (requestResponce.ResponceMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                List<HardwareTypeIL> HardwareTypes = json_serializer.Deserialize<List<HardwareTypeIL>>(Constants.ParseJsonForResponce(JsonResponce));
                                if (HardwareTypes.Count > 0)
                                {
                                    HardwareTypeBL.MarkedDeleted();
                                    foreach (HardwareTypeIL item in HardwareTypes)
                                    {
                                        HardwareTypeBL.PInsertUpdate(item);
                                    }
                                    HardwareTypeBL.DeletedData();

                                }
                                #endregion
                            }
                            LogMessage("Hardware Type synchronization " + requestResponce.ResponceMessage);
                        }
                        else
                        {
                            LogMessage("Hardware Type API synchronization not working");
                        }
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in Hardware Type sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion

                    #region 06 Get Hardware Provider Details
                    try
                    {
                        client = new HttpClient();
                        client.BaseAddress = new Uri(BaseURL);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.GetAsync(BaseURL + "GetHardwareProvider").Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationRequestResponce requestResponce = json_serializer.Deserialize<IntegrationRequestResponce>(JsonResponce);
                            if (requestResponce.ResponceMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                List<HardwareProviderIL> HardwareProviders = json_serializer.Deserialize<List<HardwareProviderIL>>(Constants.ParseJsonForResponce(JsonResponce));
                                if (HardwareProviders.Count > 0)
                                {
                                    HardwareProviderBL.MarkedDeleted();
                                    foreach (HardwareProviderIL item in HardwareProviders)
                                    {
                                        HardwareProviderBL.PInsertUpdate(item);
                                    }
                                    HardwareProviderBL.DeletedData();
                                }
                                #endregion
                            }
                            LogMessage("Hardware Provider synchronization " + requestResponce.ResponceMessage);
                        }
                        else
                        {
                            LogMessage("Hardware Provider API synchronization not working");
                        }
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in Hardware Provider sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion

                    #region 07 Get Hardware Details
                    try
                    {
                        HardwareManagementIL hardware = new HardwareManagementIL();
                        hardware.ClientId = plazaConfiguration.ClientId;
                        hardware.PlazaId = Convert.ToInt32(plazaConfiguration.EntryId);
                        Inputjson = new JavaScriptSerializer().Serialize(hardware);
                        client = new HttpClient();
                        client.BaseAddress = new Uri(BaseURL);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.PostAsync(BaseURL + "GetHardwareDetails", new StringContent(Inputjson, Encoding.UTF8, "application/json")).Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationRequestResponce requestResponce = json_serializer.Deserialize<IntegrationRequestResponce>(JsonResponce);
                            if (requestResponce.ResponceMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                List<HardwareManagementIL> HardwareDetails = json_serializer.Deserialize<List<HardwareManagementIL>>(Constants.ParseJsonForResponce(JsonResponce));
                                if (HardwareDetails.Count > 0)
                                {
                                    HardwareManagementBL.MarkedDeleted();
                                    foreach (HardwareManagementIL item in HardwareDetails)
                                    {
                                        HardwareManagementBL.PInsertUpdate(item);
                                    }
                                    HardwareManagementBL.DeletedData();
                                }
                                #endregion
                            }
                            LogMessage("Hardware Details synchronization " + requestResponce.ResponceMessage);
                        }
                        else
                        {
                            LogMessage("Hardware Details synchronization not working");
                        }
                        Thread.Sleep(100);
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in hardware Details sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion

                    #region 08 Get Vehicle Class Details
                    try
                    {
                        client = new HttpClient();
                        client.BaseAddress = new Uri(BaseURL);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.GetAsync(BaseURL + "GetVehicleClassDetails").Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationRequestResponce requestResponce = json_serializer.Deserialize<IntegrationRequestResponce>(JsonResponce);
                            if (requestResponce.ResponceMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                List<VehicleClassIL> vehicleClases = json_serializer.Deserialize<List<VehicleClassIL>>(Constants.ParseJsonForResponce(JsonResponce));
                                if (vehicleClases.Count > 0)
                                {
                                    VehicleClassBL.MarkedDeleted();
                                    foreach (VehicleClassIL item in vehicleClases)
                                    {
                                        VehicleClassBL.PInsertUpdate(item);
                                    }
                                    VehicleClassBL.DeletedData();
                                }
                                #endregion
                            }
                            LogMessage("Vehicle Class synchronization " + requestResponce.ResponceMessage);
                        }
                        else
                        {
                            LogMessage("Vehicle Class API synchronization not working");
                        }
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in vehicle class sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }

                    #endregion

                    #region 09 Fare Deails
                    #region Get Fare Details
                    try
                    {
                        client = new HttpClient();
                        client.BaseAddress = new Uri(BaseURL);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.GetAsync(BaseURL + "GetTollFares").Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationRequestResponce requestResponce = json_serializer.Deserialize<IntegrationRequestResponce>(JsonResponce);
                            if (requestResponce.ResponceMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                List<FareDetailsIL> fares = json_serializer.Deserialize<List<FareDetailsIL>>(Constants.ParseJsonForResponce(JsonResponce));
                                if (fares.Count > 0)
                                {
                                    foreach (FareDetailsIL item in fares)
                                    {
                                        FareManagementBL.PInsertUpdate(item);
                                    }
                                }
                                #endregion
                            }
                            LogMessage("Fare Details synchronization " + requestResponce.ResponceMessage);
                        }
                        else
                        {
                            LogMessage("Fare API synchronization not working");
                        }

                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in fare sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion
                    #region Get Fare net day Details
                    //try
                    //{
                    //    FareDetailsIL fare = new FareDetailsIL();
                    //    fare.ClientId = plazaConfiguration.ClientId;
                    //    fare.EffectiveDate = DateTime.Now.AddDays(1);
                    //    Inputjson = new JavaScriptSerializer().Serialize(fare);
                    //    client = new HttpClient();
                    //    client.BaseAddress = new Uri(BaseURL);
                    //    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    //    response = client.PostAsync(BaseURL + "GetTollFareDetails", new StringContent(Inputjson, Encoding.UTF8, "application/json")).Result;
                    //    if (response.IsSuccessStatusCode)
                    //    {
                    //        var JsonResponce = response.Content.ReadAsStringAsync().Result;
                    //        JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                    //        fares = json_serializer.Deserialize<FareManagementIL>(JsonResponce);
                    //        FareManagementIL fareDetails = FareManagementBL.GetAllByDate(fare);
                    //        if (fares.EffectiveDate > DateTime.Now)
                    //        {
                    //            string fd = fares.EffectiveDate.ToString("dd-MMM-yyyy");
                    //            string nd = DateTime.Now.AddDays(1).ToString("dd-MMM-yyyy");
                    //            if (fd == nd)
                    //            {
                    //                FareManagementBL.PInsertUpdate(fares);
                    //                LogMessage("Fare next date synchronization successfully");
                    //            }
                    //            else
                    //            {
                    //                LogMessage("Fare next date is " + fd + " synchronization unsuccessfully");
                    //            }
                    //        }

                    //    }
                    //    else
                    //    {
                    //        LogMessage("Fare next API synchronization not working");
                    //    }

                    //}
                    //catch (Exception ex)
                    //{
                    //    LogMessage("Error in fare class sync : " + ex.Message.ToString());
                    //}
                    //finally
                    //{
                    //    Thread.Sleep(100);
                    //}
                    #endregion
                    #endregion

                    #region 10 Get Transaction Type Details
                    try
                    {
                        client = new HttpClient();
                        client.BaseAddress = new Uri(BaseURL);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.GetAsync(BaseURL + "GetTransactionTypeDetails").Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationRequestResponce requestResponce = json_serializer.Deserialize<IntegrationRequestResponce>(JsonResponce);
                            if (requestResponce.ResponceMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                List<TransactionTypeIL> transactionType = json_serializer.Deserialize<List<TransactionTypeIL>>(Constants.ParseJsonForResponce(JsonResponce));
                                if (transactionType.Count > 0)
                                {
                                    TransactionTypeBL.MarkedDeleted();
                                    foreach (TransactionTypeIL item in transactionType)
                                    {
                                        TransactionTypeBL.PInsertUpdate(item);
                                    }
                                    TransactionTypeBL.DeletedData();
                                }
                                #endregion
                            }
                            LogMessage("Transaction Type synchronization " + requestResponce.ResponceMessage);
                        }
                        else
                        {
                            LogMessage("Transaction Type API synchronization not working");
                        }
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in Transaction Type sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion

                    #region 11 Get Exempt Details
                    try
                    {
                        client = new HttpClient();
                        client.BaseAddress = new Uri(BaseURL);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.GetAsync(BaseURL + "GetExemptTypeDetails").Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationRequestResponce requestResponce = json_serializer.Deserialize<IntegrationRequestResponce>(JsonResponce);
                            if (requestResponce.ResponceMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                List<ExemptTypeIL> exempts = json_serializer.Deserialize<List<ExemptTypeIL>>(Constants.ParseJsonForResponce(JsonResponce));
                                if (exempts.Count > 0)
                                {
                                    ExemptTypeBL.MarkedDeleted();
                                    foreach (ExemptTypeIL item in exempts)
                                    {
                                        ExemptTypeBL.PInsertUpdate(item);
                                    }
                                    ExemptTypeBL.DeletedData();
                                }
                                #endregion
                            }
                            LogMessage("Exempt synchronization " + requestResponce.ResponceMessage);
                        }
                        else
                        {
                            LogMessage("Exempt API synchronization not working");
                        }
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in Exempt sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion

                    #region 12 Get Payment Details
                    try
                    {
                        client = new HttpClient();
                        client.BaseAddress = new Uri(BaseURL);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.GetAsync(BaseURL + "GetPaymentTypeDetails").Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationRequestResponce requestResponce = json_serializer.Deserialize<IntegrationRequestResponce>(JsonResponce);
                            if (requestResponce.ResponceMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                List<PaymentTypeIL> paymentTypes = json_serializer.Deserialize<List<PaymentTypeIL>>(Constants.ParseJsonForResponce(JsonResponce));
                                if (paymentTypes.Count > 0)
                                {
                                    PaymentTypeBL.MarkedDeleted();
                                    foreach (PaymentTypeIL item in paymentTypes)
                                    {
                                        PaymentTypeBL.PInsertUpdate(item);
                                    }
                                    PaymentTypeBL.DeletedData();
                                }
                                #endregion
                            }
                            LogMessage("Payment Type synchronization " + requestResponce.ResponceMessage);
                        }
                        else
                        {
                            LogMessage("Payment Type API synchronization not working");
                        }
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in Payment Type sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion

                    #region 13 Get Shift Details
                    try
                    {
                        client = new HttpClient();
                        client.BaseAddress = new Uri(BaseURL);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.GetAsync(BaseURL + "GetShiftTiminigDetails").Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationRequestResponce requestResponce = json_serializer.Deserialize<IntegrationRequestResponce>(JsonResponce);
                            if (requestResponce.ResponceMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                List<ShiftManagementIL> shifts = json_serializer.Deserialize<List<ShiftManagementIL>>(Constants.ParseJsonForResponce(JsonResponce));
                                if (shifts.Count > 0)
                                {
                                    ShiftManagementBL.MarkedDeleted();
                                    foreach (ShiftManagementIL item in shifts)
                                    {
                                        ShiftManagementBL.PInsertUpdate(item);
                                    }
                                    ShiftManagementBL.DeletedData();
                                }
                                #endregion
                            }
                            LogMessage("Shift synchronization " + requestResponce.ResponceMessage);
                        }
                        else
                        {
                            LogMessage("Shift API synchronization not working");
                        }
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in plaza shifts sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion

                    #region 14 Get Denomination Details
                    try
                    {
                        client = new HttpClient();
                        client.BaseAddress = new Uri(BaseURL);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.GetAsync(BaseURL + "GetDenominationDetails").Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationRequestResponce requestResponce = json_serializer.Deserialize<IntegrationRequestResponce>(JsonResponce);
                            if (requestResponce.ResponceMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                List<DenominationIL> cashFlows = json_serializer.Deserialize<List<DenominationIL>>(Constants.ParseJsonForResponce(JsonResponce));
                                if (cashFlows.Count > 0)
                                {
                                    DenominationBL.MarkedDeleted();
                                    foreach (DenominationIL item in cashFlows)
                                    {
                                        DenominationBL.PInsertUpdate(item);
                                    }
                                    DenominationBL.DeletedData();
                                }
                                #endregion
                            }
                            LogMessage("Payment Type synchronization " + requestResponce.ResponceMessage);
                        }
                        else
                        {
                            LogMessage("Payment Type API synchronization not working");
                        }
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in Payment Type sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion

                    #region 15 Get Plaza Users Details
                    try
                    {
                        UserManagementIL user = new UserManagementIL();
                        user.ClientId = plazaConfiguration.ClientId;
                        user.PlazaId = Convert.ToInt32(plazaConfiguration.EntryId);
                        Inputjson = new JavaScriptSerializer().Serialize(user);
                        client = new HttpClient();
                        client.BaseAddress = new Uri(BaseURL);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.PostAsync(BaseURL + "GetPlazaUsersDetails", new StringContent(Inputjson, Encoding.UTF8, "application/json")).Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationRequestResponce requestResponce = json_serializer.Deserialize<IntegrationRequestResponce>(JsonResponce);
                            if (requestResponce.ResponceMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                List<UserManagementIL> users = json_serializer.Deserialize<List<UserManagementIL>>(Constants.ParseJsonForResponce(JsonResponce));
                                if (users.Count > 0)
                                {
                                    UserManagementBL.MarkedDeleted();
                                    foreach (UserManagementIL item in users)
                                    {
                                        UserManagementBL.PInsertUpdate(item);
                                    }
                                    UserManagementBL.DeletedData();
                                }
                                #endregion
                            }
                            LogMessage("Users synchronization " + requestResponce.ResponceMessage);
                        }
                        else
                        {
                            LogMessage("Users API synchronization not working");
                        }
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in Users sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion

                    #region 16 Get roles Details
                    try
                    {
                        UserManagementIL user = new UserManagementIL();
                        user.ClientId = plazaConfiguration.ClientId;
                        user.PlazaId = Convert.ToInt32(plazaConfiguration.EntryId);
                        Inputjson = new JavaScriptSerializer().Serialize(user);
                        client = new HttpClient();
                        client.BaseAddress = new Uri(BaseURL);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.PostAsync(BaseURL + "GetPlazaUsersRolesDetails", new StringContent(Inputjson, Encoding.UTF8, "application/json")).Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationRequestResponce requestResponce = json_serializer.Deserialize<IntegrationRequestResponce>(JsonResponce);
                            if (requestResponce.ResponceMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                List<RoleManagementIL> roles = json_serializer.Deserialize<List<RoleManagementIL>>(Constants.ParseJsonForResponce(JsonResponce));
                                if (roles.Count > 0)
                                {
                                    RoleManagementBL.MarkedDeleted();
                                    foreach (RoleManagementIL item in roles)
                                    {
                                        RoleManagementBL.PInsertUpdate(item);
                                    }
                                    RoleManagementBL.DeletedData();
                                }
                                #endregion
                            }
                            LogMessage("Roles synchronization " + requestResponce.ResponceMessage);
                        }
                        else
                        {
                            LogMessage("Roles API synchronization not working");
                        }
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in plaza roles sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion

                    #region 17 Get Plaza Menus Details
                    try
                    {

                        client = new HttpClient();
                        client.BaseAddress = new Uri(BaseURL);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.GetAsync(BaseURL + "GetPlazaMenuDetails").Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationRequestResponce requestResponce = json_serializer.Deserialize<IntegrationRequestResponce>(JsonResponce);
                            if (requestResponce.ResponceMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                List<MenuManagementIL> menus = json_serializer.Deserialize<List<MenuManagementIL>>(Constants.ParseJsonForResponce(JsonResponce));
                                if (menus.Count > 0)
                                {
                                    MenuManagementBL.MarkedDeleted();
                                    foreach (MenuManagementIL item in menus)
                                    {
                                        MenuManagementBL.PInsertUpdate(item);
                                    }
                                    MenuManagementBL.DeletedData();
                                }
                                #endregion
                            }
                            LogMessage("Menu synchronization " + requestResponce.ResponceMessage);
                        }
                        else
                        {
                            LogMessage("Menu synchronization not working");
                        }
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in Menu sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion

                    #region 21 Get Master Config
                    try
                    {
                        client = new HttpClient();
                        client.BaseAddress = new Uri(BaseURL);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.GetAsync(BaseURL + "GetMasterConfig").Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationRequestResponce requestResponce = json_serializer.Deserialize<IntegrationRequestResponce>(JsonResponce);
                            if (requestResponce.ResponceMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                bool Chnageflag = false;
                                MasterConfigIL LocalmasterConfig = MasterConfigBL.GetConfig();
                                MasterConfigIL masterConfig = json_serializer.Deserialize<MasterConfigIL>(Constants.ParseJsonForResponceObject(JsonResponce));
                                if (LocalmasterConfig.TollingType != masterConfig.TollingType)
                                    Chnageflag = true;
                                if (LocalmasterConfig.ChargingType != masterConfig.ChargingType)
                                    Chnageflag = true;
                                if (LocalmasterConfig.AppVersion != masterConfig.AppVersion)
                                    Chnageflag = true;
                                if (Chnageflag)
                                {
                                    MasterConfigBL.InsertUpdate(masterConfig);
                                    LogMessage("MasterConfig synchronization " + requestResponce.ResponceMessage);
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

                    #region Default Events Insert
                    try
                    {
                        LiveEventsBL.DefaultInsert();
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in Payment Type sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion
                }
                Thread.Sleep(100);
            }
        }
        private void ServerStatusFunction()
        {
            bool LastCheckServerPort = false;
            DateTime TheadStartTime = DateTime.MinValue;
            LogMessage("Server API is not running");
            while (!StopServerStatusThread)
            {
                TimeSpan ts = DateTime.Now - TheadStartTime;
                if (ts.TotalSeconds > 30)
                {
                    try
                    {
                        TimeSpan duration = new TimeSpan(0, 0, 0, 0, 500);
                        if (Constants.IsPortOpen(plazaConfigurationFile.ServerIP, plazaConfigurationFile.ApiPort, duration))
                        {
                            CheckServerPort = true;
                        }

                        if (LastCheckServerPort != CheckServerPort)
                        {
                            if (CheckServerPort)
                                LogMessage("Server API is running");
                            else
                                LogMessage("Server API is not running");
                        }
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Failed to check Sevrver Status" + ex.ToString());
                    }
                    finally
                    {
                        TheadStartTime = DateTime.Now;
                    }

                }
                Thread.Sleep(100);
            }
        }
        private void EntryLaneSyncFunction()
        {

            while (!stopEntryLaneSync)
            {
                if (CheckServerPort)
                {
                    #region Entry Lane sync
                    try
                    {
                        List<LaneTransactionIL> EntrypendingList = LaneTransactionBL.GetLanePendingData(1);
                        LaneTransactionIL EntrypendingData;
                        foreach (LaneTransactionIL EntryItem in EntrypendingList)
                        {
                            EntrypendingData = LaneTransactionBL.GetByEntryId(EntryItem.EntryId);
                            if (EntrypendingData.LaneType == 1)
                            {
                                #region Convert Image to base 64
                                if (!string.IsNullOrEmpty(EntrypendingData.TransactionImage))
                                {
                                    var FilePath = plazaConfigurationFile.PrefixPath + EntrypendingData.TransactionImage;
                                    if (File.Exists(FilePath))
                                    {
                                        EntrypendingData.TransactionImage = Constants.ImagetoBase64(FilePath);
                                    }
                                }

                                #endregion

                                #region Convert Video to base 64
                                if (!string.IsNullOrEmpty(EntrypendingData.TransactionVideo))
                                {
                                    var FilePath = plazaConfigurationFile.PrefixPath + EntrypendingData.TransactionVideo;
                                    if (File.Exists(FilePath))
                                    {
                                        EntrypendingData.TransactionVideo = Constants.VideotoBase64(FilePath);
                                    }
                                }
                                #endregion

                                #region 18 Entry Lane Sync
                                EntrypendingData.TransactionDateTime = EntrypendingData.TransactionTimeStamp.ToString(Constants.DATETIME_FORMAT_String);
                                EntryInputjson = new JavaScriptSerializer().Serialize(EntrypendingData);
                                Entryclient = new HttpClient();
                                Entryclient.BaseAddress = new Uri(BaseURL);
                                Entryclient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                                Entryresponse = Entryclient.PostAsync(BaseURL + "EntryLaneSync", new StringContent(EntryInputjson, Encoding.UTF8, "application/json")).Result;
                                if (Entryresponse.IsSuccessStatusCode)
                                {
                                    try
                                    {
                                        var JsonResponce = Entryresponse.Content.ReadAsStringAsync().Result;
                                        JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                                        LaneDataSyncResponce resData = json_serializer.Deserialize<LaneDataSyncResponce>(JsonResponce);
                                        if (resData.CrTransId > 0)
                                        {
                                            LaneTransactionIL laneTrans = new LaneTransactionIL();
                                            laneTrans.LaneType = 1;
                                            laneTrans.EntryId = EntryItem.EntryId;
                                            laneTrans.MasterId = resData.CrTransId;
                                            laneTrans.TransactionTimeStamp = EntryItem.TransactionTimeStamp;
                                            LaneTransactionBL.MarkedTransfer(laneTrans);
                                        }
                                        else
                                        {
                                            LogMessage("Faild to Entry lane sync : " + EntryItem.EntryId);
                                            LogMessage("Entry Lane Data Pakcet : " + EntryInputjson);
                                        }

                                    }
                                    catch (Exception ex)
                                    {
                                        LogMessage("Error to send Entry Lane sync : " + ex.Message.ToString());
                                        LogMessage("Entry Lane Data Pakcet : " + EntryInputjson);
                                    }
                                }
                                #endregion
                            }
                            else
                            {
                                if (EntrypendingData.MasterId == 0)
                                {
                                    LaneTransactionBL.EntryDiscard(EntryItem.EntryId);
                                    LogMessage("Exit Lane Data not allowed in entry");
                                    LogMessage("Entry Lane Data Pakcet : " + EntryInputjson);
                                }
                            }
                            LogMessage("Entry Data Packet Responce : " + Entryresponse.StatusCode);
                        }
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in Entry Lane sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion

                }
                Thread.Sleep(100);
            }
        }
        private void ExitLaneSyncFunction()
        {
            while (!stopExitLaneSync)
            {
                if (CheckServerPort)
                {
                    #region Exit Lane sync
                    try
                    {
                        List<LaneTransactionIL> ExitpendingList = LaneTransactionBL.GetLanePendingData(2);
                        LaneTransactionIL ExitpendingData;
                        foreach (LaneTransactionIL ExitItem in ExitpendingList)
                        {
                            ExitpendingData = LaneTransactionBL.GetByExitId(ExitItem.EntryId);
                            if (ExitpendingData.LaneType == 2)
                            {
                                #region Convert Image to base 64
                                if (!string.IsNullOrEmpty(ExitpendingData.TransactionImage))
                                {
                                    var FilePath = plazaConfigurationFile.PrefixPath + ExitpendingData.TransactionImage;
                                    if (File.Exists(FilePath))
                                    {
                                        ExitpendingData.TransactionImage = Constants.ImagetoBase64(FilePath);
                                    }
                                }

                                #endregion

                                #region Convert Video to base 64
                                if (!string.IsNullOrEmpty(ExitpendingData.TransactionVideo))
                                {
                                    var FilePath = plazaConfigurationFile.PrefixPath + ExitpendingData.TransactionVideo;
                                    if (File.Exists(FilePath))
                                    {
                                        ExitpendingData.TransactionVideo = Constants.VideotoBase64(FilePath);
                                    }
                                }
                                #endregion

                                #region 19 Exit Lane Sync
                                ExitpendingData.TransactionDateTime = ExitpendingData.TransactionTimeStamp.ToString(Constants.DATETIME_FORMAT_String);
                                ExitInputjson = new JavaScriptSerializer().Serialize(ExitpendingData);
                                Exitclient = new HttpClient();
                                Exitclient.BaseAddress = new Uri(BaseURL);
                                Exitclient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                                Exitresponse = Exitclient.PostAsync(BaseURL + "ExitLaneSync", new StringContent(ExitInputjson, Encoding.UTF8, "application/json")).Result;
                                if (Exitresponse.IsSuccessStatusCode)
                                {
                                    try
                                    {
                                        var JsonResponce = Exitresponse.Content.ReadAsStringAsync().Result;
                                        JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                                        LaneDataSyncResponce resData = json_serializer.Deserialize<LaneDataSyncResponce>(JsonResponce);
                                        if (resData.CrTransId > 0)
                                        {
                                            LaneTransactionIL laneTrans = new LaneTransactionIL();
                                            laneTrans.LaneType = 2;
                                            laneTrans.EntryId = ExitItem.EntryId;
                                            laneTrans.MasterId = resData.CrTransId;
                                            laneTrans.TransactionTimeStamp = ExitItem.TransactionTimeStamp;
                                            LaneTransactionBL.MarkedTransfer(laneTrans);
                                        }
                                        else
                                        {
                                            LogMessage("Faild to Exit lane sync : " + ExitItem.EntryId);
                                            LogMessage("Exit Lane  Data Pakcet : " + ExitInputjson);
                                        }
                                    }
                                    catch (Exception ex)
                                    {
                                        LogMessage("Error to send Exit Lane sync : " + ex.Message.ToString());
                                        LogMessage("Exit Lane  Data Pakcet : " + ExitInputjson);
                                    }
                                }
                                #endregion
                            }
                            else
                            {
                                if (ExitpendingData.MasterId == 0)
                                {
                                    LaneTransactionBL.ExitDiscard(ExitItem.EntryId);
                                    LogMessage("Entry lane data not allowed in Exit Lane");
                                    LogMessage("Exit Lane  Data Pakcet : " + ExitInputjson);
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in Exit Lane sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion

                }
                Thread.Sleep(100);
            }
        }
        private void ReviewLaneSyncFunction()
        {

            while (!stopReviewLaneSync)
            {
                if (CheckServerPort)
                {
                    #region Review Lane sync
                    try
                    {
                        List<LaneTransactionIL> ReviewPendingList = LaneTransactionBL.GetLanePendingData(3);
                        LaneTransactionReviewIL ReviewpendingData;
                        foreach (LaneTransactionIL item in ReviewPendingList)
                        {
                            #region 20 Review Data Sync
                            ReviewpendingData = LaneTransactionReviewBL.GetByExitId(item.EntryId);
                            ReviewpendingData.ReveiwedDateTimeString = ReviewpendingData.ReveiwedDateTime.ToString(Constants.DATETIME_FORMAT_String);
                            ReviewInputjson = new JavaScriptSerializer().Serialize(ReviewpendingData);
                            Reviewclient = new HttpClient();
                            Reviewclient.BaseAddress = new Uri(BaseURL);
                            Reviewclient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                            Reviewresponse = Reviewclient.PostAsync(BaseURL + "ReviewLaneSync", new StringContent(ReviewInputjson, Encoding.UTF8, "application/json")).Result;
                            if (Reviewresponse.IsSuccessStatusCode)
                            {
                                try
                                {
                                    var JsonResponce = Reviewresponse.Content.ReadAsStringAsync().Result;
                                    JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                                    LaneDataSyncResponce resData = json_serializer.Deserialize<LaneDataSyncResponce>(JsonResponce);
                                    if (resData.CrTransId > 0)
                                    {
                                        LaneTransactionIL laneTrans = new LaneTransactionIL();
                                        laneTrans.LaneType = 3;
                                        laneTrans.EntryId = item.EntryId;
                                        laneTrans.MasterId = resData.CrTransId;
                                        laneTrans.TransactionTimeStamp = item.TransactionTimeStamp;
                                        LaneTransactionBL.MarkedTransfer(laneTrans);
                                        LogMessage("Review Lane sync : " + item.EntryId);
                                    }
                                }
                                catch (Exception ex)
                                {
                                    LogMessage("Error to send Review Lane sync : " + ex.Message.ToString());
                                    LogMessage("Review Lane  Data Pakcet : " + ReviewInputjson);
                                }
                            }
                            #endregion
                        }
                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in Review Lane sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion

                }
                Thread.Sleep(100);
            }
        }
        private void PendingLaneSyncFunction()
        {
            FareDetailsIL fare;
            while (!stopPendingLaneSync)
            {
                #region Review Lane sync
                try
                {
                    List<LaneTransactionIL> PendingChargeList = LaneTransactionBL.GetPendingChargingData();
                    foreach (LaneTransactionIL laneData in PendingChargeList)
                    {
                        List<LaneTransactionIL> MappingLaneData = LaneTransactionBL.GetLaneMatchedDataByRefNum(laneData);
                        if (MappingLaneData.Count > 0)
                        {
                            #region Mapping Data Found
                            List<LaneTransactionIL> filtered = MappingLaneData.FindAll(e => e.ReferenceTransactionId == 0).OrderBy(x => x.TransactionTimeStamp).ToList();
                            if (filtered.Count > 0)
                            {
                                #region Exit Lane Data Found
                                LaneTransactionIL EntryLaneData = filtered[0];
                                laneData.ReferenceTransactionId = EntryLaneData.EntryId;
                                TransactionTypeIL EntryTranType = TransactionTypeBL.GetById(EntryLaneData.TransactionTypeId);
                                #endregion
                                #region Check Toll Fare based on exit lane
                                FareDetailsIL fd = new FareDetailsIL();
                                fd.ClassId = laneData.MappingClassId;
                                fd.EntryPlazaId = laneData.PlazaId;
                                fd.ExitPlazaId = laneData.PlazaId;
                                fd.TransactionTimeStamp = laneData.TransactionTimeStamp;
                                fare = FareManagementBL.GetFareByJourney(fd);
                                if (fare.Journey == "Found")
                                {
                                    if (laneData.Overweight == 1)
                                        laneData.TransactionAmount = fare.OverWeightFare;
                                    else if (laneData.Penalty == 1)
                                        laneData.TransactionAmount = fare.PenaltyFare;
                                    else if (EntryLaneData.Overweight == 1)
                                        laneData.TransactionAmount = fare.OverWeightFare;
                                    else if (EntryLaneData.Penalty == 1)
                                        laneData.TransactionAmount = fare.PenaltyFare;
                                    else
                                    {
                                        laneData.TransactionAmount = fare.TollFare;
                                        #region Check for Retrun Journey
                                        if (laneData.TransactionTypeId == 1)
                                        {
                                            LaneTransactionIL retJourney = new LaneTransactionIL();
                                            retJourney.ReferenceNumber = laneData.ReferenceNumber;
                                            retJourney.TransactionTimeStamp = laneData.TransactionTimeStamp;
                                            List<LaneTransactionIL> checkforReturnJourney = LaneTransactionBL.GetLaneMatchedDataForRetJourney(retJourney);
                                            if (checkforReturnJourney.Count > 0)
                                            {
                                                List<LaneTransactionIL> filteredReturn = MappingLaneData.FindAll(e => e.JourneyType == 2);
                                                if (filteredReturn.Count == 0)
                                                {
                                                    laneData.TransactionAmount = fare.ReturnFare;
                                                    laneData.JourneyType = 2;
                                                }
                                            }
                                        }
                                        #endregion
                                    }
                                    LaneTransactionIL charged = LaneTransactionBL.ExitLaneCharged(laneData);
                                    LogMessage("Pending Trans Charged " + charged.EntryId + " with amount " + charged.TransactionAmount);

                                }
                                #endregion
                            }
                            #endregion
                        }
                    }
                }
                catch (Exception ex)
                {
                    LogMessage("Error in Pending Lane sync : " + ex.Message.ToString());
                }
                finally
                {
                    Thread.Sleep(100);
                }
                #endregion
                Thread.Sleep(100);
            }
        }
        private void PlazaEntryLaneDataQueue_PeekCompleted(object sender, PeekCompletedEventArgs e)
        {
            MessageQueue mqEntry = (MessageQueue)sender;
            Message mEntry = (Message)mqEntry.EndPeek(e.AsyncResult);

            try
            {
                mEntry.Formatter = new BinaryMessageFormatter();
                if (mEntry != null)
                {
                    if (mEntry.Body is LaneTransactionSerialIL)
                    {
                        try
                        {
                            LaneTransactionIL lanes = new LaneTransactionIL();
                            LaneTransactionSerialIL lane = ((LaneTransactionSerialIL)mEntry.Body);
                            var Inputjson1 = new JavaScriptSerializer().Serialize(lane);
                            lane.ReferenceTransactionId = 0;
                            LogMessage("Entry MSMQ Data" + Inputjson1);
                            #region Serializable Data
                            LaneTransactionIL laneData = new LaneTransactionIL();
                            laneData.AvcClassId = lane.AvcClassId;
                            if (string.IsNullOrEmpty(lane.AvcClassName))
                                laneData.AvcClassName = string.Empty;
                            else
                                laneData.AvcClassName = lane.AvcClassName;
                            laneData.Chargeable = lane.Chargeable;
                            laneData.ClientId = lane.ClientId;

                            if (string.IsNullOrEmpty(lane.ClientName))
                                laneData.ClientName = string.Empty;
                            else
                                laneData.ClientName = lane.ClientName;
                            laneData.ConfirmationStatus = lane.ConfirmationStatus;
                            laneData.EntryId = lane.EntryId;
                            laneData.ExemptTypeId = lane.ExemptTypeId;
                            if (string.IsNullOrEmpty(lane.ExemptTypeName))
                                laneData.ExemptTypeName = string.Empty;
                            else
                                laneData.ExemptTypeName = lane.ExemptTypeName;

                            laneData.IhmclClassId = lane.IhmclClassId;
                            if (string.IsNullOrEmpty(lane.IhmclClassName))
                                laneData.IhmclClassName = string.Empty;
                            else
                                laneData.IhmclClassName = lane.IhmclClassName;
                            laneData.JourneyType = lane.JourneyType;
                            laneData.LaneNumber = lane.LaneNumber;
                            laneData.LaneTransId = lane.LaneTransId;
                            laneData.LaneType = lane.LaneType;
                            if (string.IsNullOrEmpty(lane.LaneTypeName))
                                laneData.LaneTypeName = string.Empty;
                            else
                                laneData.LaneTypeName = lane.LaneTypeName;
                            laneData.LaneUsed = lane.LaneUsed;
                            if (string.IsNullOrEmpty(lane.LaneUsedName))
                                laneData.LaneUsedName = string.Empty;
                            else
                                laneData.LaneUsedName = lane.LaneUsedName;
                            laneData.MappingClassId = lane.MappingClassId;
                            if (string.IsNullOrEmpty(lane.MappingClassName))
                                laneData.MappingClassName = string.Empty;
                            else
                                laneData.MappingClassName = lane.MappingClassName;
                            laneData.MasterId = lane.MasterId;
                            laneData.Overweight = lane.Overweight;
                            laneData.PaymentTypeId = lane.PaymentTypeId;
                            if (string.IsNullOrEmpty(lane.PaymentTypeName))
                                laneData.PaymentTypeName = string.Empty;
                            else
                                laneData.PaymentTypeName = lane.PaymentTypeName;
                            laneData.Penalty = lane.Penalty;
                            if (string.IsNullOrEmpty(lane.PlateNumber))
                                laneData.PlateNumber = string.Empty;
                            else
                                laneData.PlateNumber = lane.PlateNumber;
                            laneData.PlazaId = lane.PlazaId;
                            if (string.IsNullOrEmpty(lane.PlazaName))
                                laneData.PlazaName = string.Empty;
                            else
                                laneData.PlazaName = lane.PlazaName;
                            if (string.IsNullOrEmpty(lane.ReferenceNumber))
                                laneData.ReferenceNumber = string.Empty;
                            else
                                laneData.ReferenceNumber = lane.ReferenceNumber;
                            laneData.ReferenceTransactionId = lane.ReferenceTransactionId;
                            laneData.ReveiwedRequired = lane.ReveiwedRequired;
                            laneData.ReveiwedStatus = lane.ReveiwedStatus;
                            laneData.ShiftId = lane.ShiftId;
                            if (string.IsNullOrEmpty(lane.TCLoginId))
                                laneData.TCLoginId = string.Empty;
                            else
                                laneData.TCLoginId = lane.TCLoginId;
                            laneData.TCUserId = lane.TCUserId;
                            laneData.TowVehicle = lane.TowVehicle;
                            laneData.TransactionAmount = lane.TransactionAmount;
                            if (string.IsNullOrEmpty(lane.TransactionDateTime))
                                laneData.TransactionDateTime = string.Empty;
                            else
                                laneData.TransactionDateTime = lane.TransactionDateTime;
                            if (string.IsNullOrEmpty(lane.TransactionImage))
                                laneData.TransactionImage = string.Empty;
                            else
                                laneData.TransactionImage = lane.TransactionImage;
                            laneData.TransactionStatus = lane.TransactionStatus;
                            laneData.TransactionTimeStamp = lane.TransactionTimeStamp;
                            laneData.TransactionTypeId = lane.TransactionTypeId;
                            if (string.IsNullOrEmpty(lane.TransactionTypeName))
                                laneData.TransactionTypeName = string.Empty;
                            else
                                laneData.TransactionTypeName = lane.TransactionTypeName;
                            if (string.IsNullOrEmpty(lane.TransactionVideo))
                                laneData.TransactionVideo = string.Empty;
                            else
                                laneData.TransactionVideo = lane.TransactionVideo;
                            #endregion
                            var Inputjson2 = new JavaScriptSerializer().Serialize(laneData);
                            LogMessage("Entry Insert Data" + Inputjson1);
                            if (!LaneTransactionBL.CheckDuplicateLaneId(laneData))
                                lanes = LaneTransactionBL.EntryInsert(laneData);
                            else
                            {
                                LogMessage("Discard Duplicate PlazaEntryLane : " + lane.LaneTransId.ToString());
                            }
                        }
                        catch (Exception ex)
                        {
                            LogMessage("Error in PlazaEntryLane Insert : " + ex.Message.ToString());
                            throw ex;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                #region Send data to failed queue
                try
                {
                    LaneTransactionSerialIL lane = ((LaneTransactionSerialIL)mEntry.Body);
                    Message failedQueuemsg = new Message();
                    failedQueuemsg.Formatter = new BinaryMessageFormatter();
                    failedQueuemsg.Body = lane;
                    failedQueuemsg.Recoverable = true;
                    PlazaFailedQueue.Send(failedQueuemsg);
                    LogMessage("PlazaEntryLane Message sent to failed queue." + ex.ToString());
                }
                catch (Exception exc)
                {
                    LogMessage("***DATA LOST*** PlazaEntryLane Failed to send to failed queue " + exc.ToString());
                }
                #endregion
            }
            finally
            {
                mqEntry.Receive();
                PlazaEntryLaneDataQueue.BeginPeek();
            }
        }
        private void PlazaExitLaneDataQueue_PeekCompleted(object sender, PeekCompletedEventArgs e)
        {
            MessageQueue mqExit = (MessageQueue)sender;
            Message mExit = (Message)mqExit.EndPeek(e.AsyncResult);
            try
            {
                mExit.Formatter = new BinaryMessageFormatter();
                if (mExit != null)
                {
                    if (mExit.Body is LaneTransactionSerialIL)
                    {
                        try
                        {
                            LaneTransactionIL lanes = new LaneTransactionIL();
                            LaneTransactionSerialIL lane = ((LaneTransactionSerialIL)mExit.Body);
                            var Inputjson1 = new JavaScriptSerializer().Serialize(lane);
                            LogMessage("Exit MSMQ Data" + Inputjson1);
                            if (lane.ReferenceTransactionId > 0)
                            {
                                LaneTransactionIL EntrypendingData = LaneTransactionBL.GetByEntryId(lane.ReferenceTransactionId);
                                if (EntrypendingData.EntryId != lane.ReferenceTransactionId)
                                    lane.ReferenceTransactionId = 0;
                            }
                            else
                                lane.ReferenceTransactionId = 0;
                            #region Serializable Data
                            LaneTransactionIL laneData = new LaneTransactionIL();
                            laneData.AvcClassId = lane.AvcClassId;
                            if (string.IsNullOrEmpty(lane.AvcClassName))
                                laneData.AvcClassName = string.Empty;
                            else
                                laneData.AvcClassName = lane.AvcClassName;
                            laneData.Chargeable = lane.Chargeable;
                            laneData.ClientId = lane.ClientId;

                            if (string.IsNullOrEmpty(lane.ClientName))
                                laneData.ClientName = string.Empty;
                            else
                                laneData.ClientName = lane.ClientName;
                            laneData.ConfirmationStatus = lane.ConfirmationStatus;
                            laneData.EntryId = lane.EntryId;
                            laneData.ExemptTypeId = lane.ExemptTypeId;
                            if (string.IsNullOrEmpty(lane.ExemptTypeName))
                                laneData.ExemptTypeName = string.Empty;
                            else
                                laneData.ExemptTypeName = lane.ExemptTypeName;

                            laneData.IhmclClassId = lane.IhmclClassId;
                            if (string.IsNullOrEmpty(lane.IhmclClassName))
                                laneData.IhmclClassName = string.Empty;
                            else
                                laneData.IhmclClassName = lane.IhmclClassName;
                            laneData.JourneyType = lane.JourneyType;
                            laneData.LaneNumber = lane.LaneNumber;
                            laneData.LaneTransId = lane.LaneTransId;
                            laneData.LaneType = lane.LaneType;
                            if (string.IsNullOrEmpty(lane.LaneTypeName))
                                laneData.LaneTypeName = string.Empty;
                            else
                                laneData.LaneTypeName = lane.LaneTypeName;
                            laneData.LaneUsed = lane.LaneUsed;
                            if (string.IsNullOrEmpty(lane.LaneUsedName))
                                laneData.LaneUsedName = string.Empty;
                            else
                                laneData.LaneUsedName = lane.LaneUsedName;
                            laneData.MappingClassId = lane.MappingClassId;
                            if (string.IsNullOrEmpty(lane.MappingClassName))
                                laneData.MappingClassName = string.Empty;
                            else
                                laneData.MappingClassName = lane.MappingClassName;
                            laneData.MasterId = lane.MasterId;
                            laneData.Overweight = lane.Overweight;
                            laneData.PaymentTypeId = lane.PaymentTypeId;
                            if (string.IsNullOrEmpty(lane.PaymentTypeName))
                                laneData.PaymentTypeName = string.Empty;
                            else
                                laneData.PaymentTypeName = lane.PaymentTypeName;
                            laneData.Penalty = lane.Penalty;
                            if (string.IsNullOrEmpty(lane.PlateNumber))
                                laneData.PlateNumber = string.Empty;
                            else
                                laneData.PlateNumber = lane.PlateNumber;
                            laneData.PlazaId = lane.PlazaId;
                            if (string.IsNullOrEmpty(lane.PlazaName))
                                laneData.PlazaName = string.Empty;
                            else
                                laneData.PlazaName = lane.PlazaName;
                            if (string.IsNullOrEmpty(lane.ReferenceNumber))
                                laneData.ReferenceNumber = string.Empty;
                            else
                                laneData.ReferenceNumber = lane.ReferenceNumber;
                            laneData.ReferenceTransactionId = lane.ReferenceTransactionId;
                            laneData.ReveiwedRequired = lane.ReveiwedRequired;
                            laneData.ReveiwedStatus = lane.ReveiwedStatus;
                            laneData.ShiftId = lane.ShiftId;
                            if (string.IsNullOrEmpty(lane.TCLoginId))
                                laneData.TCLoginId = string.Empty;
                            else
                                laneData.TCLoginId = lane.TCLoginId;
                            laneData.TCUserId = lane.TCUserId;
                            laneData.TowVehicle = lane.TowVehicle;
                            laneData.TransactionAmount = lane.TransactionAmount;
                            if (string.IsNullOrEmpty(lane.TransactionDateTime))
                                laneData.TransactionDateTime = string.Empty;
                            else
                                laneData.TransactionDateTime = lane.TransactionDateTime;
                            if (string.IsNullOrEmpty(lane.TransactionImage))
                                laneData.TransactionImage = string.Empty;
                            else
                                laneData.TransactionImage = lane.TransactionImage;
                            laneData.TransactionStatus = lane.TransactionStatus;
                            laneData.TransactionTimeStamp = lane.TransactionTimeStamp;
                            laneData.TransactionTypeId = lane.TransactionTypeId;
                            if (string.IsNullOrEmpty(lane.TransactionTypeName))
                                laneData.TransactionTypeName = string.Empty;
                            else
                                laneData.TransactionTypeName = lane.TransactionTypeName;
                            if (string.IsNullOrEmpty(lane.TransactionVideo))
                                laneData.TransactionVideo = string.Empty;
                            else
                                laneData.TransactionVideo = lane.TransactionVideo;
                            #endregion
                            var Inputjson2 = new JavaScriptSerializer().Serialize(laneData);
                            LogMessage("Exit Inset Data" + Inputjson2);
                            if (!LaneTransactionBL.CheckDuplicateLaneId(laneData))
                                lanes = LaneTransactionBL.ExitInsert(laneData);
                            else
                            {
                                LogMessage("Discard Duplicate PlazaExitLane : " + lane.LaneTransId.ToString());
                            }
                        }
                        catch (Exception ex)
                        {
                            LogMessage("Error in PlazaExitLane Insert : " + ex.Message.ToString());
                            throw ex;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                #region Send data to failed queue
                try
                {
                    LaneTransactionSerialIL lane = ((LaneTransactionSerialIL)mExit.Body);
                    Message failedQueuemsg = new Message();
                    failedQueuemsg.Formatter = new BinaryMessageFormatter();
                    failedQueuemsg.Body = lane;
                    failedQueuemsg.Recoverable = true;
                    PlazaFailedQueue.Send(failedQueuemsg);
                    LogMessage("PlazaExitLane Message sent to failed queue." + ex.ToString());
                }
                catch (Exception exc)
                {
                    LogMessage("***DATA LOST*** PlazaExitLane Failed to send to failed queue " + exc.ToString());
                }
                #endregion
            }
            finally
            {
                mqExit.Receive();
                PlazaExitLaneDataQueue.BeginPeek();
            }

        }
        #endregion

        #region Helper Mehod
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

                Softomation.DMS.Libraries.CommonLibrary.Logger.Log.Write(message, Softomation.DMS.Libraries.CommonLibrary.Logger.Log.ErrorLogModule.PDSS);
            }
        }
        #endregion
        #endregion
    }




}
