using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Xml.Linq;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.SystemConfigurations;
using HighwaySoluations.Softomation.TMSSystemLibrary.SystemLogger;
using TMSRestAPI.Models;
using static HighwaySoluations.Softomation.CommonLibrary.Constants;

namespace TMSRestAPI.Controllers
{
    public class ICDBankController : ApiController
    {
        ResponseDirectoryConfig responseDirectoryConfig = ResponseDirectoryConfig.Deserialize();
        internal static void BankOfficeAPILog(string message)
        {
            LogMaster.Write(message, ErrorLogModule.BankOfficeAPI);
        }
        [HttpPost]
        public async System.Threading.Tasks.Task<IHttpActionResult> GetResponsePay()
        {
            try
            {
                IDCResponsePayIL iDC = new IDCResponsePayIL();
                iDC.FilePath = responseDirectoryConfig.ResponsePay;
                BankOfficeAPILog("ResponsePay-PayResponse  initiated.");
                XDocument doc = XDocument.Load(await Request.Content.ReadAsStreamAsync());
                foreach (XElement element in doc.Descendants("Head"))
                {
                    iDC.MsgId = Convert.ToString(element.Attribute("msgId").Value);

                }
                iDC.FilePath += DateTime.Now.ToString("ddMMyyyy") + "\\";
                if (!Directory.Exists(iDC.FilePath))
                {
                    Directory.CreateDirectory(Path.GetDirectoryName(iDC.FilePath));
                }

                iDC.SaveLoc = @"" + iDC.FilePath + iDC.MsgId + ".xml";
                doc.Save(iDC.SaveLoc);
                BankOfficeAPILog("ResponsePay-PayResponse file " + iDC.MsgId + ".xml saved successfully.");
                iDC = DataModel.ReadXMLFile(iDC);
                if (iDC.IsResponseFileSuccess)
                {
                    Readxml_InsertInSql(@"" + FilePath + iDC.MsgId + ".xml");
                }
                else
                {
                    BankOfficeAPILog("ResponsePay-PayResponse file " + iDC.MsgId + ".xml not inserted in DB.");

                }
                BankOfficeAPILog("ResponsePay-PayResponse file " + iDC.MsgId + ".xml Accepted successfully.");
                return StatusCode(HttpStatusCode.Accepted);



            }
            catch (Exception ex)
            {
                BankOfficeAPILog("Error: Get CCH File :" + ex.Message + "-" + ex.StackTrace);
                BankOfficeAPILog("Error: ResponsePay " + ex.Message + ex.StackTrace);
                return StatusCode(HttpStatusCode.ExpectationFailed);
            }

            //string RequriessomeReturn = "Test API Success: Get Response Pay";
            //return Ok("202");
        }
    }
}
