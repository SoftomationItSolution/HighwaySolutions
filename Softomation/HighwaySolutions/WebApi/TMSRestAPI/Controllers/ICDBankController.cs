using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Web.Http;
using System.Xml.Linq;
using TMSRestAPI.Models;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.BL;
using HighwaySoluations.Softomation.TMSSystemLibrary.SystemConfigurations;
using HighwaySoluations.Softomation.TMSSystemLibrary.SystemLogger;
using static HighwaySoluations.Softomation.CommonLibrary.Constants;

namespace TMSRestAPI.Controllers
{
    public class ICDBankController : ApiController
    {
        ResponseDirectoryConfig responseDirectoryConfig = ResponseDirectoryConfig.Deserialize();
        private static bool RemoteCertValidate(object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslpolicyerrors)
        {
            return true;
        }


        internal static void BankOfficeAPILog(string message)
        {
            LogMaster.Write(message, ErrorLogModule.BankOfficeAPI);
        }

        [Route("Rocket/GetResponsePay")]
        [HttpPost]
        public async System.Threading.Tasks.Task<IHttpActionResult> GetResponsePay()
        {
            try
            {
                ICDResponsePayIL icd = new ICDResponsePayIL();
                icd.FilePath = responseDirectoryConfig.ResponsePay;
                BankOfficeAPILog("ResponsePay-PayResponse  initiated.");
                XDocument doc = XDocument.Load(await Request.Content.ReadAsStreamAsync());
                foreach (XElement element in doc.Descendants("Head"))
                {
                    icd.MsgId = Convert.ToString(element.Attribute("msgId").Value);

                }
                icd.FilePath += DateTime.Now.ToString("ddMMyyyy") + "\\";
                if (!Directory.Exists(icd.FilePath))
                {
                    Directory.CreateDirectory(Path.GetDirectoryName(icd.FilePath));
                }
                icd.SaveLoc = @"" + icd.FilePath + icd.MsgId + ".xml";
                doc.Save(icd.SaveLoc);
                BankOfficeAPILog("ResponsePay-PayResponse file " + icd.MsgId + ".xml saved successfully.");
                icd = DataModel.ReadXMLFile(icd);
                if (icd.IsResponseFileSuccess)
                {
                    ICDResponsePayBL.Insert(icd);
                }
                else
                {
                    BankOfficeAPILog("ResponsePay-PayResponse file " + icd.MsgId + ".xml not inserted in DB.");
                }
                BankOfficeAPILog("ResponsePay-PayResponse file " + icd.MsgId + ".xml Accepted successfully.");
                return StatusCode(HttpStatusCode.Accepted);
            }
            catch (Exception ex)
            {
                BankOfficeAPILog("Error: Get CCH File :" + ex.Message + "-" + ex.StackTrace);
                BankOfficeAPILog("Error: ResponsePay " + ex.Message + ex.StackTrace);
                return StatusCode(HttpStatusCode.ExpectationFailed);
            }
        }

        [Route("Rocket/CheckTransactionStatusResponsePay")]
        [HttpPost]
        public async System.Threading.Tasks.Task<IHttpActionResult> CheckTransactionStatusResponsePay()
        {
            try
            {
                BankOfficeAPILog("ChkTransactionStatusResponse-CheckTransactionStatusResponsePay  initiated.");

                ICDTransactionStatusIL icd = new ICDTransactionStatusIL();

                XDocument doc = XDocument.Load(await Request.Content.ReadAsStreamAsync());
                foreach (XElement element in doc.Descendants("Head"))
                {
                    icd.TransactionMessageId = Convert.ToString(element.Attribute("msgId").Value);

                }

                icd.FilePath += DateTime.Now.ToString("ddMMyyyy") + "\\";
                if (!Directory.Exists(icd.FilePath))
                {
                    Directory.CreateDirectory(Path.GetDirectoryName(icd.FilePath));
                }
                icd.FileSaveLocation = @"" + icd.FilePath + icd.TransactionMessageId + ".xml";
                doc.Save(icd.FileSaveLocation);

                BankOfficeAPILog("ChkTransactionStatusResponse-Check Txn status response file " + icd.TransactionMessageId + ".xml saved successfully.");
                var directory = new DirectoryInfo(icd.FilePath);
                var myFile = (from f in directory.GetFiles()
                              orderby f.LastWriteTime descending
                              select f).First();
                icd.FileReadLocation = Convert.ToString(myFile);
                icd = DataModel.ReadXMLFile(icd);
                string New_FileName = @"" + icd.FilePath + icd.TransactionMessageId + ".xml";
                if (File.Exists(New_FileName))
                    New_FileName = @"" + icd.FilePath + icd.TransactionMessageId + "_" + DateTime.Now.ToString("ddMMyyyHHmmssfff") + ".xml";
                File.Move(icd.FileSaveLocation, New_FileName);
                ICDTransactionStatusBL.Insert(icd);
                BankOfficeAPILog("ChkTransactionStatusResponse-Check Txn status Response file " + icd.TransactionMessageId + ".xml Accepted successfully.");
                return StatusCode(HttpStatusCode.Accepted);

            }
            catch (Exception ex)
            {
                BankOfficeAPILog("Error: CheckTransactionStatusResponsePay :" + ex.Message + "-" + ex.StackTrace);
                BankOfficeAPILog("Error: CheckTransactionStatusResponsePay: " + ex.Message + ex.StackTrace);
                return StatusCode(HttpStatusCode.ExpectationFailed);
            }


        }

