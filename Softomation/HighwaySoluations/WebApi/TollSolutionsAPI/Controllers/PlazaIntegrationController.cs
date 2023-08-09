using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using Softomation.DMS.Libraries.CommonLibrary;
using Softomation.DMS.Libraries.CommonLibrary.BusinessLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;
using Softomation.DMS.Libraries.CommonLibrary.Json;
using TollSolutionsAPI.Models;
using static TollSolutionsAPI.Models.CommonMethods;


namespace TollSolutionsAPI.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class PlazaIntegrationController : ApiController
    {
        const string Provider = Constants.AppProvider;
        IntegrationRequestResponce responce = new IntegrationRequestResponce();

        [Route(Provider + "/Toll360-CloseToll/Plaza/GetPlazaDetails")]
        [HttpGet]
        public HttpResponseMessage GetPlazaDetails()
        {
            try
            {
                List<PlazaManagementIL> plazas = PlazaManagementBL.GetAll();
                responce.ResponceMessage = "success";
                responce.ResponceData = plazas;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaAPILog("Exception in GetPlazaDetails : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Plaza/GetClientDetails")]
        [HttpGet]
        public HttpResponseMessage GetClientDetails()
        {
            try
            {
                List<ClientManagementIL> clients = ClientManagementBL.GetAll();
                responce.ResponceMessage = "success";
                responce.ResponceData = clients;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaAPILog("Exception in GetClientDetails : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Plaza/GetLaneDetails")]
        [HttpPost]
        public HttpResponseMessage GetLaneDetails(LaneManagementIL lane)
        {
            try
            {
                List<LaneManagementIL> lanes = LaneManagementBL.GetByClientPlazaId(lane);
                responce.ResponceMessage = "success";
                responce.ResponceData = lanes;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaAPILog("Exception in GetLaneDetails : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Plaza/GetConnectionType")]
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
                PlazaAPILog("Exception in GetConnectionType : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Plaza/GetHardwareType")]
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
                PlazaAPILog("Exception in GetHardwareType : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Plaza/GetHardwareProvider")]
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
                PlazaAPILog("Exception in GetHardwareProvider : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Plaza/GetHardwareDetails")]
        [HttpPost]
        public HttpResponseMessage GetHardwareDetails(HardwareManagementIL haredware)
        {
            try
            {
                List<HardwareManagementIL> haredwares = HardwareManagementBL.GetByClientPlazaId(haredware);
                responce.ResponceMessage = "success";
                responce.ResponceData = haredwares;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaAPILog("Exception in GetHardwareDetails : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Plaza/GetVehicleClassDetails")]
        [HttpGet]
        public HttpResponseMessage GetVehicleClassDetails()
        {
            try
            {
                List<VehicleClassIL> vehicleClases = VehicleClassBL.GetAll();
                responce.ResponceMessage = "success";
                responce.ResponceData = vehicleClases;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaAPILog("Exception in GetVehicleClassDetails : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Plaza/GetTollFares")]
        [HttpGet]
        public HttpResponseMessage GetTollFares()
        {
            try
            {
                List<FareManagementIL> fareDetails = FareManagementBL.GetAll();
                responce.ResponceMessage = "success";
                responce.ResponceData = fareDetails;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaAPILog("Exception in GetTollFares : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Plaza/GetPlazaUsersDetails")]
        [HttpPost]
        public HttpResponseMessage GetPlazaUsersDetails(UserManagementIL user)
        {
            try
            {
                List<UserManagementIL> users = UserManagementBL.GetByClientPlazaId(user);
                responce.ResponceMessage = "success";
                responce.ResponceData = users;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaAPILog("Exception in GetPlazaUsersDetails : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Plaza/GetPlazaUsersRolesDetails")]
        [HttpPost]
        public HttpResponseMessage GetPlazaUsersRolesDetails(UserManagementIL user)
        {
            try
            {
                List<RoleManagementIL> roles = RoleManagementBL.GetByClientPlazaId(user);
                responce.ResponceMessage = "success";
                responce.ResponceData = roles;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaAPILog("Exception in GetPlazaUsersRolesDetails : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Plaza/GetPlazaMenuDetails")]
        [HttpGet]
        public HttpResponseMessage GetPlazaMenuDetails()
        {
            try
            {
                List<MenuManagementIL> menus = MenuManagementBL.GetByPlazaMenu();
                responce.ResponceMessage = "success";
                responce.ResponceData = menus;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaAPILog("Exception in GetPlazaMenuDetails : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Plaza/GetShiftTiminigDetails")]
        [HttpGet]
        public HttpResponseMessage GetShiftTiminigDetails()
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
                PlazaAPILog("Exception in GetShiftTiminigDetails : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Plaza/GetExemptTypeDetails")]
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
                PlazaAPILog("Exception in GetExemptTypeDetails : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Plaza/GetPaymentTypeDetails")]
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
                PlazaAPILog("Exception in GetPaymentTypeDetails : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Plaza/GetTransactionTypeDetails")]
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
                PlazaAPILog("Exception in GetTransactionTypeDetails : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }
        
        [Route(Provider + "/Toll360-CloseToll/Plaza/GetDenominationDetails")]
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
                PlazaAPILog("Exception in GetDenominationList : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Plaza/GetMasterConfig")]
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
                PlazaAPILog("Exception in GetMasterConfig : " + ex.Message.ToString());
                responce.ResponceMessage = "failed";
                responce.ResponceData = null;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
        }

        #region Lane Data
        [Route(Provider + "/Toll360-CloseToll/Plaza/EntryLaneSync")]
        [HttpPost]
        public HttpResponseMessage EntryLaneSync(LaneTransactionIL lane)
        {
            try
            {
                if (lane.PlazaId > 0 && lane.ClientId > 0 && lane.EntryId > 0 && lane.LaneType == 1)
                {
                    #region Save Proof
                    var path = Constants.MediaPath(lane.PlazaId, lane.LaneNumber, lane.TransactionTimeStamp);
                    var FileName = Constants.RandomString(5) + "-" + lane.TransactionTimeStamp.ToString(Constants.dateTimeFormatFileName);
                    if (!string.IsNullOrEmpty(lane.TransactionImage))
                    {
                        try
                        {
                            CommonMethods.SaveImage(lane.TransactionImage, path + "/image/", "Transcation", FileName, ".jpeg");
                            lane.TransactionImage = path + "/image/" + FileName + ".jpeg";
                        }
                        catch (Exception ex)
                        {
                            PlazaAPILog("Exception in EntrySaveImage : " + ex.Message.ToString() + " EntryId" + lane.EntryId);
                            lane.TransactionImage = string.Empty;
                        }

                    }
                    if (!string.IsNullOrEmpty(lane.TransactionVideo))
                    {
                        try
                        {
                            CommonMethods.SaveImage(lane.TransactionVideo, path + "/video/", "Transcation", FileName, ".mp4");
                            lane.TransactionVideo = path + "/video/" + FileName + ".mp4";
                        }
                        catch (Exception ex)
                        {
                            PlazaAPILog("Exception in EntrySaveVideo : " + ex.Message.ToString() + " EntryId" + lane.EntryId);
                            lane.TransactionVideo = string.Empty;
                        }

                    }
                    #endregion

                    lane.TransactionTimeStamp = Convert.ToDateTime(lane.TransactionDateTime);
                    PlazaTransactionIL lanes = PlazaTransactionBL.EntryInsert(lane);
                    LaneDataSyncResponce res = new LaneDataSyncResponce();
                    res.CrTransId = lanes.EntryId;
                    res.ResponceMessage = "success";
                    if (lanes.EntryId == 0)
                        res.ResponceMessage = "failed";
                    return Request.CreateResponse(HttpStatusCode.OK, res);
                }
                else
                {
                    if (lane.LaneType != 2)
                    {
                        LaneDataSyncResponce res = new LaneDataSyncResponce();
                        res.CrTransId = 0;
                        res.ResponceMessage = "Exit lane data allowerd";
                        return Request.CreateResponse(HttpStatusCode.OK, res);
                    }
                    else if (lane.PlazaId == 0)
                    {
                        LaneDataSyncResponce res = new LaneDataSyncResponce();
                        res.CrTransId = 0;
                        res.ResponceMessage = "Plaza id is required";
                        return Request.CreateResponse(HttpStatusCode.OK, res);
                    }
                    else if (lane.ClientId == 0)
                    {
                        LaneDataSyncResponce res = new LaneDataSyncResponce();
                        res.CrTransId = 0;
                        res.ResponceMessage = "Client id is required";
                        return Request.CreateResponse(HttpStatusCode.OK, res);
                    }
                    else
                    {
                        LaneDataSyncResponce res = new LaneDataSyncResponce();
                        res.CrTransId = 0;
                        res.ResponceMessage = "failed";
                        return Request.CreateResponse(HttpStatusCode.OK, res);
                    }
                }
            }
            catch (Exception ex)
            {
                PlazaAPILog("Exception in EntryLaneSync : " + ex.Message.ToString());
                LaneDataSyncResponce res = new LaneDataSyncResponce();
                res.CrTransId = 0;
                res.ResponceMessage = "failed";
                return Request.CreateResponse(HttpStatusCode.OK, res);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Plaza/ExitLaneSync")]
        [HttpPost]
        public HttpResponseMessage ExitLaneSync(LaneTransactionIL lane)
        {
            try
            {
                if (lane.PlazaId > 0 && lane.ClientId > 0 && lane.EntryId > 0 && lane.LaneType == 2)
                {
                    #region Save Proof
                    var path = Constants.MediaPath(lane.PlazaId, lane.LaneNumber, lane.TransactionTimeStamp);
                    var FileName = Constants.RandomString(5) + "-" + lane.TransactionTimeStamp.ToString(Constants.dateTimeFormatFileName);
                    if (!string.IsNullOrEmpty(lane.TransactionImage))
                    {
                        try
                        {
                            CommonMethods.SaveImage(lane.TransactionImage, path + "/image/", "Transcation", FileName, ".jpeg");
                            lane.TransactionImage = path + "/image/" + FileName + ".jpeg";
                        }
                        catch (Exception ex)
                        {
                            PlazaAPILog("Exception in ExitSaveImage : " + ex.Message.ToString() + " EntryId" + lane.EntryId);
                            lane.TransactionImage = string.Empty;
                        }

                    }
                    if (!string.IsNullOrEmpty(lane.TransactionVideo))
                    {
                        try
                        {
                            CommonMethods.SaveImage(lane.TransactionVideo, path + "/video/", "Transcation", FileName, ".mp4");
                            lane.TransactionVideo = path + "/video/" + FileName + ".mp4";
                        }
                        catch (Exception ex)
                        {
                            PlazaAPILog("Exception in ExitSaveVideo : " + ex.Message.ToString() + " EntryId" + lane.EntryId);
                            lane.TransactionVideo = string.Empty;
                        }

                    }
                    #endregion
                    lane.TransactionTimeStamp = Convert.ToDateTime(lane.TransactionDateTime);
                    PlazaTransactionIL lanes = PlazaTransactionBL.ExitInsert(lane);
                    LaneDataSyncResponce res = new LaneDataSyncResponce();
                    res.CrTransId = lanes.EntryId;
                    res.ResponceMessage = "success";
                    if (lanes.EntryId == 0)
                        res.ResponceMessage = "failed";
                    return Request.CreateResponse(HttpStatusCode.OK, res);
                }
                else
                {
                    if (lane.LaneType != 2)
                    {
                        LaneDataSyncResponce res = new LaneDataSyncResponce();
                        res.CrTransId = 0;
                        res.ResponceMessage = "Entry lane data allowerd";
                        return Request.CreateResponse(HttpStatusCode.OK, res);
                    }
                    else if (lane.PlazaId == 0)
                    {
                        LaneDataSyncResponce res = new LaneDataSyncResponce();
                        res.CrTransId = 0;
                        res.ResponceMessage = "Plaza id is required";
                        return Request.CreateResponse(HttpStatusCode.OK, res);
                    }
                    else if (lane.ClientId == 0)
                    {
                        LaneDataSyncResponce res = new LaneDataSyncResponce();
                        res.CrTransId = 0;
                        res.ResponceMessage = "Client id is required";
                        return Request.CreateResponse(HttpStatusCode.OK, res);
                    }
                    else
                    {
                        LaneDataSyncResponce res = new LaneDataSyncResponce();
                        res.CrTransId = 0;
                        res.ResponceMessage = "failed";
                        return Request.CreateResponse(HttpStatusCode.OK, res);
                    }
                }
            }
            catch (Exception ex)
            {
                PlazaAPILog("Exception in ExitLaneSync : " + ex.Message.ToString());
                LaneDataSyncResponce res = new LaneDataSyncResponce();
                res.CrTransId = 0;
                res.ResponceMessage = "failed";
                return Request.CreateResponse(HttpStatusCode.OK, res);
            }
        }

        [Route(Provider + "/Toll360-CloseToll/Plaza/ReviewLaneSync")]
        [HttpPost]
        public HttpResponseMessage ReviewLaneSync(LaneTransactionReviewIL lane)
        {
            try
            {
                if (lane.TransactionId > 0)
                {
                    lane.ReveiwedDateTime = Convert.ToDateTime(lane.ReveiwedDateTimeString);
                    PlazaTransactionReviewIL lanes = PlazaTransactionReviewBL.Insert(lane);
                    LaneDataSyncResponce res = new LaneDataSyncResponce();
                    res.CrTransId = lanes.EntryId;
                    res.ResponceMessage = "success";
                    if (lanes.EntryId == 0)
                        res.ResponceMessage = "failed";
                    return Request.CreateResponse(HttpStatusCode.OK, res);
                }
                else
                {
                    LaneDataSyncResponce res = new LaneDataSyncResponce();
                    res.CrTransId = 0;
                    res.ResponceMessage = "failed";
                    return Request.CreateResponse(HttpStatusCode.OK, res);
                }
            }
            catch (Exception ex)
            {
                PlazaAPILog("Exception in ReviewLaneSync : " + ex.Message.ToString());
                LaneDataSyncResponce res = new LaneDataSyncResponce();
                res.CrTransId = 0;
                res.ResponceMessage = "failed";
                return Request.CreateResponse(HttpStatusCode.OK, res);
            }
        }
        #endregion
    }
}
