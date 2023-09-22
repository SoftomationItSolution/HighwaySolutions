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
using HighwaySoluations.Softomation.TMSSystemLibrary;
using HighwaySoluations.Softomation.TMSSystemLibrary.BL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
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


        private Thread TagRequestThread;
        private volatile Boolean stopTagRequest = false;

        private Thread ViolationAuditRequestThread;
        private volatile Boolean stopViolationAuditRequest = false;

        private Thread SyncTimeRequestThread;
        private volatile Boolean stopSyncTimeRequest = false;

        private Thread HeartBeatRequestThread;
        private volatile Boolean stopHearBeatRequest = false;

        private Thread ReqPayRequestThread;
        private volatile Boolean stopReqPayRequest = false;
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

            string dtone = Convert.ToString(DateTime.Now.ToShortDateString());
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
                try
                {
                    LogMessage("Starting ReqPay thread...");
                    ReqPayRequestThread = new Thread(new ThreadStart(this.ReqPayRequestThreadFunction));
                    ReqPayRequestThread.IsBackground = true;
                    ReqPayRequestThread.Start();
                    LogMessage("The ReqPay has been started.");
                }
                catch (Exception ex)
                {
                    LogMessage("Error in starting ReqPay thread function. " + ex.ToString());
                }

                try
                {
                    LogMessage("Starting TagRequestThread thread...");
                    TagRequestThread = new Thread(new ThreadStart(this.TagRequestThreadFunction));
                    TagRequestThread.IsBackground = true;
                    TagRequestThread.Start();
                    LogMessage("The TagRequestThread has been started.");
                }
                catch (Exception ex)
                {
                    LogMessage("Error in starting TagRequest thread function. " + ex.ToString());
                }

                try
                {
                    LogMessage("Starting SyncTimeRequest thread...");
                    SyncTimeRequestThread = new Thread(new ThreadStart(this.SyncTimeRequestThreadFunction));
                    SyncTimeRequestThread.IsBackground = true;
                    SyncTimeRequestThread.Start();
                    LogMessage("The SyncTimeRequest has been started.");
                }
                catch (Exception ex)
                {
                    LogMessage("Error in starting SyncTimeRequest thread function. " + ex.ToString());
                }

                try
                {
                    LogMessage("Starting ViolationAuditRequest thread...");
                    ViolationAuditRequestThread = new Thread(new ThreadStart(this.ViolationAuditRequestThreadFunction));
                    ViolationAuditRequestThread.IsBackground = true;
                    ViolationAuditRequestThread.Start();
                    LogMessage("The ViolationAuditRequest has been started.");
                }
                catch (Exception ex)
                {
                    LogMessage("Error in starting ViolationAuditRequest thread function. " + ex.ToString());
                }

                try
                {
                    LogMessage("Starting HearBeatRequest thread...");
                    HeartBeatRequestThread = new Thread(new ThreadStart(this.HeartBeatRequestThreadFunction));
                    HeartBeatRequestThread.IsBackground = true;
                    HeartBeatRequestThread.Start();
                    LogMessage("The HearBeatRequest has been started.");
                }
                catch (Exception ex)
                {
                    LogMessage("Error in starting HearBeatRequest thread function. " + ex.ToString());
                }
            }
            #endregion
        }

        protected override void OnStop()
        {
        }

        #region ReqPay Request
        private void ReqPayRequestThreadFunction()
        {
            stopTagRequest = false;
            while (!stopTagRequest)
            {
                try
                {
                    List<ICDRequestPaymentDetailsIL> data = ICDRequestPaymentDetailsBL.GetPendingRequest();
                    foreach (ICDRequestPaymentDetailsIL item in data)
                    {
                        GenerateRequestDetails.ProcessReqPayRequest(item, icdConfig, requestDirectoryConfig.RequestPay);
                        ICDRequestPaymentDetailsBL.RequestProcess(item);
                        Thread.Sleep(50);
                    }
                }
                catch (Exception ex)
                {
                    LogMessage("ReqPayRequestThreadFunction: Error " + ex.Message.ToString());
                }
                finally
                {
                    Thread.Sleep(50);
                }
            }
        }
        #endregion

        #region Tag Request
        private void TagRequestThreadFunction()
        {
            stopTagRequest = false;
            while (!stopTagRequest)
            {
                try
                {
                    List<ICDTagDetailsIL> data = ICDTagDetailsBL.GetPendingRequest();
                    foreach (ICDTagDetailsIL item in data)
                    {
                        GenerateRequestDetails.ProcessTagDetailsRequest(item, icdConfig, requestDirectoryConfig.RequestTagDetails);
                        ICDTagDetailsBL.RequestProcess(item);
                        Thread.Sleep(50);
                    }
                }
                catch (Exception ex)
                {
                    LogMessage("TagRequestThreadFunction: Error " + ex.Message.ToString());
                }
                finally
                {
                    Thread.Sleep(50);
                }
            }
        }
        #endregion

        #region Violation Audit Request
        private void ViolationAuditRequestThreadFunction()
        {
            stopViolationAuditRequest = false;
            while (!stopViolationAuditRequest)
            {
                try
                {
                    List<ICDViolationAuditDetailsRequestIL> data = ICDViolationAuditDetailsRequestBL.GetPendingRequest();
                    foreach (ICDViolationAuditDetailsRequestIL item in data)
                    {
                        GenerateRequestDetails.ProcessViolationAuditDetailsRequest(item, icdConfig, requestDirectoryConfig.RequestVoilationAuditDetails);
                        ICDViolationAuditDetailsRequestBL.RequestProcess(item);
                        Thread.Sleep(50);
                    }
                }
                catch (Exception ex)
                {
                    LogMessage("ViolationAuditRequestThreadFunction: Error " + ex.Message.ToString());
                }
                finally
                {
                    Thread.Sleep(50);
                }
            }
        }
        #endregion

        #region Sync Time Request
        private void SyncTimeRequestThreadFunction()
        {
            stopSyncTimeRequest = false;
            while (!stopSyncTimeRequest)
            {
                try
                {
                    List<ICDSyncTimeDetailsIL> data = ICDSyncTimeDetailsBL.GetPendingRequest();
                    foreach (ICDSyncTimeDetailsIL item in data)
                    {
                        GenerateRequestDetails.ProcessSyncTimeDetailsRequest(item, icdConfig, requestDirectoryConfig.RequestSyncTime);
                        ICDSyncTimeDetailsBL.RequestProcess(item);
                        Thread.Sleep(50);
                    }
                }
                catch (Exception ex)
                {
                    LogMessage("SyncTimeRequestThreadFunction: Error " + ex.Message.ToString());
                }
                finally
                {
                    Thread.Sleep(50);
                }
            }
        }
        #endregion

        #region Heart Beat Request
        private void HeartBeatRequestThreadFunction()
        {
            stopHearBeatRequest = false;
            while (!stopHearBeatRequest)
            {
                try
                {
                    List<ICDHeartBeatDetailsIL> data = ICDHeartBeatDetailsBL.GetPendingRequest();
                    foreach (ICDHeartBeatDetailsIL item in data)
                    {
                        GenerateRequestDetails.ProcessHeartBeatDetailsRequest(item, icdConfig, requestDirectoryConfig.RequestSyncTime);
                        ICDHeartBeatDetailsBL.RequestProcess(item);
                        Thread.Sleep(50);
                    }
                }
                catch (Exception ex)
                {
                    LogMessage("HeartBeatRequestThreadFunction: Error " + ex.Message.ToString());
                }
                finally
                {
                    Thread.Sleep(50);
                }
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