        [Route("Rocket/QueryExceptionListResponsePay")]
        [HttpPost]
        public async System.Threading.Tasks.Task<IHttpActionResult> QueryExceptionListResponsePay()
        {
            try
            {
                ICDQueryExceptionIL icd = new ICDQueryExceptionIL();
                BankOfficeAPILog("QueryExceptionResponse-QueryExceptionListResponsePay  initiated.");
                BankOfficeAPILog("QueryExceptionResponse-Going to load response data in xml file started");
                XDocument doc = XDocument.Load(await Request.Content.ReadAsStreamAsync());
                BankOfficeAPILog("QueryExceptionResponse-Going to load response data in xml file finished");
                BankOfficeAPILog("QueryExceptionResponse-Going to read msgid from file started");
                foreach (XElement element in doc.Descendants("Head"))
                {
                    icd.MessageId = Convert.ToString(element.Attribute("msgId").Value);

                }
                icd.FilePath = responseDirectoryConfig.ResponseQueryException;

                BankOfficeAPILog("QueryExceptionResponse-Going to read msgid from file finished " + icd.MessageId);

                string ExceptionList_OrgFilePath = icd.FilePath + "Download" + "\\";
                if (!Directory.Exists(ExceptionList_OrgFilePath))
                {
                    Directory.CreateDirectory(Path.GetDirectoryName(ExceptionList_OrgFilePath));
                }
                string ExceptionList_DestFilePath = icd.FilePath + "Inserted" + "\\";
                if (!Directory.Exists(ExceptionList_DestFilePath))
                {
                    Directory.CreateDirectory(Path.GetDirectoryName(ExceptionList_DestFilePath));
                }
                BankOfficeAPILog("ExceptionList_OrgFilePath " + ExceptionList_OrgFilePath + "  ExceptionList_DestFilePath " + ExceptionList_DestFilePath);
                icd.FileSaveLocation = @"" + ExceptionList_OrgFilePath + icd.MessageId + DateTime.Now.ToString("dd-MM-yyyy") + "-" + DateTime.Now.ToString("hh-mm-ss") + ".xml";
                BankOfficeAPILog("QueryExceptionResponse-Going to save xml file started " + icd.FileSaveLocation);
                doc.Save(icd.FileSaveLocation);
                BankOfficeAPILog("QueryExceptionResponse-Going to save xml file finished " + icd.FileSaveLocation);
                var directory = new DirectoryInfo(ExceptionList_OrgFilePath);
                int length = directory.GetFiles().Length;
                for (int i = 0; i < length; i++)
                {

                    var myFile = (from f in directory.GetFiles()
                                  orderby f.CreationTime ascending
                                  select f).First();
                    icd.FileReadLocation = Convert.ToString(myFile);
                    icd = DataModel.ReadXMLFile(icd, @"" + icd.FilePath + "Download\\" + icd.FileReadLocation);
                    string New_FileName = @"" + ExceptionList_DestFilePath + myFile.Name;
                    try
                    {
                        if (File.Exists(@"" + ExceptionList_OrgFilePath + myFile.Name))
                        {
                            File.Move(@"" + icd.FilePath + "Download\\" + icd.FileReadLocation, New_FileName);
                            BankOfficeAPILog("QueryExceptionResponse-File moved successfully from " + @"" + icd.FilePath + "Download\\" + icd.FileReadLocation + "  to " + New_FileName);
                        }
                    }
                    catch (Exception ex)
                    {
                        BankOfficeAPILog("QueryExceptionResponse-move error " + ex.Message + " " + ex.Source + " " + ex.StackTrace);
                    }
                    ICDQueryExceptionBL.Insert(icd);
                    BankOfficeAPILog("QueryExceptionResponse-Query Exception Response file " + myFile.Name + " Accepted successfully.");

                }
                return StatusCode(HttpStatusCode.Accepted);

            }
            catch (Exception ex)
            {
                BankOfficeAPILog("Error: QueryExceptionListResponsePay :" + ex.Message + "-" + ex.Source + " " + ex.StackTrace);
                return StatusCode(HttpStatusCode.ExpectationFailed);
            }


        }

