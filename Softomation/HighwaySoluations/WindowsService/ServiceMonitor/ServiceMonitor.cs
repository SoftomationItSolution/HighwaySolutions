using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.ServiceProcess;
using System.Threading;
using Softomation.DMS.Libraries.CommonLibrary;
using Softomation.DMS.Libraries.CommonLibrary.Logger;
using Softomation.DMS.Libraries.CommonLibrary.XMLConfigurationClasses;

namespace ServiceMonitor
{
    public partial class ServiceMonitor : ServiceBase
    {
        #region Globle Variable 
        String CurrentService = String.Empty;
        String[] ServiceNames = null;
        String[] LogFolderPath = null;
        String DBServiceName = null;
        String directory = String.Empty;
        System.Timers.Timer timerWindowsServiceMonitor;
        Thread memoryManagementThread;
        bool keepMemoryManagementThreadRunning = true;
        ServiceMonitorConfiguration smConfig;
        DateTime ServiceStartTime;
        #endregion

        static void Main()
        {
            ServiceBase[] ServicesToRun;
            ServicesToRun = new ServiceBase[]
            {
                new ServiceMonitor()
            };
            ServiceBase.Run(ServicesToRun);
        }

        public ServiceMonitor()
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
                LogMessage("Starting Softomation-Service-Monitor...");
                #region Get service name to be monitored
                smConfig = ServiceMonitorConfiguration.Deserialize();
                if (!string.IsNullOrEmpty(smConfig.OtherService))
                    ServiceNames = smConfig.OtherService.Split(',');

                if (!string.IsNullOrEmpty(smConfig.LogFolder))
                    LogFolderPath = smConfig.LogFolder.Split(',');

                if (!string.IsNullOrEmpty(smConfig.DatabaseService))
                    DBServiceName = smConfig.DatabaseService;
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
                try
                {
                    LogMessage("Starting Memory Moniter thread...");
                    memoryManagementThread = new Thread(new ThreadStart(MemoryManagementThreadFunction));
                    memoryManagementThread.IsBackground = true;
                    memoryManagementThread.Start();
                    LogMessage("Started Memory Moniter  transfer thread...");
                }
                catch (Exception ex)
                {
                    LogMessage("Exception in starting Memory thread. " + ex.ToString());
                }

                LogMessage("Softomation-Service-Monitor started.");
            }
            catch (Exception ex)
            {
                LogMessage("Error in starting Softomation-Service-Monitor. " + ex.ToString());
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
                if (DBServiceIsRunning())
                    CheckServiceStatus();
                else
                {
                    if (!string.IsNullOrEmpty(DBServiceName))
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

        #region Memory Management
        private void MemoryManagementThreadFunction()
        {
            while (keepMemoryManagementThreadRunning)
            {
                try
                {
                    #region processing section 
                    for (int i = 0; i < LogFolderPath.Length; i++)
                    {
                        directory = Constants.driveLetter + ":\\" + LogFolderPath[i];
                        string[] allfiles = Directory.GetFiles(directory, "*.*", SearchOption.AllDirectories);
                        foreach (string LogFilePath in allfiles)
                        {
                            DateTime creationDateTime = File.GetCreationTime(LogFilePath);
                            if (DateTime.Now.Date.AddMonths(-1) > creationDateTime.Date) //more than 1 month older files will be deleted
                            {
                                File.Delete(LogFilePath);
                                LogMessage("File deleted : " + LogFilePath);
                            }
                        }
                    }

                    //string[] subdirectoryEntries = Directory.GetDirectories(directory);
                    //for (int i = 0; i < subdirectoryEntries.Length; i++)
                    //{
                    //    DirectoryInfo di = new DirectoryInfo(subdirectoryEntries[i]);
                    //    List<String> allFiles = di.GetFiles("*.*").Select(file => file.Name).ToList();
                    //    if (allFiles.Count != 0)
                    //    {
                    //        for (int fileIndex = 0; fileIndex <= allFiles.Count - 1; fileIndex++)
                    //        {
                    //            string filePath = di + "\\" + allFiles[fileIndex];

                    //            DateTime creationDateTime = File.GetCreationTime(filePath);

                    //            if (DateTime.Now.Date.AddMonths(-1) > creationDateTime.Date) //more than 1 month older files will be deleted
                    //            {
                    //                File.Delete(filePath);
                    //                LogMessage("File deleted : " + filePath);
                    //            }
                    //        }
                    //    }
                    //}
                    #endregion
                }
                catch (Exception ex)
                {
                    LogMessage("Exception in file MemoryManagementThreadFunction. " + ex.ToString());
                }
                finally
                {
                    Thread.Sleep(5000);
                }
            }
        }
        #endregion
        private void LogMessage(string message)
        {
            Log.Write(message, Log.ErrorLogModule.ServiceMonitor);
        }
    }
}
