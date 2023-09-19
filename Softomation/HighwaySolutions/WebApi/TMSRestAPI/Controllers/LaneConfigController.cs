using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Script.Serialization;
using HighwaySoluations.Softomation.CommonLibrary;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.MasterConfiguration;
using HighwaySoluations.Softomation.TMSSystemLibrary.SystemLogger;
using static HighwaySoluations.Softomation.CommonLibrary.Constants;

namespace TollWebAPI.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class LaneConfigController : ApiController
    {
        const string Provider = SystemConstants.AppProvider;
        const string APIPath = "FastTrackHighway-LaneIntegration";
        IntegrationResponseIL response = new IntegrationResponseIL();
        PlazaConfigurationIL plaza = new PlazaConfigurationIL();
        // static MessageQueue PlazaEntryLaneDataQueue;
        //static MessageQueue PlazaExitLaneDataQueue;
        internal static void LaneAPILog(string message)
        {
            LogMaster.Write(message, ErrorLogModule.LaneConfig);
        }
        string RootPath = HttpContext.Current.Server.MapPath("~/LaneRequest/" + DateTime.Now.ToString("dd-MMM-yyyy") + "/");
        #region Token
        //[Route(Provider + "/Toll360-LaneIntegration/GenerateToken")]
        //[AllowAnonymous]
        //[HttpPost]
        //public HttpResponseMessage GenerateToken(UserManagementIL login)
        //{
        //    try
        //    {
        //        if (login.LoginId.ToLower() == "serviceuser")
        //        {
        //            UserManagementIL obj = new UserManagementIL();
        //            obj.LoginId = login.LoginId.ToLower();
        //            obj.EntryId = 0;
        //            obj.RoleId = 0;
        //            obj.FirstName = Provider;
        //            obj.LastName = "Toll 360";
        //            obj.EmailId = "support@superwaveinfra.com";
        //            obj.MobileNumber = "9999999999";
        //            obj.RoleName = "Service Admin";
        //            obj.PlazaId = Convert.ToInt32(ConfigurationManager.AppSettings["PlazaId"].ToString());
        //            PlazaConfigurationIL plazaDetails = PlazaConfigurationBL.GetByPlazaId(obj.PlazaId);
        //            if (login.LoginPassword == Persistents.Decrypt(ConfigurationManager.AppSettings["tollPassword"].ToString()))
        //            {
        //                UserManagementIL result = (UserManagementIL)Persistents.GetToken(obj);
        //                obj.LoginToken = result.LoginToken;
        //                obj.AccountExpiredDate = result.AccountExpiredDate;
        //                response.ResponseMessage = "success";
        //                response.ResponseData = obj;
        //                return Request.CreateResponse(HttpStatusCode.OK, response);
        //            }
        //            else
        //            {
        //                response.ResponseMessage = "failed";
        //                response.ResponseData = null;
        //                return Request.CreateResponse(HttpStatusCode.OK, response);
        //            }
        //        }
        //        else
        //        {
        //            response.ResponseMessage = "failed";
        //            response.ResponseData = null;
        //            return Request.CreateResponse(HttpStatusCode.OK, response);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        LaneAPILog("Error in GenerateToken : " + ex.Message.ToString());
        //        response.ResponseMessage = "failed";
        //        response.ResponseData = null;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
        //    }
        //}
        #endregion

        #region Transaction Type Management
        [Route(Provider  +"/" + APIPath +"/ServerConfigGet")]
        [HttpGet]
        public HttpResponseMessage ServerConfigGet()
        {
            try
            {
                response.ResponseMessage = "success";
                response.ResponseData = ServerConfig.Deserialize();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in ServerConfigGet : " + ex.Message.ToString());
                response.ResponseMessage = "failed";
                response.ResponseData = null;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        //#region Transaction Type Management
        //[Route(Provider + "/Toll360-LaneIntegration/TransectionTypeGet")]
        //[Authorize]
        //[HttpGet]
        //public HttpResponseMessage TransectionTypeGet()
        //{
        //    try
        //    {
        //        response.ResponseMessage = "success";
        //        response.ResponseData = TransactionTypeBL.GetAll();
        //        return Request.CreateResponse(HttpStatusCode.OK, response);
        //    }
        //    catch (Exception ex)
        //    {
        //        LaneAPILog("Exception in TransectionTypeGet : " + ex.Message.ToString());
        //        response.ResponseMessage = "failed";
        //        response.ResponseData = null;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
        //    }
        //}
        //#endregion
        //#region Exempt Type Management
        //[Route(Provider + "/Toll360-LaneIntegration/ExemptTypeGet")]
        //[Authorize]
        //[HttpGet]
        //public HttpResponseMessage ExemptTypeGet()
        //{
        //    try
        //    {
        //        response.ResponseMessage = "success";
        //        response.ResponseData = ExemptTypeBL.GetAll();
        //        return Request.CreateResponse(HttpStatusCode.OK, response);
        //    }
        //    catch (Exception ex)
        //    {
        //        LaneAPILog("Exception in ExemptTypeGet : " + ex.Message.ToString());
        //        response.ResponseMessage = "failed";
        //        response.ResponseData = null;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
        //    }
        //}

        //#endregion
        //#region Payment Type Management
        //[Route(Provider + "/Toll360-LaneIntegration/PaymentTypeGet")]
        //[Authorize]
        //[HttpGet]
        //public HttpResponseMessage PaymentTypeGet()
        //{
        //    try
        //    {
        //        response.ResponseMessage = "success";
        //        response.ResponseData = PaymentTypeBL.GetAll();
        //        return Request.CreateResponse(HttpStatusCode.OK, response);
        //    }
        //    catch (Exception ex)
        //    {
        //        LaneAPILog("Exception in PaymentTypeGet : " + ex.Message.ToString());
        //        response.ResponseMessage = "failed";
        //        response.ResponseData = null;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
        //    }
        //}

        //#endregion
        //#region Connection Type Management
        //[Route(Provider + "/Toll360-LaneIntegration/ConnectionTypeGet")]
        //[Authorize]
        //[HttpGet]
        //public HttpResponseMessage ConnectionTypeGet()
        //{
        //    try
        //    {
        //        response.ResponseMessage = "success";
        //        response.ResponseData = ConnectionTypeBL.GetAll();
        //        return Request.CreateResponse(HttpStatusCode.OK, response);
        //    }
        //    catch (Exception ex)
        //    {
        //        LaneAPILog("Exception in ConnectionTypeGet : " + ex.Message.ToString());
        //        response.ResponseMessage = "failed";
        //        response.ResponseData = null;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
        //    }
        //}
        //#endregion
        //#region Hardware Type Management
        //[Route(Provider + "/Toll360-LaneIntegration/HardwareTypeGet")]
        //[Authorize]
        //[HttpGet]
        //public HttpResponseMessage HardwareTypeGet()
        //{
        //    try
        //    {
        //        response.ResponseMessage = "success";
        //        response.ResponseData = HardwareTypeBL.GetAll();
        //        return Request.CreateResponse(HttpStatusCode.OK, response);
        //    }
        //    catch (Exception ex)
        //    {
        //        LaneAPILog("Exception in HardwareTypeGet : " + ex.Message.ToString());
        //        response.ResponseMessage = "failed";
        //        response.ResponseData = null;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
        //    }
        //}
        //#endregion
        //#region Hardware Provider Management
        //[Route(Provider + "/Toll360-LaneIntegration/HardwareProviderGet")]
        //[Authorize]
        //[HttpGet]
        //public HttpResponseMessage HardwareProviderGet()
        //{
        //    try
        //    {
        //        response.ResponseMessage = "success";
        //        response.ResponseData = HardwareProviderBL.GetAll();
        //        return Request.CreateResponse(HttpStatusCode.OK, response);
        //    }
        //    catch (Exception ex)
        //    {
        //        LaneAPILog("Exception in HardwareProviderGet : " + ex.Message.ToString());
        //        response.ResponseMessage = "failed";
        //        response.ResponseData = null;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
        //    }
        //}
        //#endregion
        //#region Vehicle Class
        //[Route(Provider + "/Toll360-LaneIntegration/VehicleClassGet")]
        //[Authorize]
        //[HttpGet]
        //public HttpResponseMessage VehicleClassGet()
        //{
        //    try
        //    {
        //        response.ResponseMessage = "success";
        //        response.ResponseData = VehicleClassBL.GetActive(); ;
        //        return Request.CreateResponse(HttpStatusCode.OK, response);
        //    }
        //    catch (Exception ex)
        //    {
        //        LaneAPILog("Exception in VehicleClassGet : " + ex.Message.ToString());
        //        response.ResponseMessage = "failed";
        //        response.ResponseData = null;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
        //    }
        //}


        //#endregion
        //#region Plaza
        //[Route(Provider + "/Toll360-LaneIntegration/PlazaGet")]
        //[Authorize]
        //[HttpGet]
        //public HttpResponseMessage PlazaGet()
        //{
        //    try
        //    {

        //        response.ResponseMessage = "success";
        //        response.ResponseData = PlazaConfigurationBL.GetActive();
        //        return Request.CreateResponse(HttpStatusCode.OK, response);
        //    }
        //    catch (Exception ex)
        //    {
        //        LaneAPILog("Exception in PlazaGet : " + ex.Message.ToString());
        //        response.ResponseMessage = "failed";
        //        response.ResponseData = null;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
        //    }
        //}
        //#endregion
        //#region Lane
        //[Route(Provider + "/Toll360-LaneIntegration/LaneGet")]
        //[Authorize]
        //[HttpGet]
        //public HttpResponseMessage LaneGet(string IpAddress)
        //{
        //    try
        //    {
        //        response.ResponseMessage = "success";
        //        response.ResponseData = LaneManagementBL.GetByIpAddress(IpAddress); ;
        //        return Request.CreateResponse(HttpStatusCode.OK, response);
        //    }
        //    catch (Exception ex)
        //    {
        //        LaneAPILog("Exception in LaneGet : " + ex.Message.ToString());
        //        response.ResponseMessage = "failed";
        //        response.ResponseData = null;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
        //    }
        //}


        //#endregion
        //#region Lane Type
        //[Route(Provider + "/Toll360-LaneIntegration/LaneTypeGet")]
        //[Authorize]
        //[HttpGet]
        //public HttpResponseMessage LaneTypeGet()
        //{
        //    try
        //    {
        //        response.ResponseMessage = "success";
        //        response.ResponseData = LaneTypeBL.GetAll();
        //        return Request.CreateResponse(HttpStatusCode.OK, response);
        //    }
        //    catch (Exception ex)
        //    {
        //        LaneAPILog("Exception in LaneTypeGet : " + ex.Message.ToString());
        //        response.ResponseMessage = "failed";
        //        response.ResponseData = null;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
        //    }
        //}
        //#endregion
        //#region Lane Used
        //[Route(Provider + "/Toll360-LaneIntegration/LaneUsedForGet")]
        //[Authorize]
        //[HttpGet]
        //public HttpResponseMessage LaneUsedForGet()
        //{
        //    try
        //    {
        //        response.ResponseMessage = "success";
        //        response.ResponseData = LaneUsedBL.GetAll();
        //        return Request.CreateResponse(HttpStatusCode.OK, response);
        //    }
        //    catch (Exception ex)
        //    {
        //        LaneAPILog("Exception in LaneUsedForGet : " + ex.Message.ToString());
        //        response.ResponseMessage = "failed";
        //        response.ResponseData = null;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
        //    }
        //}
        //#endregion
        //#region Users
        //[Route(Provider + "/Toll360-LaneIntegration/UsersGet")]
        //[Authorize]
        //[HttpGet]
        //public HttpResponseMessage UsersGet()
        //{
        //    try
        //    {
        //        response.ResponseMessage = "success";
        //        response.ResponseData = UserManagementBL.GetByLaneUsers(Convert.ToInt32(ConfigurationManager.AppSettings["PlazaId"].ToString()));
        //        return Request.CreateResponse(HttpStatusCode.OK, response);
        //    }
        //    catch (Exception ex)
        //    {
        //        LaneAPILog("Exception in UsersGet : " + ex.Message.ToString());
        //        response.ResponseMessage = "failed";
        //        response.ResponseData = null;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
        //    }
        //}

        //[Route(Provider + "/Toll360-LaneIntegration/UsersPwdGet")]
        //[Authorize]
        //[HttpGet]
        //public HttpResponseMessage UsersPwdGet()
        //{
        //    try
        //    {
        //        response.ResponseMessage = "success";
        //        response.ResponseData = UserManagementBL.GetByLaneUsersPwd(Convert.ToInt32(ConfigurationManager.AppSettings["PlazaId"].ToString()));
        //        return Request.CreateResponse(HttpStatusCode.OK, response);
        //    }
        //    catch (Exception ex)
        //    {
        //        LaneAPILog("Exception in UsersPwdGet : " + ex.Message.ToString());
        //        response.ResponseMessage = "failed";
        //        response.ResponseData = null;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
        //    }
        //}
        //#endregion
        //#region Journey
        //[Route(Provider + "/Toll360-LaneIntegration/JourneyGet")]
        //[Authorize]
        //[HttpGet]
        //public HttpResponseMessage JourneyGet()
        //{
        //    try
        //    {
        //        response.ResponseMessage = "success";
        //        response.ResponseData = JourneyBL.GetActive();
        //        return Request.CreateResponse(HttpStatusCode.OK, response);
        //    }
        //    catch (Exception ex)
        //    {
        //        LaneAPILog("Exception in JourneyGet : " + ex.Message.ToString());
        //        response.ResponseMessage = "failed";
        //        response.ResponseData = null;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
        //    }
        //}


        //#endregion
        //#region Shift Details
        //[Route(Provider + "/Toll360-LaneIntegration/ShiftDetailsGet")]
        //[Authorize]
        //[HttpGet]
        //public HttpResponseMessage ShiftDetailsGet()
        //{
        //    try
        //    {
        //        response.ResponseMessage = "success";
        //        response.ResponseData = ShiftManagementBL.GetAll();
        //        return Request.CreateResponse(HttpStatusCode.OK, response);
        //    }
        //    catch (Exception ex)
        //    {
        //        LaneAPILog("Exception in ShiftDetailsGet : " + ex.Message.ToString());
        //        response.ResponseMessage = "failed";
        //        response.ResponseData = null;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
        //    }
        //}


        //#endregion
        //#region Hardware
        //[Route(Provider + "/Toll360-LaneIntegration/HardwareGet")]
        //[Authorize]
        //[HttpGet]
        //public HttpResponseMessage HardwareGet(string IpAddress)
        //{
        //    try
        //    {
        //        response.ResponseMessage = "success";
        //        response.ResponseData = HardwareManagementBL.GetByLaneIpAddress(IpAddress); ;
        //        return Request.CreateResponse(HttpStatusCode.OK, response);
        //    }
        //    catch (Exception ex)
        //    {
        //        LaneAPILog("Exception in HardwareGet : " + ex.Message.ToString());
        //        response.ResponseMessage = "failed";
        //        response.ResponseData = null;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
        //    }
        //}
        //#endregion
        //#region MOP Mapping
        //[Route(Provider + "/Toll360-LaneIntegration/MOPMappingGet")]
        //[Authorize]
        //[HttpGet]
        //public HttpResponseMessage MOPMappingGet()
        //{
        //    try
        //    {
        //        response.ResponseMessage = "success";
        //        response.ResponseData = MOPMappingBL.GetAll();
        //        return Request.CreateResponse(HttpStatusCode.OK, response);
        //    }
        //    catch (Exception ex)
        //    {
        //        LaneAPILog("Exception in MOPMappingGet : " + ex.Message.ToString());
        //        response.ResponseMessage = "failed";
        //        response.ResponseData = null;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
        //    }
        //}
        //#endregion
        //#region System Integrator
        //[Route(Provider + "/Toll360-LaneIntegration/SystemIntegratorGet")]
        //[Authorize]
        //[HttpGet]
        //public HttpResponseMessage SystemIntegratorGet()
        //{
        //    try
        //    {
        //        response.ResponseMessage = "success";
        //        response.ResponseData = SystemIntegratorBL.GetAll();
        //        return Request.CreateResponse(HttpStatusCode.OK, response);
        //    }
        //    catch (Exception ex)
        //    {
        //        LaneAPILog("Exception in SystemIntegratorGet : " + ex.Message.ToString());
        //        response.ResponseMessage = "failed";
        //        response.ResponseData = null;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
        //    }
        //}
        //#endregion

        #region Master Config
        //[Route(Provider + "/" + APIPath + "/MasterConfigGet")]
        //[Authorize]
        //[HttpGet]
        //public HttpResponseMessage MasterConfigGet()
        //{
        //    try
        //    {
        //        response.ResponseMessage = "success";
        //        response.ResponseData = MasterConfigBL.GetConfig();
        //        return Request.CreateResponse(HttpStatusCode.OK, response);
        //    }
        //    catch (Exception ex)
        //    {
        //        LaneAPILog("Exception in MasterConfigGet : " + ex.Message.ToString());
        //        response.ResponseMessage = "failed";
        //        response.ResponseData = null;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
        //    }
        //}
        #endregion

        //#region System Setting Config
        //[Route(Provider + "/Toll360-LaneIntegration/SystemSettingGet")]
        //[Authorize]
        //[HttpGet]
        //public HttpResponseMessage SystemSettingGet()
        //{
        //    try
        //    {
        //        response.ResponseMessage = "success";
        //        response.ResponseData = SystemSettingBL.Get();
        //        return Request.CreateResponse(HttpStatusCode.OK, response);
        //    }
        //    catch (Exception ex)
        //    {
        //        LaneAPILog("Exception in SystemSettingGet : " + ex.Message.ToString());
        //        response.ResponseMessage = "failed";
        //        response.ResponseData = null;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
        //    }
        //}
        //#endregion
        //#region Denomination List
        //[Route(Provider + "/Toll360-LaneIntegration/DenominationListGet")]
        //[Authorize]
        //[HttpGet]
        //public HttpResponseMessage DenominationListGet()
        //{
        //    try
        //    {
        //        response.ResponseMessage = "success";
        //        response.ResponseData = DenominationBL.GetAll();
        //        return Request.CreateResponse(HttpStatusCode.OK, response);
        //    }
        //    catch (Exception ex)
        //    {
        //        LaneAPILog("Exception in DenominationListGet : " + ex.Message.ToString());
        //        response.ResponseMessage = "failed";
        //        response.ResponseData = null;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
        //    }
        //}
        //#endregion
        //#region Toll Fare
        //[Route(Provider + "/Toll360-LaneIntegration/TollFareDetailsGet")]
        //[Authorize]
        //[HttpPost]
        //public HttpResponseMessage TollFareDetailsGet(FareDetailsIL fare)
        //{
        //    try
        //    {
        //        response.ResponseMessage = "success";
        //        response.ResponseData = FareManagementBL.GetAllByDate(fare);
        //        return Request.CreateResponse(HttpStatusCode.OK, response);
        //    }
        //    catch (Exception ex)
        //    {
        //        LaneAPILog("Exception in TollFareDetailsGet : " + ex.Message.ToString());
        //        response.ResponseMessage = "failed";
        //        response.ResponseData = null;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
        //    }
        //}
        //#endregion
        //#region Lane Transcation Data
        //[Route(Provider + "/Toll360-LaneIntegration/LaneTranscation")]
        //[Authorize]
        //[HttpPost]
        //public HttpResponseMessage LaneTranscation(LaneTransactionIL laneData)
        //{
        //    try
        //    {
        //        int InsertFromApi = 0;
        //        LaneDataSyncResponse res = new LaneDataSyncResponse();
        //        var serializer1 = new JavaScriptSerializer() { MaxJsonLength = 99999990 };
        //        string Inputjson1 = serializer1.Serialize(laneData);

        //        LaneAPILog("Lane Data : " + RootPath + " " + Inputjson1);

        //        if (!Directory.Exists(RootPath))
        //        {
        //            Directory.CreateDirectory(RootPath);
        //        }


        //        if (laneData.LaneTransId > 0)
        //        {
        //            if (laneData.LaneType == (short)Persistents.LaneType.Entry)
        //            {

        //                var filepath = RootPath + "EntryLane/";
        //                if (!Directory.Exists(filepath))
        //                {
        //                    Directory.CreateDirectory(filepath);
        //                }
        //                filepath = filepath + "Lane_" + laneData.LaneNumber.ToString() + "/";
        //                if (!Directory.Exists(filepath))
        //                {
        //                    Directory.CreateDirectory(filepath);
        //                }
        //                var guid = Guid.NewGuid().ToString();
        //                filepath = filepath + DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss-fff") + "-GUID-" + guid + ".json";
        //                File.Create(filepath).Dispose();
        //                File.WriteAllText(filepath, Inputjson1);



        //                if (laneData.PlazaId == Convert.ToInt16(ConfigurationManager.AppSettings["PlazaId"].ToString()))
        //                {
        //                    try
        //                    {
        //                        InsertFromApi = Convert.ToInt16(ConfigurationManager.AppSettings["InsertFromApi"].ToString());
        //                    }
        //                    catch(Exception ex)
        //                    {

        //                    }


        //                    try
        //                    {
        //                        var serializer = new JavaScriptSerializer() { MaxJsonLength = 86753090 };
        //                        string Inputjson = serializer.Serialize(laneData);
        //                        //LaneAPILog("Entry Lane Data : " + Inputjson);

        //                        if (InsertFromApi == 1)
        //                        {

        //                            if (!string.IsNullOrEmpty(laneData.TagReadDateTimeStamp))
        //                                laneData.TagReadDateTime = Convert.ToDateTime(laneData.TagReadDateTimeStamp);
        //                            #region Reveiwed Required

        //                            laneData.ReveiwedRequired = 0;
        //                            if (laneData.VehicleSubClassId != laneData.AvcClassId && laneData.AvcClassId > 0)
        //                            {
        //                                laneData.ReveiwedRequired = 1;
        //                            }
        //                            if (laneData.Simulation == 1)
        //                            {
        //                                laneData.ReveiwedRequired = 1;
        //                            }

        //                            #endregion
        //                            if (!LaneTransactionBL.CheckDuplicateLaneId(laneData))
        //                            {
        //                                LaneAPILog("Going to Insert Started for this lane trans id " + Convert.ToString(laneData.LaneTransId));
        //                                laneData = LaneTransactionBL.EntryInsert(laneData);
        //                                LaneAPILog("Going to Insert Finished for this lane trans id " + Convert.ToString(laneData.LaneTransId));
        //                                res.ServerTransId = laneData.LaneTransId;
        //                                res.ResponseMessage = "success";
        //                            }
        //                            else
        //                            {
        //                                LaneAPILog(Convert.ToString(laneData.LaneTransId) + " Already Inserted in DB, So returning duplicate");
        //                                res.ServerTransId = laneData.LaneTransId;
        //                                res.ResponseMessage = "Duplicate";
        //                                //LogMessage("Discard Duplicate PlazaEntryLane : " + EntryQueuelane.LaneTransId.ToString());
        //                            }
        //                        }
        //                        else
        //                        {
        //                            #region Send to MSMQ
        //                            Message m = new Message();
        //                            m.Formatter = new BinaryMessageFormatter();
        //                            m.Body = Inputjson;
        //                            m.Recoverable = true;
        //                            PlazaEntryLaneDataQueue = MessageQueuing.Create(MessageQueuing.PlazaEntryLaneDataQueueName.Replace("{ipaddress}", "."));
        //                            PlazaEntryLaneDataQueue.Send(m);
        //                            res.ServerTransId = laneData.LaneTransId;
        //                            res.ResponseMessage = "success";
        //                            #endregion
        //                        }

        //                    }
        //                    catch (Exception ex)
        //                    {
        //                        res.ServerTransId = 0;
        //                        res.ResponseMessage = "failed";
        //                        LaneAPILog("Exception in to send in  EntryLane Q : " + ex.Message.ToString());
        //                    }

        //                }
        //                else
        //                {
        //                    res.ServerTransId = 0;
        //                    res.ResponseMessage = "Plaza Id must be valid";
        //                }
        //            }
        //            else if (laneData.LaneType == (short)Persistents.LaneType.Exit)
        //            {

        //                var filepath = RootPath + "ExitLane/";
        //                if (!Directory.Exists(filepath))
        //                {
        //                    Directory.CreateDirectory(filepath);
        //                }
        //                filepath = filepath + "Lane_" + laneData.LaneNumber.ToString() + "/";
        //                if (!Directory.Exists(filepath))
        //                {
        //                    Directory.CreateDirectory(filepath);
        //                }
        //                var guid = Guid.NewGuid().ToString();
        //                filepath = filepath + DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss-fff") + "-GUID-" + guid + ".json";
        //                File.Create(filepath).Dispose();
        //                File.WriteAllText(filepath, Inputjson1);


        //                if (laneData.DestinationPlazaId == Convert.ToInt16(ConfigurationManager.AppSettings["PlazaId"].ToString()))
        //                {

        //                    try
        //                    {
        //                        InsertFromApi = Convert.ToInt16(ConfigurationManager.AppSettings["InsertFromApi"].ToString());
        //                    }
        //                    catch (Exception ex)
        //                    {

        //                    }



        //                    try
        //                    {
        //                        var serializer = new JavaScriptSerializer() { MaxJsonLength = 86753090 };
        //                        string Inputjson = serializer.Serialize(laneData);


        //                        if (InsertFromApi == 1)
        //                        {
        //                            if (!string.IsNullOrEmpty(laneData.TagReadDateTimeStamp))
        //                                laneData.TagReadDateTime = Convert.ToDateTime(laneData.TagReadDateTimeStamp);

        //                            laneData.ReveiwedRequired = 0;
        //                            if (laneData.VehicleSubClassId != laneData.AvcClassId && laneData.AvcClassId > 0)
        //                            {
        //                                laneData.ReveiwedRequired = 1;
        //                            }
        //                            if (laneData.Simulation == 1)
        //                            {
        //                                laneData.ReveiwedRequired = 1;
        //                            }

        //                            if (!string.IsNullOrEmpty(laneData.EntryTagId_Qrcode))
        //                            {
        //                                LaneTransactionIL EntryLane = LaneTransactionBL.GetEntryLaneByQrCode(laneData);
        //                                if (EntryLane != null)
        //                                {
        //                                    if (EntryLane.PlazaId > 0)
        //                                    {
        //                                        laneData.SourcePlazaId = EntryLane.PlazaId;
        //                                        laneData.SourceTranscationId = EntryLane.EntryId;
        //                                        //Exitlane.PlazaId = Exitlane.DestinationPlazaId;
        //                                    }
        //                                    else
        //                                    {
        //                                        laneData.SourcePlazaId = laneData.PlazaId;
        //                                    }
        //                                }
        //                                else
        //                                {
        //                                    laneData.SourcePlazaId = laneData.PlazaId;
        //                                    //Exitlane.PlazaId = Exitlane.DestinationPlazaId;
        //                                }
        //                            }
        //                            else
        //                                laneData.SourcePlazaId = laneData.PlazaId;

        //                            if (!LaneTransactionBL.CheckDuplicateLaneId(laneData))
        //                            {
        //                                plaza = PlazaConfigurationBL.GetByPlazaId(Convert.ToInt16(ConfigurationManager.AppSettings["PlazaId"].ToString()));
        //                                laneData.FasTagTranscationId = plaza.PlazaZoneId.ToString() + laneData.LaneNumber.ToString("000").Replace("0", "L") + Convert.ToDateTime(laneData.TransactionDateTime).ToString(Persistents.dateTimeFormatTxnFastTagFormat);
        //                                LaneAPILog("Going to Insert Started for this lane trans id " + Convert.ToString(laneData.LaneTransId));
        //                                laneData = LaneTransactionBL.ExitInsert(laneData);
        //                                LaneAPILog("Going to Insert Finished for this lane trans id " + Convert.ToString(laneData.LaneTransId));
        //                                res.ServerTransId = laneData.LaneTransId;
        //                                res.ResponseMessage = "success";
        //                            }
        //                            else
        //                            {
        //                                res.ServerTransId = laneData.LaneTransId;
        //                                res.ResponseMessage = "Duplicate";
        //                                LaneAPILog("Already Inserted in DB, return duplicate " + Convert.ToString(laneData.LaneTransId));
        //                                //LogMessage("Discard Duplicate PlazaExitLane : " + laneData.LaneTransId.ToString());
        //                            }
        //                        }
        //                        else
        //                        {

        //                            #region Send to MSMQ
        //                            //LaneAPILog("Exit Lane Data : " + Inputjson);
        //                            Message m = new Message();
        //                            m.Formatter = new BinaryMessageFormatter();
        //                            m.Body = Inputjson;
        //                            m.Recoverable = true;
        //                            PlazaExitLaneDataQueue = MessageQueuing.Create(MessageQueuing.PlazaExitLaneDataQueue.Replace("{ipaddress}", "."));
        //                            PlazaExitLaneDataQueue.Send(m);
        //                            res.ServerTransId = laneData.LaneTransId;
        //                            res.ResponseMessage = "success";
        //                            #endregion
        //                        }
        //                    }
        //                    catch (Exception ex)
        //                    {
        //                        res.ServerTransId = 0;
        //                        res.ResponseMessage = "failed";
        //                        LaneAPILog("Exception in to send in  ExitLane Q : " + ex.Message.ToString());
        //                    }

        //                }
        //                else
        //                {
        //                    res.ServerTransId = 0;
        //                    res.ResponseMessage = "Plaza Id must be valid";
        //                }
        //            }
        //            else
        //            {
        //                res.ServerTransId = 0;
        //                res.ResponseMessage = "success";
        //            }
        //            return Request.CreateResponse(HttpStatusCode.OK, res);
        //        }
        //        else
        //        {
        //            res.ServerTransId = 0;
        //            res.ResponseMessage = "Lane transcation id must be valid";
        //            return Request.CreateResponse(HttpStatusCode.OK, res);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        LaneAPILog("Exception in LaneTranscation : " + ex.Message.ToString());
        //        response.ResponseMessage = "failed";
        //        response.ResponseData = null;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
        //    }
        //}

        //[Route(Provider + "/Toll360-LaneIntegration/LaneTranscationAck")]
        //[Authorize]
        //[HttpPost]
        //public HttpResponseMessage LaneTranscationAck(LaneTransactionIL laneData)
        //{
        //    try
        //    {
        //        LaneDataSyncResponse res = new LaneDataSyncResponse();
        //        var serializer1 = new JavaScriptSerializer() { MaxJsonLength = 99999990 };
        //        string Inputjson1 = serializer1.Serialize(laneData);
        //        if (laneData.LaneTransId > 0)
        //        {

        //            if (laneData.LaneType == (short)Persistents.LaneType.Entry)
        //            {
        //                #region Send Get ACK from DB
        //                try
        //                {
        //                    laneData = LaneTransactionBL.GetByEntryLaneTransId(laneData);
        //                    res.ServerTransId = laneData.EntryId;
        //                    res.ResponseMessage = "success";
        //                }
        //                catch (Exception ex)
        //                {
        //                    res.ResponseMessage = "failed";
        //                    LaneAPILog("Exception in to get ACK in  EntryLane : " + ex.Message.ToString());
        //                }
        //                #endregion
        //            }
        //            else if (laneData.LaneType == (short)Persistents.LaneType.Exit)
        //            {
        //                #region Send to MSMQ
        //                try
        //                {
        //                    //if (string.IsNullOrEmpty(laneData.EntryTagId_Qrcode))
        //                    //{
        //                    //    if (laneData.TransactionTypeId == 2)
        //                    //        laneData.PlazaId = laneData.DestinationPlazaId;
        //                    //}
        //                    laneData.PlazaId = laneData.DestinationPlazaId;
        //                    var serializerAck = new JavaScriptSerializer() { MaxJsonLength = 86753090 };
        //                    //LaneAPILog("shiv pratap Test : " + serializerAck.Serialize(laneData));
        //                    laneData = LaneTransactionBL.GetByExitLaneTransId(laneData);
        //                    res.ServerTransId = laneData.EntryId;
        //                    res.ResponseMessage = "success";

        //                }
        //                catch (Exception ex)
        //                {
        //                    res.ServerTransId = 0;
        //                    res.ResponseMessage = "failed";
        //                    LaneAPILog("Exception in to get ACK in  ExitLane : " + ex.Message.ToString());
        //                }
        //                #endregion

        //            }
        //            else
        //            {
        //                res.ServerTransId = 0;
        //                res.ResponseMessage = "success";
        //            }


        //            //if (laneData.PlazaId == Convert.ToInt16(ConfigurationManager.AppSettings["PlazaId"].ToString()))
        //            //{
        //            //    if (laneData.LaneType == (short)Persistents.LaneType.Entry)
        //            //    {
        //            //        #region Send Get ACK from DB
        //            //        try
        //            //        {
        //            //            laneData = LaneTransactionBL.GetByEntryLaneTransId(laneData);
        //            //            res.ServerTransId = laneData.EntryId;
        //            //            res.ResponseMessage = "success";
        //            //        }
        //            //        catch (Exception ex)
        //            //        {
        //            //            res.ResponseMessage = "failed";
        //            //            LaneAPILog("Exception in to get ACK in  EntryLane : " + ex.Message.ToString());
        //            //        }
        //            //        #endregion
        //            //    }
        //            //    else if (laneData.LaneType == (short)Persistents.LaneType.Exit)
        //            //    {
        //            //        #region Send to MSMQ
        //            //        try
        //            //        {
        //            //            laneData = LaneTransactionBL.GetByExitLaneTransId(laneData);
        //            //            res.ServerTransId = laneData.EntryId;
        //            //            res.ResponseMessage = "success";

        //            //        }
        //            //        catch (Exception ex)
        //            //        {
        //            //            res.ServerTransId = 0;
        //            //            res.ResponseMessage = "failed";
        //            //            LaneAPILog("Exception in to get ACK in  ExitLane : " + ex.Message.ToString());
        //            //        }
        //            //        #endregion

        //            //    }
        //            //    else
        //            //    {
        //            //        res.ServerTransId = 0;
        //            //        res.ResponseMessage = "success";
        //            //    }
        //            //}
        //            //else
        //            //{
        //            //    res.ServerTransId = 0;
        //            //    res.ResponseMessage = "Plaza Id must be valid";
        //            //}
        //            return Request.CreateResponse(HttpStatusCode.OK, res);
        //        }
        //        else
        //        {
        //            res.ServerTransId = 0;
        //            res.ResponseMessage = "Lane transcation id must be valid";
        //            return Request.CreateResponse(HttpStatusCode.OK, res);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        LaneAPILog("Exception in LaneTranscation : " + ex.Message.ToString());
        //        response.ResponseMessage = "failed";
        //        response.ResponseData = null;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
        //    }
        //}
        //#endregion
    }
}