        [Route("Rocket/SyncTimeResponse")]
        [HttpPost]
        public async System.Threading.Tasks.Task<IHttpActionResult> SyncTimeResponse()
        {
            try
            {
                BankOfficeAPILog("SyncTimeResponse-syncTimeResponse  initiated.");
                ICDTimeResponseIL icd = new ICDTimeResponseIL();
                XDocument doc = XDocument.Load(await Request.Content.ReadAsStreamAsync());
                icd.FilePath = responseDirectoryConfig.ResponseSyncTime;
                foreach (XElement element in doc.Descendants("Head"))
                {
                    icd.MessageId = Convert.ToString(element.Attribute("msgId").Value);
                }
                if (!Directory.Exists(icd.FilePath))
                {
                    Directory.CreateDirectory(Path.GetDirectoryName(icd.FilePath));
                }
                icd.FileSaveLocation = @"" + icd.FilePath + icd.MessageId + ".xml";
                doc.Save(icd.FileSaveLocation);
                BankOfficeAPILog("SyncTimeResponse-Sync Time  response File " + icd.MessageId + ".xml saved successfully.");
                var directory = new DirectoryInfo(icd.FilePath);
                var myFile = (from f in directory.GetFiles()
                              orderby f.LastWriteTime descending
                              select f).First();
                icd.FileReadLocation = Convert.ToString(myFile);
                icd = DataModel.ReadXMLFile(icd);
                string New_FileName = @"" + icd.FilePath + icd.MessageId + ".xml";
                if (File.Exists(New_FileName))
                    New_FileName = @"" + icd.FilePath + icd.MessageId + "_" + DateTime.Now.ToString("ddMMyyyyHHmmssfff") + ".xml";
                File.Move(icd.FileSaveLocation, New_FileName);
                ICDTimeResponseBL.Insert(icd);
                BankOfficeAPILog("SyncTimeResponse-Sync time  Response file " + icd.MessageId + ".xml Accepted successfully.");
                return StatusCode(HttpStatusCode.Accepted);

            }
            catch (Exception ex)
            {
                BankOfficeAPILog("Error: syncTimeResponse :" + ex.Message + "-" + ex.StackTrace);
                return StatusCode(HttpStatusCode.ExpectationFailed);
            }

        }

        [Route("Rocket/TagDetailsResponse")]
        [HttpPost]
        public async System.Threading.Tasks.Task<IHttpActionResult> TagDetailsResponse()
        {
            try
            {
                ICDTagDetailsIL icd = new ICDTagDetailsIL();
                BankOfficeAPILog("TagDetailsResponse-TagDetailsResponse  initiated.");
                XDocument doc = XDocument.Load(await Request.Content.ReadAsStreamAsync());
                foreach (XElement element in doc.Descendants("Head"))
                {
                    icd.MessageId = Convert.ToString(element.Attribute("msgId").Value);

                }
                icd.FilePath = responseDirectoryConfig.ResponseTagDetails;
                if (!Directory.Exists(icd.FilePath))
                {
                    Directory.CreateDirectory(Path.GetDirectoryName(icd.FilePath));
                }
                icd.FileSaveLocation = @"" + icd.FilePath + icd.MessageId + ".xml";
                doc.Save(icd.FileSaveLocation);
                BankOfficeAPILog("TagDetailsResponse-Tag Deatils response file " + icd.MessageId + ".xml saved successfully.");
                var directory = new DirectoryInfo(icd.FilePath);
                var myFile = (from f in directory.GetFiles()
                              orderby f.LastWriteTime descending
                              select f).First();
                icd.FileReadLocation = Convert.ToString(myFile);
                icd = DataModel.ReadXMLFile(icd);
                string New_FileName = @"" + icd.FilePath + icd.MessageId + ".xml";
                if (File.Exists(New_FileName))
                    New_FileName = @"" + icd.FilePath + icd.MessageId + "_" + DateTime.Now.ToString("ddMMyyyyHHmmssfff") + ".xml";
                File.Move(icd.FileSaveLocation, New_FileName);
                if (icd.IsTagRespoSuccess)
                {
                    ICDTagDetailsBL.Insert(icd);
                }
                else
                {
                    BankOfficeAPILog("TagDetailsResponse-Tag Details Response file " + icd.MessageId + ".xml insert Failed");
                }
                BankOfficeAPILog("TagDetailsResponse-Tag details Response file " + icd.MessageId + ".xml Accepted successfully.");
                return StatusCode(HttpStatusCode.Accepted);

            }
            catch (Exception ex)
            {
                BankOfficeAPILog("Error: Tag Details Response :" + ex.Message + "-" + ex.StackTrace);
                return StatusCode(HttpStatusCode.ExpectationFailed);
            }
        }

