using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Messaging;
using System.Web.Http.Cors;
using System.Web.Script.Serialization;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.SystemLogger;
using static HighwaySoluations.Softomation.CommonLibrary.Constants;
using HighwaySoluations.Softomation.ATMSSystemLibrary.SystemConfigurations;
using System.Web;

namespace ATMSRestAPI.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class RoadSideEventsController : ApiController
    {
        static MessageQueue RseAtccQueue;
        const string Provider = AppProvider;
        const string APIPath = "FastTrackHighway-ATMS";
        ApiResponseIL response = new ApiResponseIL();
        ResponseIL resp = new ResponseIL();

        internal static void BackOfficeAPILog(string message)
        {
            LogMaster.Write(message, ErrorLogModule.EventAPI);
        }

        [Route(Provider + "/" + APIPath + "/ATCC-Softomation")]
        [AllowAnonymous]
        public HttpResponseMessage ATCCSoftomation(ATCCSoftomation atcc)
        {
            try
            {
                String FilePath = String.Empty;
                ATCCEventIL aTCCEventIL = new ATCCEventIL();
                aTCCEventIL.SystemProviderId = (short)SystemProviderType.Softomation;
                if (!string.IsNullOrEmpty(atcc.Time))
                {
                    aTCCEventIL.EventDate = Convert.ToDateTime(atcc.Time);
                    aTCCEventIL.EventDateStamp = aTCCEventIL.EventDate.ToString(DateTimeFormatJson);
                    FilePath = "\\ATCC\\" + aTCCEventIL.EventDate.ToString(DateFileFormat) + "\\VehicleImage\\";
                }
                else 
                {
                    aTCCEventIL.EventDate = DateTime.Now;
                    aTCCEventIL.EventDateStamp = aTCCEventIL.EventDate.ToString(DateTimeFormatJson);
                    FilePath = "\\ATCC\\" + aTCCEventIL.EventDate.ToString(DateFileFormat) + "\\VehicleImage\\";
                }
                aTCCEventIL.VehicleClassName = atcc.Class;
                aTCCEventIL.ClassConfidencelevel = atcc.Score;
                aTCCEventIL.EventId = atcc.ID;

                if (!string.IsNullOrEmpty(atcc.Image))
                {
                    string currentPath = HttpContext.Current.Server.MapPath("~/EventMedia/");
                    FilePath = SaveMediaFiles(atcc.Image, currentPath + FilePath, atcc.ID, ".jpeg");
                    aTCCEventIL.VehicleImageUrl = FilePath.Replace(currentPath, "");
                    aTCCEventIL.VehicleImageUrl = aTCCEventIL.VehicleImageUrl.Replace("\\", "/");
                }
                aTCCEventIL.EquipmentIp = atcc.IP;
                if (!string.IsNullOrEmpty(atcc.Lane))
                {
                    try
                    {
                        aTCCEventIL.LaneNumber = Convert.ToInt16(atcc.Lane);
                    }
                    catch (Exception )
                    {

                        aTCCEventIL.LaneNumber = 0;
                    }
                }
               
                #region Send to MSMQ
                JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                var jsonString = json_serializer.Serialize(aTCCEventIL);
                Message m = new Message();
                m.Formatter = new BinaryMessageFormatter();
                m.Body = jsonString;
                m.Recoverable = true;
                RseAtccQueue = MSMQConfig.Create(MSMQConfig.RseAtccQueueName.Replace("{ipaddress}", "."));
                RseAtccQueue.Send(m);
                return Request.CreateResponse(HttpStatusCode.OK);
                #endregion

            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Error in Event-ATCCSoftomation : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError);
            }
        }
    }
}
