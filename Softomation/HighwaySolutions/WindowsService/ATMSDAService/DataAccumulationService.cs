using System;
using System.Net.Http;
using System.Threading;
using System.Collections;
using System.ServiceProcess;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.BL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.SystemLogger;
using static HighwaySoluations.Softomation.CommonLibrary.Constants;
using System.Messaging;
using HighwaySoluations.Softomation.ATMSSystemLibrary.SystemConfigurations;
using System.Linq;
using System.Text;
using uPLibrary.Networking.M2Mqtt.Messages;
using uPLibrary.Networking.M2Mqtt;

namespace ATMSDAService
{
    public partial class DataAccumulationService : ServiceBase
    {

        #region Globel Variable
        volatile int onstartCheckCount = 0;
        Int32 WeatherAPIHitPerMinite = 15;
        static MessageQueue RseAtccQueue;
        static MessageQueue RseVidsQueue;
        static MessageQueue RseECBQueue;
        SystemSettingIL systemSetting;
        List<EventsTypeIL> eventsTypesList;
        List<EquipmentDetailsIL> equipmentDetailsList;
        List<EquipmentConfigIL> equipmentConfigsList;
        List<VehicleClassIL> vehicleClassesList;
        DashboardSystemDataIL ATCCdashboardSystemData;
        DashboardSystemDataIL VIDSdashboardSystemData;

        static readonly object _locdevice = new object();
        static readonly object _locClass = new object();
        static readonly object _locEvent = new object();
        static readonly object _locPosition = new object();

        #region Log Thread
        private Queue logQueue = new Queue();
        private Thread loggerThread;
        private volatile Boolean stopLoggerThread = true;
        #endregion

        #region Weather Thread
        private Thread WeatherThread;
        private volatile Boolean stopWeatherThread = true;
        #endregion

        #region MQTT
        //12.16.175.50 127.0.0.1
        string MqttIP = "127.0.0.1";
        static string[] PostTopic = { "Dashboard/ATCC", "Dashboard/VIDS" };
        static MqttClient mqttDataPostLocal = null;
        Thread MqttConnectionThread;
        volatile Boolean stopMqttConnectionThread = false;
        #endregion
        #endregion

        #region Main
        static void Main()
        {
            ServiceBase[] ServicesToRun;
            ServicesToRun = new ServiceBase[]
            {
                new DataAccumulationService()
            };
            ServiceBase.Run(ServicesToRun);
        }
        #endregion

        #region Constructor
        public DataAccumulationService()
        {
            InitializeComponent();
            //dont forget to comment this line
            //OnStart(new string[] { "DAS" }); //<== only for debugging
        }
        #endregion

