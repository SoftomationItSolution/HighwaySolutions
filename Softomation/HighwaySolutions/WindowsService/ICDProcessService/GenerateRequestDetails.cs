using System;
using System.IO;
using System.Net;
using System.Xml;
using System.Text;
using System.Data;
using System.Security.Cryptography;
using System.Security.Cryptography.Xml;
using System.Security.Cryptography.X509Certificates;
using HighwaySoluations.Softomation.TMSSystemLibrary;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.SystemLogger;
using static HighwaySoluations.Softomation.CommonLibrary.Constants;
using HighwaySoluations.Softomation.TMSSystemLibrary.SystemConfigurations;


namespace ICDProcessService
{
    public class GenerateRequestDetails
    {
        static object _objSignlock = new object();
        static object _objSettinglock = new object();
        static object _objSendRequest = new object();

        public static RSA Key;
        public static string Certificate;

        static void BankOfficeAPILog(string message)
        {
            LogMaster.Write(message, ErrorLogModule.BankAPI);
        }
        

        //15.5 Request Tag Details   Page Number-91
        public static ICDTagDetailsIL ProcessTagDetailsRequest(ICDTagDetailsIL data, ICDConfig config, string RequestTagDetailsPath)
        {
            try
            {
                DataSet dataSet;
                string FileName = RequestTagDetailsPath + "\\" + Convert.ToString(data.MessageId) + "_.xml";
                string SignedFileName = RequestTagDetailsPath + "\\" + Convert.ToString(data.MessageId) + ".xml";
                string _fname = Convert.ToString(data.MessageId) + ".xml";
                data.RequestDateTime = DateTime.Now;
                #region Xml Writer
                XmlWriter writer = XmlWriter.Create(FileName, GetSettingFile());
                #region Start Document 
                writer.WriteStartDocument();
                #region Root
                writer.WriteStartElement("etc", "ReqTagDetails", "http://npci.org/etc/schema/");
                #region Head
                writer.WriteStartElement("Head");
                writer.WriteAttributeString("msgId", Convert.ToString(data.MessageId));
                writer.WriteAttributeString("orgId", Convert.ToString(config.OrgId));
                writer.WriteAttributeString("ts", data.RequestDateTime.ToString(SystemConstants.dateTimeFormatICDFormat));
                writer.WriteAttributeString("ver", Convert.ToString(config.APIVersion));
                writer.WriteEndElement();
                #endregion
                #region Transaction
                writer.WriteStartElement("Txn");
                writer.WriteAttributeString("note", data.Note);
                writer.WriteAttributeString("refId", data.RefId);
                writer.WriteAttributeString("refUrl", data.RefUrl);
                writer.WriteAttributeString("ts", data.TransactionDateTime.ToString(SystemConstants.dateTimeFormatICDFormat));
                writer.WriteAttributeString("type", "FETCH");
                writer.WriteAttributeString("orgTxnId", "");
                writer.WriteAttributeString("id", Convert.ToString(data.MessageId));
                #region Vehicle
                writer.WriteStartElement("Vehicle");
                writer.WriteAttributeString("vehicleRegNo", data.VRN);
                writer.WriteAttributeString("TID", data.TID);
                writer.WriteAttributeString("tagId", data.TagId);
                writer.WriteEndElement();
                writer.WriteEndElement();
                #endregion
                #endregion
                #endregion
                writer.WriteEndDocument();
                #endregion
                writer.Flush();
                writer.Close();
                #endregion

                if (data.IsSignatureRequired)
                {
                    SignXmlFile(FileName, SignedFileName, config);
                    dataSet = ProcessRequest(SignedFileName, 1000, config, config.RequestTagDetails, RequestTagDetailsPath, _fname);
                }
                else
                {
                    dataSet = ProcessRequest(FileName, 1000, config, config.RequestTagDetails, RequestTagDetailsPath, _fname);
                }
                foreach (DataTable table in dataSet.Tables)
                {
                    if (table.TableName.Equals("Detail"))
                    {
                        string VEHICLECLASS = table.Rows[0]["value"].ToString();
                        string REGNUMBER = table.Rows[1]["value"].ToString();
                        string TAGSTATUS = table.Rows[2]["value"].ToString();
                        string EXCCODE = table.Rows[3]["value"].ToString();
                        string TAGID = table.Rows[4]["value"].ToString();
                        data.TID = table.Rows[5]["value"].ToString();
                        string COMVEHICLE = table.Rows[6]["value"].ToString();
                    }
                };
                data.RequestStatusId = (short)SystemConstants.ICDRequestStatusType.Send;
            }
            catch (Exception ex)
            {
                data.RequestStatusId = (short)SystemConstants.ICDRequestStatusType.Generated;
                throw ex;
            }
            return data;
        }
        //4.6.1 Request Violation Audit Details  Page Number-27
        public static ICDViolationAuditDetailsRequestIL ProcessViolationAuditDetailsRequest(ICDViolationAuditDetailsRequestIL data, ICDConfig config, string RequestViolationAuditDetailsPath)
        {
            try
            {
                string FileName = RequestViolationAuditDetailsPath + "\\" + Convert.ToString(data.MessageId) + "_.xml";
                string SignedFileName = RequestViolationAuditDetailsPath + "\\" + Convert.ToString(data.MessageId) + ".xml";
                string _fname = Convert.ToString(data.MessageId) + ".xml";
                data.RequestDateTime = DateTime.Now;
                #region XML Writer
                XmlWriter writer = XmlWriter.Create(FileName, GetSettingFile());
                #region Start Document
                writer.WriteStartDocument();
                #region Root
                writer.WriteStartElement("etc", "ViolationAuditDetails", "http://npci.org/etc/schema/");
                #region Head
                writer.WriteStartElement("Head");
                writer.WriteAttributeString("msgId", Convert.ToString(data.MessageId));
                writer.WriteAttributeString("orgId", Convert.ToString(config.OrgId));
                writer.WriteAttributeString("ts", data.RequestDateTime.ToString(SystemConstants.dateTimeFormatICDFormat));
                writer.WriteAttributeString("ver", Convert.ToString(config.APIVersion));
                writer.WriteEndElement();
                #endregion

                #region Meta
                writer.WriteStartElement("Meta");
                writer.WriteEndElement();
                #endregion

                #region Violations
                writer.WriteStartElement("Violations");
                #region Violation
                writer.WriteStartElement("Violation");
                #region AuditTime Detail
                writer.WriteStartElement("Detail");
                writer.WriteAttributeString("name", "AuditTime");
                writer.WriteAttributeString("value", data.AuditDateTime.ToString(SystemConstants.dateTimeFormatICDFormat));
                writer.WriteEndElement();
                #endregion

                #region AuditResult Detail
                writer.WriteStartElement("Detail");
                writer.WriteAttributeString("name", "AuditResult");
                writer.WriteAttributeString("value", "VIOLATION");
                writer.WriteEndElement();
                #endregion

                #region AVCProfile Detail
                writer.WriteStartElement("Detail");
                writer.WriteAttributeString("name", "AVCProfile");
                writer.WriteAttributeString("value", "inline");

                #region ProfileData AVCClassId
                writer.WriteStartElement("Item");
                writer.WriteAttributeString("name", "ProfileData");
                writer.WriteAttributeString("value", Convert.ToString(data.AVCClassId));
                writer.WriteEndElement();
                #endregion

                #region AVC NumberAxles
                writer.WriteStartElement("Item");
                writer.WriteAttributeString("name", "NumberAxles");
                writer.WriteAttributeString("value", Convert.ToString(data.AVCNumberAxcel));
                writer.WriteEndElement();
                #endregion

                #region AVC INterAxleDistance
                writer.WriteStartElement("Item");
                writer.WriteAttributeString("name", "INterAxleDistance");
                writer.WriteAttributeString("value", "0.0");
                writer.WriteEndElement();
                #endregion

                #region AVC VehicleHeight
                writer.WriteStartElement("Item");
                writer.WriteAttributeString("name", "VehicleHeight");
                writer.WriteAttributeString("value", Convert.ToString(data.VehicleHeight));
                writer.WriteEndElement();
                #endregion

                #region AVC DoubleWheelDetected
                writer.WriteStartElement("Item");
                writer.WriteAttributeString("name", "DoubleWheelDetected");
                writer.WriteAttributeString("value", data.DoubleWheelDetected == true ? "T" : "F");
                writer.WriteEndElement();
                #endregion

                #region AVC VehicleLength
                writer.WriteStartElement("Item");
                writer.WriteAttributeString("name", "VehicleLEngth");
                writer.WriteAttributeString("value", Convert.ToString(data.VehicleLength));
                writer.WriteEndElement();
                #endregion
                writer.WriteEndElement();
                #endregion

                #region Transaction Details
                writer.WriteStartElement("Detail");
                writer.WriteAttributeString("name", "TransactionDetails");
                writer.WriteAttributeString("value", "inline");

                #region Plaza Id
                writer.WriteStartElement("Item");
                writer.WriteAttributeString("name", "PlazaId");
                writer.WriteAttributeString("value", Convert.ToString(data.PlazaId));
                writer.WriteEndElement();
                #endregion

                #region Reader Read Time
                writer.WriteStartElement("Item");
                writer.WriteAttributeString("name", "ReaderReadTime");
                writer.WriteAttributeString("value", Convert.ToString(data.ReaderReadTime.ToString(SystemConstants.dateTimeFormatICDFormat)));
                writer.WriteEndElement();
                #endregion

                #region TransactionTime
                writer.WriteStartElement("Item");
                writer.WriteAttributeString("name", "TransactionTime");
                writer.WriteAttributeString("value", data.TransactionDateTime.ToString(SystemConstants.dateTimeFormatICDFormat));
                writer.WriteEndElement();
                #endregion

                #region ICD TrasactionId
                writer.WriteStartElement("Item");
                writer.WriteAttributeString("name", "TrasactionId");
                writer.WriteAttributeString("value", Convert.ToString(data.ICDTrasactionId));
                writer.WriteEndElement();
                #endregion

                #region LaneId
                writer.WriteStartElement("Item");
                writer.WriteAttributeString("name", "LaneId");
                writer.WriteAttributeString("value", data.LaneId);
                writer.WriteEndElement();
                #endregion
                writer.WriteEndElement();
                #endregion

                #region Image Details
                writer.WriteStartElement("ImageDetails");
                #region Image 1 Details
                writer.WriteStartElement("Image1");
                writer.WriteAttributeString("name", data.ImageFirstName);
                writer.WriteAttributeString("refPath", data.ImageFirstPath);
                writer.WriteEndElement();
                #endregion
                #region Image 2 Details
                writer.WriteStartElement("Image2");
                writer.WriteAttributeString("name", data.ImageFirstName);
                writer.WriteAttributeString("refPath", data.ImageSecondPath);
                writer.WriteEndElement();
                #endregion
                writer.WriteEndElement();
                #endregion

                #region AVC Image Details
                writer.WriteStartElement("AVCProfile");
                #region Image 1 Details
                writer.WriteStartElement("Image1");
                writer.WriteAttributeString("name", data.ImageFirstName);
                writer.WriteAttributeString("refPath", data.ImageFirstPath);
                writer.WriteEndElement();
                #endregion
                #region Image 2 Details
                writer.WriteStartElement("Image2");
                writer.WriteAttributeString("name", data.ImageFirstName);
                writer.WriteAttributeString("refPath", data.ImageSecondPath);
                writer.WriteEndElement();
                #endregion
                writer.WriteEndElement();
                #endregion

                writer.WriteEndElement();
                #endregion
                writer.WriteEndElement();
                #endregion
                writer.WriteEndElement();
                #endregion
                writer.WriteEndDocument();
                #endregion
                writer.Flush();
                writer.Close();
                #endregion
                if (data.IsSignatureRequired)
                {
                    SignXmlFile(FileName, SignedFileName, config);
                    DataSet dataSet = ProcessRequest(SignedFileName, 1000, config, config.RequestViolationAuditDetailAPI, RequestViolationAuditDetailsPath, _fname);
                }
                else 
                {
                    DataSet dataSet = ProcessRequest(FileName, 1000, config, config.RequestViolationAuditDetailAPI, RequestViolationAuditDetailsPath, _fname);
                }
                data.RequestStatusId = (short)SystemConstants.ICDRequestStatusType.Send;
            }
            catch (Exception ex)
            {
                data.RequestStatusId = (short)SystemConstants.ICDRequestStatusType.Generated;
                throw ex;
            }
            return data;
        }
        //15.7 SyncTime Request Page Number-99
        public static ICDSyncTimeDetailsIL ProcessSyncTimeDetailsRequest(ICDSyncTimeDetailsIL data, ICDConfig config, string RequestSyncTimeDetailsPath)
        {
            try
            {
                string FileName = RequestSyncTimeDetailsPath + "\\" + Convert.ToString(data.MessageId) + "_.xml";
                string SignedFileName = RequestSyncTimeDetailsPath + "\\" + Convert.ToString(data.MessageId) + ".xml";
                string _fname = Convert.ToString(data.MessageId) + ".xml";
                data.RequestDateTime = DateTime.Now;
                #region XML Writer
                XmlWriter writer = XmlWriter.Create(FileName, GetSettingFile());
                #region Start Document
                writer.WriteStartDocument();
                #region Root
                writer.WriteStartElement("etc", "ReqSyncTime", "http://npci.org/etc/schema/");
                #region Head
                writer.WriteStartElement("Head");
                writer.WriteAttributeString("msgId", Convert.ToString(data.MessageId));
                writer.WriteAttributeString("orgId", Convert.ToString(config.OrgId));
                writer.WriteAttributeString("ts", data.RequestDateTime.ToString(SystemConstants.dateTimeFormatICDFormat));
                writer.WriteAttributeString("ver", Convert.ToString(config.APIVersion));
                writer.WriteEndElement();
                #endregion
                writer.WriteEndElement();
                #endregion
                writer.WriteEndDocument();
                #endregion
                writer.Flush();
                writer.Close();
                #endregion
                if (data.IsSignatureRequired)
                {
                    SignXmlFile(FileName, SignedFileName, config);
                    DataSet dataSet = ProcessRequest(SignedFileName, 1000, config, config.RequestSyncTime, RequestSyncTimeDetailsPath, _fname);
                }
                else
                {
                    DataSet dataSet = ProcessRequest(FileName, 1000, config, config.RequestViolationAuditDetailAPI, RequestSyncTimeDetailsPath, _fname);
                }
                data.RequestStatusId = (short)SystemConstants.ICDRequestStatusType.Send;
            }
            catch (Exception ex)
            {
                data.RequestStatusId = (short)SystemConstants.ICDRequestStatusType.Generated;
                throw ex;
            }
            return data;
        }

