using System;
using System.Threading;
using System.Reflection;
using System.ServiceProcess;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.SystemLogger;
using static HighwaySoluations.Softomation.CommonLibrary.Constants;
using HighwaySoluations.Softomation.ATMSSystemLibrary.SystemConfigurations;


namespace ServiceMoniter
{
    public partial class ServiceMoniter : ServiceBase
    {
        #region Globle Variable 
        String CurrentService = String.Empty;
        String[] ServiceNames = null;
        String DBServiceName = null;
        System.Timers.Timer timerWindowsServiceMonitor;
        ServiceMonitorIL smConfig;
        DateTime ServiceStartTime;
        #endregion


        static void Main()
        {
            ServiceBase[] ServicesToRun;
            ServicesToRun = new ServiceBase[]
            {
                new ServiceMoniter()
            };
            ServiceBase.Run(ServicesToRun);
        }
        public ServiceMoniter()
        {
            InitializeComponent();

            //dont forget to comment this line

            //OnStart(new string[] { "SM" }); //<== only for debugging
        }

        protected override void OnStart(string[] args)
        {
            try
            {

                LogMessage("Current Version: " + Assembly.GetExecutingAssembly().GetName().Version);
                LogMessage("Starting Service-Monitor...");

                #region Get service name to be monitored
                try
                {
                    smConfig = ServiceMonitorConfig.Deserialize();
                }
                catch (Exception ex)
                {

                    LogMessage("Unable to read Config file" + ex.Message.ToString());
                }

                if (smConfig != null)
                {
                    if (!string.IsNullOrEmpty(smConfig.OtherService))
                        ServiceNames = smConfig.OtherService.Split(',');



                    if (!string.IsNullOrEmpty(smConfig.DatabaseService))
                        DBServiceName = smConfig.DatabaseService;
                }
                #endregion
                #region Starting service monitor timer
                if (ServiceNames != null)
                {
                    ServiceStartTime = DateTime.Now;
                    LogMessage("Starting windows service monitor timer.");
                    timerWindowsServiceMonitor = new System.Timers.Timer();
                    timerWindowsServiceMonitor.Elapsed += new System.Timers.ElapsedEventHandler(timerWindowsServiceMonitor_Elapsed);
                    timerWindowsServiceMonitor.Interval = 10 * 1000;
                    timerWindowsServiceMonitor.Enabled = true;
                    timerWindowsServiceMonitor.Start();

                    LogMessage("timerWindowsServiceMonitor timer started successfully.");
                }
                else
                {
                    LogMessage("timerWindowsServiceMonitor timer not started due to no servce found.");
                }
                #endregion

                

            }
            catch (Exception ex)
            {
                LogMessage("Error in starting Scaipl-Service-Monitor. " + ex.ToString());
                this.Stop();
                return;
            }
        }

        protected override void OnStop()
        {
            try
            {
                timerWindowsServiceMonitor.Elapsed -= new System.Timers.ElapsedEventHandler(timerWindowsServiceMonitor_Elapsed);
                timerWindowsServiceMonitor.Enabled = false;
                timerWindowsServiceMonitor.Stop();
            }
            catch (Exception ex)
            {
                LogMessage("Error to stop timer :" + ex.Message.ToString());
            }
            

        }

        #region Service Start
        void timerWindowsServiceMonitor_Elapsed(object sender, System.Timers.ElapsedEventArgs e)
        {
            try
            {
                timerWindowsServiceMonitor.Stop();// Stop timer so that task can be finished

                if (!string.IsNullOrEmpty(DBServiceName))
                {
                    if (DBServiceIsRunning())
                        CheckServiceStatus();
                    else
                    {
                        TimeSpan ts = DateTime.Now - ServiceStartTime;
                        LogMessage("DB Service not running. " + DBServiceName);
                        if (ts.TotalMinutes > 1)
                        {
                            LogMessage("Going to start DB Service. " + DBServiceName);
                            StartService(DBServiceName, 100000);
                        }
                    }
                }
                else
                {
                    CheckServiceStatus();
                }


            }
            catch (Exception ex)
            {
                LogMessage("Failed to check windows service status. " + ex.ToString());
            }
            finally
            {
                timerWindowsServiceMonitor.Start();// Resume timer
            }
        }

        private Boolean DBServiceIsRunning()
        {
            if (!string.IsNullOrEmpty(DBServiceName))
                return IsServiceRunning(DBServiceName);
            else
                return true;
        }

        private void CheckServiceStatus()
        {
            for (Int32 i = 0; i < ServiceNames.Length; i++)
            {
                bool checkStatus = true;

                if (checkStatus)
                {
                    #region Start service if not running
                    CurrentService = ServiceNames[i].ToString();
                    if (!IsServiceRunning(CurrentService))
                    {
                        try
                        {
                            LogMessage(CurrentService + " is found stopped. Trying to start...");
                            StartService(CurrentService, 100000);
                        }
                        catch (Exception ex)
                        {
                            LogMessage("Failed to start service: " + CurrentService + ". See corresponding log." + ex.ToString());
                        }
                    }
                    else
                    {
                        //TimeSpan ts = DateTime.Now - ServiceStartTime;
                        //LogMessage("DB Service not running. " + DBServiceName);
                        //if (ts.TotalMinutes > 30) 
                        //{
                        //    StopService(CurrentService, 100000);
                        //}
                    }

                    #endregion
                }
            }
        }
        private Boolean IsServiceRunning(String ServiceName)
        {
            return IsWindowsServiceRunning(ServiceName);
        }
        private static Boolean IsWindowsServiceRunning(String ServiceName)
        {
            Boolean result = false;

            ServiceController[] services = ServiceController.GetServices();

            foreach (ServiceController sc in services)
            {
                if (sc.ServiceName.ToLower().Contains(ServiceName.ToLower()))
                {
                    result = (sc.Status == ServiceControllerStatus.Running);
                    break;
                }
            }

            return result;
        }
        public void StartService(string serviceName, int timeoutMilliseconds)
        {
            try
            {
                StartWindowsService(serviceName, timeoutMilliseconds);
                LogMessage(serviceName + " has been started.");
            }
            catch (Exception ex)
            {
                LogMessage("Failed to start service: " + serviceName + "error:" + ex.ToString());
            }
        }
        public void StopService(string serviceName, int timeoutMilliseconds)
        {
            try
            {
                ServiceController service = new ServiceController(serviceName);
                TimeSpan timeout = TimeSpan.FromMilliseconds(timeoutMilliseconds);
                service.Stop();
                service.WaitForStatus(ServiceControllerStatus.Running, timeout);

                LogMessage(serviceName + " has been stoped.");
            }
            catch (Exception ex)
            {
                LogMessage("Failed to start service: " + serviceName + "error:" + ex.ToString());
            }
        }
        public static void StartWindowsService(string serviceName, int timeoutMilliseconds)
        {
            ServiceController service = new ServiceController(serviceName);
            TimeSpan timeout = TimeSpan.FromMilliseconds(timeoutMilliseconds);
            service.Start();
            service.WaitForStatus(ServiceControllerStatus.Running, timeout);
        }
        #endregion
        private void LogMessage(string message)
        {
            LogMaster.Write(message, ErrorLogModule.ServiceMonitor);
        }
    }
}