        #region Event Start Stop
        protected override void OnStart(string[] args)
        {
            #region logger thread
            try
            {
                LogMessage("Starting DAS logger thread...");
                loggerThread = new Thread(new ThreadStart(this.LoggerThreadFunction));
                loggerThread.IsBackground = true;
                loggerThread.Start();
                LogMessage("The DAS logger has been started.");
            }
            catch (Exception)
            {
                //LogMessage("Error in starting DAS logger thread function. DAS cannot be started. " + ex.ToString());
            }
            #endregion
            #region Onstart multiple call check
            onstartCheckCount++;
            if (onstartCheckCount > 1)
            {
                LogMessage("Onstart called multiple time so stopping service.");
                this.Stop();
                //return;
            }
            #endregion

            #region Master Data
            try
            {
                systemSetting = SystemSettingBL.Get();
                eventsTypesList = EventsTypeBL.GetActive();
                equipmentDetailsList = EquipmentDetailsBL.GetActive();
                equipmentConfigsList = EquipmentConfigBL.GetActive();
                vehicleClassesList = VehicleClassBL.GetActive();
                ATCCdashboardSystemData = DashboardSystemDataBL.GetATCC();
                VIDSdashboardSystemData = DashboardSystemDataBL.GetVIDS();
                MQTTCreateThread();
            }
            catch (Exception ex)
            {
                systemSetting = null;
                LogMessage("Error in geting Master Data. DAS cannot be started. " + ex.ToString());
            }
            finally
            {
                if (systemSetting == null)
                {
                    LogMessage("System Setting not found so stopping service.");
                    this.Stop();

                }
                else
                {
                    WeatherAPIHitPerMinite = systemSetting.WeatherAPIHitPerMinite;
                }
            }
            #endregion

            #region Weather thread
            try
            {
                LogMessage("Starting DAS Weather thread...");
                WeatherThread = new Thread(new ThreadStart(this.WeatherThreadFunction));
                WeatherThread.IsBackground = true;
                WeatherThread.Start();
                LogMessage("The DAS Weather has been started.");
            }
            catch (Exception ex)
            {
                LogMessage("Error in starting DAS Weather thread function " + ex.ToString());
            }
            #endregion

            #region ATCC Data Queue
            try
            {
                RseAtccQueue = MSMQConfig.Create(MSMQConfig.RseAtccQueueName.Replace("{ipaddress}", "."));
                RseAtccQueue.PeekCompleted += new PeekCompletedEventHandler(RseAtccDataQueue_PeekCompleted);
                RseAtccQueue.BeginPeek();
                LogMessage("ATCC Data Queue listener has been attached.");
            }
            catch (Exception ex)
            {
                LogMessage("Failed to ATCC Data Queue listener. " + ex.Message);
            }
            #endregion

            #region VIDS Data Queue
            try
            {
                RseVidsQueue = MSMQConfig.Create(MSMQConfig.RseVidsQueueName.Replace("{ipaddress}", "."));
                RseVidsQueue.PeekCompleted += new PeekCompletedEventHandler(RseVidsDataQueue_PeekCompleted);
                RseVidsQueue.BeginPeek();
                LogMessage("VIDS Data Queue listener has been attached.");
            }
            catch (Exception ex)
            {
                LogMessage("Failed to VIDS Data Queue listener. " + ex.Message);
            }
            #endregion

            #region ECB Data Queue
            try
            {
                RseECBQueue = MSMQConfig.Create(MSMQConfig.RseECBQueueName.Replace("{ipaddress}", "."));
                RseECBQueue.PeekCompleted += new PeekCompletedEventHandler(RseECBDataQueue_PeekCompleted);
                RseECBQueue.BeginPeek();
                LogMessage("ECB Data Queue listener has been attached.");
            }
            catch (Exception ex)
            {
                LogMessage("Failed to ECB Data Queue listener. " + ex.Message);
            }
            #endregion

        }

