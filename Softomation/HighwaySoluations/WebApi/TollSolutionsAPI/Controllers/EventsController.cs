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
using TollSolutionsAPI.Models;
using static TollSolutionsAPI.Models.CommonMethods;

namespace TollSolutionsAPI.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class EventsController : ApiController
    {
        const string Provider = Constants.AppProvider;
        List<ResponceMessage> responce = new List<ResponceMessage>();
        #region Master Data
        [Route(Provider + "/Toll360-BackOffice/Events/GetClientById")]
        [HttpGet]
        public HttpResponseMessage GetClientById(int ClientId)
        {
            try
            {
                ClientManagementIL client = ClientManagementBL.GetById(ClientId);
                return Request.CreateResponse(HttpStatusCode.OK, client);
            }
            catch (Exception ex)
            {
                EventAPILog("Exception in GetClientById : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "Something went wrong!";
                responce.Add(objMessage);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/Events/GetClientDetails")]
        [HttpGet]
        public HttpResponseMessage GetClientDetails()
        {
            try
            {
                List<ClientManagementIL> clients = ClientManagementBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, clients);
            }
            catch (Exception ex)
            {
                EventAPILog("Exception in GetPlazaDetails : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "Something went wrong!";
                responce.Add(objMessage);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }


        [Route(Provider + "/Toll360-BackOffice/Events/GetPlazaIP")]
        [HttpGet]
        public HttpResponseMessage GetPlazaIP(String IPAddress)
        {
            try
            {
                PlazaManagementIL plaza = PlazaManagementBL.GetByIP(IPAddress);
                return Request.CreateResponse(HttpStatusCode.OK, plaza);
            }
            catch (Exception ex)
            {
                EventAPILog("Exception in GetPlazaIP : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "Something went wrong!";
                responce.Add(objMessage);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/Events/GetPlazaDetails")]
        [HttpGet]
        public HttpResponseMessage GetPlazaDetails()
        {
            try
            {
                List<PlazaManagementIL> plazas = PlazaManagementBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, plazas);
            }
            catch (Exception ex)
            {
                EventAPILog("Exception in GetPlazaDetails : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "Something went wrong!";
                responce.Add(objMessage);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/Events/GetLaneDetails")]
        [HttpPost]
        public HttpResponseMessage GetLaneDetails(LaneManagementIL lane)
        {
            try
            {
                List<LaneManagementIL> lanes = LaneManagementBL.GetByClientPlazaId(lane);
                return Request.CreateResponse(HttpStatusCode.OK, lanes);
            }
            catch (Exception ex)
            {
                EventAPILog("Exception in GetLaneDetails : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "Something went wrong!";
                responce.Add(objMessage);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/Events/GetHardwareDetails")]
        [HttpPost]
        public HttpResponseMessage GetHardwareDetails(HardwareManagementIL haredware)
        {
            try
            {
                List<HardwareManagementIL> haredwares = HardwareManagementBL.GetByClientPlazaId(haredware);
                return Request.CreateResponse(HttpStatusCode.OK, haredwares);
            }
            catch (Exception ex)
            {
                EventAPILog("Exception in GetHardwareDetails : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "Something went wrong!";
                responce.Add(objMessage);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        [Route(Provider + "/Toll360-BackOffice/Events/GetHardwareProvider")]
        [HttpGet]
        public HttpResponseMessage GetHardwareProvider()
        {
            try
            {
                List<HardwareProviderIL> haredwaresProvider = HardwareProviderBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, haredwaresProvider);
            }
            catch (Exception ex)
            {
                EventAPILog("Exception in GetHardwareProvider : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "Something went wrong!";
                responce.Add(objMessage);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/Events/GetByHardwareType")]
        [HttpGet]
        public HttpResponseMessage GetByHardwareType()
        {
            try
            {
                List<HardwareTypeIL> hardwariesTypes = HardwareTypeBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, hardwariesTypes);
            }
            catch (Exception ex)
            {
                EventAPILog("Exception in GetByHardwareType : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "Something went wrong!";
                responce.Add(objMessage);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/Events/GetConnectionType")]
        [HttpGet]
        public HttpResponseMessage GetConnectionType()
        {
            try
            {
                List<ConnectionTypeIL> hardwaries = ConnectionTypeBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, hardwaries);
            }
            catch (Exception ex)
            {
                EventAPILog("Exception in GetConnectionType : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "Something went wrong!";
                responce.Add(objMessage);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/Events/GetAllVehicleClassDetails")]
        [HttpGet]
        public HttpResponseMessage GetAllVehicleClassDetails()
        {
            try
            {
                List<VehicleClassIL> vehicleClases = VehicleClassBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, vehicleClases);
            }
            catch (Exception ex)
            {
                EventAPILog("Exception in GetAllVehicleClassDetails : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "Something went wrong!";
                responce.Add(objMessage);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/Events/GetTollFareDetails")]
        [HttpPost]
        public HttpResponseMessage GetTollFareDetails(FareDetailsIL fare)
        {
            try
            {
                FareManagementIL fareDetails = FareManagementBL.GetAllByDate(fare);
                return Request.CreateResponse(HttpStatusCode.OK, fareDetails);
            }
            catch (Exception ex)
            {
                EventAPILog("Exception in GetTollFareDetails : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "Something went wrong!";
                responce.Add(objMessage);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/Events/GetTollFares")]
        [HttpGet]
        public HttpResponseMessage GetTollFares()
        {
            try
            {
                List<FareManagementIL> fareDetails = FareManagementBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, fareDetails);
            }
            catch (Exception ex)
            {
                EventAPILog("Exception in GetTollFares : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "Something went wrong!";
                responce.Add(objMessage);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/Events/GetPlazaUsersDetails")]
        [HttpPost]
        public HttpResponseMessage GetPlazaUsersDetails(UserManagementIL user)
        {
            try
            {
                List<UserManagementIL> users = UserManagementBL.GetByClientPlazaId(user);
                return Request.CreateResponse(HttpStatusCode.OK, users);
            }
            catch (Exception ex)
            {
                EventAPILog("Exception in GetPlazaUsersDetails : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "Something went wrong!";
                responce.Add(objMessage);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/Events/GetPlazaUsersRolesDetails")]
        [HttpPost]
        public HttpResponseMessage GetPlazaUsersRolesDetails(UserManagementIL user)
        {
            try
            {
                List<RoleManagementIL> roles = RoleManagementBL.GetByClientPlazaId(user);
                return Request.CreateResponse(HttpStatusCode.OK, roles);
            }
            catch (Exception ex)
            {
                EventAPILog("Exception in GetPlazaUsersRolesDetails : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "Something went wrong!";
                responce.Add(objMessage);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/Events/GetPlazaMenuDetails")]
        [HttpGet]
        public HttpResponseMessage GetPlazaMenuDetails()
        {
            try
            {
                List<MenuManagementIL> roles = MenuManagementBL.GetByPlazaMenu();
                return Request.CreateResponse(HttpStatusCode.OK, roles);
            }
            catch (Exception ex)
            {
                EventAPILog("Exception in GetPlazaMenuDetails : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "Something went wrong!";
                responce.Add(objMessage);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/Events/GetShiftTiminigDetails")]
        [HttpGet]
        public HttpResponseMessage GetShiftDetails()
        {
            try
            {
                List<ShiftManagementIL> shifts = ShiftManagementBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, shifts);
            }
            catch (Exception ex)
            {
                EventAPILog("Exception in GetShiftDetails : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "Something went wrong!";
                responce.Add(objMessage);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/Events/GetExemptTypeDetails")]
        [HttpGet]
        public HttpResponseMessage GetExemptDetails()
        {
            try
            {
                List<ExemptTypeIL> exemptType = ExemptTypeBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, exemptType);
            }
            catch (Exception ex)
            {
                EventAPILog("Exception in GetExemptDetails : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "Something went wrong!";
                responce.Add(objMessage);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/Events/GetPaymentTypeDetails")]
        [HttpGet]
        public HttpResponseMessage GetPaymentDetails()
        {
            try
            {
                List<PaymentTypeIL> exemptType = PaymentTypeBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, exemptType);
            }
            catch (Exception ex)
            {
                EventAPILog("Exception in GetPaymentDetails : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "Something went wrong!";
                responce.Add(objMessage);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/Events/GetTransactionTypeDetails")]
        [HttpGet]
        public HttpResponseMessage GetTransactionDetails()
        {
            try
            {
                List<TransactionTypeIL> transactionType = TransactionTypeBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, transactionType);
            }
            catch (Exception ex)
            {
                EventAPILog("Exception in GetTransactionDetails : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "Something went wrong!";
                responce.Add(objMessage);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Lane Data
        [Route(Provider + "/Toll360-BackOffice/Events/EntryLaneSync")]
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
                            EventAPILog("Exception in EntrySaveImage : " + ex.Message.ToString() + " EntryId" + lane.EntryId);
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
                            EventAPILog("Exception in EntrySaveVideo : " + ex.Message.ToString() + " EntryId" + lane.EntryId);
                            lane.TransactionVideo = string.Empty;
                        }

                    }
                    #endregion
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
                EventAPILog("Exception in EntryLaneSync : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "Something went wrong!";
                responce.Add(objMessage);

                LaneDataSyncResponce res = new LaneDataSyncResponce();
                res.CrTransId = 0;
                res.ResponceMessage = "failed";
                return Request.CreateResponse(HttpStatusCode.OK, res);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/Events/ExitLaneSync")]
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
                            EventAPILog("Exception in ExitSaveImage : " + ex.Message.ToString() + " EntryId" + lane.EntryId);
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
                            EventAPILog("Exception in ExitSaveVideo : " + ex.Message.ToString() + " EntryId" + lane.EntryId);
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
                EventAPILog("Exception in ExitLaneSync : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "Something went wrong!";
                responce.Add(objMessage);

                LaneDataSyncResponce res = new LaneDataSyncResponce();
                res.CrTransId = 0;
                res.ResponceMessage = "failed";
                return Request.CreateResponse(HttpStatusCode.OK, res);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/Events/ReviewLaneSync")]
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
                EventAPILog("Exception in ReviewLaneSync : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "Something went wrong!";
                responce.Add(objMessage);

                LaneDataSyncResponce res = new LaneDataSyncResponce();
                res.CrTransId = 0;
                res.ResponceMessage = "failed";
                return Request.CreateResponse(HttpStatusCode.OK, res);
            }
        }

        [Route(Provider + "/Toll360-Plaza/EntryLaneSync")]
        [HttpPost]
        public HttpResponseMessage PlazaEntryLaneSync(PlazaTransactionIL lane)
        {
            try
            {
                if (lane.PlazaId > 0 && lane.ClientId > 0 && lane.EntryId > 0)
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
                    lane.TransactionTimeStamp = Convert.ToDateTime(lane.TransactionDateTime);
                    LaneTransactionIL lanes = LaneTransactionBL.OtherEntryInsert(lane);
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
                EventAPILog("Exception in PlazaEntryLaneSync : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "Something went wrong!";
                responce.Add(objMessage);

                LaneDataSyncResponce res = new LaneDataSyncResponce();
                res.CrTransId = 0;
                res.ResponceMessage = "failed";
                return Request.CreateResponse(HttpStatusCode.OK, res);
            }
        }
        #endregion
    }
}
