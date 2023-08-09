using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
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
using Softomation.DMS.Libraries.CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;
using Softomation.DMS.Libraries.CommonLibrary.XMLConfigurationClasses;

namespace CRDataAggregationService
{
    public partial class DataAggregationService : ServiceBase
    {
        #region Globel Variable
        volatile int onstartCheckCount = 0;
        private Queue logQueue = new Queue();
        private Thread loggerThread;
        private Thread CSDataCollectionsThread;
        private Thread BlackListProcessThread;
        private volatile Boolean stopLoggerThread = false;
        private volatile Boolean StopDataCollectionsThread = false;
        private volatile Boolean StopBlackListProcessThread = false;
        GeneralConfiguration generalConfigFile;
        string BaseURL = string.Empty;
        string Inputjson = string.Empty;
        HttpResponseMessage response = null;
        HttpClient client = null;
        DataTable PlazaList;
        string PrefixPath = string.Empty;
        #endregion

        #region Main Finction
        static void Main()
        {
            ServiceBase[] ServicesToRun;
            ServicesToRun = new ServiceBase[]
            {
                new DataAggregationService()
            };
            ServiceBase.Run(ServicesToRun);
        }
        public DataAggregationService()
        {
            InitializeComponent();

            //dont forget to comment this line
            //OnStart(new string[] { "CRDA" }); //<== only for debugging
        }
        #endregion

