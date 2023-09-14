using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using HighwaySoluations.Softomation.TMSSystemLibrary.SystemConfigurations;
using HighwaySoluations.Softomation.TMSSystemLibrary.SystemLogger;
using static HighwaySoluations.Softomation.CommonLibrary.Constants;

namespace ICDProcessService
{
    public partial class ICDProcessService : ServiceBase
    {
        #region Globel Variable
        volatile int onstartCheckCount = 0;
        #region Log
        private Queue logQueue = new Queue();
        private Thread loggerThread;
        private volatile Boolean stopLoggerThread = false;
        #endregion

        #region ICD Config
        ICDConfig icdConfig;
        RequestDirectoryConfig requestDirectoryConfig;
        #endregion
        #endregion
        static void Main()
        {
            ServiceBase[] ServicesToRun;
            ServicesToRun = new ServiceBase[]
            {
                new ICDProcessService()
            };
            ServiceBase.Run(ServicesToRun);
        }
        public ICDProcessService()
        {
            InitializeComponent();
            //dont forget to comment this line
            OnStart(new string[] { "ICDPS" }); //<== only for debugging
        }

        protected override void OnStart(string[] args)
        {
            try
            {
                LogMessage("Starting ICDPS logger thread...");
                loggerThread = new Thread(new ThreadStart(this.LoggerThreadFunction));
                loggerThread.IsBackground = true;
                loggerThread.Start();
                LogMessage("The ICDPS logger has been started.");
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

            #region icd Config
            icdConfig = ICDConfig.Deserialize();
            if (icdConfig == null)
            {
                LogMessage("icdConfig is config is missing");
                this.Stop();
                return;
            }
            else 
            {
                if (string.IsNullOrEmpty(icdConfig.ICDVersion)) 
                {
                    LogMessage("ICD version is missing from config");
                    this.Stop();
                    return;
                }
            }
            requestDirectoryConfig = RequestDirectoryConfig.Deserialize();

            if (icdConfig.ICDVersion == "2.5") 
            {
                //_QueryApiInsert = new Thread(RunQueryApiInsert);
                //_QueryApiInsert.Start();
            }

            #endregion
        }

        protected override void OnStop()
        {
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

                LogMaster.Write(message, ErrorLogModule.BackOfficeService);
            }
        }
        #endregion
    }
}