        [Route("Rocket/HeartBeatResponse")]
        [HttpPost]
        public async System.Threading.Tasks.Task<IHttpActionResult> HeartBeatResponse()
        {
            try
            {
                ICDHeartBeatResponseIL icd = new ICDHeartBeatResponseIL();
                BankOfficeAPILog("HeartBeatResponse-Heart Beat Response initiated.");
                var content = await Request.Content.ReadAsStringAsync();
                BankOfficeAPILog("HeartBeatResponse-Going to read response finished " + content.ToString());
                XDocument doc = XDocument.Load(await Request.Content.ReadAsStreamAsync());
                foreach (XElement element in doc.Descendants("Head"))
                {
                    icd.MessageId = Convert.ToString(element.Attribute("msgId").Value);
                }
                BankOfficeAPILog("HeartBeatResponse-Going to read the messageid  finished " + icd.MessageId);
                icd.FilePath = responseDirectoryConfig.ResponseTollPlazaHeartBeat;
                icd.FilePath += DateTime.Now.ToString("ddMMyyyy") + "\\";
                if (!Directory.Exists(icd.FilePath))
                {
                    Directory.CreateDirectory(Path.GetDirectoryName(icd.FilePath));

                }
                icd.FileSaveLocation = @"" + icd.FilePath + icd.MessageId + ".xml";
                doc.Save(icd.FileSaveLocation);
                BankOfficeAPILog("HeartBeatResponse-Heart Beat Response file " + icd.MessageId + ".xml saved successfully.");
                var directory = new DirectoryInfo(icd.FilePath);
                var myFile = (from f in directory.GetFiles()
                              orderby f.LastWriteTime descending
                              select f).First();
                icd.FileReadLocation = Convert.ToString(myFile);
                icd=DataModel.ReadXMLFile(icd);
                string New_FileName = @"" + icd.FilePath + icd.MessageId + ".xml";
                if (File.Exists(New_FileName))
                    New_FileName = @"" + icd.FilePath + icd.MessageId + "_" + DateTime.Now.ToString("ddMMyyyyHHmmssfff") + ".xml";
                File.Move(icd.FileSaveLocation, New_FileName);
                HeartBeatResponse_InsertInSql();
                BankOfficeAPILog("HeartBeatResponse-Heart Beat Response file " + icd.MessageId + "Accepted successfully.");
                return StatusCode(HttpStatusCode.Accepted);

            }
            catch (Exception ex)
            {
                BankOfficeAPILog("Error: Heart Beat Response :" + ex.Message + "-" + ex.StackTrace);
                return StatusCode(HttpStatusCode.ExpectationFailed);
            }
        }

        //[Route("Rocket/VoilationAuditDetailsResponse")]
        //[HttpPost]
        //public async System.Threading.Tasks.Task<IHttpActionResult> VoilationAuditDetailsResponse()
        //{
        //    try
        //    {
        //        WriteLog.WriteEventLogToFile("VoilationAuditResponse", "Violation Audit Response initiated.");

        //        XDocument doc = XDocument.Load(await Request.Content.ReadAsStreamAsync());
        //        //XDocument doc = XDocument.Load(@"E:\Dvelopment\API\ResponseVoilationAuditDetails\VoilationAuditDetailsResponse.xml");