        //Toll Plaza Heart Beat Page Number-103
        public static ICDHeartBeatDetailsIL ProcessSyncTimeDetailsRequest(ICDHeartBeatDetailsIL data, ICDConfig config, string RequestSyncTimeDetailsPath)
        {
            try
            {
                string FileName = RequestSyncTimeDetailsPath + "\\" + Convert.ToString(data.MessageId) + "_.xml";
                string SignedFileName = RequestSyncTimeDetailsPath + "\\" + Convert.ToString(data.MessageId) + ".xml";
                string _fname = Convert.ToString(data.MessageId) + ".xml";
                data.RequestDateTime = DateTime.Now;
                #region XML Writer
                XmlWriter writer = XmlWriter.Create(FileName, GetSettingFile());
                #region Start Document
                writer.WriteStartDocument();
                #region Root
                writer.WriteStartElement("etc", "ReqSyncTime", "http://npci.org/etc/schema/");
                #region Head
                writer.WriteStartElement("Head");
                writer.WriteAttributeString("msgId", Convert.ToString(data.MessageId));
                writer.WriteAttributeString("orgId", Convert.ToString(config.OrgId));
                writer.WriteAttributeString("ts", data.RequestDateTime.ToString(SystemConstants.dateTimeFormatICDFormat));
                writer.WriteAttributeString("ver", Convert.ToString(config.APIVersion));
                writer.WriteEndElement();
                #endregion
                writer.WriteEndElement();
                #endregion
                writer.WriteEndDocument();
                #endregion
                writer.Flush();
                writer.Close();
                #endregion
                if (data.IsSignatureRequired)
                {
                    SignXmlFile(FileName, SignedFileName, config);
                    DataSet dataSet = ProcessRequest(SignedFileName, 1000, config, config.RequestSyncTime, RequestSyncTimeDetailsPath, _fname);
                }
                else
                {
                    DataSet dataSet = ProcessRequest(FileName, 1000, config, config.RequestViolationAuditDetailAPI, RequestSyncTimeDetailsPath, _fname);
                }
                data.RequestStatusId = (short)SystemConstants.ICDRequestStatusType.Send;
            }
            catch (Exception ex)
            {
                data.RequestStatusId = (short)SystemConstants.ICDRequestStatusType.Generated;
                throw ex;
            }
            return data;
        }

