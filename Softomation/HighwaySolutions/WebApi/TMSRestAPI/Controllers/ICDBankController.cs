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
using HighwaySoluations.Softomation.TMSSystemLibrary;

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
            LogMaster.Write(message, ErrorLogModule.BankAPI);
        }

        [Route("Rocket/GetResponsePay")]
        [HttpPost]
        public async System.Threading.Tasks.Task<IHttpActionResult> GetResponsePay()
        {
            try
            {
                ICDPaymentResponseIL icd = new ICDPaymentResponseIL();
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
                    ICDPaymentResponseBL.Insert(icd);
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
                BankOfficeAPILog("ChkTransactionStatusResponse-CheckTransactionStatusResponsePay initiated.");

                ICDTransactionStatusResponseIL icd = new ICDTransactionStatusResponseIL();

                XDocument doc = XDocument.Load(await Request.Content.ReadAsStreamAsync());
                foreach (XElement element in doc.Descendants("Head"))
                {
                    icd.TransactionMessageId = Convert.ToString(element.Attribute("msgId").Value);

                }
                icd.FilePath = responseDirectoryConfig.ResponseCheckTransaction;
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
                ICDTransactionStatusResponseBL.Insert(icd);
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
                ICDQueryExceptionResponseIL icd = new ICDQueryExceptionResponseIL();
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
                    ICDQueryExceptionResponseBL.Insert(icd);
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
                ICDSyncTimeDetailsIL icd = new ICDSyncTimeDetailsIL();
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
                icd.MessageType = true;
                ICDSyncTimeDetailsBL.RequestProcess(icd);
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
                icd.RequestStatusId = (short)SystemConstants.ICDRequestStatusType.Received;
                icd.MessageType = true;
                ICDTagDetailsBL.RequestProcess(icd);
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
                ICDHeartBeatDetailsIL icd = new ICDHeartBeatDetailsIL();
                BankOfficeAPILog("HeartBeatResponse-Heart Beat Response initiated.");
                var content = await Request.Content.ReadAsStringAsync();
                BankOfficeAPILog("HeartBeatResponse-Going to read response finished " + content.ToString());
                XDocument doc = XDocument.Load(await Request.Content.ReadAsStreamAsync());
                icd.FilePath = responseDirectoryConfig.ResponseTollPlazaHeartBeat;
                foreach (XElement element in doc.Descendants("Head"))
                {
                    icd.MessageId = Convert.ToString(element.Attribute("msgId").Value);
                }
                BankOfficeAPILog("HeartBeatResponse-Going to read the messageid  finished " + icd.MessageId);

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
                icd = DataModel.ReadXMLFile(icd);
                string New_FileName = @"" + icd.FilePath + icd.MessageId + ".xml";
                if (File.Exists(New_FileName))
                    New_FileName = @"" + icd.FilePath + icd.MessageId + "_" + DateTime.Now.ToString("ddMMyyyyHHmmssfff") + ".xml";
                File.Move(icd.FileSaveLocation, New_FileName);
               
                icd.RequestStatusId = (short)SystemConstants.ICDRequestStatusType.Received;
                icd.MessageType = true;
                ICDHeartBeatDetailsBL.RequestProcess(icd);
                BankOfficeAPILog("HeartBeatResponse-Heart Beat Response file " + icd.MessageId + "Accepted successfully.");
                return StatusCode(HttpStatusCode.Accepted);
            }
            catch (Exception ex)
            {
                BankOfficeAPILog("Error: Heart Beat Response :" + ex.Message + "-" + ex.StackTrace);
                return StatusCode(HttpStatusCode.ExpectationFailed);
            }
        }

        [Route("Rocket/VoilationAuditDetailsResponse")]
        [HttpPost]
        public async System.Threading.Tasks.Task<IHttpActionResult> VoilationAuditDetailsResponse()
        {
            ICDViolationAuditDetailsRequestIL icd = new ICDViolationAuditDetailsRequestIL();
            try
            {
                BankOfficeAPILog("VoilationAuditResponse-Violation Audit Response initiated.");
                XDocument doc = XDocument.Load(await Request.Content.ReadAsStreamAsync());
                icd.FilePath = responseDirectoryConfig.ResponseVoilationAuditDetails;
                foreach (XElement element in doc.Descendants("Head"))
                {
                    icd.MessageId = Convert.ToString(element.Attribute("msgId").Value);
                }
                icd.FilePath += DateTime.Now.ToString("ddMMyyyy") + "\\";
                if (!Directory.Exists(icd.FilePath))
                {
                    Directory.CreateDirectory(Path.GetDirectoryName(icd.FilePath));
                }
                icd.FileSaveLocation = @"" + icd.FilePath + icd.MessageId + ".xml";
                doc.Save(icd.FileSaveLocation);
                BankOfficeAPILog("VoilationAuditResponse-Violation Audit Response file " + icd.MessageId + ".xml saved successfully.");
                var directory = new DirectoryInfo(icd.FilePath);
                var myFile = (from f in directory.GetFiles()
                              orderby f.LastWriteTime descending
                              select f).First();
                icd.FileReadLocation = Convert.ToString(myFile);
                icd = DataModel.ReadXMLFile(icd);
                string New_FileName = @"" + icd.FilePath + icd.MessageId + ".xml";
                if (File.Exists(New_FileName))
                    New_FileName = @"" + icd.FilePath + icd.MessageId + "" + DateTime.Now.ToString("ddMMyyyyHHmmssfff") + ".xml";
                File.Move(icd.FileSaveLocation, New_FileName);
                icd.RequestStatusId = (short)SystemConstants.ICDRequestStatusType.Received;
                icd.MessageType = true;
                ICDViolationAuditDetailsRequestBL.RequestProcess(icd);
                BankOfficeAPILog("VoilationAuditResponse-Voilation Audit details Response file " + icd.MessageId + ".xml Accepted successfully.");
                return StatusCode(HttpStatusCode.Accepted);
            }
            catch (Exception ex)
            {
                BankOfficeAPILog("Error: VoilationAuditDetailsResponsee :" + ex.Message + "-" + ex.StackTrace);
                icd.RequestStatusId = (short)SystemConstants.ICDRequestStatusType.Received_Error;
                icd.MessageType = true;
                ICDViolationAuditDetailsRequestBL.RequestProcess(icd);
                return StatusCode(HttpStatusCode.ExpectationFailed);
            }
        }

        [Route("Rocket/NotificationResponse")]
        [HttpPost]
        public async System.Threading.Tasks.Task<IHttpActionResult> NotificationResponse()
        {
            try
            {
                ICDNotificationResponseIL icd = new ICDNotificationResponseIL();
                BankOfficeAPILog("NotificationResponse-NotificationResponse initiated .");
                XDocument doc = XDocument.Load(await Request.Content.ReadAsStreamAsync());
                icd.FilePath = responseDirectoryConfig.ResponseTollPlazaHeartBeat;
                foreach (XElement element in doc.Descendants("Head"))
                {
                    icd.MessageId = Convert.ToString(element.Attribute("msgId").Value);
                }
                icd.FilePath += DateTime.Now.ToString("ddMMyyyy") + "\\";
                if (!Directory.Exists(icd.FilePath))
                {
                    Directory.CreateDirectory(Path.GetDirectoryName(icd.FilePath));
                }
                icd.FileSaveLocation = @"" + icd.FilePath + icd.MessageId + ".xml";
                doc.Save(icd.FileSaveLocation);
                BankOfficeAPILog("NotificationResponse-Notification Response file " + icd.MessageId + ".xml saved successfully.");
                var directory = new DirectoryInfo(icd.FilePath);
                var myFile = (from f in directory.GetFiles()
                              orderby f.LastWriteTime descending
                              select f).First();
                icd.FileReadLocation = Convert.ToString(myFile);
                icd = DataModel.ReadXMLFile(icd);
                string New_FileName = @"" + icd.FilePath + icd.MessageId + ".xml";
                if (File.Exists(New_FileName))
                    New_FileName = @"" + icd.FilePath + icd.MessageId + "" + DateTime.Now.ToString("ddMMyyyyHHmmssfff") + ".xml";
                File.Move(icd.FileSaveLocation, New_FileName);
                if (icd.IsNotificationFileSuccess)
                {
                    ICDNotificationResponseBL.Insert(icd);
                }
                else
                {
                    BankOfficeAPILog("NotificationResponse-NotificationResponse file " + icd.MessageId + ".xml save failed.");
                }
                BankOfficeAPILog("NotificationResponse-Notification Response file " + icd.MessageId + ".xml Accepted successfully.");
                return StatusCode(HttpStatusCode.Accepted);
            }
            catch (Exception ex)
            {
                BankOfficeAPILog("Error: NotificationResponsee :" + ex.Message + "-" + ex.StackTrace);
                return StatusCode(HttpStatusCode.ExpectationFailed);
            }
        }

        [Route("Rocket/GetRespCashDetail")]
        [HttpPost]
        public async System.Threading.Tasks.Task<IHttpActionResult> GetRespCashDetail()
        {
            try
            {
                ICDCashDetailResponseIL icd = new ICDCashDetailResponseIL();
                BankOfficeAPILog("RespCashDetail-PayResponse for cash initiated.");
                XDocument doc = XDocument.Load(await Request.Content.ReadAsStreamAsync());
                icd.FilePath = responseDirectoryConfig.ResponseTollPlazaHeartBeat;
                foreach (XElement element in doc.Descendants("Head"))
                {
                    icd.MessageId = Convert.ToString(element.Attribute("msgId").Value);
                }
                icd.FilePath += DateTime.Now.ToString("ddMMyyyy") + "\\";
                if (!Directory.Exists(icd.FilePath))
                {
                    Directory.CreateDirectory(Path.GetDirectoryName(icd.FilePath));
                }
                icd.FileSaveLocation = @"" + icd.FilePath + icd.MessageId + ".xml";
                doc.Save(icd.FileSaveLocation);
                BankOfficeAPILog("RespCashDetail-PayResponse cash file " + icd.MessageId + ".xml saved successfully.");
                icd = DataModel.ReadXMLFile(icd);
                if (icd.IsResponseFileSuccess)
                {
                    //CashReadxml_InsertInSql(@"" + icd.FilePath + icd.MessageId + ".xml");
                }
                else
                {
                    BankOfficeAPILog("RespCashDetail-PayResponse cash file " + icd.MessageId + ".xml not inserted in DB.");

                }
                BankOfficeAPILog("RespCashDetail-PayResponse cash file " + icd.MessageId + ".xml Accepted successfully.");
                return StatusCode(HttpStatusCode.Accepted);
            }
            catch (Exception ex)
            {
                BankOfficeAPILog("Error: Get Resp Cash CCH File :" + ex.Message + "-" + ex.StackTrace);
                return StatusCode(HttpStatusCode.ExpectationFailed);
            }
        }
    }
}
