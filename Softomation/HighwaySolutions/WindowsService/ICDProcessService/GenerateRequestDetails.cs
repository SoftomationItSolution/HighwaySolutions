using System;
using System.Data;
using System.IO;
using System.Net;
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;
using System.Security.Cryptography.Xml;
using System.Text;
using System.Xml;
using HighwaySoluations.Softomation.CommonLibrary;
using HighwaySoluations.Softomation.TMSSystemLibrary;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.SystemConfigurations;
using HighwaySoluations.Softomation.TMSSystemLibrary.SystemLogger;
using static HighwaySoluations.Softomation.CommonLibrary.Constants;

namespace ICDProcessService
{
    public class GenerateRequestDetails
    {
        static object _ojlock = new object();
        public static RSA Key;
        public static string Certificate;

        private static void BankOfficeAPILog(string message)
        {
            LogMaster.Write(message, ErrorLogModule.BankAPI);
        }
        private static XmlWriterSettings GetSettingFile()
        {
            XmlWriterSettings xSetting = new XmlWriterSettings();
            xSetting.OmitXmlDeclaration = true;
            xSetting.ConformanceLevel = ConformanceLevel.Auto;
            xSetting.CloseOutput = false;
            xSetting.Indent = true;

            return xSetting;
        }
        public static ICDTagDetailsIL GetTagDetailsRequest(ICDTagDetailsIL data, ICDConfig config, string ReqETCTagDir)
        {

            try
            {
                string FileName = ReqETCTagDir + "\\" + Convert.ToString(data.MessageId) + "_.xml";
                string SignedFileName = ReqETCTagDir + "\\" + Convert.ToString(data.MessageId) + ".xml";
                string _fname = Convert.ToString(data.MessageId) + ".xml";
                data.RequestDateTime = DateTime.Now;
                XmlWriter writer = XmlWriter.Create(FileName, GetSettingFile());
                writer.WriteStartDocument();
                writer.WriteStartElement("etc", "ReqTagDetails", "http://npci.org/etc/schema/");
                writer.WriteStartElement("Head");
                writer.WriteAttributeString("msgId", Convert.ToString(data.MessageId));
                writer.WriteAttributeString("orgId", Convert.ToString(config.OrgId));
                writer.WriteAttributeString("ts", data.RequestDateTime.ToString(SystemConstants.dateTimeFormatICDFormat));
                writer.WriteAttributeString("ver", Convert.ToString(config.APIVersion));
                writer.WriteEndElement();

                writer.WriteStartElement("Txn");
                writer.WriteAttributeString("note", data.Note);
                writer.WriteAttributeString("refId", data.RefId);
                writer.WriteAttributeString("refUrl", data.RefUrl);
                writer.WriteAttributeString("ts", data.TransactionDateTime.ToString(SystemConstants.dateTimeFormatICDFormat));
                writer.WriteAttributeString("type", "FETCH");
                writer.WriteAttributeString("orgTxnId", "");
                writer.WriteAttributeString("id", Convert.ToString(data.MessageId));
                writer.WriteStartElement("Vehicle");
                writer.WriteAttributeString("vehicleRegNo", data.VRN);
                writer.WriteAttributeString("TID", data.TID);
                writer.WriteAttributeString("tagId", data.TagId);
                writer.WriteEndElement();
                writer.WriteEndElement();
                writer.WriteEndDocument();
                writer.Flush();
                writer.Close();
                SignXmlFile(FileName, SignedFileName, config);
                data.TID = ProcessTagRequest(SignedFileName, 1000, _fname, config, ReqETCTagDir);
                data.RequestStatusId = (short)SystemConstants.ICDRequestStatusType.Send;
            }
            catch (Exception ex)
            {
                data.RequestStatusId = (short)SystemConstants.ICDRequestStatusType.Generated;
                throw ex;
            }
            return data;
        }

        static void SignXmlFile(string FileName, string SignedFileName, ICDConfig config)
        {
            try
            {
                lock (_ojlock)
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
        static string ProcessTagRequest(string xmlFilepath, int timeout, string nameasmsgid, ICDConfig config, string ReqETCTagDir)
        {
            string TID = string.Empty;
            timeout = 3000;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(config.RequestTagDetails);
            request.KeepAlive = false;
            request.ProtocolVersion = HttpVersion.Version10;
            request.ContentType = "application/xml";
            request.Method = "POST";
            if (config.CertificateValidation)
            {
                ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
            }
            StringBuilder sb = new StringBuilder();
            using (StreamReader sr = new StreamReader(xmlFilepath))
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
                        XmlDocument xmlDoc = new XmlDocument();
                        xmlDoc.Load(response.GetResponseStream());
                        XmlReader xmlReader = new XmlNodeReader(xmlDoc);
                        DataSet dataSet = new DataSet();
                        dataSet.ReadXml(xmlReader);
                        foreach (DataTable table in dataSet.Tables)
                        {
                            if (table.TableName.Equals("Detail"))
                            {
                                string VEHICLECLASS = table.Rows[0]["value"].ToString();
                                string REGNUMBER = table.Rows[1]["value"].ToString();
                                string TAGSTATUS = table.Rows[2]["value"].ToString();
                                string EXCCODE = table.Rows[3]["value"].ToString();
                                string TAGID = table.Rows[4]["value"].ToString();
                                TID = table.Rows[5]["value"].ToString();
                                string COMVEHICLE = table.Rows[6]["value"].ToString();
                            }
                        };
                        string fname = DateTime.Now.ToString(DateFormat);
                        if (!Directory.Exists(ReqETCTagDir + fname))
                            Directory.CreateDirectory(ReqETCTagDir + fname);
                        xmlDoc.Save(ReqETCTagDir + fname + "\\" + nameasmsgid);
                    }
                }
                catch (Exception ex)
                {
                    BankOfficeAPILog("ProcessTagRequest : Error" + ex.Message.ToString());
                    request.Abort();
                }
                return TID;
            }
        }
    }
}