        //        if (VoilationAudit_FilePath == null || VoilationAudit_FilePath == "")
        //        {
        //            Get_FilePath();
        //        }
        //        //VoilationAudit_MsgID = GetMessegeID(doc);

        //        foreach (XElement element in doc.Descendants("Head"))
        //        {
        //            VoilationAudit_MsgID = Convert.ToString(element.Attribute("msgId").Value);

        //        }

        //        VoilationAudit_FilePath += DateTime.Now.ToString("ddMMyyyy") + "\\";
        //        if (!Directory.Exists(VoilationAudit_FilePath))
        //        {
        //            Directory.CreateDirectory(Path.GetDirectoryName(VoilationAudit_FilePath));
        //        }

        //        VoilationAudit_saveLoc = @"" + VoilationAudit_FilePath + VoilationAudit_MsgID + ".xml";
        //        doc.Save(VoilationAudit_saveLoc);
        //        WriteLog.WriteEventLogToFile("VoilationAuditResponse", "Violation Audit Response file " + VoilationAudit_MsgID + ".xml saved successfully.");

        //        var directory = new DirectoryInfo(VoilationAudit_FilePath);
        //        var myFile = (from f in directory.GetFiles()
        //                      orderby f.LastWriteTime descending
        //                      select f).First();
        //        VoilationAudit_ReadFileLocation = Convert.ToString(myFile);
        //        ReadVoilationAuditResponseXMLFile();
        //        string New_FileName = @"" + VoilationAudit_FilePath + VoilationAudit_MsgID + ".xml";
        //        if (File.Exists(New_FileName))
        //            New_FileName = @"" + VoilationAudit_FilePath + VoilationAudit_MsgID + "" + DateTime.Now.ToString("ddMMyyyyHHmmssfff") + ".xml";
        //        File.Move(VoilationAudit_saveLoc, New_FileName);
        //        if (IsVilatonFileSuccess)
        //        {
        //            VoilationAuditDetailsResponse_InsertInSql(New_FileName);
        //        }
        //        else
        //        {
        //            WriteLog.WriteEventLogToFile("VoilationAuditResponse", "VoilationAuditDetailsResponse file " + VoilationAudit_MsgID + ".xml insert Failed.");
        //        }

        //        WriteLog.WriteEventLogToFile("VoilationAuditResponse", "Voilation Audit details Response file " + VoilationAudit_MsgID + ".xml Accepted successfully.");
        //        return StatusCode(HttpStatusCode.Accepted);

        //    }
        //    catch (Exception ex)
        //    {
        //        WriteErrorInDatabase.ErrorLog("Error: VoilationAuditDetailsResponsee :" + ex.Message + "-" + ex.StackTrace);
        //        WriteLog.WriteErrorToFile("Error: VoilationAuditDetailsResponse  : " + ex.Message + ex.StackTrace);
        //        return StatusCode(HttpStatusCode.ExpectationFailed);

        //    }

        //    //string RequriessomeReturn = "Test API Success: Check Voilation Audit Details Response";
        //    //return Ok();//RequriessomeReturn;
        //}

        //[Route("Rocket/NotificationResponse")]
        //[HttpPost]
        //public async System.Threading.Tasks.Task<IHttpActionResult> NotificationResponse()
        //{
        //    try
        //    {
        //        WriteLog.WriteEventLogToFile("NotificationResponse", "NotificationResponse initiated .");
        //        XDocument doc = XDocument.Load(await Request.Content.ReadAsStreamAsync());
        //        //XDocument doc = XDocument.Load(@"D:\Notification_Resp.xml");

        //        if (Notification_FilePath == null || Notification_FilePath == "")
        //        {
        //            Get_FilePath();
        //        }
        //        //Notification_MsgID = GetMessegeID(doc);

        //        foreach (XElement element in doc.Descendants("Head"))
        //        {
        //            Notification_MsgID = Convert.ToString(element.Attribute("msgId").Value);

        //        }

        //        Notification_FilePath += DateTime.Now.ToString("ddMMyyyy") + "\\";
        //        if (!Directory.Exists(Notification_FilePath))
        //        {
        //            Directory.CreateDirectory(Path.GetDirectoryName(Notification_FilePath));
        //        }

        //        Notification_saveLoc = @"" + Notification_FilePath + Notification_MsgID + ".xml";