        #region Helper Method
        static XmlWriterSettings GetSettingFile()
        {
            lock (_objSettinglock)
            {
                XmlWriterSettings xSetting = new XmlWriterSettings();
                xSetting.OmitXmlDeclaration = true;
                xSetting.ConformanceLevel = ConformanceLevel.Auto;
                xSetting.CloseOutput = false;
                xSetting.Indent = true;
                return xSetting;
            }
        }
        static void SignXmlFile(string FileName, string SignedFileName, ICDConfig config)
        {
            try
            {
                lock (_objSignlock)
                {
                    XmlDocument doc = new XmlDocument();
                    doc.PreserveWhitespace = false;
                    doc.Load(new XmlTextReader(FileName));

                    SignedXml signedXml = new SignedXml(doc);
                    Reference reference = new Reference();
                    XmlDsigEnvelopedSignatureTransform env = new XmlDsigEnvelopedSignatureTransform();
                    reference.AddTransform(env);

                    reference.DigestMethod = "http://www.w3.org/2001/04/xmlenc#sha256";
                    reference.Uri = "";
                    signedXml.AddReference(reference);
                    KeyInfo keyInfo = new KeyInfo();

                    X509Certificate2 MSCert = new X509Certificate2(Certificate, config.PassPrase, X509KeyStorageFlags.Exportable);
                    var exporterdkey = MSCert.PrivateKey.ToXmlString(true);
                    RSACryptoServiceProvider keya = new RSACryptoServiceProvider(2048);
                    keya.PersistKeyInCsp = false;
                    keya.FromXmlString(exporterdkey);


                    signedXml.KeyInfo = keyInfo;
                    keyInfo.AddClause(new KeyInfoX509Data(MSCert));
                    signedXml.SignedInfo.SignatureMethod = "http://www.w3.org/2001/04/xmldsig-more#rsa-sha256";
                    signedXml.SigningKey = keya;

                    signedXml.ComputeSignature();
                    XmlElement xmlDigitalSignature = signedXml.GetXml();
                    doc.DocumentElement.AppendChild(doc.ImportNode(xmlDigitalSignature, true));

                    if (doc.FirstChild is XmlDeclaration)
                    {
                        doc.RemoveChild(doc.FirstChild);
                    }
                    XmlTextWriter xmltw = new XmlTextWriter(SignedFileName, new UTF8Encoding(false));
                    doc.WriteTo(xmltw);
                    xmltw.Close();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        static DataSet ProcessRequest(string RequestXmlFilePath, int timeout, ICDConfig config, string RequestURL, string ResponseFilePath, string ResponseXmlFileName)
        {
            lock (_objSendRequest)
            {
                DataSet dataSet = new DataSet();
                try
                {

                    string TID = string.Empty;
                    ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(RequestURL);
                    request.KeepAlive = false;
                    request.ProtocolVersion = HttpVersion.Version10;
                    request.ContentType = "application/xml";
                    request.Method = "POST";
                    if (config.CertificateValidation)
                    {
                        ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
                    }
                    StringBuilder sb = new StringBuilder();
                    using (StreamReader sr = new StreamReader(RequestXmlFilePath))
                    {
                        String line;
                        while ((line = sr.ReadLine()) != null)
                        {
                            sb.AppendLine(line);
                        }
                        byte[] postBytes = Encoding.UTF8.GetBytes(sb.ToString());

                        if (timeout < 0)
                        {
                            request.ReadWriteTimeout = timeout;
                            request.Timeout = timeout;
                        }
                        request.ContentLength = postBytes.Length;
                        try
                        {
                            Stream requestStream = request.GetRequestStream();
                            requestStream.Write(postBytes, 0, postBytes.Length);
                            requestStream.Close();
                            using (var response = (HttpWebResponse)request.GetResponse())
                            {
                                BankOfficeAPILog("Status Code:" + response.StatusCode.ToString() + " Status Description =" + response.StatusDescription.ToString());
                                XmlDocument xmlDoc = new XmlDocument();
                                xmlDoc.Load(response.GetResponseStream());
                                XmlReader xmlReader = new XmlNodeReader(xmlDoc);
                                dataSet.ReadXml(xmlReader);
                                string filepath = ResponseFilePath + DateTime.Now.ToString(DateFormat);
                                Directory.CreateDirectory(filepath);
                                xmlDoc.Save(filepath + "\\" + ResponseXmlFileName);
                            }
                        }
                        catch (Exception ex)
                        {
                            BankOfficeAPILog("ProcessRequest : Error" + ex.Message.ToString());
                            request.Abort();
                        }

                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                return dataSet;
            }
        }
        #endregion
    }
}
