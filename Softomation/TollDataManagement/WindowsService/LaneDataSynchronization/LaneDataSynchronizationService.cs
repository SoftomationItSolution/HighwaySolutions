using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
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
using Softomation.DMS.Libraries.CommonLibrary.XMLConfigurationClasses;

namespace LaneDataSynchronization
{
    public partial class LaneDataSynchronizationService : ServiceBase
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
        LaneConfiguration laneConfigurationFile;
        PlazaManagementIL plazaConfiguration;
        LaneManagementIL laneConfiguration;
        ClientManagementIL clientConfiguration;
        string LaneIP = string.Empty;
        Int16 LaneType = 0;
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
        #endregion

        static void Main()
        {
            ServiceBase[] ServicesToRun;
            ServicesToRun = new ServiceBase[]
            {
                new LaneDataSynchronizationService()
            };
            ServiceBase.Run(ServicesToRun);
        }
        public LaneDataSynchronizationService()
        {
            InitializeComponent();
            //dont forget to comment this line
            //OnStart(new string[] { "LDSS" }); //<== only for debugging


        }

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
                    laneConfigurationFile = LaneConfiguration.Deserialize();
                    LogMessage("Get General Config Files");
                    List<string> LocalIps = Constants.GetLocalIPAddressList();
                    List<string> filtered = LocalIps.FindAll(e => e == laneConfigurationFile.LocalIP);
                    if (filtered.Count == 0)
                    {
                        ServiceStatus = false;
                        LogMessage("Unable to Local IP not matched, PDSS cannot be started. ");
                    }
                    else
                    {
                        LaneIP = laneConfigurationFile.LocalIP;
                        BaseURL = "http://" + laneConfigurationFile.PlazaIP + ":" + laneConfigurationFile.ApiPort + "/" + laneConfigurationFile.ApiPath + "/";
                        LogMessage("LaneIP " + LaneIP);
                        LogMessage("BaseURL " + BaseURL);
                        //laneConfiguration = LaneManagementBL.GetByIP(LaneIP);
                        //plazaConfiguration = PlazaManagementBL.GetByIP(LaneIP);
                        //clientConfiguration = ClientManagementBL.GetById(plazaConfiguration.ClientId);
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


                    //try
                    //{
                    //    LogMessage("Starting EntryLaneSyncThread logger thread...");
                    //    EntryLaneSyncThread = new Thread(new ThreadStart(this.EntryLaneSyncFunction));
                    //    EntryLaneSyncThread.IsBackground = true;
                    //    EntryLaneSyncThread.Start();
                    //    LogMessage("The EntryLaneSyncThread logger has been started.");
                    //}
                    //catch (Exception ex)
                    //{
                    //    LogMessage("error in starting EntryLaneSyncThread function. PDSS cannot be started. " + ex.ToString());
                    //}

                    //try
                    //{
                    //    LogMessage("Starting ExitLaneSyncThread logger thread...");
                    //    ExitLaneSyncThread = new Thread(new ThreadStart(this.ExitLaneSyncFunction));
                    //    ExitLaneSyncThread.IsBackground = true;
                    //    ExitLaneSyncThread.Start();
                    //    LogMessage("The ExitLaneSyncThread logger has been started.");
                    //}
                    //catch (Exception ex)
                    //{
                    //    LogMessage("error in starting ExitLaneSyncThread function. PDSS cannot be started. " + ex.ToString());
                    //}

                    //try
                    //{
                    //    LogMessage("Starting ReviewLaneSyncThread logger thread...");
                    //    ReviewLaneSyncThread = new Thread(new ThreadStart(this.ReviewLaneSyncFunction));
                    //    ReviewLaneSyncThread.IsBackground = true;
                    //    ReviewLaneSyncThread.Start();
                    //    LogMessage("The ReviewLaneSyncThread logger has been started.");
                    //}
                    //catch (Exception ex)
                    //{
                    //    LogMessage("error in starting ReviewLaneSyncThread function. PDSS cannot be started. " + ex.ToString());
                    //}


                    //try
                    //{
                    //    LogMessage("Starting PendingLaneSyncThread logger thread...");
                    //    PendingLaneSyncThread = new Thread(new ThreadStart(this.PendingLaneSyncFunction));
                    //    PendingLaneSyncThread.IsBackground = true;
                    //    PendingLaneSyncThread.Start();
                    //    LogMessage("The PendingLaneSyncThread logger has been started.");
                    //}
                    //catch (Exception ex)
                    //{
                    //    LogMessage("error in starting PendingLaneSyncThread function. PDSS cannot be started. " + ex.ToString());
                    //}

                }
            }
        }

        protected override void OnStop()
        {
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
                    #region 00 - Get Client Details 
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
                                ClientManagementIL clients = json_serializer.Deserialize<ClientManagementIL>(Constants.ParseJsonForResponceObject(JsonResponce));
                                ClientManagementBL.MarkedDeleted();
                                ClientManagementBL.PInsertUpdate(clients);
                                ClientManagementBL.DeletedData();
                                #endregion
                            }
                            LogMessage("clients synchronization " + requestResponce.ResponceMessage);
                        }
                        else
                        {
                            LogMessage("clients API synchronization not working");
                        }

                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in clients sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }

                    #endregion

                    #region 02 - Get Plaza Details
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
                                PlazaManagementIL plazas = json_serializer.Deserialize<PlazaManagementIL>(Constants.ParseJsonForResponceObject(JsonResponce));
                                PlazaManagementBL.MarkedDeleted();
                                PlazaManagementBL.PInsertUpdate(plazas);
                                PlazaManagementBL.DeletedData();
                                #endregion

                                plazaConfiguration = PlazaManagementBL.GetByIP(laneConfigurationFile.PlazaIP);
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

                    #endregion
                    
                    #region 03 - Get Lane Details
                    try
                    {
                        LaneManagementIL lane = new LaneManagementIL();
                        lane.LaneIP = laneConfigurationFile.LocalIP;
                        Inputjson = new JavaScriptSerializer().Serialize(lane);
                        client = new HttpClient();
                        client.BaseAddress = new Uri(BaseURL);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.PostAsync(BaseURL + "GetLaneByIPDetails", new StringContent(Inputjson, Encoding.UTF8, "application/json")).Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationRequestResponce requestResponce = json_serializer.Deserialize<IntegrationRequestResponce>(JsonResponce);
                            if (requestResponce.ResponceMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                LaneManagementIL laneD = json_serializer.Deserialize<LaneManagementIL>(Constants.ParseJsonForResponceObject(JsonResponce));
                                LaneManagementBL.MarkedDeleted();
                                LaneManagementBL.PInsertUpdate(laneD);
                                LaneManagementBL.DeletedData();
                                #endregion

                                laneConfiguration = LaneManagementBL.GetByIpAddress(laneConfigurationFile.LocalIP);
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

                    #region 04 - Get Hardware Provider Details
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

                    #region 05 - Get Hardware Type Details
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

                    #region 06 - Get Hardware Connection Type Details
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

                    #region 07 - Get Lane Hardware Details
                    try
                    {
                        HardwareManagementIL hardware = new HardwareManagementIL();
                        hardware.ClientId = plazaConfiguration.ClientId;
                        hardware.PlazaId = Convert.ToInt32(plazaConfiguration.EntryId);
                        hardware.LaneNumber = laneConfiguration.LaneNumber;
                        Inputjson = new JavaScriptSerializer().Serialize(hardware);
                        client = new HttpClient();
                        client.BaseAddress = new Uri(BaseURL);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.PostAsync(BaseURL + "GetLaneHardwareDetails", new StringContent(Inputjson, Encoding.UTF8, "application/json")).Result;
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

                    #region 08 - Get Vehicle Class Details
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

                    #region 09 - Fare Deails
                    #region Get Fare Details
                    try
                    {
                        FareDetailsIL fare = new FareDetailsIL();
                        fare.ClientId = plazaConfiguration.ClientId;
                        fare.EffectiveDate = DateTime.Now;
                        Inputjson = new JavaScriptSerializer().Serialize(fare);
                        client = new HttpClient();
                        client.BaseAddress = new Uri(BaseURL);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.PostAsync(BaseURL + "GetTollFareDetails", new StringContent(Inputjson, Encoding.UTF8, "application/json")).Result;
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
                    try
                    {
                        FareDetailsIL fare = new FareDetailsIL();
                        fare.ClientId = plazaConfiguration.ClientId;
                        fare.EffectiveDate = DateTime.Now.AddDays(1);
                        Inputjson = new JavaScriptSerializer().Serialize(fare);
                        client = new HttpClient();
                        client.BaseAddress = new Uri(BaseURL);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.PostAsync(BaseURL + "GetTollFareDetails", new StringContent(Inputjson, Encoding.UTF8, "application/json")).Result;
                        if (response.IsSuccessStatusCode)
                        {
                            var JsonResponce = response.Content.ReadAsStringAsync().Result;
                            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                            IntegrationRequestResponce requestResponce = json_serializer.Deserialize<IntegrationRequestResponce>(JsonResponce);
                            if (requestResponce.ResponceMessage.ToLower() == "success")
                            {
                                #region Data Sync
                                FareManagementIL fares = json_serializer.Deserialize<FareManagementIL>(Constants.ParseJsonForResponce(JsonResponce));
                                if (fares.EffectiveDate > DateTime.Now)
                                {
                                    string fd = fares.EffectiveDate.ToString("dd-MMM-yyyy");
                                    string nd = DateTime.Now.AddDays(1).ToString("dd-MMM-yyyy");
                                    if (fd == nd)
                                    {
                                        FareManagementBL.PInsertUpdate(fares);
                                        LogMessage("Fare next date synchronization successfully");
                                    }
                                    else
                                    {
                                        LogMessage("Fare next date is " + fd + " synchronization unsuccessfully");
                                    }
                                }
                                #endregion
                            }
                        }
                        else
                        {
                            LogMessage("Fare next API synchronization not working");
                        }

                    }
                    catch (Exception ex)
                    {
                        LogMessage("Error in fare class sync : " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                    #endregion
                    #endregion

                    #region 10 - Get Transaction Type Details
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

                    #region 11 - Get Exempt Details
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

                    #region 12 - Get Payment Details
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

                    #region 13 - Get Shift Timining Details
                    try
                    {
                        client = new HttpClient();
                        client.BaseAddress = new Uri(BaseURL);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.GetAsync(BaseURL + "GetShiftDetails").Result;
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

                    #region 25 - Get Denomination Details
                    try
                    {
                        client = new HttpClient();
                        client.BaseAddress = new Uri(BaseURL);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.GetAsync(BaseURL + "GetDenominationList").Result;
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

                    #region 01 - Get Lane Users Details
                    try
                    {

                        client = new HttpClient();
                        client.BaseAddress = new Uri(BaseURL);
                        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        response = client.GetAsync(BaseURL + "GetLaneUsersDetails").Result;
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

                    #region Get Master Config
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
                        if (Constants.IsPortOpen(laneConfigurationFile.PlazaIP, laneConfigurationFile.ApiPort, duration))
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
                        LogMessage("Entry Data Found: " + EntrypendingList.Count);
                        foreach (LaneTransactionIL EntryItem in EntrypendingList)
                        {
                            EntrypendingData = LaneTransactionBL.GetByEntryId(EntryItem.EntryId);
                            if (EntrypendingData.LaneType == 1)
                            {
                                #region Convert Image to base 64
                                if (!string.IsNullOrEmpty(EntrypendingData.TransactionImage))
                                {
                                    var FilePath = laneConfigurationFile.PrefixPath + EntrypendingData.TransactionImage;
                                    if (File.Exists(FilePath))
                                    {
                                        EntrypendingData.TransactionImage = Constants.ImagetoBase64(FilePath);
                                    }
                                }

                                #endregion

                                #region Convert Video to base 64
                                if (!string.IsNullOrEmpty(EntrypendingData.TransactionVideo))
                                {
                                    var FilePath = laneConfigurationFile.PrefixPath + EntrypendingData.TransactionVideo;
                                    if (File.Exists(FilePath))
                                    {
                                        EntrypendingData.TransactionVideo = Constants.VideotoBase64(FilePath);
                                    }
                                }
                                #endregion
                                //JavaScriptSerializer serializer = new JavaScriptSerializer();
                                //serializer.MaxJsonLength = Int32.MaxValue;serializer.Serialize(EntrypendingData);

                                EntryInputjson = new JavaScriptSerializer().Serialize(EntrypendingData);

                                LogMessage("Entry Data Packet: " + EntryInputjson);
                                Entryclient = new HttpClient();
                                Entryclient.BaseAddress = new Uri(BaseURL);
                                Entryclient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                                Entryresponse = Entryclient.PostAsync(BaseURL + "EntryLaneSync", new StringContent(EntryInputjson, Encoding.UTF8, "application/json")).Result;
                                if (Entryresponse.IsSuccessStatusCode)
                                {
                                    try
                                    {
                                        var JsonResponce = Entryresponse.Content.ReadAsStringAsync().Result;
                                        LogMessage("Entry Data Responce" + JsonResponce);
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
                                            LogMessage("Entry Lane sync : " + EntryItem.EntryId);
                                        }
                                        else
                                        {
                                            LogMessage("Faild to Exit lane sync : " + EntryItem.EntryId);
                                        }

                                    }
                                    catch (Exception ex)
                                    {
                                        LogMessage("Send to failed in Entry Lane sync : " + Inputjson);
                                        throw ex;
                                    }
                                }
                            }
                            else
                            {
                                LogMessage("Exit Lane Data not allowed in entry");
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
                                    var FilePath = laneConfigurationFile.PrefixPath + ExitpendingData.TransactionImage;
                                    if (File.Exists(FilePath))
                                    {
                                        ExitpendingData.TransactionImage = Constants.ImagetoBase64(FilePath);
                                    }
                                }

                                #endregion

                                #region Convert Video to base 64
                                if (!string.IsNullOrEmpty(ExitpendingData.TransactionVideo))
                                {
                                    var FilePath = laneConfigurationFile.PrefixPath + ExitpendingData.TransactionVideo;
                                    if (File.Exists(FilePath))
                                    {
                                        ExitpendingData.TransactionVideo = Constants.VideotoBase64(FilePath);
                                    }
                                }
                                #endregion



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
                                        LogMessage("Exit Data Responce" + JsonResponce);
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
                                            LogMessage("Exit Lane sync : " + ExitItem.EntryId);
                                        }
                                        else
                                        {
                                            LogMessage("Faild to Exit lane sync : " + ExitItem.EntryId);
                                        }
                                    }
                                    catch (Exception ex)
                                    {
                                        LogMessage("Send to failed in Exit Lane sync : " + Inputjson);
                                        throw ex;
                                    }
                                }
                            }
                            else
                            {
                                LogMessage("Entry Lane Data not allowed in exit");
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
                            ReviewpendingData = LaneTransactionReviewBL.GetByExitId(item.EntryId);
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
                                    throw ex;
                                }
                            }
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
                                //if (EntryLaneData.TransactionTypeId != laneData.TransactionTypeId)
                                //{
                                //    ResponceMessage msg1 = new ResponceMessage();
                                //    msg1.AlertMessage = "Transaction Type mismatch current lane is " + tranType.TransactionTypeName + " & entry lane have " + tranType.TransactionTypeName;
                                //    responceMessae.Add(msg1);
                                //}
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
        #endregion

        #region Helper Mehod

        #endregion

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
    }
}