        //        doc.Save(Notification_saveLoc);
        //        WriteLog.WriteEventLogToFile("NotificationResponse", "Notification Response file " + Notification_MsgID + ".xml saved successfully.");
        //        var directory = new DirectoryInfo(Notification_FilePath);
        //        var myFile = (from f in directory.GetFiles()
        //                      orderby f.LastWriteTime descending
        //                      select f).First();
        //        Notification_ReadFileLocation = Convert.ToString(myFile);
        //        NotificationResponseXMLFile();
        //        string New_FileName = @"" + Notification_FilePath + Notification_MsgID + ".xml";
        //        if (File.Exists(New_FileName))
        //            New_FileName = @"" + Notification_FilePath + Notification_MsgID + "" + DateTime.Now.ToString("ddMMyyyyHHmmssfff") + ".xml";
        //        File.Move(Notification_saveLoc, New_FileName);
        //        if (IsNotificationFileSuccess)
        //        {
        //            NotificationResponse_InsertInSql(New_FileName);
        //        }
        //        else
        //        {
        //            WriteLog.WriteEventLogToFile("NotificationResponse", "NotificationResponse file " + Notification_MsgID + ".xml save failed.");
        //        }
        //        WriteLog.WriteEventLogToFile("NotificationResponse", "Notification Response file " + Notification_MsgID + ".xml Accepted successfully.");
        //        return StatusCode(HttpStatusCode.Accepted);
        //    }
        //    catch (Exception ex)
        //    {
        //        WriteErrorInDatabase.ErrorLog("Error: NotificationResponsee :" + ex.Message + "-" + ex.StackTrace);
        //        WriteLog.WriteErrorToFile("Error: NotificationResponse  : " + ex.Message + ex.StackTrace);
        //        return StatusCode(HttpStatusCode.ExpectationFailed);

        //    }

        //    //string RequriessomeReturn = "Test API Success: Check Voilation Audit Details Response";
        //    //return Ok();//RequriessomeReturn;
        //}

        //[Route("Rocket/GetRespCashDetail")]
        //[HttpPost]
        //public async System.Threading.Tasks.Task<IHttpActionResult> GetRespCashDetail()
        //{
        //    try
        //    {

        //        WriteLog.WriteEventLogToFile("RespCashDetail", "PayResponse for cash initiated.");
        //        XDocument doc = XDocument.Load(await Request.Content.ReadAsStreamAsync());
        //        //XDocument doc = XDocument.Load(@"F:\XML\4TTIYMBGF751769335.xml");
        //        if (OtherFilePath == null || OtherFilePath == "")
        //        {
        //            Get_FilePath();
        //        }
        //        //Cash_msgId = GetMessegeID(doc);

        //        foreach (XElement element in doc.Descendants("Head"))
        //        {
        //            Cash_msgId = Convert.ToString(element.Attribute("msgId").Value);

        //        }

        //        OtherFilePath += DateTime.Now.ToString("ddMMyyyy") + "\\";
        //        if (!Directory.Exists(OtherFilePath))
        //        {
        //            Directory.CreateDirectory(Path.GetDirectoryName(OtherFilePath));
        //        }
        //        Cash_saveLoc = @"" + OtherFilePath + Cash_msgId + ".xml";
        //        doc.Save(Cash_saveLoc);
        //        WriteLog.WriteEventLogToFile("RespCashDetail", "PayResponse cash file " + Cash_msgId + ".xml saved successfully.");
        //        CashReadXMLFile();
        //        if (Cash_IsResponseFileSuccess)
        //        {
        //            CashReadxml_InsertInSql(@"" + OtherFilePath + Cash_msgId + ".xml");
        //        }
        //        else
        //        {
        //            WriteLog.WriteEventLogToFile("RespCashDetail", "PayResponse cash file " + Cash_msgId + ".xml not inserted in DB.");

        //        }
        //        WriteLog.WriteEventLogToFile("RespCashDetail", "PayResponse cash file " + Cash_msgId + ".xml Accepted successfully.");
        //        return StatusCode(HttpStatusCode.Accepted);



        //    }
        //    catch (Exception ex)
        //    {
        //        WriteErrorInDatabase.ErrorLog("Error: Get Resp Cash CCH File :" + ex.Message + "-" + ex.StackTrace);
        //        WriteLog.WriteErrorToFile("Error: RespCashDetail " + ex.Message + ex.StackTrace);
        //        return StatusCode(HttpStatusCode.ExpectationFailed);
        //    }

        //    //string RequriessomeReturn = "Test API Success: Get Response Pay";
        //    //return Ok("202");
        //}
    }
}
