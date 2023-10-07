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


namespace ATMSDAService
{
    public partial class DataAccumulationService : ServiceBase
    {

        #region Globel Variable
        volatile int onstartCheckCount = 0;
        Int32 WeatherAPIHitPerMinite = 15;
        SystemSettingIL systemSetting;
        List<EventsTypeIL> eventsTypesList;
        #region Log Thread
        private Queue logQueue = new Queue();
        private Thread loggerThread;
        private volatile Boolean stopLoggerThread = true;
        #endregion

        #region Weather Thread
        private Thread WeatherThread;
        private volatile Boolean stopWeatherThread = true;
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
            //1696687951

            //var APIDateTime = UnixTimeStampToDateTimeLocal(1696687951);
            InitializeComponent();
            //dont forget to comment this line
            OnStart(new string[] { "DAS" }); //<== only for debugging
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
                return;
            }
            #endregion

            #region Master Data Setting
            try
            {
                systemSetting = SystemSettingBL.Get();
                eventsTypesList = EventsTypeBL.GetActive();
            }
            catch (Exception ex)
            {
                systemSetting = null;
                LogMessage("Error in geting Master Data Setting. DAS cannot be started. " + ex.ToString());
            }
            finally
            {
                if (systemSetting == null)
                {
                    LogMessage("System Setting not found so stopping service.");
                    this.Stop();
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


        }

        protected override void OnStop()
        {

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
        #endregion


        #region Helper Methods
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
        #endregion
    }
}