        protected override void OnStart(string[] args)
        {
            try
            {
                LogMessage("Starting CRDA logger thread...");
                loggerThread = new Thread(new ThreadStart(this.LoggerThreadFunction));
                loggerThread.IsBackground = true;
                loggerThread.Start();
                LogMessage("The CRDA logger has been started.");
            }
            catch (Exception)
            {
                //LogMessage("Error in starting CRDA logger thread function. CRDA cannot be started. " + ex.ToString());
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
            try
            {
                int i = 0;
                while (i < 4)
                {
                    try
                    {
                        generalConfigFile = GeneralConfiguration.Deserialize();
                        PrefixPath = ConfigurationManager.AppSettings["PrefixPath"];
                        if (string.IsNullOrEmpty(PrefixPath))
                            LogMessage("PrefixPath not found");
                        else
                        {
                            if (Directory.Exists(PrefixPath))
                                LogMessage("PrefixPath exists");
                            else
                                LogMessage("PrefixPath not exists");
                        }
                        LogMessage("Get General Config Files");
                        i = 10;
                        break;
                    }
                    catch (Exception ex)
                    {
                        LogMessage("error in getting General Config. CRDA cannot be started. " + ex.ToString());

                    }
                }
            }
            catch (Exception ex)
            {
                LogMessage("error in getting General Config. CRDA cannot be started. " + ex.ToString());
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
                LogMessage("error in starting CSDataCollectionsThread function. CRDA cannot be started. " + ex.ToString());
            }

            //try
            //{
            //    LogMessage("Starting BlackListProcessThread logger thread...");
            //    BlackListProcessThread = new Thread(new ThreadStart(this.BlackListProcessFunction));
            //    BlackListProcessThread.IsBackground = true;
            //    BlackListProcessThread.Start();
            //    LogMessage("The BlackListProcessThread logger has been started.");
            //}
            //catch (Exception ex)
            //{
            //    LogMessage("error in starting BlackListProcessThread function. CRDA cannot be started. " + ex.ToString());
            //}
        }

        protected override void OnStop()
        {
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
                StopBlackListProcessThread = true;
                Thread.Sleep(500);
                if (BlackListProcessThread != null)
                {
                    if (BlackListProcessThread.IsAlive == true)
                    {
                        BlackListProcessThread.Abort();
                    }
                }
            }
            catch (Exception ex)
            {
                LogMessage("error in storping BlackListProcessThread function. " + ex.ToString());
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

        private void CSDataCollectionsFunction()
        {
            Int16 PlazaId = 0;
            Int64 LastTransId = 0;
            while (!StopDataCollectionsThread)
            {
                try
                {
                    PlazaList = PlazaTransactionBL.PendingPlazaTransList();
                    LogMessage("PlazaList: " + PlazaList.Rows.Count.ToString());
                    foreach (DataRow row in PlazaList.Rows)
                    {
                        #region Plaza Data List
                        if (row["EntryId"] != DBNull.Value)
                            PlazaId = Convert.ToInt16(row["EntryId"]);
                        if (row["LastTransId"] != DBNull.Value)
                            LastTransId = Convert.ToInt64(row["LastTransId"]);
                        if (row["DataSendAPI"] != DBNull.Value)
                            BaseURL = Convert.ToString(row["DataSendAPI"]);
                        #endregion
                        List<PlazaTransactionIL> plazaData = PlazaTransactionBL.GetEntryPendingDataByPlaza(PlazaId, LastTransId);
                        LogMessage("plazaData: " + plazaData.Count.ToString());
                        foreach (PlazaTransactionIL pendingData in plazaData)
                        {

                            LogMessage("PrefixPath: " + PrefixPath);
                            if (!string.IsNullOrEmpty(PrefixPath))
                            {
                                #region Convert Image to base 64
                                if (!string.IsNullOrEmpty(pendingData.TransactionImage))
                                {
                                    var FilePath = PrefixPath + pendingData.TransactionImage;
                                    if (File.Exists(FilePath))
                                    {
                                        pendingData.TransactionImage = Constants.ImagetoBase64(FilePath);
                                    }
                                }

                                #endregion

                                #region Convert Video to base 64
                                if (!string.IsNullOrEmpty(pendingData.TransactionVideo))
                                {
                                    var FilePath = PrefixPath + pendingData.TransactionVideo;
                                    if (File.Exists(FilePath))
                                    {
                                        pendingData.TransactionVideo = Constants.VideotoBase64(FilePath);
                                    }
                                }
                                #endregion
                            }

                            pendingData.TransactionDateTime = pendingData.TransactionTimeStamp.ToString(Constants.DATETIME_FORMAT_String);

                            Inputjson = new JavaScriptSerializer().Serialize(pendingData);
                            //LogMessage("Data Sync to " + BaseURL + " Inputjson:" + Inputjson);
                            client = new HttpClient();
                            client.BaseAddress = new Uri(BaseURL);
                            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                            response = client.PostAsync(BaseURL, new StringContent(Inputjson, Encoding.UTF8, "application/json")).Result;
                            if (response.IsSuccessStatusCode)
                            {
                                try
                                {
                                    var JsonResponce = response.Content.ReadAsStringAsync().Result;
                                    JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                                    LaneDataSyncResponce resData = json_serializer.Deserialize<LaneDataSyncResponce>(JsonResponce);
                                    if (resData.ResponceMessage == "success")
                                    {
                                        PlazaManagementBL.UpdatePendingList(PlazaId, pendingData.EntryId);
                                        LogMessage("Data Sync to " + BaseURL + " Id:" + pendingData.EntryId.ToString());
                                    }
                                    else
                                    {
                                        LogMessage("Data failed to send at URL " + BaseURL);
                                    }
                                }
                                catch (Exception ex)
                                {
                                    LogMessage("Data failed to send at URL " + BaseURL + " Packet :" + Inputjson + " error is: " + ex.Message.ToString());
                                }
                            }
                            else
                            {
                                LogMessage("Failed to Sync Data tot URL " + BaseURL);
                            }
                            LogMessage("StatusCode: " + response.StatusCode);
                            Thread.Sleep(100);
                        }
                        Thread.Sleep(100);
                    }
                }
                catch (Exception ex)
                {
                    LogMessage("Error in CSDataCollectionsFunction" + ex.Message.ToString());


                }
                Thread.Sleep(100);
            }
        }


        private void BlackListProcessFunction()
        {
            DataTable dtblacklistdetail = new DataTable();
            dtblacklistdetail.Columns.Add(new DataColumn("TagID", typeof(string)));
            dtblacklistdetail.Columns.Add(new DataColumn("Status", typeof(string)));
            dtblacklistdetail.Columns.Add(new DataColumn("EffectiveDate", typeof(string)));
            dtblacklistdetail.Columns.Add(new DataColumn("ReasonCode", typeof(string)));
            dtblacklistdetail.Columns.Add(new DataColumn("SessionId", typeof(string)));
            var watch = new System.Diagnostics.Stopwatch();
            while (!StopBlackListProcessThread)
            {
                try
                {
                    string sourceDirectory = @"D:\FileProcess";
                    var allFiles = Directory.EnumerateFiles(sourceDirectory, "*.blt*");
                    foreach (var file in allFiles)
                    {
                        FileInfo fi = new FileInfo(file);
                        int intNoOfLines = 0;

                        string SessionId = Constants.RandomString(10);
                        watch.Start();
                        LogMessage("Process Start:" + DateTime.Now);
                        Console.WriteLine(DateTime.Now);
                        ArrayList arlist = new ArrayList();
                        using (StreamReader oReader = new StreamReader(fi.FullName))
                        {
                            string strLine;
                            while ((strLine = oReader.ReadLine()) != null)
                            {
                                if (intNoOfLines != 0)
                                {
                                    strLine = strLine + "," + SessionId + "";
                                    arlist.Add(strLine);
                                }
                                intNoOfLines++;
                            }
                        }
                        int rowCount = arlist.Count;
                        int counter = 1;
                        int init = 0;
                        int ittration = ((rowCount / 500) * 1);
                        int forEnd = ittration;
                        while (init != (rowCount - 1))
                        {
                            for (int i = init; i < forEnd; i++)
                            {
                                string[] details = arlist[i].ToString().Split(',');
                                dtblacklistdetail.Rows.Add(details[0].Trim(), details[1].Trim(), details[2].Trim(), details[3].Trim(), details[4].Trim());
                            }
                            FileProcessBL.ImportData(dtblacklistdetail, SessionId);
                            init = forEnd;
                            forEnd = forEnd + ittration;
                            if (forEnd >= rowCount)
                            {
                                forEnd = rowCount - 1;
                            }
                            //LogMessage("Process List counter :" + counter + " Init :"+init + " End :"+ forEnd);
                            dtblacklistdetail.Rows.Clear();
                            counter++;
                            Thread.Sleep(1);
                        }
                        FileProcessBL.Insert(SessionId);
                        File.Move(fi.FullName, sourceDirectory + "\\Processed\\" + fi.Name);
                        watch.Stop();
                        LogMessage($"Execution Time: {watch.ElapsedMilliseconds} ms");
                    }


                }
                catch (Exception ex)
                {
                    LogMessage("Error in BlackListProcessFunction" + ex.Message.ToString());
                }
                Thread.Sleep(100);
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

                Softomation.DMS.Libraries.CommonLibrary.Logger.Log.Write(message, Softomation.DMS.Libraries.CommonLibrary.Logger.Log.ErrorLogModule.CRDA);
            }
        }
        #endregion
    }
}
