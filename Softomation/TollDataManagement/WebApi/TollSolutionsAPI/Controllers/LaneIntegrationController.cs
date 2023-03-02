using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Messaging;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;
using Softomation.DMS.Libraries.CommonLibrary;
using Softomation.DMS.Libraries.CommonLibrary.BusinessLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;
using Softomation.DMS.Libraries.CommonLibrary.Json;
using Softomation.DMS.Libraries.CommonLibrary.MSMQ;
using TollSolutionsAPI.Models;
using static TollSolutionsAPI.Models.CommonMethods;

namespace TollSolutionsAPI.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class LaneIntegrationController : ApiController
    {
        const string Provider = Constants.AppProvider;
        static System.Messaging.MessageQueue PlazaEntryLaneDataQueue;
        static System.Messaging.MessageQueue PlazaExitLaneDataQueue;
        List<ResponceMessage> responceMessae = new List<ResponceMessage>();
        IntegrationRequestResponce responce = new IntegrationRequestResponce();
        #region Master Data
        [Route(Provider + "/Toll360-CloseToll/Lane/GetLaneUsersDetails")]
        [HttpGet]
        public HttpResponseMessage GetLaneUsersDetails()
        {
            try
            {
                List<UserManagementIL> users = UserManagementBL.SharedLaneUsers();
                responce.ResponceMessage = "success";
                responce.ResponceData = users;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in GetLaneUsersDetails : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Lane/GetLaneDetails")]
        [HttpGet]
        public HttpResponseMessage GetLaneDetails()
        {
            try
            {
                List<LaneManagementIL> lanes = LaneManagementBL.GetAll();
                responce.ResponceMessage = "success";
                responce.ResponceData = lanes;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in GetLaneDetails : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Lane/GetLaneByLaneNumber")]
        [HttpPost]
        public HttpResponseMessage GetLaneDetailByLaneNumber(LaneManagementIL lane)
        {
            try
            {
                LaneManagementIL lanes = LaneManagementBL.GetByLaneNumber(lane);
                responce.ResponceMessage = "success";
                responce.ResponceData = lanes;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in GetLaneDetailByLaneNumber : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }


        [Route(Provider + "/Toll360-CloseToll/Lane/GetLaneByIPDetails")]
        [HttpPost]
        public HttpResponseMessage GetLaneByIPDetails(LaneManagementIL lane)
        {
            try
            {
                LaneManagementIL lanes = LaneManagementBL.GetByIpAddress(lane.LaneIP);
                responce.ResponceMessage = "success";
                responce.ResponceData = lanes;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in GetLaneByIPDetails : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Lane/GetPlazaDetails")]
        [HttpGet]
        public HttpResponseMessage GetPlazaDetails()
        {
            try
            {
                PlazaManagementIL plaza = PlazaManagementBL.GetById(Convert.ToInt16(ConfigurationManager.AppSettings["PlazaId"].ToString()));
                responce.ResponceMessage = "success";
                responce.ResponceData = plaza;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in GetPlazaDetails : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Lane/GetAllPlazaDetails")]
        [HttpGet]
        public HttpResponseMessage GetAllPlazaDetails()
        {
            try
            {
                List<PlazaManagementIL> plazas = PlazaManagementBL.GetActive();
                responce.ResponceMessage = "success";
                responce.ResponceData = plazas;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in GetAllPlazaDetails : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Lane/GetClientDetails")]
        [HttpGet]
        public HttpResponseMessage GetClientDetails()
        {
            try
            {
                PlazaManagementIL plaza = PlazaManagementBL.GetById(Convert.ToInt16(ConfigurationManager.AppSettings["PlazaId"].ToString()));
                ClientManagementIL clients = ClientManagementBL.GetById(plaza.ClientId);
                responce.ResponceMessage = "success";
                responce.ResponceData = clients;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in GetClientDetails : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Lane/GetConnectionType")]
        [HttpGet]
        public HttpResponseMessage GetConnectionType()
        {
            try
            {
                List<ConnectionTypeIL> connectionTypes = ConnectionTypeBL.GetAll();
                responce.ResponceMessage = "success";
                responce.ResponceData = connectionTypes;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in GetConnectionType : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Lane/GetHardwareType")]
        [HttpGet]
        public HttpResponseMessage GetHardwareType()
        {
            try
            {
                List<HardwareTypeIL> hardwareTypes = HardwareTypeBL.GetAll();
                responce.ResponceMessage = "success";
                responce.ResponceData = hardwareTypes;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in GetHardwareType : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Lane/GetHardwareProvider")]
        [HttpGet]
        public HttpResponseMessage GetHardwareProvider()
        {
            try
            {
                List<HardwareProviderIL> haredwaresProvider = HardwareProviderBL.GetAll();
                responce.ResponceMessage = "success";
                responce.ResponceData = haredwaresProvider;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in GetHardwareProvider : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Lane/GetHardwareDetails")]
        [HttpGet]
        public HttpResponseMessage GetHardwareDetails()
        {
            try
            {
                responce.ResponceMessage = "success";
                responce.ResponceData = HardwareManagementBL.GetAllTest();
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in GetHardwareDetails : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Lane/GetLaneHardwareDetails")]
        [HttpPost]
        public HttpResponseMessage GetLaneHardwareDetails(HardwareManagementIL lane)
        {
            try
            {
                List<HardwareManagementIL> hrdware = HardwareManagementBL.GetByLaneNumber(lane);
                responce.ResponceMessage = "success";
                responce.ResponceData = hrdware;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in GetLaneHardwareDetails : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }


        [Route(Provider + "/Toll360-CloseToll/Lane/GetVehicleClassDetails")]
        [HttpGet]
        public HttpResponseMessage GetVehicleClassDetails()
        {
            try
            {
                List<VehicleClassIL> vc = VehicleClassBL.GetActive();
                responce.ResponceMessage = "success";
                responce.ResponceData = vc;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in GetVehicleClassDetails : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Lane/GetTollFareDetails")]
        [HttpPost]
        public HttpResponseMessage GetTollFareDetails(FareDetailsIL fare)
        {
            try
            {
                FareManagementIL fareDetails = FareManagementBL.GetAllByDate(fare);
                responce.ResponceMessage = "success";
                responce.ResponceData = fareDetails;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in GetTollFareDetails : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }



        [Route(Provider + "/Toll360-CloseToll/Lane/GetShiftDetails")]
        [HttpGet]
        public HttpResponseMessage GetShiftDetails()
        {
            try
            {
                List<ShiftManagementIL> shifts = ShiftManagementBL.GetAll();
                responce.ResponceMessage = "success";
                responce.ResponceData = shifts;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in GetShiftDetails : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);

            }
        }

        [Route(Provider + "/Toll360-CloseToll/Lane/GetExemptTypeDetails")]
        [HttpGet]
        public HttpResponseMessage GetExemptTypeDetails()
        {
            try
            {
                List<ExemptTypeIL> exemptType = ExemptTypeBL.GetAll();
                responce.ResponceMessage = "success";
                responce.ResponceData = exemptType;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in GetExemptTypeDetails : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Lane/GetTransactionTypeDetails")]
        [HttpGet]
        public HttpResponseMessage GetTransactionTypeDetails()
        {
            try
            {
                List<TransactionTypeIL> transactionType = TransactionTypeBL.GetAll();
                responce.ResponceMessage = "success";
                responce.ResponceData = transactionType;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in GetTransactionTypeDetails : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Lane/GetPaymentTypeDetails")]
        [HttpGet]
        public HttpResponseMessage GetPaymentTypeDetails()
        {
            try
            {
                List<PaymentTypeIL> paymentType = PaymentTypeBL.GetAll();
                responce.ResponceMessage = "success";
                responce.ResponceData = paymentType;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in GetPaymentTypeDetails : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Lane/GetByHardwareType")]
        [HttpGet]
        public HttpResponseMessage GetByHardwareType()
        {
            try
            {
                List<HardwareTypeIL> hardwariesTypes = HardwareTypeBL.GetAll();
                responce.ResponceMessage = "success";
                responce.ResponceData = hardwariesTypes;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in GetByHardwareType : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Lane/GetDenominationList")]
        [HttpGet]
        public HttpResponseMessage GetDenominationList()
        {
            try
            {
                List<DenominationIL> cashFlows = DenominationBL.GetAll();
                responce.ResponceMessage = "success";
                responce.ResponceData = cashFlows;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in GetDenominationList : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Lane/GetMasterConfig")]
        [HttpGet]
        public HttpResponseMessage GetMasterConfig()
        {
            try
            {
                MasterConfigIL masterConfig = MasterConfigBL.GetConfig();
                responce.ResponceMessage = "success";
                responce.ResponceData = masterConfig;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in GetMasterConfig : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Lane/GetSystemSetting")]
        [HttpGet]
        public HttpResponseMessage GetSystemSetting()
        {
            try
            {
                SystemSettingIL systemSetting = SystemSettingBL.GetSetting();
                responce.ResponceMessage = "success";
                responce.ResponceData = systemSetting;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in GetSystemSetting : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Lane/ValidateTCLogin")]
        [HttpPost]
        public HttpResponseMessage ValidateTCLogin(CashFlowConfigurationIL cashFlow)
        {
            try
            {
                bool result = false;
                List<ResponceIL> resp = CashFlowConfigurationBL.ValidateTCLogin(cashFlow);
                foreach (var ResponceIL in resp)
                {
                    if (ResponceIL.AlertMessage == "User details not found")
                    {
                        ResponceMessage objMessage = new ResponceMessage();
                        objMessage.AlertMessage = ResponceIL.AlertMessage;
                        responceMessae.Add(objMessage);
                        result = false;
                        break;
                    }
                    else if (ResponceIL.AlertMessage == "User role not set")
                    {
                        ResponceMessage objMessage = new ResponceMessage();
                        objMessage.AlertMessage = ResponceIL.AlertMessage;
                        responceMessae.Add(objMessage);
                        result = false;
                        break;
                    }
                    else if (ResponceIL.AlertMessage == "This is testing user")
                    {
                        ResponceMessage objMessage = new ResponceMessage();
                        objMessage.AlertMessage = "success";
                        responceMessae.Add(objMessage);
                        result = true;
                        break;
                    }
                    else if (ResponceIL.AlertMessage == "success")
                    {
                        ResponceMessage objMessage = new ResponceMessage();
                        objMessage.AlertMessage = "success";
                        responceMessae.Add(objMessage);
                        result = true;
                        break;
                    }
                    else if (ResponceIL.AlertMessage == "failed")
                    {
                        ResponceMessage objMessage = new ResponceMessage();
                        objMessage.AlertMessage = "Cash is not allotted for this user";
                        responceMessae.Add(objMessage);
                        result = false;
                        break;
                    }
                }
                return Request.CreateResponse(HttpStatusCode.OK, responceMessae);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in ValidateTCLogin : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }
        #endregion

        #region Lane Transactions
        [Route(Provider + "/Toll360-CloseToll/Lane/GetTollFare")]
        [HttpPost]
        public HttpResponseMessage GetTollFare(FareDetailsIL fare)
        {
            try
            {
                FareDetailsIL fareDetails = FareManagementBL.GetFareByJourney(fare);
                if (fare.Journey == "Found")
                {
                    ValidatFareResponce vfare = new ValidatFareResponce();
                    vfare.TollFare = fareDetails.TollFare;
                    vfare.PenaltyFare = fareDetails.PenaltyFare;
                    vfare.OverWeightFare = fareDetails.OverWeightFare;
                    vfare.ReturnFare = fareDetails.ReturnFare;
                    responce.ResponceMessage = "success";
                    responce.ResponceData = vfare;
                    return Request.CreateResponse(HttpStatusCode.OK, responce);

                }
                else
                {
                    responce.ResponceMessage = "Toll fare not found";
                    responce.ResponceData = null;
                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                }
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in GetTollFare : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }
        [Route(Provider + "/Toll360-CloseToll/Lane/EntryLane")]
        [HttpPost]
        public HttpResponseMessage EntryLaneSync(LaneTransactionSerialIL lane)
        {
            try
            {
                LaneDataSyncResponce res = new LaneDataSyncResponce();
                if (lane.ClientId > 0 && lane.LaneTransId > 0)
                {
                    if (lane.LaneType == 1)
                    {
                        if (lane.PlazaId == Convert.ToInt16(ConfigurationManager.AppSettings["PlazaId"].ToString()))
                        {
                            #region Save Proof
                            var path = Constants.MediaPath(lane.PlazaId, lane.LaneNumber, lane.TransactionTimeStamp);
                            var FileName = Constants.RandomString(5) + "-" + lane.TransactionTimeStamp.ToString(Constants.dateTimeFormatFileName);
                            if (!string.IsNullOrEmpty(lane.TransactionImage))
                            {
                                CommonMethods.SaveImage(lane.TransactionImage, path + "/image/", "Transcation", FileName, ".jpeg");
                                lane.TransactionImage = path + "/image/" + FileName + ".jpeg";
                            }
                            if (!string.IsNullOrEmpty(lane.TransactionVideo))
                            {
                                CommonMethods.SaveImage(lane.TransactionVideo, path + "/video/", "Transcation", FileName, ".mp4");
                                lane.TransactionVideo = path + "/video/" + FileName + ".mp4";
                            }
                            #endregion
                            #region Reveiwed Required
                            TransactionTypeIL tranType = TransactionTypeBL.GetById(lane.TransactionTypeId);
                            lane.ReveiwedRequired = tranType.ReveiwedRequired;
                            if (lane.MappingClassId != lane.AvcClassId && lane.AvcClassId > 0)
                            {
                                lane.ReveiwedRequired = 1;
                            }
                            #endregion
                            #region Send to MSMQ
                            try
                            {
                                Message m = new Message();
                                m.Formatter = new BinaryMessageFormatter();
                                m.Body = lane;
                                m.Recoverable = true;
                                PlazaEntryLaneDataQueue = MSMQConfiguration.Create(MSMQConfiguration.PlazaEntryLaneDataQueueName.Replace("{ipaddress}", "."));
                                PlazaEntryLaneDataQueue.Send(m);
                                res.ResponceMessage = "success";
                            }
                            catch (Exception ex)
                            {
                                res.ResponceMessage = "failed";
                                LaneAPILog("Exception in to send in  EntryLane Q : " + ex.Message.ToString());
                            }
                            #endregion
                        }
                        else
                        {
                            res.CrTransId = 0;
                            res.ResponceMessage = "Plaza Id must be valid";
                        }
                    }
                    else
                    {
                        res.CrTransId = 0;
                        res.ResponceMessage = "Only Entry lane transcation allowed";
                    }
                }
                else
                {

                    res.CrTransId = 0;
                    res.ResponceMessage = "Client & Lane transcation id must be valid";
                    return Request.CreateResponse(HttpStatusCode.OK, res);
                }
                return Request.CreateResponse(HttpStatusCode.OK, res);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in EntryLane : " + ex.Message.ToString());
                LaneDataSyncResponce res = new LaneDataSyncResponce();
                res.CrTransId = 0;
                res.ResponceMessage = "failed";
                return Request.CreateResponse(HttpStatusCode.OK, res);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Lane/ExitLane")]
        [HttpPost]
        public HttpResponseMessage ExitLaneSync(LaneTransactionSerialIL lane)
        {
            try
            {
                LaneAPILog("Step 0 : ");
                LaneDataSyncResponce res = new LaneDataSyncResponce();
                if (lane.ClientId > 0 && lane.LaneTransId > 0)
                {
                    if (lane.LaneType == 2)
                    {
                        if (lane.PlazaId == Convert.ToInt16(ConfigurationManager.AppSettings["PlazaId"].ToString()))
                        {
                            bool DuplicateCashReceipt = false;

                            //LaneAPILog("Step 1 : ");
                            if (lane.TransactionTypeId == 2)
                            {

                                #region Serializable Data
                                LaneTransactionIL laneData = new LaneTransactionIL();
                                laneData.AvcClassId = lane.AvcClassId;
                                if (string.IsNullOrEmpty(lane.AvcClassName))
                                    laneData.AvcClassName = string.Empty;
                                else
                                    laneData.AvcClassName = lane.AvcClassName;
                                laneData.Chargeable = lane.Chargeable;
                                laneData.ClientId = lane.ClientId;

                                if (string.IsNullOrEmpty(lane.ClientName))
                                    laneData.ClientName = string.Empty;
                                else
                                    laneData.ClientName = lane.ClientName;
                                laneData.ConfirmationStatus = lane.ConfirmationStatus;
                                laneData.EntryId = lane.EntryId;
                                laneData.ExemptTypeId = lane.ExemptTypeId;
                                if (string.IsNullOrEmpty(lane.ExemptTypeName))
                                    laneData.ExemptTypeName = string.Empty;
                                else
                                    laneData.ExemptTypeName = lane.ExemptTypeName;

                                laneData.IhmclClassId = lane.IhmclClassId;
                                if (string.IsNullOrEmpty(lane.IhmclClassName))
                                    laneData.IhmclClassName = string.Empty;
                                else
                                    laneData.IhmclClassName = lane.IhmclClassName;
                                laneData.JourneyType = lane.JourneyType;
                                laneData.LaneNumber = lane.LaneNumber;
                                laneData.LaneTransId = lane.LaneTransId;
                                laneData.LaneType = lane.LaneType;
                                if (string.IsNullOrEmpty(lane.LaneTypeName))
                                    laneData.LaneTypeName = string.Empty;
                                else
                                    laneData.LaneTypeName = lane.LaneTypeName;
                                laneData.LaneUsed = lane.LaneUsed;
                                if (string.IsNullOrEmpty(lane.LaneUsedName))
                                    laneData.LaneUsedName = string.Empty;
                                else
                                    laneData.LaneUsedName = lane.LaneUsedName;
                                laneData.MappingClassId = lane.MappingClassId;
                                if (string.IsNullOrEmpty(lane.MappingClassName))
                                    laneData.MappingClassName = string.Empty;
                                else
                                    laneData.MappingClassName = lane.MappingClassName;
                                laneData.MasterId = lane.MasterId;
                                laneData.Overweight = lane.Overweight;
                                laneData.PaymentTypeId = lane.PaymentTypeId;
                                if (string.IsNullOrEmpty(lane.PaymentTypeName))
                                    laneData.PaymentTypeName = string.Empty;
                                else
                                    laneData.PaymentTypeName = lane.PaymentTypeName;
                                laneData.Penalty = lane.Penalty;
                                if (string.IsNullOrEmpty(lane.PlateNumber))
                                    laneData.PlateNumber = string.Empty;
                                else
                                    laneData.PlateNumber = lane.PlateNumber;
                                laneData.PlazaId = lane.PlazaId;
                                if (string.IsNullOrEmpty(lane.PlazaName))
                                    laneData.PlazaName = string.Empty;
                                else
                                    laneData.PlazaName = lane.PlazaName;
                                if (string.IsNullOrEmpty(lane.ReferenceNumber))
                                    laneData.ReferenceNumber = string.Empty;
                                else
                                    laneData.ReferenceNumber = lane.ReferenceNumber;
                                laneData.ReferenceTransactionId = lane.ReferenceTransactionId;
                                laneData.ReveiwedRequired = lane.ReveiwedRequired;
                                laneData.ReveiwedStatus = lane.ReveiwedStatus;
                                laneData.ShiftId = lane.ShiftId;
                                if (string.IsNullOrEmpty(lane.TCLoginId))
                                    laneData.TCLoginId = string.Empty;
                                else
                                    laneData.TCLoginId = lane.TCLoginId;
                                laneData.TCUserId = lane.TCUserId;
                                laneData.TowVehicle = lane.TowVehicle;
                                laneData.TransactionAmount = lane.TransactionAmount;
                                if (string.IsNullOrEmpty(lane.TransactionDateTime))
                                    laneData.TransactionDateTime = string.Empty;
                                else
                                    laneData.TransactionDateTime = lane.TransactionDateTime;
                                if (string.IsNullOrEmpty(lane.TransactionImage))
                                    laneData.TransactionImage = string.Empty;
                                else
                                    laneData.TransactionImage = lane.TransactionImage;
                                laneData.TransactionStatus = lane.TransactionStatus;
                                laneData.TransactionTimeStamp = lane.TransactionTimeStamp;
                                laneData.TransactionTypeId = lane.TransactionTypeId;
                                if (string.IsNullOrEmpty(lane.TransactionTypeName))
                                    laneData.TransactionTypeName = string.Empty;
                                else
                                    laneData.TransactionTypeName = lane.TransactionTypeName;
                                if (string.IsNullOrEmpty(lane.TransactionVideo))
                                    laneData.TransactionVideo = string.Empty;
                                else
                                    laneData.TransactionVideo = lane.TransactionVideo;
                                #endregion
                                DuplicateCashReceipt = LaneTransactionBL.CheckDuplicateCashReceipt(laneData);
                            }
                            if (!DuplicateCashReceipt)
                            {
                                //LaneAPILog("Step 2 : ");
                                #region Save Proof
                                var path = Constants.MediaPath(lane.PlazaId, lane.LaneNumber, lane.TransactionTimeStamp);
                                var FileName = Constants.RandomString(5) + "-" + lane.TransactionTimeStamp.ToString(Constants.dateTimeFormatFileName);
                                if (!string.IsNullOrEmpty(lane.TransactionImage))
                                {
                                    CommonMethods.SaveImage(lane.TransactionImage, path + "/image/", "Transcation", FileName, ".jpeg");
                                    lane.TransactionImage = path + "/image/" + FileName + ".jpeg";
                                }
                                if (!string.IsNullOrEmpty(lane.TransactionVideo))
                                {
                                    CommonMethods.SaveImage(lane.TransactionVideo, path + "/video/", "Transcation", FileName, ".mp4");
                                    lane.TransactionVideo = path + "/video/" + FileName + ".mp4";
                                }
                                #endregion

                                #region Reveiwed Required
                                //LaneAPILog("Step 3 : ");
                                TransactionTypeIL tranType = TransactionTypeBL.GetById(lane.TransactionTypeId);
                                lane.ReveiwedRequired = tranType.ReveiwedRequired;
                                if (lane.MappingClassId != lane.AvcClassId)
                                {
                                    lane.ReveiwedRequired = 1;
                                }
                                //LaneAPILog("Step 4 : ");
                                #endregion

                                #region Send to MSMQ

                                try
                                {
                                    Message m = new Message();
                                    m.Formatter = new BinaryMessageFormatter();
                                    m.Body = lane;
                                    m.Recoverable = true;
                                    PlazaExitLaneDataQueue = MSMQConfiguration.Create(MSMQConfiguration.PlazaExitLaneDataQueueName.Replace("{ipaddress}", "."));
                                    PlazaExitLaneDataQueue.Send(m);
                                    res.ResponceMessage = "success";
                                }
                                catch (Exception ex)
                                {
                                    res.ResponceMessage = "failed";
                                    LaneAPILog("Exception in to send in  EntryLane Q : " + ex.Message.ToString());
                                }
                                #endregion
                                //LaneDataSyncResponce res = new LaneDataSyncResponce();
                                //if (!LaneTransactionBL.CheckDuplicateLaneId(lane))
                                //{
                                //    LaneTransactionIL lanes = LaneTransactionBL.ExitInsert(lane);
                                //    res.CrTransId = lanes.EntryId;
                                //    res.ResponceMessage = "success";
                                //    if (lanes.EntryId == 0)
                                //        res.ResponceMessage = "failed";
                                //}
                                //else
                                //{
                                //    res.ResponceMessage = "Duplicate Lane transcation Id";
                                //}
                            }
                            else
                            {
                                res.CrTransId = 0;
                                res.ResponceMessage = "This transcation already exists";
                            }

                        }
                        else
                        {
                            res.CrTransId = 0;
                            res.ResponceMessage = "Plaza Id must be valid";
                        }
                    }
                    else
                    {
                        res.CrTransId = 0;
                        res.ResponceMessage = "Only Exit lane transcation allowed";
                    }
                }
                else
                {

                    res.CrTransId = 0;
                    res.ResponceMessage = "Client & Lane transcation id must be valid";
                    return Request.CreateResponse(HttpStatusCode.OK, res);
                }
                return Request.CreateResponse(HttpStatusCode.OK, res);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in ExitLaneSync : " + ex.Message.ToString());
                LaneDataSyncResponce res = new LaneDataSyncResponce();
                res.CrTransId = 0;
                res.ResponceMessage = "failed";
                return Request.CreateResponse(HttpStatusCode.OK, res);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Lane/GetEntryLane")]
        [HttpPost]
        public HttpResponseMessage GetEntryLane(LaneTransactionIL lane)
        {
            try
            {
                Int16 PlazaId = Convert.ToInt16(ConfigurationManager.AppSettings["PlazaId"].ToString());
                if (lane.PlazaId == PlazaId)
                {
                    List<LaneTransactionIL> MappingLaneData = LaneTransactionBL.GetLaneMatchedDataByRefNum(lane);
                    if (MappingLaneData.Count > 0)
                    {
                        List<LaneTransactionIL> filtered = MappingLaneData.FindAll(e => e.ReferenceTransactionId == 0).OrderByDescending(x => x.TransactionTimeStamp).ToList();
                        if (filtered.Count > 0)
                        {
                            LaneTransactionIL EntryLaneData = filtered[0];


                            if (!string.IsNullOrEmpty(EntryLaneData.TransactionImage))
                            {
                                string FilePath = HttpContext.Current.Server.MapPath("~/Transcation/" + EntryLaneData.TransactionImage);
                                if (File.Exists(FilePath))
                                {
                                    EntryLaneData.TransactionImage = Constants.ImagetoBase64(FilePath);
                                }
                            }


                            responce.ResponceMessage = "success";
                            responce.ResponceData = EntryLaneData;
                            return Request.CreateResponse(HttpStatusCode.OK, responce);

                        }
                        else
                        {
                            responce.ResponceMessage = "This transaction already done";
                            responce.ResponceData = null;
                            return Request.CreateResponse(HttpStatusCode.OK, responce);
                        }
                    }
                    else
                    {
                        responce.ResponceMessage = "Entry Lane Data Not found";
                        responce.ResponceData = null;
                        return Request.CreateResponse(HttpStatusCode.OK, responce);
                    }

                }
                else
                {
                    responce.ResponceMessage = "Plaza Id is mismatched";
                    responce.ResponceData = null;
                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                }
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in GetEntryLane : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Lane/ValidateFare")]
        [HttpPost]
        public HttpResponseMessage ValidateFare(LaneTransactionIL lane)
        {
            try
            {
                if (lane.PlazaId > 0)
                {
                    if (lane.MappingClassId > 0)
                    {
                        VehicleClassIL mappedClasses = VehicleClassBL.GetByClassId(lane.MappingClassId);
                        if (mappedClasses.DataStatus == 1)
                        {
                            LaneAPILog("ValidateFare Tran DateTime: " + lane.TransactionTimeStamp.ToString(Constants.DATETIME_FORMAT_String));
                            LaneAPILog("ValidateFare MappingClassId: " + lane.MappingClassId.ToString());
                            LaneAPILog("ValidateFare PlazaId: " + lane.PlazaId.ToString());
                            LaneAPILog("ValidateFare LaneType: " + lane.LaneType.ToString());
                            LaneAPILog("ValidateFare Reference: " + lane.ReferenceNumber);
                            List<LaneTransactionIL> MappingLaneData = LaneTransactionBL.GetLaneMatchedDataByRefNum(lane);
                            if (MappingLaneData.Count > 0)
                            {
                                LaneAPILog("ValidateFare MappingLaneData: " + MappingLaneData.Count.ToString());
                                List<LaneTransactionIL> filtered = MappingLaneData.FindAll(e => e.ReferenceTransactionId == 0).OrderByDescending(x => x.TransactionTimeStamp).ToList();
                                if (filtered.Count > 0)
                                {
                                    LaneTransactionIL EntryLaneData = filtered[0];
                                    lane.ReferenceTransactionId = EntryLaneData.EntryId;
                                    #region Check Toll Fare based on exit lane
                                    FareDetailsIL fd = new FareDetailsIL();
                                    fd.ClassId = lane.MappingClassId;
                                    fd.EntryPlazaId = EntryLaneData.PlazaId;
                                    fd.ExitPlazaId = lane.PlazaId;
                                    fd.TransactionTimeStamp = lane.TransactionTimeStamp;
                                    FareDetailsIL fare = FareManagementBL.GetFareByJourney(fd);
                                    if (fare.Journey == "Found")
                                    {
                                        ValidatFareResponce vfare = new ValidatFareResponce();
                                        vfare.ClassId = fare.ClassId;
                                        vfare.JourneyType = 1;
                                        vfare.AlredayPaid = EntryLaneData.TransactionAmount;
                                        vfare.EntryPlazaId = EntryLaneData.PlazaId;
                                        vfare.ReferenceTransactionId = EntryLaneData.EntryId;
                                        vfare.TollFare = fare.TollFare;
                                        vfare.PenaltyFare = fare.PenaltyFare;
                                        vfare.OverWeightFare = fare.OverWeightFare;
                                        vfare.ReturnFare = fare.ReturnFare;
                                        if (!string.IsNullOrEmpty(EntryLaneData.TransactionImage))
                                        {
                                            string FilePath = HttpContext.Current.Server.MapPath("~/Transcation/" + EntryLaneData.TransactionImage);
                                            if (File.Exists(FilePath))
                                            {
                                                vfare.EntryImage = Constants.ImagetoBase64(FilePath);
                                            }
                                        }
                                        #region Check for Retrun Journey
                                        if (lane.TransactionTypeId == 1)
                                        {
                                            LaneTransactionIL retJourney = new LaneTransactionIL();
                                            retJourney.ReferenceNumber = lane.ReferenceNumber;
                                            retJourney.TransactionTimeStamp = lane.TransactionTimeStamp;
                                            List<LaneTransactionIL> checkforReturnJourney = LaneTransactionBL.GetLaneMatchedDataForRetJourney(retJourney);
                                            if (checkforReturnJourney.Count > 0)
                                            {
                                                List<LaneTransactionIL> filteredReturn = MappingLaneData.FindAll(e => e.JourneyType == 2);
                                                if (filteredReturn.Count == 0)
                                                {
                                                    lane.TransactionAmount = fare.ReturnFare;
                                                    lane.JourneyType = 2;
                                                    vfare.JourneyType = 2;
                                                }
                                            }
                                        }
                                        #endregion
                                        responce.ResponceMessage = "success";
                                        responce.ResponceData = vfare;
                                        return Request.CreateResponse(HttpStatusCode.OK, responce);
                                    }
                                    else
                                    {
                                        responce.ResponceMessage = "Toll fare not found";
                                        responce.ResponceData = null;
                                        return Request.CreateResponse(HttpStatusCode.OK, responce);
                                    }
                                    #endregion
                                }
                                else
                                {
                                    responce.ResponceMessage = "This transaction already done!";
                                    responce.ResponceData = null;
                                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                                }
                            }
                            else
                            {
                                responce.ResponceMessage = "Entry Lane Data Not found";
                                responce.ResponceData = null;
                                return Request.CreateResponse(HttpStatusCode.OK, responce);
                            }
                        }
                        else if (mappedClasses.DataStatus == 2)
                        {
                            responce.ResponceMessage = "Vehicle Class Id is inactive";
                            responce.ResponceData = null;
                            return Request.CreateResponse(HttpStatusCode.OK, responce);
                        }
                        else
                        {
                            responce.ResponceMessage = "Vehicle Class Id not found";
                            responce.ResponceData = null;
                            return Request.CreateResponse(HttpStatusCode.OK, responce);
                        }
                    }
                    else
                    {
                        responce.ResponceMessage = "Vehicle Class Id is missing";
                        responce.ResponceData = null;
                        return Request.CreateResponse(HttpStatusCode.OK, responce);
                    }

                }
                else
                {
                    responce.ResponceMessage = "Plaza Id is missing";
                    responce.ResponceData = null;
                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                }
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in ValidateFare : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }
        #endregion

        #region Shift Data
        [Route(Provider + "/Toll360-CloseToll/Lane/LogingActivity")]
        [HttpPost]
        public HttpResponseMessage LogingActivity(LogingActivityIL activity)
        {
            try
            {
                LogingActivityBL.InsertUpdate(activity);
                if (activity.LoginStatus == (Int16)Constants.UserLoginStatus.Login)
                {

                    UserManagementIL login = new UserManagementIL();
                    login.LoginId = activity.LoginId;
                    UserManagementIL user = UserManagementBL.GetByLoginId(login);
                    CashFlowConfigurationIL cashFlow = new CashFlowConfigurationIL();
                    cashFlow.ShiftDate = activity.ShiftDate;
                    cashFlow.ShiftId = activity.ShiftId;
                    cashFlow.ShiftStatus = 1;
                    cashFlow.CreatedBy = (int)user.EntryId;
                    cashFlow.CreatedDate = DateTime.Now;
                    CashFlowConfigurationBL.StartStopShift(cashFlow);

                    ShiftDetailsIL sd = new ShiftDetailsIL();
                    sd.ShiftId = activity.ShiftId;
                    sd.ShiftDate = activity.ShiftDate;
                    ShiftDetailsIL shiftDetilsData = ShiftDetailsBL.GetAllByShiftId(sd);
                    ShiftLaneDetailsIL sld = new ShiftLaneDetailsIL();
                    sld.LaneNumber = activity.LaneNumber;
                    sld.ShfitDetailId = shiftDetilsData.EntryId;
                    ShiftLaneDetailsBL.ShfitLaneDetailsInsert(sld);

                }
                else if (activity.LoginStatus == (Int16)Constants.UserLoginStatus.Logout)
                {

                    UserManagementIL login = new UserManagementIL();
                    login.LoginId = activity.LoginId;
                    UserManagementIL user = UserManagementBL.GetByLoginId(login);
                    CashFlowConfigurationIL cashFlow = new CashFlowConfigurationIL();
                    cashFlow.ShiftDate = activity.ShiftDate;
                    cashFlow.ShiftId = activity.ShiftId;
                    cashFlow.ShiftStatus = 1;
                    cashFlow.CreatedBy = (int)user.EntryId;
                    cashFlow.CreatedDate = DateTime.Now;

                    ShiftDetailsIL sd = new ShiftDetailsIL();
                    sd.ShiftId = activity.ShiftId;
                    sd.ShiftDate = activity.ShiftDate;
                    ShiftDetailsIL shiftDetilsData = ShiftDetailsBL.GetAllByShiftId(sd);

                    ShiftLaneDetailsIL sld = new ShiftLaneDetailsIL();
                    sld.LaneNumber = activity.LaneNumber;
                    sld.ShfitDetailId = shiftDetilsData.EntryId;
                    sld.LastTransId = activity.LaneTransId;
                    ShiftLaneDetailsBL.ShfitLaneDetailsClose(sld);
                }
                responce.ResponceMessage = "success";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in LogingActivity : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }
        [Route(Provider + "/Toll360-CloseToll/MidClearance")]
        [HttpPost]
        public HttpResponseMessage MidClearance(CashFlowConfigurationIL cashFlow)
        {
            bool validate = true;
            try
            {

                ShiftDetailsIL sd = new ShiftDetailsIL();
                sd.ShiftId = cashFlow.ShiftId;
                sd.ShiftDate = cashFlow.ShiftDate;
                ShiftDetailsIL shiftDetilsData = ShiftDetailsBL.GetAllByShiftId(sd);
                if (shiftDetilsData.EntryId > 0)
                {
                    cashFlow.EntryId = shiftDetilsData.EntryId;
                    cashFlow.DataStatus = 1;
                    CashFlowConfigurationIL crrentFlow = CashFlowConfigurationBL.GetById(cashFlow.EntryId);
                    if (Convert.ToDateTime(crrentFlow.ShiftDate.ToString("dd-MMM-yyyy") + " " + crrentFlow.EndTimming) > DateTime.Now
                        && Convert.ToDateTime(crrentFlow.ShiftDate.ToString("dd-MMM-yyyy") + " " + crrentFlow.StartTimmng) < DateTime.Now)
                        validate = true;
                    else
                        validate = false;

                    if (validate)
                    {
                        validate = false;
                        cashFlow.ReceiptNumber = "DR-" + Constants.RandomString(5) + "-" + DateTime.Now.ToString(Constants.dateTimeFormatFileName);
                        List<ResponceIL> resp = CashFlowConfigurationBL.Clearance(cashFlow);
                        foreach (var ResponceIL in resp)
                        {
                            if (ResponceIL.AlertMessage == "success")
                            {
                                validate = true;
                                break;
                            }
                        }
                        if (validate)
                        {
                            responce.ResponceMessage = "success";
                            responce.ResponceData = null;
                        }
                        else
                        {
                            if (resp.Count > 0)
                            {
                                responce.ResponceMessage = resp[0].AlertMessage;
                                responce.ResponceData = null;
                            }
                            else
                            {
                                responce.ResponceMessage = "failed";
                                responce.ResponceData = null;
                            }
                        }
                        return Request.CreateResponse(HttpStatusCode.OK, responce);
                    }
                    else
                    {
                        ResponceMessage objMessage = new ResponceMessage();
                        responce.ResponceMessage = "Mid clearance not allowed for future shift!";
                        responce.ResponceData = null;
                        return Request.CreateResponse(HttpStatusCode.OK, responce);
                    }
                }
                else
                {
                    responce.ResponceMessage = "Shift details not found";
                    responce.ResponceData = null;
                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                }

            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in MidClearance : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }
        #endregion

        #region Live Events
        [Route(Provider + "/Toll360-CloseToll/Lane/LiveStatusEvents")]
        [HttpPost]
        public HttpResponseMessage LiveEvents(LiveEventsIL events)
        {
            try
            {
                if (events.LaneNumber > 0)
                {
                    LiveEventsBL.Insert(events);
                    responce.ResponceMessage = "success";
                    responce.ResponceData = null;
                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                }
                else
                {
                    responce.ResponceMessage = "failed";
                    responce.ResponceData = null;
                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                }
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in LiveStatusEvents : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Lane/LiveSystemEvents")]
        [HttpPost]
        public HttpResponseMessage SystemProcessingInsert(LiveSystemIL events)
        {
            try
            {
                if (events.LaneNumber > 0)
                {
                    LiveSystemBL.SystemProcessingInsert(events);
                    responce.ResponceMessage = "success";
                    responce.ResponceData = null;
                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                }
                else
                {
                    responce.ResponceMessage = "failed";
                    responce.ResponceData = null;
                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                }
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in SystemProcessingInsert : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Lane/LiveTransactionEvents")]
        [HttpPost]
        public HttpResponseMessage SystemTransactionInsert(LiveSystemIL events)
        {
            try
            {
                if (events.LaneNumber > 0)
                {
                    LiveSystemBL.SystemTransactionInsert(events);
                    responce.ResponceMessage = "success";
                    responce.ResponceData = null;
                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                }
                else
                {
                    responce.ResponceMessage = "failed";
                    responce.ResponceData = null;
                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                }
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in SystemTransactionInsert : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }
        [Route(Provider + "/Toll360-CloseToll/Lane/LiveAVCTransactionEvents")]
        [HttpPost]
        public HttpResponseMessage SystemAVCTransactionInsert(LiveSystemIL events)
        {
            try
            {
                if (events.LaneNumber > 0)
                {
                    LiveSystemBL.SystemAVCTransactionInsert(events);
                    responce.ResponceMessage = "success";
                    responce.ResponceData = null;
                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                }
                else
                {
                    responce.ResponceMessage = "failed";
                    responce.ResponceData = null;
                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                }
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in SystemAVCTransactionInsert : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Lane/OperatorAccessPermission")]
        [HttpPost]
        public HttpResponseMessage OperatorAccessPermission(LaneAccessPermissionIL events)
        {
            try
            {
                if (events.LaneNumber > 0 && events.OperatorId > 0)
                {
                    events.PermissionType = 1;
                    events.CreatedBy = (int)events.OperatorId;
                    LaneAccessPermissionBL.Insert(events);
                    responce.ResponceMessage = "success";
                    responce.ResponceData = null;
                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                }
                else
                {
                    responce.ResponceMessage = "failed";
                    responce.ResponceData = null;
                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                }
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in OperatorAccessPermission : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Lane/ExemptAccessPermission")]
        [HttpPost]
        public HttpResponseMessage ExemptAccessPermission(LaneAccessPermissionIL events)
        {
            try
            {
                if (events.LaneNumber > 0 && events.OperatorId > 0)
                {
                    events.PermissionType = 2;
                    events.CreatedBy = (int)events.OperatorId;
                    LaneAccessPermissionBL.Insert(events);
                    responce.ResponceMessage = "success";
                    responce.ResponceData = null;
                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                }
                else
                {
                    responce.ResponceMessage = "failed";
                    responce.ResponceData = null;
                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                }
            }
            catch (Exception ex)
            {
                LaneAPILog("Exception in ExemptAccessPermission : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }
        #endregion
    }
}