        protected override void OnStop()
        {
            try
            {
                RseAtccQueue.PeekCompleted -= new PeekCompletedEventHandler(RseAtccDataQueue_PeekCompleted);
                RseVidsQueue.PeekCompleted -= new PeekCompletedEventHandler(RseVidsDataQueue_PeekCompleted);
                RseECBQueue.PeekCompleted -= new PeekCompletedEventHandler(RseECBDataQueue_PeekCompleted);
            }
            catch (Exception ex)
            {

                LogMessage("error in de queue. " + ex.Message.ToString() + " " + ex.Source.ToString() + " " + ex.StackTrace.ToString());
            }

            try
            {
                Thread.Sleep(500);
                stopWeatherThread = true;
                if (WeatherThread != null)
                {
                    if (WeatherThread.IsAlive == true)
                    {
                        WeatherThread.Abort();
                    }
                }
            }
            catch (Exception ex)
            {
                LogMessage("error in stoping WeatherThread function. " + ex.Message.ToString() + " " + ex.Source.ToString() + " " + ex.StackTrace.ToString());
            }

            try
            {
                MQTTStopThread();
                Thread.Sleep(100);
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
        #endregion
        
        #region Helper Methods
        #region ATCC Data Q
        private void RseAtccDataQueue_PeekCompleted(object sender, PeekCompletedEventArgs e)
        {
            MessageQueue mqRSEATCC = (MessageQueue)sender;
            Message mRSEATCC = mqRSEATCC.EndPeek(e.AsyncResult);
            EquipmentDetailsIL ATCCequipmentDetails = null;
            EquipmentConfigIL ATCCequipmentConfig = null;
            VehicleClassIL ATCCvehicleClass = null;
            string DataPacket = string.Empty;
            try
            {
                mRSEATCC.Formatter = new BinaryMessageFormatter();
                if (mRSEATCC != null)
                {
                    DataPacket = mRSEATCC.Body.ToString();
                    JavaScriptSerializer json_serializer = new JavaScriptSerializer() { MaxJsonLength = 86753090 };
                    ATCCEventIL DataEvent = json_serializer.Deserialize<ATCCEventIL>(DataPacket);
                    DataEvent.EventDate = Convert.ToDateTime(DataEvent.EventDateStamp);
                    if (string.IsNullOrEmpty(DataEvent.EquipmentIp))
                        LogMessage("ATCC:IP Not Found" + DataPacket);
                    else
                    {

                        #region Get Vehicle Class
                        if (!string.IsNullOrEmpty(DataEvent.VehicleClassName))
                        {
                            lock (_locClass)
                            {
                                ATCCvehicleClass = vehicleClassesList.SingleOrDefault(x => x.VehicleClassName == DataEvent.VehicleClassName);
                            }
                            if (ATCCvehicleClass != null)
                            {
                                DataEvent.VehicleClassId = ATCCvehicleClass.VehicleClassId;
                            }
                            else
                                LogMessage("ATCC:VehicleClass Not Found " + DataPacket);
                        }
                        else
                            LogMessage("ATCC:VehicleClass Not blank " + DataPacket);
                        #endregion

                        if (DataEvent.VehicleClassId > 0)
                        {
                            #region Get Equipment Details
                            lock (_locdevice)
                            {
                                ATCCequipmentDetails = equipmentDetailsList.SingleOrDefault(x => x.IpAddress == DataEvent.EquipmentIp);
                            }
                            if (ATCCequipmentDetails != null)
                            {
                                DataEvent.EquipmentId = ATCCequipmentDetails.EquipmentId;
                                DataEvent.ChainageNumber = ATCCequipmentDetails.ChainageNumber;
                                DataEvent.ChainageName = ATCCequipmentDetails.ChainageName;
                                DataEvent.PackageId = ATCCequipmentDetails.PackageId;
                                DataEvent.PackageName = ATCCequipmentDetails.PackageName;
                                DataEvent.ControlRoomId = ATCCequipmentDetails.ControlRoomId;
                                DataEvent.ControlRoomName = ATCCequipmentDetails.ControlRoomName;
                                DataEvent.DirectionId = ATCCequipmentDetails.DirectionId;
                                DataEvent.DirectionName = ATCCequipmentDetails.DirectionName;

                            }
                            else
                                LogMessage("ATCC:EquipmentDetails Not Found" + DataPacket);
                            #endregion

                            if (DataEvent.EquipmentId > 0) 
                            {
                                #region Get Equipment Position
                                lock (_locPosition)
                                {
                                    ATCCequipmentConfig = equipmentConfigsList.SingleOrDefault(x => x.EquipmentId == DataEvent.EquipmentId);
                                }
                                if (ATCCequipmentConfig != null)
                                {
                                    DataEvent.PositionId = ATCCequipmentConfig.PositionId;
                                    DataEvent.PositionName = ATCCequipmentConfig.PositionName;
                                }
                                else
                                    LogMessage("ATCC:EquipmentConfigsList Not Found" + DataPacket);
                                #endregion

                                #region Data Process
                                DataEvent.TransactionId = DataEvent.EventDate.ToString(DateTimeFormatTxnIdFormat);
                                List<ResponseIL> responses = ATCCEventBL.Insert(DataEvent);
                                try
                                {
                                    #region Serializer
                                    DashboardSystemDataIL dashATCC = DashboardSystemDataBL.GetATCC();
                                    var callHistory_Serializer = new JavaScriptSerializer() { MaxJsonLength = 86753090 };
                                    var sendData = callHistory_Serializer.Serialize(dashATCC);
                                    #endregion

                                    #region Publish to MQTT
                                    MqttPublish(mqttDataPostLocal, sendData, PostTopic[0], "ATCCEvents");
                                    #endregion
                                }
                                catch (Exception ex)
                                {
                                    LogMessage("error to send ATCC Events MQTT: error:" + ex.Message.ToString());
                                }
                                #endregion
                            }
                        }
                    }
                }
            }
            catch (Exception exc)
            {
                LogMessage("Error in RseAtccDataQueue : " + exc.ToString());
                if (!string.IsNullOrEmpty(DataPacket))
                    LogMessage("RseAtccDataQueue DataPacket: " + DataPacket);
            }
            finally
            {
                mqRSEATCC.Receive();
                RseAtccQueue.BeginPeek();
            }

        }
        #endregion

        #region VIDS Data Q
        private void RseVidsDataQueue_PeekCompleted(object sender, PeekCompletedEventArgs e)
        {
            MessageQueue mqRSEVIDS = (MessageQueue)sender;
            Message mRSEVIDS = mqRSEVIDS.EndPeek(e.AsyncResult);
            string DataPacket = string.Empty;
            EquipmentDetailsIL VIDSequipmentDetails = null;
            EquipmentConfigIL VIDSequipmentConfig = null;
            VehicleClassIL VIDSvehicleClass = null;
            EventsTypeIL VIDSeventsType = null;
            try
            {
                mRSEVIDS.Formatter = new BinaryMessageFormatter();
                if (mRSEVIDS != null)
                {
                    DataPacket = mRSEVIDS.Body.ToString();
                    JavaScriptSerializer json_serializer = new JavaScriptSerializer() { MaxJsonLength = 86753090 };
                    VIDSEventIL DataEvent = json_serializer.Deserialize<VIDSEventIL>(DataPacket);
                    DataEvent.EventStartDate = Convert.ToDateTime(DataEvent.EventStartDateStamp);
                    if (string.IsNullOrEmpty(DataEvent.EquipmentIp))
                        LogMessage("VIDS:IP Not Found" + DataPacket);
                    else
                    {
                        #region Get Events Class
                        if (!string.IsNullOrEmpty(DataEvent.EventTypeName))
                        {
                            lock (_locEvent)
                            {
                                VIDSeventsType = eventsTypesList.SingleOrDefault(x => x.EventTypeName == DataEvent.EventTypeName);
                            }
                            if (VIDSeventsType != null)
                            {
                                DataEvent.EventTypeId = VIDSeventsType.EventTypeId;
                            }
                            else
                                LogMessage("VIDS:EventType Not Found" + DataPacket);
                        }
                        #endregion

                        if (DataEvent.EventTypeId > 0)
                        {
                            #region Get Equipment Details
                            lock (_locdevice)
                            {
                                VIDSequipmentDetails = equipmentDetailsList.SingleOrDefault(x => x.IpAddress == DataEvent.EquipmentIp);
                            }
                            if (VIDSequipmentDetails != null)
                            {
                                DataEvent.EquipmentId = VIDSequipmentDetails.EquipmentId;
                                DataEvent.ChainageNumber = VIDSequipmentDetails.ChainageNumber;
                                DataEvent.ChainageName = VIDSequipmentDetails.ChainageName;
                                DataEvent.PackageId = VIDSequipmentDetails.PackageId;
                                DataEvent.PackageName = VIDSequipmentDetails.PackageName;
                                DataEvent.ControlRoomId = VIDSequipmentDetails.ControlRoomId;
                                DataEvent.ControlRoomName = VIDSequipmentDetails.ControlRoomName;
                            }
                            else
                                LogMessage("VIDS:EquipmentDetails Not Found" + DataPacket);
                            #endregion

                            if (DataEvent.EquipmentId > 0)
                            {
                                #region Get Equipment Position
                                lock (_locPosition)
                                {
                                    VIDSequipmentConfig = equipmentConfigsList.SingleOrDefault(x => x.EquipmentId == DataEvent.EquipmentId);
                                }
                                if (VIDSequipmentConfig != null)
                                {
                                    DataEvent.PositionId = VIDSequipmentConfig.PositionId;
                                    DataEvent.PositionName = VIDSequipmentConfig.PositionName;
                                }
                                else
                                    LogMessage("VIDS:EquipmentConfigsList Not Found" + DataPacket);
                                #endregion

                                #region Get Vehicle Class
                                if (!string.IsNullOrEmpty(DataEvent.VehicleClassName))
                                {
                                    lock (_locClass)
                                    {
                                        VIDSvehicleClass = vehicleClassesList.SingleOrDefault(x => x.VehicleClassName == DataEvent.VehicleClassName);
                                    }
                                    if (VIDSvehicleClass != null)
                                    {
                                        DataEvent.VehicleClassId = VIDSvehicleClass.VehicleClassId;
                                    }
                                }
                                #endregion

                                #region Data Process
                                DataEvent.TransactionId = DataEvent.EventStartDate.ToString(DateTimeFormatTxnIdFormat);
                                List<ResponseIL> responses = VIDSEventBL.Insert(DataEvent);
                                try
                                {
                                    #region Serializer
                                    DashboardSystemDataIL dashVIDS = DashboardSystemDataBL.GetVIDS();
                                    var callHistory_Serializer = new JavaScriptSerializer() { MaxJsonLength = 86753090 };
                                    var sendData = callHistory_Serializer.Serialize(dashVIDS);
                                    #endregion

                                    #region Publish to MQTT
                                    MqttPublish(mqttDataPostLocal, sendData, PostTopic[1], "VIDSEvents");
                                    #endregion
                                }
                                catch (Exception ex)
                                {
                                    LogMessage("error to send VIDS Events MQTT: error:" + ex.Message.ToString());
                                }
                                #endregion
                            }
                        }
                    }
                }
            }
            catch (Exception exc)
            {
                LogMessage("Error in RseVIDSDataQueue : " + exc.ToString());
                if (!string.IsNullOrEmpty(DataPacket))
                    LogMessage("RseVIDSDataQueue DataPacket: " + DataPacket);
            }
            finally
            {
                mqRSEVIDS.Receive();
                RseVidsQueue.BeginPeek();
            }

        }
        #endregion

        #region ECB Data Q
        private void RseECBDataQueue_PeekCompleted(object sender, PeekCompletedEventArgs e)
        {
            MessageQueue mqRSEECB = (MessageQueue)sender;
            Message mRSEECB = mqRSEECB.EndPeek(e.AsyncResult);
            string DataPacket = string.Empty;
            try
            {
                mRSEECB.Formatter = new BinaryMessageFormatter();
                if (mRSEECB != null)
                {
                    DataPacket = mRSEECB.Body.ToString();
                    JavaScriptSerializer json_serializer = new JavaScriptSerializer() { MaxJsonLength = 86753090 };
                    ECBCallEventIL DataEvent = json_serializer.Deserialize<ECBCallEventIL>(DataPacket);
                    DataEvent.CallStatusId = (short)CallType.Outgoing;
                    if (!string.IsNullOrEmpty(DataEvent.StartDateTimeStamp))
                        DataEvent.StartDateTime = Convert.ToDateTime(DataEvent.StartDateTimeStamp);
                    if (!string.IsNullOrEmpty(DataEvent.EndDateTimeStamp))
                        DataEvent.EndDateTime = Convert.ToDateTime(DataEvent.EndDateTimeStamp);
                    if (string.IsNullOrEmpty(DataEvent.CallerIpAddress))
                        LogMessage("Caller IP Not Found" + DataPacket);
                    else
                    {
                        #region Get Caller Equipment Details
                        var eq = equipmentDetailsList.SingleOrDefault(x => x.IpAddress == DataEvent.CallerIpAddress);
                        if (eq != null)
                        {
                            DataEvent.CallerId = eq.EquipmentId;
                            DataEvent.ChainageNumber = eq.ChainageNumber;
                            DataEvent.ChainageName = eq.ChainageName;
                            DataEvent.PackageId = eq.PackageId;
                            DataEvent.PackageName = eq.PackageName;
                            DataEvent.ControlRoomId = eq.ControlRoomId;
                            DataEvent.ControlRoomName = eq.ControlRoomName;
                            DataEvent.DirectionId = eq.DirectionId;
                            DataEvent.DirectionName = eq.DirectionName;
                            if (eq.EquipmentTypeId == (short)SystemConstants.EquipmentMasterType.ECB)
                            {
                                DataEvent.CallStatusId = (short)CallType.Incomming;
                            }
                            else if (eq.EquipmentTypeId == (short)SystemConstants.EquipmentMasterType.IpPhone)
                            {
                                DataEvent.CallStatusId = (short)CallType.Outgoing;
                            }

                        }
                        else
                            LogMessage("ECB:EquipmentDetails Not Found" + DataPacket);
                        #endregion
                    }

                    if (string.IsNullOrEmpty(DataEvent.CalleeIpAddress))
                        LogMessage("ECB:Callee IP Not Found" + DataPacket);
                    else
                    {
                        #region Get Caller Equipment Details
                        var eq = equipmentDetailsList.SingleOrDefault(x => x.IpAddress == DataEvent.CalleeIpAddress);
                        if (eq != null)
                        {
                            DataEvent.CalleeId = eq.EquipmentId;
                            DataEvent.ChainageNumber = eq.ChainageNumber;
                            DataEvent.ChainageName = eq.ChainageName;
                            DataEvent.PackageId = eq.PackageId;
                            DataEvent.PackageName = eq.PackageName;
                            DataEvent.ControlRoomId = eq.ControlRoomId;
                            DataEvent.ControlRoomName = eq.ControlRoomName;
                            DataEvent.DirectionId = eq.DirectionId;
                            DataEvent.DirectionName = eq.DirectionName;
                            if (eq.EquipmentTypeId == (short)SystemConstants.EquipmentMasterType.ECB)
                            {
                                DataEvent.CallStatusId = (short)CallType.Outgoing;
                            }
                            else if (eq.EquipmentTypeId == (short)SystemConstants.EquipmentMasterType.IpPhone)
                            {
                                DataEvent.CallStatusId = (short)CallType.Incomming;
                            }
                        }
                        else
                            LogMessage("EquipmentDetails Not Found" + DataPacket);
                        #endregion
                    }

                    #region Get Equipment Details
                    if (DataEvent.CallTypeId == (short)IPPbxCallStatusType.NotAnswered)
                    {
                        DataEvent.CallStatusId = (short)CallType.Missed;
                    }
                    else if (DataEvent.CallTypeId == (short)IPPbxCallStatusType.Completed && DataEvent.CallDuration == 0)
                    {
                        DataEvent.CallStatusId = (short)CallType.Missed;
                    }
                    else if (DataEvent.CallTypeId == (short)IPPbxCallStatusType.Busy || DataEvent.CallTypeId == (short)IPPbxCallStatusType.Aborted)
                    {
                        DataEvent.CallStatusId = (short)CallType.Rejected;
                    }
                    #endregion
                    List<ResponseIL> responses = ECBCallEventBL.Insert(DataEvent);
                }
            }
            catch (Exception exc)
            {
                LogMessage("Error in RseAtccDataQueue : " + exc.ToString());
                if (!string.IsNullOrEmpty(DataPacket))
                    LogMessage("RseAtccDataQueue DataPacket: " + DataPacket);
            }
            finally
            {
                mqRSEECB.Receive();
                RseAtccQueue.BeginPeek();
            }

        }
        #endregion

        #region Weather ThreadFunction
        void WeatherThreadFunction()
        {
            stopWeatherThread = false;
            string APIUrl = string.Empty;
            DateTime TheadStartTime = DateTime.MinValue;
            try
            {
                List<EquipmentDetailsIL> weatherList = EquipmentDetailsBL.GetByTypeId((short)SystemConstants.EquipmentMasterType.MET);
                while (!stopWeatherThread)
                {
                    try
                    {
                        if (systemSetting.IsWeatherOnline)
                        {
                            #region Online API
                            if (!string.IsNullOrEmpty(systemSetting.WeatherAPI))
                            {
                                TimeSpan ts = DateTime.Now - TheadStartTime;
                                if (ts.TotalMinutes > WeatherAPIHitPerMinite)
                                {
                                    foreach (EquipmentDetailsIL item in weatherList)
                                    {
                                        #region Weather API Request
                                        try
                                        {
                                            HttpClient client = new HttpClient();
                                            APIUrl = systemSetting.WeatherAPI.Replace("{lat}", item.Latitude.ToString());
                                            APIUrl = APIUrl.Replace("{lon}", item.Longitude.ToString());
                                            HttpResponseMessage clientResponse = client.GetAsync(APIUrl).Result;
                                            if (clientResponse.IsSuccessStatusCode)
                                            {
                                                var result = clientResponse.Content.ReadAsStringAsync().Result;
                                                JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                                                WeatherOpenAPIIL requestResponce = json_serializer.Deserialize<WeatherOpenAPIIL>(result);
                                                requestResponce.APIDateTime = UnixTimeStampToDateTimeLocal(requestResponce.dt);
                                                requestResponce.EquipmentId = item.EquipmentId;
                                                List<ResponseIL> responses = WeatherOpenAPIBL.Insert(requestResponce);
                                                if (responses.Count > 0)
                                                {
                                                    if (responses[0].AlertMessage.ToLower() == "success")
                                                    {
                                                        WeatherEventIL weather = new WeatherEventIL();
                                                        weather.EquipmentId = requestResponce.EquipmentId;
                                                        weather.EventDateTime = requestResponce.APIDateTime;
                                                        weather.AirTemperature = Convert.ToDecimal(requestResponce.main.temp);
                                                        weather.Humidity = Convert.ToDecimal(requestResponce.main.humidity);
                                                        weather.Visibility = Convert.ToDecimal(requestResponce.visibility);
                                                        weather.WindDirection = Convert.ToDecimal(requestResponce.wind.deg);
                                                        weather.WindSpeed = Convert.ToDecimal(requestResponce.wind.speed);
                                                        weather.WeatherDescription = "NA";
                                                        if (requestResponce.weather.Count > 0)
                                                        {
                                                            weather.WeatherDescription = requestResponce.weather[0].description;
                                                        }
                                                        WeatherEventBL.Insert(weather);
                                                    }
                                                }
                                            }
                                            else
                                            {
                                                LogMessage("Weather API Response failed code:" + clientResponse.StatusCode.ToString());
                                            }
                                        }
                                        catch (Exception ex)
                                        {
                                            LogMessage("error in Get Weather Request. " + ex.ToString());
                                        }
                                        finally
                                        {
                                            TheadStartTime = DateTime.Now;
                                        }
                                        #endregion
                                    }
                                }
                            }
                            #endregion
                        }
                    }
                    catch (Exception ex)
                    {
                        LogMessage("WeatherThreadFunction: Error " + ex.Message.ToString());
                    }
                    finally
                    {
                        Thread.Sleep(100);
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }

        }
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
                catch (Exception)
                {

                }
                finally
                {
                    Thread.Sleep(1);
                }
            }
        }
        private void WriteMessageFromQueue()
        {
            if (logQueue.Count > 0)
            {
                String message = (String)logQueue.Dequeue();

                LogMaster.Write(message, ErrorLogModule.BackOfficeService);
            }
        }
        #endregion

        #region MQTT Thread Events and Publish
        private void MQTTCreateThread()
        {
            try
            {
                LogMessage("Starting MqttConnectionThread..");
                stopMqttConnectionThread = false;
                MqttConnectionThread = new Thread(new ThreadStart(this.MqttConnectionFunction));
                MqttConnectionThread.IsBackground = true;
                MqttConnectionThread.Start();
                LogMessage("The MqttConnectionThread has been started.");
            }
            catch (Exception ex)
            {
                LogMessage("error in MqttConnectionThread ." + ex.ToString());
            }
        }
        private void MQTTStopThread()
        {
            try
            {
                #region Thread MQTT Connection
                stopMqttConnectionThread = true;
                Thread.Sleep(500);
                if (MqttConnectionThread != null)
                {
                    if (MqttConnectionThread.IsAlive == true)
                    {
                        MqttConnectionThread.Abort();
                    }
                }
                #endregion

                #region Remove MQTT
                try
                {
                    if (mqttDataPostLocal != null)
                    {
                        mqttDataPostLocal.Unsubscribe(PostTopic);
                    }
                }
                catch (Exception ex)
                {

                    LogMessage("error in stoping mqttDataPostLocal function. " + ex.ToString());
                }
                #endregion
            }
            catch (Exception ex)
            {

                LogMessage("error in stop MqttConnectionThread ." + ex.ToString());
            }
        }
        private void MqttConnectionFunction()
        {
            DateTime MqttThreaLastUpdateDateTime = DateTime.MinValue;
            while (!stopMqttConnectionThread)
            {
                try
                {
                    TimeSpan ts1 = DateTime.Now - MqttThreaLastUpdateDateTime;
                    if (ts1.TotalSeconds > 10)
                    {
                        if (!string.IsNullOrEmpty(MqttIP))
                        {
                            try
                            {
                                if (mqttDataPostLocal == null)
                                {
                                    mqttDataPostLocal = CreateMqttClientAndSubcribe(mqttDataPostLocal, MqttIP, PostTopic[0], (short)MqttMessageType.SendOnly);
                                }
                            }
                            catch (Exception ex)
                            {
                                LogMessage("Error in MqttConnectionFunction for MqttLocalIpAddress : " + ex.Message.ToString() + " IP: " + MqttIP);
                            }
                        }
                        MqttThreaLastUpdateDateTime = DateTime.Now;
                    }
                }
                catch (Exception ex)
                {
                    LogMessage("Error in MqttConnectionFunction sync : " + ex.Message.ToString());
                }
                finally
                {
                    Thread.Sleep(100);

                }
            }
        }
        private static string MqttPublish(MqttClient clientbroker, string strEvent, string publishTopic, string threadName)
        {
            try
            {
                ushort result = 0;
                if (clientbroker != null)
                {
                    if (clientbroker.IsConnected)
                    {
                        result = clientbroker.Publish(publishTopic, Encoding.UTF8.GetBytes(strEvent), MqttMsgBase.QOS_LEVEL_AT_MOST_ONCE, true);
                        return "success";
                    }
                    else
                    {
                        return "Broker is not connected." + threadName;
                    }
                }
                else
                {
                    return "Broker is found null." + threadName;
                }
            }
            catch (Exception e)
            {
                return e.Message.ToString();
            }
        }
        private MqttClient CreateMqttClientAndSubcribe(MqttClient obj, string IpAddress, string topic, short SendorReceive)
        {
            try
            {
                string clientId = Guid.NewGuid().ToString();
                obj = new MqttClient(IpAddress);
                obj.Connect(clientId);

            }
            catch (Exception ex)
            {
                LogMessage("Error in CreateMqttClientAndSubcribe sync : " + ex.Message.ToString());
                obj = null;
            }
            return obj;
        }
        #endregion
        #endregion
    }
}
