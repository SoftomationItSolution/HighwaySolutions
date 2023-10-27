using System;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading;
using System.Collections;
using System.ServiceProcess;
using System.Collections.Generic;
using uPLibrary.Networking.M2Mqtt;
using uPLibrary.Networking.M2Mqtt.Messages;
using HighwaySoluations.Softomation.NMSSystemLibrary;
using HighwaySoluations.Softomation.NMSSystemLibrary.IL;
using HighwaySoluations.Softomation.NMSSystemLibrary.SystemLogger;

using static HighwaySoluations.Softomation.CommonLibrary.Constants;
using HighwaySoluations.Softomation.NMSSystemLibrary.BL;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using System.Web.Script.Serialization;
using System.Threading.Tasks;

namespace NMSService
{
    public partial class NMSService : ServiceBase
    {

        #region Globel Variable

        volatile int onstartCheckCount = 0;
        static readonly object _locdevice = new object();

        List<EquipmentDetailsIL> equipmentDetailsList;

        #region Log Thread
        private Queue logQueue = new Queue();
        private Thread loggerThread;
        private volatile Boolean stopLoggerThread = true;
        #endregion

        #region MQTT
        //12.16.175.50 127.0.0.1
        string MqttIP = "127.0.0.1";
        string[] PostTopic = { "NMS/DeviceSummary", "NMS/DeviceStatus" };
        static MqttClient mqttDataPostLocal = null;
        Thread MqttConnectionThread;
        volatile Boolean stopMqttConnectionThread = false;
        #endregion

        #region Thread
        private Thread EquipmentStatusThread;
        private volatile Boolean stopEquipmentStatusThread;
        #endregion

        #endregion

        static void Main()
        {
            ServiceBase[] ServicesToRun;
            ServicesToRun = new ServiceBase[]
            {
                new NMSService()
            };
            ServiceBase.Run(ServicesToRun);
        }
        public NMSService()
        {
            InitializeComponent();
            //dont forget to comment this line
            //OnStart(new string[] { "NMS" }); //<== only for debugging
        }

        protected override void OnStart(string[] args)
        {
            #region Log Thread
            try
            {
                LogMessage("Starting FMS logger thread...");
                loggerThread = new Thread(new ThreadStart(this.LoggerThreadFunction));
                loggerThread.IsBackground = true;
                loggerThread.Start();
                LogMessage("The FMS logger has been started.");
            }
            catch (Exception)
            {
                //LogMessage("Error in starting LDSS logger thread function. LDSS cannot be started. " + ex.ToString());
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
                equipmentDetailsList = EquipmentDetailsBL.GetActive();
            }
            catch (Exception ex)
            {
                LogMessage("error in geting master data." + ex.ToString());
            }
            #endregion

            #region MQTT Connection
            try
            {
                MQTTCreateThread();
            }
            catch (Exception ex)
            {
                LogMessage("error in mqtt thread-1." + ex.ToString());
            }
            #endregion

            #region Equipment Status Updated
            try
            {
                LogMessage("Starting EquipmentStatusThread..");
                EquipmentStatusThread = new Thread(new ThreadStart(this.EquipmentStatusFunction));
                EquipmentStatusThread.IsBackground = true;
                EquipmentStatusThread.Start();
                LogMessage("The EquipmentStatusThread has been started.");
            }
            catch (Exception ex)
            {
                LogMessage("error in starting EquipmentStatusThread function." + ex.ToString());
            }
            #endregion
        }

        protected override void OnStop()
        {

            try
            {
                stopEquipmentStatusThread = true;
                if (EquipmentStatusThread != null)
                {
                    if (EquipmentStatusThread.IsAlive == true)
                    {
                        EquipmentStatusThread.Abort();
                    }
                }
            }
            catch (Exception ex)
            {
                LogMessage("error in stoping loggerThread function. " + ex.Message.ToString() + " " + ex.Source.ToString() + " " + ex.StackTrace.ToString());
            }

            try
            {
                Thread.Sleep(100);
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

        #region Equipment Status

        private void EquipmentStatusFunction()
        {
            stopEquipmentStatusThread = false;
            while (!stopEquipmentStatusThread)
            {
                try
                {
                    lock (_locdevice)
                    {
                        equipmentDetailsList = EquipmentDetailsBL.GetActive();
                    }

                    foreach (EquipmentDetailsIL item in equipmentDetailsList)
                    {
                        if (SystemConstants.ValidateIP(item.IpAddress))
                        {
                            CheckStatus(item);
                            //var task = Task.Factory.StartNew(() => CheckStatus(item));
                        }
                    }
                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
        }

        private void CheckStatus(EquipmentDetailsIL item)
        {
            try
            {
                IMCPStatusIL currentStatus = new IMCPStatusIL();
                currentStatus.IpAddress = item.IpAddress;
                currentStatus.EquipmentId = item.EquipmentId;
                currentStatus = SystemConstants.CheckStatusByIMCP(currentStatus);
                if (item.OnLineStatus != currentStatus.OnLineStatus)
                {
                    if (!currentStatus.OnLineStatus)
                    {
                        int i = 0;
                        while (i < 5)
                        {
                            currentStatus = SystemConstants.CheckStatusByIMCP(currentStatus);
                            if (currentStatus.OnLineStatus)
                            {
                                break;
                            }
                            else
                            {
                                Thread.Sleep(50);
                            }
                            i++;
                        }
                    }
                    LogMessage("Equipment Details : " + item.IpAddress + "Last Status : " + item.OnLineStatus + "Current Status : " + currentStatus.OnLineStatus);
                    item.OnLineStatus = currentStatus.OnLineStatus;
                    lock (_locdevice)
                    {
                        var deviceStatus = equipmentDetailsList.Where(n => n.IpAddress == item.IpAddress).ToList();
                        deviceStatus.ForEach(c => c.OnLineStatus = item.OnLineStatus);
                    }
                    List<ResponseIL> resp = IMCPStatusBL.Insert(currentStatus);
                    if (resp.Count > 0)
                    {
                        if (resp[0].AlertMessage.ToLower() == "success")
                        {
                            #region Mqtt Publish
                            var callHistory_Serializer = new JavaScriptSerializer() { MaxJsonLength = 86753090 };
                            var sendData = callHistory_Serializer.Serialize(item);
                            MqttPublish(mqttDataPostLocal, sendData, PostTopic[1], "NMSStatus");
                            #endregion
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                LogMessage("getting error in CheckStatus " + ex.ToString());
            }
        }
        #endregion
    }
}
