using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text.RegularExpressions;
using System.Threading;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;
using Newtonsoft.Json;
using Softomation.DMS.Libraries.CommonLibrary;
using Softomation.DMS.Libraries.CommonLibrary.BusinessLayer;
using Softomation.DMS.Libraries.CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;
using Softomation.DMS.Libraries.CommonLibrary.XMLConfigurationClasses;
using TollSolutionsAPI.Models;
using static TollSolutionsAPI.Models.CommonMethods;

namespace TollSolutionsAPI.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class PlazaOfficeController : ApiController
    {
        const string Provider = Constants.AppProvider;//"Softomation";//ConfigurationManager.AppSettings["Provider"].ToString();
        List<ResponceMessage> responceMessae = new List<ResponceMessage>();
        Responce responce = new Responce();

        #region Master Config
        [Route(Constants.AppProvider + "/Toll360-PlazaOffice/MasterConfigGet")]
        [HttpGet]
        public HttpResponseMessage MasterConfigGet()
        {
            try
            {
                MasterConfigIL config = MasterConfigBL.GetConfig();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = config;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in MasterConfigGet : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion
        #region Login
        [Route(Provider + "/Toll360-PlazaOffice/ValidateUser")]
        [HttpPost]
        public HttpResponseMessage ValidateUser(UserManagementIL login)
        {
            try
            {
                if (login.LoginId.ToLower() == "toll360")
                {
                    UserManagementIL obj = new UserManagementIL();
                    obj.EntryId = 0;
                    obj.ClientId = 0;
                    obj.PlazaId = 0;
                    obj.RoleId = 0;
                    obj.FirstName = "Softomation";
                    obj.LastName = "Toll 360";
                    obj.EmailId = "support@softomation.com";
                    obj.MobileNumber = "9999999999";
                    obj.RoleName = "Super Admin";
                    obj.PlazaId = Convert.ToInt32(ConfigurationManager.AppSettings["PlazaId"].ToString());

                    List<ClientManagementIL> clients = ClientManagementBL.GetAll();
                    if (clients.Count > 0)
                    {
                        obj.ClientId = Convert.ToInt16(clients[0].EntryId);
                    }
                    if (login.LoginPassword == Constants.Decrypt(ConfigurationManager.AppSettings["tollPassword"].ToString()))
                    {

                        LogingActivityIL activity = new LogingActivityIL();
                        activity.LoginId = login.LoginId.ToLower();
                        activity.LoginStatus = (Int16)Constants.UserLoginStatus.Login;
                        LogingActivityBL.InsertUpdate(activity);
                        obj.LoginPassword = "";


                        obj.LoginPassword = "";
                        ResponceMessage objMessage = new ResponceMessage();
                        objMessage.AlertMessage = "success";
                        responceMessae.Add(objMessage);
                        responce.ResponceData = obj;
                        responce.Message = responceMessae;
                        return Request.CreateResponse(HttpStatusCode.OK, responce);
                    }
                    else
                    {

                        LogingActivityIL activity = new LogingActivityIL();

                        activity.LoginId = login.LoginId.ToLower();
                        activity.LoginStatus = (Int16)Constants.UserLoginStatus.Invalid;
                        LogingActivityBL.InsertUpdate(activity);

                        obj.LoginPassword = "";
                        ResponceMessage objMessage = new ResponceMessage();
                        objMessage.AlertMessage = "Invalid user credentials";
                        responceMessae.Add(objMessage);
                        responce.ResponceData = obj;
                        responce.Message = responceMessae;
                        return Request.CreateResponse(HttpStatusCode.OK, responce);
                    }
                }
                else
                {
                    UserManagementIL obj = UserManagementBL.GetByLoginId(login);
                    if (obj != null)
                    {
                        if (string.IsNullOrEmpty(obj.LoginPassword))
                        {

                            LogingActivityIL activity = new LogingActivityIL();

                            activity.LoginId = login.LoginId.ToLower();
                            activity.LoginStatus = (Int16)Constants.UserLoginStatus.Invalid;
                            LogingActivityBL.InsertUpdate(activity);

                            obj.LoginPassword = "";
                            ResponceMessage objMessage = new ResponceMessage();
                            objMessage.AlertMessage = "Invalid user credentials";
                            responceMessae.Add(objMessage);
                            responce.ResponceData = obj;
                            responce.Message = responceMessae;
                            return Request.CreateResponse(HttpStatusCode.OK, responce);
                        }
                        else
                        {
                            if (login.LoginPassword == Constants.Decrypt(obj.LoginPassword))
                            {
                                if (obj.UserType != 1)
                                {
                                    if (obj.AccountExpiredDate < DateTime.Now)
                                    {
                                        LogingActivityIL activity = new LogingActivityIL();
                                        activity.LoginId = login.LoginId.ToLower();
                                        activity.LoginStatus = (Int16)Constants.UserLoginStatus.Invalid;
                                        LogingActivityBL.InsertUpdate(activity);
                                        obj.LoginPassword = "";
                                        ResponceMessage objMessage = new ResponceMessage();
                                        objMessage.AlertMessage = "Account has expired";
                                        responceMessae.Add(objMessage);
                                        responce.ResponceData = obj;
                                        responce.Message = responceMessae;
                                        return Request.CreateResponse(HttpStatusCode.OK, responce);
                                    }
                                    else
                                    {

                                        LogingActivityIL activity = new LogingActivityIL();
                                        activity.LoginId = login.LoginId.ToLower();
                                        activity.LoginStatus = (Int16)Constants.UserLoginStatus.Login;
                                        LogingActivityBL.InsertUpdate(activity);
                                        obj.LoginPassword = "";

                                        ResponceMessage objMessage = new ResponceMessage();
                                        objMessage.AlertMessage = "success";
                                        responceMessae.Add(objMessage);
                                        responce.ResponceData = obj;
                                        responce.Message = responceMessae;
                                        return Request.CreateResponse(HttpStatusCode.OK, responce);
                                    }
                                }
                                else
                                {
                                    LogingActivityIL activity = new LogingActivityIL();
                                    activity.LoginId = login.LoginId.ToLower();
                                    activity.LoginStatus = (Int16)Constants.UserLoginStatus.Invalid;
                                    LogingActivityBL.InsertUpdate(activity);


                                    obj.LoginPassword = "";
                                    ResponceMessage objMessage = new ResponceMessage();
                                    objMessage.AlertMessage = "Unauthorized user has access";
                                    responceMessae.Add(objMessage);
                                    responce.ResponceData = obj;
                                    responce.Message = responceMessae;
                                    return Request.CreateResponse(HttpStatusCode.OK, responce);

                                }
                            }
                            else
                            {
                                LogingActivityIL activity = new LogingActivityIL();

                                activity.LoginId = login.LoginId.ToLower();
                                activity.LoginStatus = (Int16)Constants.UserLoginStatus.Invalid;
                                LogingActivityBL.InsertUpdate(activity);


                                obj.LoginPassword = "";
                                ResponceMessage objMessage = new ResponceMessage();
                                objMessage.AlertMessage = "Invalid user credentials";
                                responceMessae.Add(objMessage);
                                responce.ResponceData = obj;
                                responce.Message = responceMessae;
                                return Request.CreateResponse(HttpStatusCode.OK, responce);
                            }
                        }
                    }
                    else
                    {

                        LogingActivityIL activity = new LogingActivityIL();

                        activity.LoginId = login.LoginId.ToLower();
                        activity.LoginStatus = (Int16)Constants.UserLoginStatus.Invalid;
                        LogingActivityBL.InsertUpdate(activity);

                        obj.LoginPassword = "";
                        ResponceMessage objMessage = new ResponceMessage();
                        objMessage.AlertMessage = "Login credentials not found";
                        responceMessae.Add(objMessage);
                        responce.ResponceData = obj;
                        responce.Message = responceMessae;
                        return Request.CreateResponse(HttpStatusCode.OK, responce);
                    }
                }
            }
            catch (Exception ex)
            {
                LogingActivityIL activity = new LogingActivityIL();
                activity.LoginId = login.LoginId.ToLower();
                activity.LoginStatus = (Int16)Constants.UserLoginStatus.Invalid;
                LogingActivityBL.InsertUpdate(activity);

                PlazaOfficeAPILog("Error in PlazaOffice : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/LogoutUser")]
        [HttpPost]
        public HttpResponseMessage LogoutUser(LogingActivityIL activity)
        {
            try
            {
                activity.LoginStatus = (Int16)Constants.UserLoginStatus.Logout;
                LogingActivityBL.InsertUpdate(activity);
                return Request.CreateResponse(HttpStatusCode.OK);
            }
            catch (Exception ex)
            {

                BackOfficeAPILog("Error in ValidateUser : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region All Menu
        [Route(Provider + "/Toll360-PlazaOffice/AllMenu")]
        [HttpGet]
        public HttpResponseMessage GetAllMenuList(int RoleId)
        {
            try
            {
                List<MenuManagementIL> obj;
                if (RoleId == 0)
                    obj = MenuManagementBL.GetByPlazaMenu();
                else
                    obj = MenuManagementBL.GetByRoleId(RoleId);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = obj;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in GetAllMenuList : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Client Management
        [Route(Provider + "/Toll360-PlazaOffice/ClientConfigurationGetAll")]
        [HttpGet]
        public HttpResponseMessage ClientConfigurationGetAll()
        {
            try
            {
                List<ClientManagementIL> clients = ClientManagementBL.GetAll();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = clients;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in ClientConfigurationGetAll : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/ClientConfigurationGetById")]
        [HttpGet]
        public HttpResponseMessage ClientConfigurationGetById(int ClientId)
        {
            try
            {
                ClientManagementIL client = ClientManagementBL.GetById(ClientId);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = client;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in ClientConfigurationGetById : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Plaza Management
        [Route(Provider + "/Toll360-PlazaOffice/PlazaConfigurationGetAll")]
        [HttpGet]
        public HttpResponseMessage PlazaConfigurationGetAll()
        {
            try
            {
                List<PlazaManagementIL> plazas = PlazaManagementBL.GetAll();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = plazas;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in PlazaConfigurationGetAll : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/PlazaConfigurationGetById")]
        [HttpGet]
        public HttpResponseMessage PlazaConfigurationGetById(int PlazId)
        {
            try
            {
                PlazaManagementIL plaza = PlazaManagementBL.GetById(PlazId);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = plaza;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in PlazaConfigurationGetById : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Class Mapping
        [Route(Provider + "/Toll360-PlazaOffice/ClassMappingGetAll")]
        [HttpGet]
        public HttpResponseMessage ClassMappingGetAll()
        {
            try
            {
                List<VehicleClassIL> mappedClasses = VehicleClassBL.GetAll();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = mappedClasses;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in ClassMappingGetAll : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/ClassMappingGetActive")]
        [HttpGet]
        public HttpResponseMessage ClassMappingGetActive()
        {
            try
            {
                List<VehicleClassIL> mappedClasses = VehicleClassBL.GetActive();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = mappedClasses;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in ClassMappingGetActive : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        [Route(Provider + "/Toll360-PlazaOffice/ClassMappingGetByClassId")]
        [HttpGet]
        public HttpResponseMessage ClassMappingGetByClassId(int ClassId)
        {
            try
            {
                VehicleClassIL mappedClasses = VehicleClassBL.GetByClassId(ClassId);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = mappedClasses;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in ClassMappingGetByClassId : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/ClassMappingGetByClientId")]
        [HttpGet]
        public HttpResponseMessage ClassMappingGetByClientId(int ClientId)
        {
            try
            {
                List<VehicleClassIL> mappedClasses = VehicleClassBL.GetByClientId(ClientId);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = mappedClasses;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in ClassMappingGetByClientId : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Fare Mapping
        [Route(Provider + "/Toll360-PlazaOffice/FareGetAllByDate")]
        [HttpPost]
        public HttpResponseMessage FareGetAllByDate(FareManagementIL fare)
        {
            try
            {

                FareManagementIL fareData = FareManagementBL.GetAllByDate(fare);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = fareData;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in FareGetAllByDate : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Hardware Management
        [Route(Provider + "/Toll360-PlazaOffice/HardwareConfigurationGetAll")]
        [HttpGet]
        public HttpResponseMessage HardwareConfigurationGetAll()
        {
            try
            {
                List<HardwareManagementIL> hardwaries = HardwareManagementBL.GetAll();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = hardwaries;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in HardwareConfigurationGetAll : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/HardwareConfigurationGetById")]
        [HttpGet]
        public HttpResponseMessage HardwareConfigurationGetById(int HardwareId)
        {
            try
            {
                HardwareManagementIL hardware = HardwareManagementBL.GetById(HardwareId);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = hardware;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in HardwareConfigurationGetById : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/HardwareConfigurationGetByClientId")]
        [HttpGet]
        public HttpResponseMessage HardwareConfigurationGetByClientId(int ClientId)
        {
            try
            {
                List<HardwareManagementIL> hardwaries = HardwareManagementBL.GetByClientId(ClientId);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = hardwaries;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in HardwareConfigurationGetByClientId : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/GetByConnectionType")]
        [HttpGet]
        public HttpResponseMessage GetByConnectionType()
        {
            try
            {
                List<ConnectionTypeIL> hardwaries = ConnectionTypeBL.GetActive();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = hardwaries;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in GetByConnectionType : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/GetByHardwareType")]
        [HttpGet]
        public HttpResponseMessage GetByHardwareType()
        {
            try
            {
                List<HardwareTypeIL> hardwariesTypes = HardwareTypeBL.GetActive();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = hardwariesTypes;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in GetByHardwareType : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Lane Management
        [Route(Provider + "/Toll360-PlazaOffice/LaneConfigurationGetAll")]
        [HttpGet]
        public HttpResponseMessage LaneConfigurationGetAll()
        {
            try
            {
                List<LaneManagementIL> lanes = LaneManagementBL.GetAll();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = lanes;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in LaneConfigurationGetAll : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }


        [Route(Provider + "/Toll360-PlazaOffice/LaneConfigurationGetByType")]
        [HttpGet]
        public HttpResponseMessage LaneConfigurationGetByType(short LaneType)
        {
            try
            {
                List<LaneManagementIL> lane = LaneManagementBL.GetByLaneType(LaneType);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = lane;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in LaneConfigurationGetByType : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/LaneConfigurationGetById")]
        [HttpGet]
        public HttpResponseMessage LaneConfigurationGetById(int LaneId)
        {
            try
            {
                LaneManagementIL lane = LaneManagementBL.GetById(LaneId);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = lane;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in LaneConfigurationGetById : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/LaneConfigurationGetByPlazaId")]
        [HttpGet]
        public HttpResponseMessage LaneConfigurationGetByPlazaId(int PlazaId)
        {
            try
            {
                List<LaneManagementIL> lanes = LaneManagementBL.GetByPlazaId(PlazaId);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = lanes;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in LaneConfigurationGetByPlazaId : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Role Management
        [Route(Provider + "/Toll360-PlazaOffice/RoleConfigurationGetAll")]
        [HttpGet]
        public HttpResponseMessage RoleConfigurationGetAll()
        {
            try
            {
                List<RoleManagementIL> roles = RoleManagementBL.GetAll();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = roles;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in RoleConfigurationGetAll : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/RoleConfigurationGetById")]
        [HttpGet]
        public HttpResponseMessage RoleConfigurationGetById(int RoleId)
        {
            try
            {
                RoleManagementIL role = RoleManagementBL.GetById(RoleId);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = role;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in RoleConfigurationGetById : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }


        [Route(Provider + "/Toll360-PlazaOffice/RolePermissionGetByRoleId")]
        [HttpGet]
        public HttpResponseMessage RolePermissionGetByRoleId(Int64 RoleId)
        {
            try
            {
                List<RolePermissionIL> role = RolePermissionBL.GetByRoleId(RoleId);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = role;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in RolePermissionGetByRoleId : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/RolePermissionGetByEventId")]
        [HttpPost]
        public HttpResponseMessage RolePermissionGetByEventId(RolePermissionIL role)
        {
            try
            {
                RolePermissionIL roles = RolePermissionBL.GetByEventId(role);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = roles;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in RolePermissionGetByEventId : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/RolePermissionSetup")]
        [HttpPost]
        public HttpResponseMessage RolePermissionSetup(RoleManagementIL roles)
        {
            try
            {
                List<ResponceIL> resp = RolePermissionBL.ImportData(roles);
                foreach (var ResponceIL in resp)
                {
                    ResponceMessage objMessage = new ResponceMessage();
                    objMessage.AlertMessage = ResponceIL.AlertMessage;
                    responceMessae.Add(objMessage);
                }
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in RolePermissionSetup : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region User Management
        [Route(Provider + "/Toll360-PlazaOffice/UserValidatePassword")]
        [HttpPost]
        public HttpResponseMessage UserValidatePassword(UserManagementIL user)
        {
            try
            {
                UserManagementIL users = UserManagementBL.GetById((int)user.EntryId);
                if (user.LoginPassword == Constants.Decrypt(users.LoginPassword))
                {
                    ResponceMessage objMessage = new ResponceMessage();
                    objMessage.AlertMessage = "success";
                    responceMessae.Add(objMessage);
                    responce.Message = responceMessae;
                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                }
                else
                {
                    ResponceMessage objMessage = new ResponceMessage();
                    objMessage.AlertMessage = "failed";
                    responceMessae.Add(objMessage);
                    responce.Message = responceMessae;
                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                }
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in UserValidatePassword : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/UserUpdatePassword")]
        [HttpPost]
        public HttpResponseMessage UserUpdatePassword(UserManagementIL user)
        {
            try
            {
                UserManagementBL.UpdatePassword(user);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in UserUpdatePassword : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/UserConfigurationGetAll")]
        [HttpGet]
        public HttpResponseMessage UserConfigurationGetAll()
        {
            try
            {
                List<UserManagementIL> users = UserManagementBL.GetAll();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = users;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in UserConfigurationGetAll : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        [Route(Provider + "/Toll360-PlazaOffice/UserConfigurationGetAllLaneUsers")]
        [HttpGet]
        public HttpResponseMessage UserConfigurationGetAllLaneUsers()
        {
            try
            {
                List<UserManagementIL> users = UserManagementBL.GetAllLaneUsers();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = users;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in UserConfigurationGetAllLaneUsers : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        [Route(Provider + "/Toll360-PlazaOffice/UserConfigurationGetById")]
        [HttpGet]
        public HttpResponseMessage UserConfigurationGetById(int UserId)
        {
            try
            {
                UserManagementIL user = UserManagementBL.GetById(UserId);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = user;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in UserConfigurationGetById : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Cash Flow Management
        [Route(Provider + "/Toll360-PlazaOffice/CashFlowConfigurationSetUp")]
        [HttpPost]
        public HttpResponseMessage CashFlowConfigurationSetUp(CashFlowConfigurationIL cashFlow)
        {
            try
            {
                SystemSettingIL ss = SystemSettingBL.GetSetting();

                DateTime ValidateDate = Convert.ToDateTime(DateTime.Now.ToString("dd-MMM-yyyy")).AddDays(ss.AllotmentDays);
                ShiftManagementIL shift = ShiftManagementBL.GetById(cashFlow.ShiftId);
                cashFlow.StartTimmng = cashFlow.ShiftDate.ToString("dd-MMM-yyyy") + " " + shift.StartTimmng;
                cashFlow.EndTimming = cashFlow.ShiftDate.ToString("dd-MMM-yyyy") + " " + shift.EndTimming;
                if (Convert.ToDateTime(cashFlow.ShiftDate.ToString("dd-MMM-yyyy")) >= ValidateDate)
                {
                    ResponceMessage objMessage = new ResponceMessage();
                    objMessage.AlertMessage = "Not allowed for this shift";
                    responceMessae.Add(objMessage);
                    responce.Message = responceMessae;
                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                }
                else
                {
                    cashFlow.ReceiptNumber = "AR-" + Constants.RandomString(5) + "-" + DateTime.Now.ToString(Constants.dateTimeFormatFileName);
                    List<ResponceIL> resp = CashFlowConfigurationBL.InsertUpdate(cashFlow);
                    foreach (ResponceIL item in resp)
                    {
                        if (item.AlertMessage.Contains("success"))
                        {
                            cashFlow.EntryId = Convert.ToInt64(item.AlertMessage.Replace("success-", ""));
                            item.AlertMessage = "success";
                            break;
                        }
                    }
                    if (cashFlow.EntryId != 0)
                    {
                        string FileName = cashFlow.ReceiptNumber + ".pdf";
                        string urlAddress = ConfigurationManager.AppSettings["APIUrl"].ToString() + "/Home/CashAlotment?CashFlowId=" + cashFlow.EntryId + "&PlazaId=" + ConfigurationManager.AppSettings["PlazaId"].ToString() + "&FileName=" + FileName + "&Type=1";
                        var client = new WebClient();
                        client.Headers.Add("User-Agent", "C# console program");
                        string content = client.DownloadString(urlAddress);
                        if (string.IsNullOrEmpty(content))
                        {
                            ResponceMessage objMessage = new ResponceMessage();
                            objMessage.AlertMessage = "Something went wrong!";
                            responceMessae.Add(objMessage);
                            responce.Message = responceMessae;
                            return Request.CreateResponse(HttpStatusCode.OK, responce);
                        }
                        else
                        {
                            string FinalPath = ConfigurationManager.AppSettings["APIUrl"].ToString() + "/reports/" + FileName;
                            ResponceMessage objMessage = new ResponceMessage();
                            objMessage.AlertMessage = FinalPath;
                            responceMessae.Add(objMessage);
                            responce.Message = responceMessae;
                            return Request.CreateResponse(HttpStatusCode.OK, responce);
                        }
                    }
                    else
                    {
                        foreach (var ResponceIL in resp)
                        {
                            ResponceMessage objMessage = new ResponceMessage();
                            objMessage.AlertMessage = ResponceIL.AlertMessage;
                            responceMessae.Add(objMessage);
                        }
                        responce.Message = responceMessae;
                        return Request.CreateResponse(HttpStatusCode.OK, responce);
                    }
                }
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in CashFlowConfigurationSetUp : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/CashFlowConfigurationClearance")]
        [HttpPost]
        public HttpResponseMessage CashFlowConfigurationClearance(CashFlowConfigurationIL cashFlow)
        {
            bool validate = true;
            try
            {
                if (cashFlow.DataStatus == 1)
                {
                    CashFlowConfigurationIL crrentFlow = CashFlowConfigurationBL.GetById(cashFlow.EntryId);
                    if (Convert.ToDateTime(crrentFlow.ShiftDate.ToString("dd-MMM-yyyy") + " " + crrentFlow.EndTimming) > DateTime.Now
                        && Convert.ToDateTime(crrentFlow.ShiftDate.ToString("dd-MMM-yyyy") + " " + crrentFlow.StartTimmng) < DateTime.Now)
                        validate = true;
                    else
                        validate = false;
                }
                if (validate)
                {
                    cashFlow.ReceiptNumber = "DR-" + Constants.RandomString(5) + "-" + DateTime.Now.ToString(Constants.dateTimeFormatFileName);
                    List<ResponceIL> resp = CashFlowConfigurationBL.Clearance(cashFlow);
                    if (cashFlow.EntryId != 0)
                    {
                        string FileName = cashFlow.ReceiptNumber + ".pdf";
                        string urlAddress = ConfigurationManager.AppSettings["APIUrl"].ToString() + "/Home/CashDeposit?ReceiptNumber=" + cashFlow.ReceiptNumber + "&PlazaId=" + ConfigurationManager.AppSettings["PlazaId"].ToString() + "&FileName=" + FileName + "&Type=1";
                        var client = new WebClient();
                        client.Headers.Add("User-Agent", "C# console program");
                        string content = client.DownloadString(urlAddress);
                        if (string.IsNullOrEmpty(content))
                        {
                            ResponceMessage objMessage = new ResponceMessage();
                            objMessage.AlertMessage = "Something went wrong!";
                            responceMessae.Add(objMessage);
                            responce.Message = responceMessae;
                            return Request.CreateResponse(HttpStatusCode.OK, responce);
                        }
                        else
                        {
                            string FinalPath = ConfigurationManager.AppSettings["APIUrl"].ToString() + "/reports/" + FileName;
                            ResponceMessage objMessage = new ResponceMessage();
                            objMessage.AlertMessage = FinalPath;
                            responceMessae.Add(objMessage);
                            responce.Message = responceMessae;
                            return Request.CreateResponse(HttpStatusCode.OK, responce);
                        }
                    }
                    else
                    {
                        foreach (var ResponceIL in resp)
                        {
                            ResponceMessage objMessage = new ResponceMessage();
                            objMessage.AlertMessage = ResponceIL.AlertMessage;
                            responceMessae.Add(objMessage);
                        }
                        responce.Message = responceMessae;
                        return Request.CreateResponse(HttpStatusCode.OK, responce);
                    }
                }
                else
                {
                    ResponceMessage objMessage = new ResponceMessage();
                    objMessage.AlertMessage = "Mid clearance not allowed for future shift!";
                    responceMessae.Add(objMessage);
                    responce.Message = responceMessae;
                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                }
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in CashFlowConfigurationClearance : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/CashFlowConfigurationPrint")]
        [HttpGet]
        public HttpResponseMessage CashFlowConfigurationPrint(int Type, string Number)
        {
            try
            {
                string FileName = string.Empty;
                string urlAddress = string.Empty;
                if (Type == 1)
                {
                    CashFlowConfigurationIL cashFlow = CashFlowConfigurationBL.GetByReceiptNumber(Number);
                    if (cashFlow.ReceiptNumber == Number)
                    {
                        FileName = Constants.RandomString(5) + ".pdf";
                        urlAddress = ConfigurationManager.AppSettings["APIUrl"].ToString() + "/Home/CashAlotment?CashFlowId=" + cashFlow.EntryId + "&PlazaId=" + ConfigurationManager.AppSettings["PlazaId"].ToString() + "&FileName=" + FileName + "&Type=2";
                    }
                }
                else
                {
                    CashFlowDepositIL Deositdata = CashFlowDepositBL.CashDepositGetByReceipt(Number);
                    if (Deositdata.ReceiptNumber == Number)
                    {
                        FileName = Constants.RandomString(5) + ".pdf";
                        urlAddress = ConfigurationManager.AppSettings["APIUrl"].ToString() + "/Home/CashDeposit?ReceiptNumber=" + Number + "&PlazaId=" + ConfigurationManager.AppSettings["PlazaId"].ToString() + "&FileName=" + FileName + "&Type=2";
                    }
                }
                if (string.IsNullOrEmpty(FileName))
                {
                    ResponceMessage objMessage = new ResponceMessage();
                    objMessage.AlertMessage = "No data found!";
                    responceMessae.Add(objMessage);
                    responce.Message = responceMessae;
                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                }
                else
                {
                    var client = new WebClient();
                    client.Headers.Add("User-Agent", "C# console program");
                    string content = client.DownloadString(urlAddress);
                    if (string.IsNullOrEmpty(content))
                    {
                        ResponceMessage objMessage = new ResponceMessage();
                        objMessage.AlertMessage = "Something went wrong!";
                        responceMessae.Add(objMessage);
                        responce.Message = responceMessae;
                        return Request.CreateResponse(HttpStatusCode.OK, responce);
                    }
                    else
                    {
                        string FinalPath = ConfigurationManager.AppSettings["APIUrl"].ToString() + "/reports/" + FileName;
                        ResponceMessage objMessage = new ResponceMessage();
                        objMessage.AlertMessage = FinalPath;
                        responceMessae.Add(objMessage);
                        responce.Message = responceMessae;
                        return Request.CreateResponse(HttpStatusCode.OK, responce);
                    }
                }
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in CashFlowConfigurationPrint : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }


        [Route(Provider + "/Toll360-PlazaOffice/CashFlowConfigurationFinish")]
        [HttpPost]
        public HttpResponseMessage CashFlowConfigurationFinish(CashFlowConfigurationIL cashFlow)
        {
            try
            {
                List<ResponceIL> resp = CashFlowConfigurationBL.Finish(cashFlow);
                if (cashFlow.EntryId != 0)
                {
                    string FileName = "CashDeposit_" + DateTime.Now.ToString(Constants.dateTimeFormatFileName) + ".pdf";
                    string urlAddress = ConfigurationManager.AppSettings["APIUrl"].ToString() + "/Home/CashDeposit?CashFlowId=" + cashFlow.EntryId + "&PlazaId=" + ConfigurationManager.AppSettings["PlazaId"].ToString() + "&FileName=" + FileName;
                    var client = new WebClient();
                    client.Headers.Add("User-Agent", "C# console program");
                    string content = client.DownloadString(urlAddress);
                    if (string.IsNullOrEmpty(content))
                    {
                        ResponceMessage objMessage = new ResponceMessage();
                        objMessage.AlertMessage = "Something went wrong";
                        responceMessae.Add(objMessage);
                        responce.Message = responceMessae;
                        return Request.CreateResponse(HttpStatusCode.OK, responce);
                    }
                    else
                    {
                        string FinalPath = ConfigurationManager.AppSettings["APIUrl"].ToString() + "/reports/" + FileName;
                        ResponceMessage objMessage = new ResponceMessage();
                        objMessage.AlertMessage = FinalPath;
                        responceMessae.Add(objMessage);
                        responce.Message = responceMessae;
                        return Request.CreateResponse(HttpStatusCode.OK, responce);
                    }
                }
                else
                {
                    foreach (var ResponceIL in resp)
                    {
                        ResponceMessage objMessage = new ResponceMessage();
                        objMessage.AlertMessage = ResponceIL.AlertMessage;
                        responceMessae.Add(objMessage);
                    }
                    responce.Message = responceMessae;
                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                }
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in CashFlowConfigurationFinish : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }


        [Route(Provider + "/Toll360-PlazaOffice/CashFlowConfigurationGetAll")]
        [HttpGet]
        public HttpResponseMessage CashFlowConfigurationGetAll()
        {
            try
            {
                List<CashFlowConfigurationIL> cashFlows = CashFlowConfigurationBL.GetAll();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = cashFlows;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in CashFlowConfigurationGetAll : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/CashFlowConfigurationGetAllPending")]
        [HttpGet]
        public HttpResponseMessage CashFlowConfigurationGetAllPending(long UserId)
        {
            try
            {
                List<CashFlowConfigurationIL> cashFlows = CashFlowConfigurationBL.GetAllPendingByUserId(UserId);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = cashFlows;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in CashFlowConfigurationGetAllPending : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/CashFlowConfigurationGetById")]
        [HttpGet]
        public HttpResponseMessage CashFlowConfigurationGetById(Int64 CashFlowId)
        {
            try
            {
                CashFlowConfigurationIL cashFlow = CashFlowConfigurationBL.GetById(CashFlowId);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = cashFlow;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in CashFlowConfigurationGetById : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/CashFlowConfigurationGetByOpenShift")]
        [HttpGet]
        public HttpResponseMessage CashFlowConfigurationGetByOpenShift(Int64 ShiftMasterId)
        {
            try
            {
                List<CashFlowConfigurationIL> cashFlow = CashFlowConfigurationBL.CashDepositGetByOpenShift(ShiftMasterId);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = cashFlow;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in CashFlowConfigurationGetByOpenShift : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Shift Management
        [Route(Provider + "/Toll360-PlazaOffice/GetShiftDetails")]
        [HttpGet]
        public HttpResponseMessage GetShiftDetails()
        {
            try
            {
                List<ShiftManagementIL> shifts = ShiftManagementBL.GetAll();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = shifts;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in GetShiftDetails : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }


        [Route(Provider + "/Toll360-PlazaOffice/GetShiftStatusDetails")]
        [HttpGet]
        public HttpResponseMessage GetShiftStatusDetails(Int16 ShiftStatus)
        {
            try
            {
                List<ShiftDetailsIL> shifts = ShiftDetailsBL.GetAllByStatus(ShiftStatus);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = shifts;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in GetShiftStatusDetails : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/GetShiftStatusDetailsAll")]
        [HttpGet]
        public HttpResponseMessage GetShiftStatusDetailsAll()
        {
            try
            {
                List<ShiftDetailsIL> shifts = ShiftDetailsBL.GetAll();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = shifts;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in GetShiftStatusDetailsAll : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/ShiftClosed")]
        [HttpPost]
        public HttpResponseMessage ShiftClosed(ShiftDetailsIL shift)
        {
            try
            {
                shift.PlazaId = Convert.ToInt32(ConfigurationManager.AppSettings["PlazaId"].ToString());
                List<ResponceIL> resp = ShiftDetailsBL.ShiftClose(shift);
                foreach (var ResponceIL in resp)
                {
                    ResponceMessage objMessage = new ResponceMessage();
                    objMessage.AlertMessage = ResponceIL.AlertMessage;
                    responceMessae.Add(objMessage);
                }
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in ShiftClosed : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Denomination Management
        [Route(Provider + "/Toll360-PlazaOffice/GetMasterDenomination")]
        [HttpGet]
        public HttpResponseMessage GetMasterDenomination()
        {
            try
            {
                List<DenominationIL> cashFlows = DenominationBL.GetAll();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = cashFlows;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in GetMasterDenomination : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Exempt Type
        [Route(Provider + "/Toll360-PlazaOffice/GetExemptDetails")]
        [HttpGet]
        public HttpResponseMessage GetExemptDetails()
        {
            try
            {
                List<ExemptTypeIL> exemptType = ExemptTypeBL.GetAll();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = exemptType;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in GetExemptDetails : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Transaction Type
        [Route(Provider + "/Toll360-PlazaOffice/GetTransactionDetails")]
        [HttpGet]
        public HttpResponseMessage GetTransactionDetails()
        {
            try
            {
                List<TransactionTypeIL> transactionType = TransactionTypeBL.GetAll();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = transactionType;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in GetTransactionDetails : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }

        }
        #endregion

        #region Payment Type
        [Route(Provider + "/Toll360-PlazaOffice/GetPaymentDetails")]
        [HttpGet]
        public HttpResponseMessage GetPaymentDetails()
        {
            try
            {
                List<PaymentTypeIL> exemptType = PaymentTypeBL.GetAll();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = exemptType;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in GetPaymentDetails : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Lane Transaction
        [Route(Provider + "/Toll360-PlazaOffice/DemoTransaction")]
        [HttpPost]
        public HttpResponseMessage DemoTransaction(LaneTransactionIL laneData)
        {
            LaneTrsnResponce finlResponce = new LaneTrsnResponce();

            MasterConfigIL config = MasterConfigBL.GetConfig();
            try
            {
                ShiftDetailsIL sd = new ShiftDetailsIL();
                sd.ShiftId = laneData.ShiftId;
                sd.ShiftDate = laneData.TransactionTimeStamp;
                ShiftDetailsIL shiftDetilsData = ShiftDetailsBL.GetAllByShiftId(sd);
                laneData.JourneyType = 1;
                if (shiftDetilsData.ShiftId == laneData.ShiftId)
                {
                    FareDetailsIL fare;
                    LaneManagementIL lane = LaneManagementBL.GetById(laneData.LaneNumber);
                    ShiftManagementIL shifts = ShiftManagementBL.GetById(laneData.ShiftId);
                    TransactionTypeIL tranType = TransactionTypeBL.GetById(laneData.TransactionTypeId);
                    laneData.ClientId = lane.ClientId;
                    laneData.PlazaId = (short)lane.PlazaId;
                    laneData.LaneNumber = lane.LaneNumber;
                    laneData.LaneType = lane.LaneTypeId;

                    ShiftLaneDetailsIL sld = new ShiftLaneDetailsIL();
                    sld.LaneNumber = laneData.LaneNumber;
                    sld.ShfitDetailId = shiftDetilsData.EntryId;
                    ShiftLaneDetailsIL shiftLaneData = ShiftLaneDetailsBL.GetAllByStatus(sld);
                    if (shiftLaneData.LastTransId == 0)
                    {
                        if (shiftLaneData.LaneNumber != laneData.LaneNumber)
                        {
                            ShiftLaneDetailsBL.ShfitLaneDetailsInsert(sld);
                        }
                        shiftLaneData = ShiftLaneDetailsBL.GetAllByStatus(sld);
                        Int64 LaneTransId = LaneTransactionBL.GetMaxId(laneData);
                        laneData.LaneTransId = Convert.ToInt64(LaneTransId.ToString() + lane.PlazaId.ToString("00") + lane.LaneNumber.ToString("00"));
                        DateTime d = Convert.ToDateTime(laneData.TransactionTimeStamp.ToString("dd-MMM-yyyy") + " " + shifts.StartTimmng);
                        if (laneData.LaneType == 1)
                            laneData.TransactionTimeStamp = d.AddSeconds(LaneTransId);
                        else
                            laneData.TransactionTimeStamp = d.AddMinutes(LaneTransId);
                        if (laneData.ConfirmationStatus == 2)
                        {
                            sld.LastTransId = laneData.LaneTransId;
                            ShiftLaneDetailsBL.ShfitLaneDetailsClose(sld);
                        }

                        #region Reveiwed Required
                        laneData.ReveiwedRequired = tranType.ReveiwedRequired;
                        if (laneData.MappingClassId != laneData.AvcClassId)
                        {
                            laneData.ReveiwedRequired = 1;
                        }
                        #endregion

                        List<LaneTransactionIL> MappingLaneData = LaneTransactionBL.GetLaneMatchedDataByRefNum(laneData);
                        if (laneData.LaneType == 1)
                        {
                            #region Entry Lane Trans
                            if (MappingLaneData.Count > 0)
                            {
                                #region Mapping Data Found
                                List<LaneTransactionIL> filtered = MappingLaneData.FindAll(e => e.ReferenceTransactionId == 0).OrderBy(x => x.TransactionTimeStamp).ToList();
                                if (filtered.Count > 0)
                                {
                                    #region Exit Lane Data Found
                                    LaneTransactionIL ExitLaneData = filtered[0];
                                    laneData.ReferenceTransactionId = ExitLaneData.EntryId;
                                    TransactionTypeIL ExitTranType = TransactionTypeBL.GetById(ExitLaneData.TransactionTypeId);
                                    finlResponce.MappedTransactionDetalis = ExitLaneData;

                                    if (ExitLaneData.MappingClassId != laneData.MappingClassId)
                                    {
                                        ResponceMessage msg1 = new ResponceMessage();
                                        msg1.AlertMessage = "Class mismatch current lane is " + laneData.MappingClassId + " & exit lane have " + ExitLaneData.MappingClassId;
                                        responceMessae.Add(msg1);
                                    }

                                    if (ExitLaneData.TransactionTypeId != laneData.TransactionTypeId)
                                    {
                                        ResponceMessage msg1 = new ResponceMessage();
                                        msg1.AlertMessage = "Transaction Type mismatch current lane is " + tranType.TransactionTypeName + " & exit lane have " + ExitTranType.TransactionTypeName;
                                        responceMessae.Add(msg1);
                                    }
                                    #endregion

                                    if (laneData.ExemptTypeId == 0)
                                    {
                                        #region Check Toll Fare based on exit lane
                                        FareDetailsIL fd = new FareDetailsIL();
                                        fd.ClassId = ExitLaneData.MappingClassId;
                                        fd.EntryPlazaId = laneData.PlazaId;
                                        fd.ExitPlazaId = ExitLaneData.PlazaId;
                                        fd.TransactionTimeStamp = ExitLaneData.TransactionTimeStamp;
                                        fare = FareManagementBL.GetFareByJourney(fd);
                                        if (fare.Journey == "Found")
                                        {
                                            laneData.TransactionAmount = fare.TollFare;


                                            if (laneData.Overweight == 1)
                                                laneData.TransactionAmount = fare.OverWeightFare;
                                            else if (laneData.Penalty == 1)
                                                laneData.TransactionAmount = fare.PenaltyFare;
                                            else if (ExitLaneData.Overweight == 1)
                                                laneData.TransactionAmount = fare.OverWeightFare;
                                            else if (ExitLaneData.Penalty == 1)
                                                laneData.TransactionAmount = fare.PenaltyFare;
                                            else
                                            {
                                                laneData.TransactionAmount = fare.TollFare;
                                                #region Check for Retrun Journey
                                                if (ExitLaneData.TransactionTypeId == 1)
                                                {
                                                    LaneTransactionIL retJourney = new LaneTransactionIL();
                                                    retJourney.ReferenceNumber = ExitLaneData.ReferenceNumber;
                                                    retJourney.TransactionTimeStamp = ExitLaneData.TransactionTimeStamp;
                                                    List<LaneTransactionIL> checkforReturnJourney = LaneTransactionBL.GetLaneMatchedDataForRetJourney(retJourney);
                                                    List<LaneTransactionIL> filteredReturnJourney = MappingLaneData.FindAll(e => e.EntryId != ExitLaneData.EntryId);
                                                    if (filteredReturnJourney.Count > 0)
                                                    {
                                                        List<LaneTransactionIL> filteredReturn = filteredReturnJourney.FindAll(e => e.JourneyType == 2);
                                                        if (filteredReturn.Count == 0)
                                                        {
                                                            laneData.TransactionAmount = fare.ReturnFare;
                                                            laneData.JourneyType = 2;
                                                        }
                                                    }
                                                }
                                                #endregion
                                            }
                                            finlResponce.FareDetalis = fare;
                                        }
                                        else
                                        {
                                            ResponceMessage msg2 = new ResponceMessage();
                                            msg2.AlertMessage = "Toll fare not found";
                                            responceMessae.Add(msg2);
                                        }
                                        #endregion
                                    }
                                }
                                #endregion
                            }
                            #endregion

                            #region Create Entry Transcation

                            #region Save Proof
                            var path = Constants.MediaPath(laneData.PlazaId, laneData.LaneNumber, laneData.TransactionTimeStamp);
                            //"P" + laneData.PlazaId.ToString() + "/" + "L" + laneData.LaneNumber.ToString() + "/" + laneData.TransactionTimeStamp.ToString("ddMMMyyyy");
                            var FileName = Constants.RandomString(5) + "-" + laneData.TransactionTimeStamp.ToString(Constants.dateTimeFormatFileName);
                            CommonMethods.SaveImage(laneData.TransactionImage, path + "/image/", "Transcation", FileName, ".jpeg");
                            laneData.TransactionImage = path + "/image/" + FileName + ".jpeg";
                            CommonMethods.SaveImage(laneData.TransactionVideo, path + "/video/", "Transcation", FileName, ".mp4");
                            laneData.TransactionVideo = path + "/video/" + FileName + ".mp4";

                            #region Convert Video
                            //try
                            //{
                            //    string Input = HttpContext.Current.Server.MapPath("~/Transcation/" + path + "/video/" + FileName + "_C.mp4");
                            //    string output = HttpContext.Current.Server.MapPath("~/Transcation/" + path + "/video/" + FileName + ".mp4");
                            //    var ffMpeg = new NReco.VideoConverter.FFMpegConverter();
                            //    ffMpeg.ConvertMedia(Input, Input, "mp4");
                            //    FileInfo file = new FileInfo(Input);
                            //    if (file.Exists)
                            //    {
                            //        file.Delete();
                            //    }
                            //    laneData.TransactionVideo = path + "/video/" + FileName + ".mp4";
                            //}
                            //catch (Exception ex)
                            //{
                            //    PlazaOfficeAPILog("Exception in Video Conversion : " + ex.Message.ToString());
                            //}
                            #endregion
                            #endregion


                            finlResponce.CurrentTransactionDetails = LaneTransactionBL.EntryInsert(laneData);
                            ResponceMessage msg0 = new ResponceMessage();
                            msg0.AlertMessage = "success";
                            responceMessae.Add(msg0);

                            finlResponce.Message = responceMessae;
                            return Request.CreateResponse(HttpStatusCode.OK, finlResponce);
                            #endregion
                        }
                        else
                        {

                            if (config.TollingType == 1)
                            {
                                if (laneData.ExemptTypeId == 0)
                                {
                                    #region Check Toll Fare based on exit lane
                                    FareDetailsIL fd = new FareDetailsIL();
                                    fd.ClassId = laneData.MappingClassId;
                                    fd.EntryPlazaId = laneData.PlazaId;
                                    fd.ExitPlazaId = laneData.PlazaId;
                                    fd.TransactionTimeStamp = laneData.TransactionTimeStamp;
                                    fare = FareManagementBL.GetFareByJourney(fd);
                                    if (fare.Journey == "Found")
                                    {
                                        if (laneData.Overweight == 1)
                                            laneData.TransactionAmount = fare.OverWeightFare;
                                        else if (laneData.Penalty == 1)
                                            laneData.TransactionAmount = fare.PenaltyFare;
                                        else
                                        {

                                            laneData.TransactionAmount = fare.TollFare;
                                            #region Check for Retrun Journey
                                            if (laneData.TransactionTypeId == 1)
                                            {
                                                LaneTransactionIL retJourney = new LaneTransactionIL();
                                                retJourney.ReferenceNumber = laneData.ReferenceNumber;
                                                retJourney.TransactionTimeStamp = laneData.TransactionTimeStamp;
                                                List<LaneTransactionIL> checkforReturnJourney = LaneTransactionBL.GetLaneMatchedDataForRetJourney(retJourney);
                                                if (checkforReturnJourney.Count > 0)
                                                {
                                                    List<LaneTransactionIL> filteredReturn = MappingLaneData.FindAll(e => e.JourneyType == 2);
                                                    if (filteredReturn.Count == 0)
                                                    {
                                                        laneData.TransactionAmount = fare.ReturnFare;
                                                        laneData.JourneyType = 2;
                                                    }
                                                }
                                            }
                                            #endregion
                                        }
                                        finlResponce.FareDetalis = fare;
                                    }
                                    else
                                    {
                                        ResponceMessage msg2 = new ResponceMessage();
                                        msg2.AlertMessage = "Toll fare not found";
                                        responceMessae.Add(msg2);
                                    }
                                    #endregion
                                }
                            }
                            else
                            {
                                #region Exit Lane Trans
                                if (MappingLaneData.Count > 0)
                                {
                                    #region Mapping Data Found
                                    List<LaneTransactionIL> filtered = MappingLaneData.FindAll(e => e.ReferenceTransactionId == 0).OrderBy(x => x.TransactionTimeStamp).ToList();
                                    if (filtered.Count > 0)
                                    {
                                        #region Exit Lane Data Found
                                        LaneTransactionIL EntryLaneData = filtered[0];
                                        laneData.ReferenceTransactionId = EntryLaneData.EntryId;
                                        TransactionTypeIL EntryTranType = TransactionTypeBL.GetById(EntryLaneData.TransactionTypeId);
                                        finlResponce.MappedTransactionDetalis = EntryLaneData;

                                        if (EntryLaneData.MappingClassId != laneData.MappingClassId)
                                        {
                                            ResponceMessage msg1 = new ResponceMessage();
                                            msg1.AlertMessage = "Class mismatch current lane is " + laneData.MappingClassId + " & entry lane have " + EntryLaneData.MappingClassId;
                                            responceMessae.Add(msg1);
                                        }

                                        if (EntryLaneData.TransactionTypeId != laneData.TransactionTypeId)
                                        {
                                            ResponceMessage msg1 = new ResponceMessage();
                                            msg1.AlertMessage = "Transaction Type mismatch current lane is " + tranType.TransactionTypeName + " & entry lane have " + tranType.TransactionTypeName;
                                            responceMessae.Add(msg1);
                                        }
                                        #endregion
                                        if (laneData.ExemptTypeId == 0)
                                        {
                                            #region Check Toll Fare based on exit lane
                                            FareDetailsIL fd = new FareDetailsIL();
                                            fd.ClassId = laneData.MappingClassId;
                                            fd.EntryPlazaId = laneData.PlazaId;
                                            fd.ExitPlazaId = laneData.PlazaId;
                                            fd.TransactionTimeStamp = laneData.TransactionTimeStamp;
                                            fare = FareManagementBL.GetFareByJourney(fd);
                                            if (fare.Journey == "Found")
                                            {
                                                if (laneData.Overweight == 1)
                                                    laneData.TransactionAmount = fare.OverWeightFare;
                                                else if (laneData.Penalty == 1)
                                                    laneData.TransactionAmount = fare.PenaltyFare;
                                                else if (EntryLaneData.Overweight == 1)
                                                    laneData.TransactionAmount = fare.OverWeightFare;
                                                else if (EntryLaneData.Penalty == 1)
                                                    laneData.TransactionAmount = fare.PenaltyFare;
                                                else
                                                {

                                                    laneData.TransactionAmount = fare.TollFare;
                                                    #region Check for Retrun Journey
                                                    if (laneData.TransactionTypeId == 1)
                                                    {
                                                        LaneTransactionIL retJourney = new LaneTransactionIL();
                                                        retJourney.ReferenceNumber = laneData.ReferenceNumber;
                                                        retJourney.TransactionTimeStamp = laneData.TransactionTimeStamp;
                                                        List<LaneTransactionIL> checkforReturnJourney = LaneTransactionBL.GetLaneMatchedDataForRetJourney(retJourney);
                                                        if (checkforReturnJourney.Count > 0)
                                                        {
                                                            List<LaneTransactionIL> filteredReturn = MappingLaneData.FindAll(e => e.JourneyType == 2);
                                                            if (filteredReturn.Count == 0)
                                                            {
                                                                laneData.TransactionAmount = fare.ReturnFare;
                                                                laneData.JourneyType = 2;
                                                            }
                                                        }
                                                    }
                                                    #endregion
                                                }
                                                finlResponce.FareDetalis = fare;
                                            }
                                            else
                                            {
                                                ResponceMessage msg2 = new ResponceMessage();
                                                msg2.AlertMessage = "Toll fare not found";
                                                responceMessae.Add(msg2);
                                            }
                                            #endregion
                                        }
                                    }
                                    #endregion
                                }
                                #endregion
                            }

                            #region Create Exit Transcation
                            #region Save Proof
                            var path = Constants.MediaPath(laneData.PlazaId, laneData.LaneNumber, laneData.TransactionTimeStamp);
                            //var path = laneData.TransactionTimeStamp.ToString("ddMMMyyyy") + "/" + "P" + laneData.PlazaId.ToString() + "/" + "L" + laneData.LaneNumber.ToString();
                            var FileName = Constants.RandomString(5) + "-" + laneData.TransactionTimeStamp.ToString(Constants.dateTimeFormatFileName);
                            CommonMethods.SaveImage(laneData.TransactionImage, path + "/image/", "Transcation", FileName, ".jpeg");
                            laneData.TransactionImage = path + "/image/" + FileName + ".jpeg";
                            CommonMethods.SaveImage(laneData.TransactionVideo, path + "/video/", "Transcation", FileName, ".mp4");
                            laneData.TransactionVideo = path + "/video/" + FileName + ".mp4";
                            #region Convert Video
                            //try
                            //{
                            //    string Input = HttpContext.Current.Server.MapPath("~/Transcation/" + path + "/video/" + FileName + "_C.mp4");
                            //    string output = HttpContext.Current.Server.MapPath("~/Transcation/" + path + "/video/" + FileName + ".mp4");
                            //    var ffMpeg = new NReco.VideoConverter.FFMpegConverter();
                            //    ffMpeg.ConvertMedia(Input, output, "mp4");
                            //    FileInfo file = new FileInfo(Input);
                            //    if (file.Exists)
                            //    {
                            //        file.Delete();
                            //    }
                            //    laneData.TransactionVideo = path + "/video/" + FileName + ".mp4";
                            //}
                            //catch (Exception ex)
                            //{
                            //    PlazaOfficeAPILog("Exception in Video Conversion : " + ex.Message.ToString());
                            //}
                            #endregion
                            #endregion

                            finlResponce.CurrentTransactionDetails = LaneTransactionBL.ExitInsert(laneData);
                            ResponceMessage msg0 = new ResponceMessage();
                            msg0.AlertMessage = "success";
                            responceMessae.Add(msg0);
                            finlResponce.Message = responceMessae;
                            return Request.CreateResponse(HttpStatusCode.OK, finlResponce);
                            #endregion
                        }
                    }
                    else
                    {
                        ResponceMessage msg0 = new ResponceMessage();
                        msg0.AlertMessage = "this lane alreday stoped for this shift";
                        responceMessae.Add(msg0);
                        finlResponce.Message = responceMessae;
                        return Request.CreateResponse(HttpStatusCode.OK, finlResponce);
                    }
                }
                else
                {
                    ResponceMessage msg0 = new ResponceMessage();
                    msg0.AlertMessage = "Please create the cash allotment";
                    responceMessae.Add(msg0);
                    finlResponce.Message = responceMessae;
                    return Request.CreateResponse(HttpStatusCode.OK, finlResponce);
                }
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in DemoTransaction : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/GetTransactionDataFilter")]
        [HttpPost]
        public HttpResponseMessage GetTransactionDataFilter(DataFilterIL filter)
        {
            try
            {
                #region Filter Query
                filter.QueryFilter = "WHERE 1=1 ";
                if (filter.ShiftId != 0)
                {
                    filter.QueryFilter = filter.QueryFilter + "AND ShiftId = " + filter.Shift + " ";
                }
                if (filter.TCUserId != 0)
                {
                    filter.QueryFilter = filter.QueryFilter + "AND UserId = " + filter.TCUserId + " ";
                }
                if (filter.LaneNumber != 0)
                {
                    filter.QueryFilter = filter.QueryFilter + "AND LaneNumber = " + filter.LaneNumber + " ";
                }
                if (filter.TransactionTypeId != 0)
                {
                    filter.QueryFilter = filter.QueryFilter + "AND TransactionTypeId = " + filter.TransactionTypeId + " ";
                }
                if (!string.IsNullOrEmpty(filter.PlateNumber))
                {
                    filter.QueryFilter = filter.QueryFilter + "AND (ReferenceNumber LIKE '%" + filter.PlateNumber + "%' OR PlateNumber LIKE '%" + filter.PlateNumber + "%') ";
                }
                if (filter.QueryFilter == "WHERE 1=1 ")
                    filter.QueryFilter = string.Empty;
                #endregion

                filter.PlazaId = Convert.ToInt16(ConfigurationManager.AppSettings["PlazaId"].ToString());
                System.Data.DataTable UnreviewedData = LaneTransactionBL.TransactionDataFilter(filter);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = UnreviewedData;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in GetTransactionDataFilter : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/GetUnreviewFilter")]
        [HttpPost]
        public HttpResponseMessage GetUnreviewFilter(DataFilterIL filter)
        {
            try
            {
                filter.PlazaId = Convert.ToInt16(ConfigurationManager.AppSettings["PlazaId"].ToString());
                List<LaneTransactionIL> UnreviewedData = LaneTransactionBL.GetUnreviewFilter(filter);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = UnreviewedData;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in GetUnreviewFilter : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }


        [Route(Provider + "/Toll360-PlazaOffice/ReviewTransaction")]
        [HttpPost]
        public HttpResponseMessage ReviewTransaction(LaneTransactionReviewIL reviewData)
        {
            try
            {
                reviewData.PlazaId = Convert.ToInt16(ConfigurationManager.AppSettings["PlazaId"].ToString());
                LaneTransactionIL ExitlaneData = LaneTransactionBL.GetByExitId(reviewData.TransactionId);
                LaneTransactionIL EntrylaneData = LaneTransactionBL.GetByExitId(ExitlaneData.ReferenceTransactionId);
                if (ExitlaneData.TransactionTypeId == 5)
                {
                    if (reviewData.ReveiwedTransactionType == 1)
                    {
                        FareDetailsIL fd = new FareDetailsIL();
                        fd.ClassId = reviewData.ReveiwedClassId;
                        fd.EntryPlazaId = EntrylaneData.PlazaId;
                        fd.ExitPlazaId = ExitlaneData.PlazaId;
                        fd.TransactionTimeStamp = ExitlaneData.TransactionTimeStamp;
                        FareDetailsIL fare = FareManagementBL.GetFareByJourney(fd);
                        if (fare.Journey == "Found")
                        {
                            reviewData.ReveiwedTransactionAmount = fare.TollFare;
                            reviewData.TransactionAmountDifference = reviewData.ReveiwedTransactionAmount - ExitlaneData.TransactionAmount;
                        }
                    }
                }
                else
                {
                    if (reviewData.ReveiwedClassCorrection == 0)
                        reviewData.ReveiwedClassId = 0;
                    else if (reviewData.ReveiwedClassCorrection == 1)
                        reviewData.ReveiwedClassId = 0;
                    else if (reviewData.ReveiwedClassCorrection == 2)
                        reviewData.ReveiwedClassId = ExitlaneData.AvcClassId;
                    if (reviewData.ReveiwedClassId != 0)
                    {
                        FareDetailsIL fd = new FareDetailsIL();
                        fd.ClassId = reviewData.ReveiwedClassId;
                        fd.EntryPlazaId = EntrylaneData.PlazaId;
                        fd.ExitPlazaId = ExitlaneData.PlazaId;
                        fd.TransactionTimeStamp = ExitlaneData.TransactionTimeStamp;
                        FareDetailsIL fare = FareManagementBL.GetFareByJourney(fd);
                        if (fare.Journey == "Found")
                        {
                            reviewData.ReveiwedTransactionAmount = fare.TollFare;
                            reviewData.TransactionAmountDifference = reviewData.ReveiwedTransactionAmount - ExitlaneData.TransactionAmount;
                        }
                    }
                }
                List<ResponceIL> resp = LaneTransactionReviewBL.Insert(reviewData);
                foreach (var ResponceIL in resp)
                {
                    ResponceMessage objMessage = new ResponceMessage();
                    objMessage.AlertMessage = ResponceIL.AlertMessage;
                    responceMessae.Add(objMessage);
                }
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in ReviewTransaction : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/ReviewCancelTransaction")]
        [HttpPost]
        public HttpResponseMessage ReviewCancelTransaction(LaneTransactionReviewIL reviewData)
        {
            try
            {
                reviewData.PlazaId = Convert.ToInt16(ConfigurationManager.AppSettings["PlazaId"].ToString());
                List<ResponceIL> resp = LaneTransactionReviewBL.Cancel(reviewData);
                foreach (var ResponceIL in resp)
                {
                    ResponceMessage objMessage = new ResponceMessage();
                    objMessage.AlertMessage = ResponceIL.AlertMessage;
                    responceMessae.Add(objMessage);
                }
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in ReviewCancelTransaction : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/ReviewScrapTransaction")]
        [HttpPost]
        public HttpResponseMessage ReviewScrapTransaction(LaneTransactionReviewIL reviewData)
        {
            try
            {
                reviewData.PlazaId = Convert.ToInt16(ConfigurationManager.AppSettings["PlazaId"].ToString());
                List<ResponceIL> resp = LaneTransactionReviewBL.Scrap(reviewData);
                foreach (var ResponceIL in resp)
                {
                    ResponceMessage objMessage = new ResponceMessage();
                    objMessage.AlertMessage = ResponceIL.AlertMessage;
                    responceMessae.Add(objMessage);
                }
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in ReviewScrapTransaction : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Reporting
        [Route(Provider + "/Toll360-PlazaOffice/GetReportCategory")]
        [HttpGet]
        public HttpResponseMessage GetReportCategory()
        {
            try
            {
                List<ReportManagementIL> transactionType = ReportManagementBL.GetAllParent();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = transactionType;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in GetReportCategory : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }

        }

        [Route(Provider + "/Toll360-PlazaOffice/GetSubReportCategory")]
        [HttpGet]
        public HttpResponseMessage GetSubReportCategory(Int16 CategoryId)
        {
            try
            {
                List<ReportManagementIL> transactionType = ReportManagementBL.GetBySubCategoryActive(CategoryId);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = transactionType;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in GetSubReportCategory : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }

        }

        [Route(Provider + "/Toll360-PlazaOffice/ReportFilter")]
        [HttpPost]
        public HttpResponseMessage ReportFilter(DataFilterIL data)
        {
            try
            {

                string FileName = string.Empty;
                string urlAddress = string.Empty;
                data.PlazaId = Convert.ToInt16(ConfigurationManager.AppSettings["PlazaId"].ToString());
                ReportManagementIL rpt = ReportManagementBL.GetById(data.SubCategoryId);
                FileName = Regex.Replace(rpt.CategoryName, @"\s+", "") + "_" + Constants.RandomString(5) + ".pdf";
                #region Save Json File
                string jsonString = JsonConvert.SerializeObject(data);
                string rootpath = HttpContext.Current.Server.MapPath("~/filter/");
                if (!Directory.Exists(rootpath))
                {
                    Directory.CreateDirectory(rootpath);
                }
                var filepath = rootpath + FileName.Replace(".pdf", ".json");
                File.Create(filepath).Dispose();
                File.WriteAllText(filepath, jsonString);
                #endregion
                data.SessionId = "CR-" + Constants.RandomString(15);
                switch (data.SubCategoryId)
                {
                    case 8:
                        {
                            #region Filter Query
                            data.QueryFilter = "WHERE 1=1 ";
                            if (data.Shift != "ALL" && data.Shift != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND ShiftId IN (" + data.Shift + ") ";
                            }
                            if (data.VehicleClass != "ALL" && data.VehicleClass != "0")
                            {
                                //data.QueryFilter = data.QueryFilter + "AND (ClassId IN (" + data.VehicleClass + ") OR AVCClassId IN (" + data.VehicleClass + ")) ";
                                data.QueryFilter = data.QueryFilter + "AND ClassId IN (" + data.VehicleClass + ") ";
                            }
                            if (data.Lane != "ALL" && data.Lane != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND LaneNumber IN (" + data.Lane + ") ";
                            }
                            if (data.LaneUser != "ALL" && data.LaneUser != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND (UserId IN (" + data.LaneUser + ") OR ReveiwedBy IN (" + data.LaneUser + ")) ";
                            }
                            if (data.TranType != "ALL" && data.TranType != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND TransactionTypeId IN (" + data.TranType + ") ";
                            }
                            if (data.ExemptType != "ALL" && data.ExemptType != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND ExemptTypeId IN (" + data.ExemptType + ") ";
                            }
                            if (data.PaymentType != "ALL" && data.PaymentType != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND PaymentTypeId IN (" + data.PaymentType + ") ";
                            }
                            if (data.QueryFilter == "WHERE 1=1 ")
                                data.QueryFilter = string.Empty;
                            #endregion
                            if (LaneTransactionBL.CancelTransactionDetailReport(data).Rows.Count > 0)
                            {
                                urlAddress = ConfigurationManager.AppSettings["APIUrl"].ToString() + "/Home/Reports?Id=" + data.SubCategoryId + "&PlazaId=" + ConfigurationManager.AppSettings["PlazaId"].ToString() + "&FileName=" + FileName + "&SessionId=" + data.SessionId;

                                var client = new WebClient();
                                client.Headers.Add("User-Agent", "C# console program");
                                string content = client.DownloadString(urlAddress);
                                if (string.IsNullOrEmpty(content))
                                {
                                    ResponceMessage objMessage = new ResponceMessage();
                                    objMessage.AlertMessage = "Something went wrong!";
                                    responceMessae.Add(objMessage);
                                    responce.Message = responceMessae;
                                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                                }
                                else
                                {
                                    string FinalPath = ConfigurationManager.AppSettings["APIUrl"].ToString() + "/reports/" + FileName;
                                    ResponceMessage objMessage = new ResponceMessage();
                                    objMessage.AlertMessage = FinalPath;
                                    responceMessae.Add(objMessage);
                                    responce.Message = responceMessae;
                                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                                }
                            }
                            else
                            {
                                ResponceMessage objMessage = new ResponceMessage();
                                objMessage.AlertMessage = "No data found";
                                responceMessae.Add(objMessage);
                                responce.ResponceData = null;
                                responce.Message = responceMessae;
                            }
                            break;
                        }
                    case 9:
                        {
                            #region Filter Query
                            data.QueryFilter = "WHERE 1=1 ";
                            if (data.Shift != "ALL" && data.Shift != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND ShiftId IN (" + data.Shift + ") ";
                            }
                            if (data.LaneUser != "ALL" && data.LaneUser != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND TCUserId IN (" + data.LaneUser + ") ";
                            }
                            if (data.QueryFilter == "WHERE 1=1 ")
                                data.QueryFilter = string.Empty;
                            #endregion
                            if (CashFlowConfigurationBL.CashUPReport(data).Tables[1].Rows.Count > 0)
                            {
                                urlAddress = ConfigurationManager.AppSettings["APIUrl"].ToString() + "/Home/Reports?Id=" + data.SubCategoryId + "&PlazaId=" + ConfigurationManager.AppSettings["PlazaId"].ToString() + "&FileName=" + FileName + "&SessionId=" + data.SessionId;

                                var client = new WebClient();
                                client.Headers.Add("User-Agent", "C# console program");
                                string content = client.DownloadString(urlAddress);
                                if (string.IsNullOrEmpty(content))
                                {
                                    ResponceMessage objMessage = new ResponceMessage();
                                    objMessage.AlertMessage = "Something went wrong!";
                                    responceMessae.Add(objMessage);
                                    responce.Message = responceMessae;
                                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                                }
                                else
                                {
                                    string FinalPath = ConfigurationManager.AppSettings["APIUrl"].ToString() + "/reports/" + FileName;
                                    ResponceMessage objMessage = new ResponceMessage();
                                    objMessage.AlertMessage = FinalPath;
                                    responceMessae.Add(objMessage);
                                    responce.Message = responceMessae;
                                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                                }
                            }
                            else
                            {
                                ResponceMessage objMessage = new ResponceMessage();
                                objMessage.AlertMessage = "No data found";
                                responceMessae.Add(objMessage);
                                responce.ResponceData = null;
                                responce.Message = responceMessae;
                            }
                            break;
                        }
                    case 11:
                        {
                            #region Filter Query
                            data.QueryFilter = "WHERE 1=1 ";
                            if (data.Shift != "ALL" && data.Shift != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND ShiftId IN (" + data.Shift + ") ";
                            }
                            if (data.VehicleClass != "ALL" && data.VehicleClass != "0")
                            {
                                //data.QueryFilter = data.QueryFilter + "AND (ClassId IN (" + data.VehicleClass + ") OR AVCClassId IN (" + data.VehicleClass + ")) ";
                                data.QueryFilter = data.QueryFilter + "AND ClassId IN (" + data.VehicleClass + ") ";
                            }
                            if (data.Lane != "ALL" && data.Lane != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND LaneNumber IN (" + data.Lane + ") ";
                            }
                            if (data.LaneUser != "ALL" && data.LaneUser != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND UserId IN (" + data.LaneUser + ") ";
                            }
                            if (data.TranType != "ALL" && data.TranType != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND TransactionTypeId IN (" + data.TranType + ") ";
                            }
                            if (data.QueryFilter == "WHERE 1=1 ")
                                data.QueryFilter = string.Empty;
                            #endregion
                            if (LaneTransactionBL.TrafficRevenueConsolidatedReport(data).Rows.Count > 0)
                            {
                                urlAddress = ConfigurationManager.AppSettings["APIUrl"].ToString() + "/Home/Reports?Id=" + data.SubCategoryId + "&PlazaId=" + ConfigurationManager.AppSettings["PlazaId"].ToString() + "&FileName=" + FileName + "&SessionId=" + data.SessionId;

                                var client = new WebClient();
                                client.Headers.Add("User-Agent", "C# console program");
                                string content = client.DownloadString(urlAddress);
                                if (string.IsNullOrEmpty(content))
                                {
                                    ResponceMessage objMessage = new ResponceMessage();
                                    objMessage.AlertMessage = "Something went wrong!";
                                    responceMessae.Add(objMessage);
                                    responce.Message = responceMessae;
                                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                                }
                                else
                                {
                                    string FinalPath = ConfigurationManager.AppSettings["APIUrl"].ToString() + "/reports/" + FileName;
                                    ResponceMessage objMessage = new ResponceMessage();
                                    objMessage.AlertMessage = FinalPath;
                                    responceMessae.Add(objMessage);
                                    responce.Message = responceMessae;
                                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                                }
                            }
                            else
                            {
                                ResponceMessage objMessage = new ResponceMessage();
                                objMessage.AlertMessage = "No data found";
                                responceMessae.Add(objMessage);
                                responce.ResponceData = null;
                                responce.Message = responceMessae;
                            }
                            break;
                        }
                    case 15:
                        {
                            #region Filter Query
                            data.QueryFilter = "WHERE 1=1 ";
                            if (data.Shift != "ALL" && data.Shift != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND ShiftId IN (" + data.Shift + ") ";
                            }
                            if (data.VehicleClass != "ALL" && data.VehicleClass != "0")
                            {
                                //data.QueryFilter = data.QueryFilter + "AND (ClassId IN (" + data.VehicleClass + ") OR AVCClassId IN (" + data.VehicleClass + ")) ";
                                data.QueryFilter = data.QueryFilter + "AND ClassId IN (" + data.VehicleClass + ") ";
                            }
                            if (data.Lane != "ALL" && data.Lane != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND LaneNumber IN (" + data.Lane + ") ";
                            }
                            if (data.LaneUser != "ALL" && data.LaneUser != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND UserId IN (" + data.LaneUser + ") ";
                            }
                            if (data.TranType != "ALL" && data.TranType != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND TransactionTypeId IN (" + data.TranType + ") ";
                            }
                            if (data.QueryFilter == "WHERE 1=1 ")
                                data.QueryFilter = string.Empty;
                            #endregion
                            if (LaneTransactionBL.TrafficRevenueSummaryReport(data).Rows.Count > 0)
                            {
                                urlAddress = ConfigurationManager.AppSettings["APIUrl"].ToString() + "/Home/Reports?Id=" + data.SubCategoryId + "&PlazaId=" + ConfigurationManager.AppSettings["PlazaId"].ToString() + "&FileName=" + FileName + "&SessionId=" + data.SessionId;

                                var client = new WebClient();
                                client.Headers.Add("User-Agent", "C# console program");
                                string content = client.DownloadString(urlAddress);
                                if (string.IsNullOrEmpty(content))
                                {
                                    ResponceMessage objMessage = new ResponceMessage();
                                    objMessage.AlertMessage = "Something went wrong!";
                                    responceMessae.Add(objMessage);
                                    responce.Message = responceMessae;
                                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                                }
                                else
                                {
                                    string FinalPath = ConfigurationManager.AppSettings["APIUrl"].ToString() + "/reports/" + FileName;
                                    ResponceMessage objMessage = new ResponceMessage();
                                    objMessage.AlertMessage = FinalPath;
                                    responceMessae.Add(objMessage);
                                    responce.Message = responceMessae;
                                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                                }
                            }
                            else
                            {
                                ResponceMessage objMessage = new ResponceMessage();
                                objMessage.AlertMessage = "No data found";
                                responceMessae.Add(objMessage);
                                responce.ResponceData = null;
                                responce.Message = responceMessae;
                            }
                            break;
                        }
                    case 18:
                        {
                            #region Filter Query
                            data.QueryFilter = "WHERE 1=1 ";
                            if (data.Shift != "ALL" && data.Shift != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND ShiftId IN (" + data.Shift + ") ";
                            }
                            if (data.LaneUser != "ALL" && data.LaneUser != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND TCUserId IN (" + data.LaneUser + ") ";
                            }
                            if (data.QueryFilter == "WHERE 1=1 ")
                                data.QueryFilter = string.Empty;
                            #endregion
                            if (CashFlowConfigurationBL.UserClearanceDetailReport(data).Rows.Count > 0)
                            {
                                urlAddress = ConfigurationManager.AppSettings["APIUrl"].ToString() + "/Home/Reports?Id=" + data.SubCategoryId + "&PlazaId=" + ConfigurationManager.AppSettings["PlazaId"].ToString() + "&FileName=" + FileName + "&SessionId=" + data.SessionId;

                                var client = new WebClient();
                                client.Headers.Add("User-Agent", "C# console program");
                                string content = client.DownloadString(urlAddress);
                                if (string.IsNullOrEmpty(content))
                                {
                                    ResponceMessage objMessage = new ResponceMessage();
                                    objMessage.AlertMessage = "Something went wrong!";
                                    responceMessae.Add(objMessage);
                                    responce.Message = responceMessae;
                                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                                }
                                else
                                {
                                    string FinalPath = ConfigurationManager.AppSettings["APIUrl"].ToString() + "/reports/" + FileName;
                                    ResponceMessage objMessage = new ResponceMessage();
                                    objMessage.AlertMessage = FinalPath;
                                    responceMessae.Add(objMessage);
                                    responce.Message = responceMessae;
                                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                                }
                            }
                            else
                            {
                                ResponceMessage objMessage = new ResponceMessage();
                                objMessage.AlertMessage = "No data found";
                                responceMessae.Add(objMessage);
                                responce.ResponceData = null;
                                responce.Message = responceMessae;
                            }
                            break;
                        }

                    case 22:
                        {
                            #region Filter Query
                            data.QueryFilter = "WHERE 1=1 ";
                            if (data.Shift != "ALL" && data.Shift != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND ShiftId IN (" + data.Shift + ") ";
                            }
                            if (data.VehicleClass != "ALL" && data.VehicleClass != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND ClassId IN (" + data.VehicleClass + ") ";
                            }
                            if (data.Lane != "ALL" && data.Lane != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND LaneNumber IN (" + data.Lane + ") ";
                            }
                            if (data.LaneUser != "ALL" && data.LaneUser != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND UserId IN (" + data.LaneUser + ") ";
                            }
                            if (data.ExemptType != "ALL" && data.ExemptType != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND ExemptTypeId IN (" + data.ExemptType + ") ";
                            }
                            if (data.QueryFilter == "WHERE 1=1 ")
                                data.QueryFilter = string.Empty;
                            #endregion
                            if (LaneTransactionBL.ExemptVehicleDetailReport(data).Tables[0].Rows.Count > 0)
                            {
                                urlAddress = ConfigurationManager.AppSettings["APIUrl"].ToString() + "/Home/Reports?Id=" + data.SubCategoryId + "&PlazaId=" + ConfigurationManager.AppSettings["PlazaId"].ToString() + "&FileName=" + FileName + "&SessionId=" + data.SessionId;

                                var client = new WebClient();
                                client.Headers.Add("User-Agent", "C# console program");
                                string content = client.DownloadString(urlAddress);
                                if (string.IsNullOrEmpty(content))
                                {
                                    ResponceMessage objMessage = new ResponceMessage();
                                    objMessage.AlertMessage = "Something went wrong!";
                                    responceMessae.Add(objMessage);
                                    responce.Message = responceMessae;
                                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                                }
                                else
                                {
                                    string FinalPath = ConfigurationManager.AppSettings["APIUrl"].ToString() + "/reports/" + FileName;
                                    ResponceMessage objMessage = new ResponceMessage();
                                    objMessage.AlertMessage = FinalPath;
                                    responceMessae.Add(objMessage);
                                    responce.Message = responceMessae;
                                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                                }
                            }
                            else
                            {
                                ResponceMessage objMessage = new ResponceMessage();
                                objMessage.AlertMessage = "No data found";
                                responceMessae.Add(objMessage);
                                responce.ResponceData = null;
                                responce.Message = responceMessae;
                            }
                            break;
                        }
                    case 28:
                        {
                            #region Filter Query
                            data.QueryFilter = "WHERE 1=1 ";
                            if (data.Shift != "ALL" && data.Shift != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND ShiftId IN (" + data.Shift + ") ";
                            }
                            if (data.VehicleClass != "ALL" && data.VehicleClass != "0")
                            {
                                //data.QueryFilter = data.QueryFilter + "AND (ClassId IN (" + data.VehicleClass + ") OR AVCClassId IN (" + data.VehicleClass + ")) ";
                                data.QueryFilter = data.QueryFilter + "AND ClassId IN (" + data.VehicleClass + ") ";
                            }
                            if (data.Lane != "ALL" && data.Lane != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND LaneNumber IN (" + data.Lane + ") ";
                            }
                            if (data.LaneUser != "ALL" && data.LaneUser != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND UserId IN (" + data.LaneUser + ") ";
                            }
                            if (data.TranType != "ALL" && data.TranType != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND TransactionTypeId IN (" + data.TranType + ") ";
                            }
                            if (data.ExemptType != "ALL" && data.ExemptType != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND ExemptTypeId IN (" + data.ExemptType + ") ";
                            }
                            if (data.PaymentType != "ALL" && data.PaymentType != "0")
                            {
                                data.QueryFilter = data.QueryFilter + "AND PaymentTypeId IN (" + data.PaymentType + ") ";
                            }
                            if (data.QueryFilter == "WHERE 1=1 ")
                                data.QueryFilter = string.Empty;
                            #endregion
                            if (LaneTransactionBL.TransactionDetailReport(data).Rows.Count > 0)
                            {
                                urlAddress = ConfigurationManager.AppSettings["APIUrl"].ToString() + "/Home/Reports?Id=" + data.SubCategoryId + "&PlazaId=" + ConfigurationManager.AppSettings["PlazaId"].ToString() + "&FileName=" + FileName + "&SessionId=" + data.SessionId;

                                var client = new WebClient();
                                client.Headers.Add("User-Agent", "C# console program");
                                string content = client.DownloadString(urlAddress);
                                if (string.IsNullOrEmpty(content))
                                {
                                    ResponceMessage objMessage = new ResponceMessage();
                                    objMessage.AlertMessage = "Something went wrong!";
                                    responceMessae.Add(objMessage);
                                    responce.Message = responceMessae;
                                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                                }
                                else
                                {
                                    string FinalPath = ConfigurationManager.AppSettings["APIUrl"].ToString() + "/reports/" + FileName;
                                    ResponceMessage objMessage = new ResponceMessage();
                                    objMessage.AlertMessage = FinalPath;
                                    responceMessae.Add(objMessage);
                                    responce.Message = responceMessae;
                                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                                }
                            }
                            else
                            {
                                ResponceMessage objMessage = new ResponceMessage();
                                objMessage.AlertMessage = "No data found";
                                responceMessae.Add(objMessage);
                                responce.ResponceData = null;
                                responce.Message = responceMessae;
                            }
                            break;
                        }

                    default:
                        {
                            ResponceMessage objMessage = new ResponceMessage();
                            objMessage.AlertMessage = "No data found";
                            responceMessae.Add(objMessage);
                            responce.ResponceData = null;
                            responce.Message = responceMessae;
                            break;
                        }
                }
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in ReportFilter : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }

        }
        #endregion

        #region DashBoard
        [Route(Provider + "/Toll360-PlazaOffice/GetHourlyTrafic")]
        [HttpGet]
        public HttpResponseMessage GetHourlyTrafic()
        {
            try
            {
                DashboardIL dash = new DashboardIL();
                dash.PlazaId = Convert.ToInt16(ConfigurationManager.AppSettings["PlazaId"].ToString());
                dash.StartDateTime = DateTime.Now;
                List<DashboardIL> hourlyTraffic = DashboardBL.GetHourlyTrafic(dash);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = hourlyTraffic;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in GetHourlyTrafic : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/GetTransTypeCount")]
        [HttpGet]
        public HttpResponseMessage GetTransTypeCount()
        {
            try
            {
                DashboardIL dash = new DashboardIL();
                dash.PlazaId = Convert.ToInt16(ConfigurationManager.AppSettings["PlazaId"].ToString());
                dash.StartDateTime = DateTime.Now;
                List<DashboardIL> hourlyTraffic = DashboardBL.GetTransTypeCount(dash);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = hourlyTraffic;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in GetTransTypeCount : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/GetLaneRevenue")]
        [HttpGet]
        public HttpResponseMessage GetLaneRevenue()
        {
            try
            {
                DashboardIL dash = new DashboardIL();
                dash.PlazaId = Convert.ToInt16(ConfigurationManager.AppSettings["PlazaId"].ToString());
                dash.StartDateTime = DateTime.Now;
                List<DashboardIL> hourlyTraffic = DashboardBL.GetLaneRevenue(dash);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = hourlyTraffic;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in GetLaneRevenue : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Live Events
        [Route(Provider + "/Toll360-PlazaOffice/GetLiveStatus")]
        [HttpGet]
        public HttpResponseMessage GetLiveStatus()
        {
            try
            {
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = LiveEventsBL.GetLiveStatus();
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in GetLiveStatus : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/GetLiveStatusByLane")]
        [HttpGet]
        public HttpResponseMessage GetLiveStatusByLane(Int16 LaneNumber)
        {
            try
            {
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = LiveEventsBL.GetLiveStatusByLane(LaneNumber);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in GetLiveStatusByLane : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/LiveOutputDeveiceByLane")]
        [HttpGet]
        public HttpResponseMessage LiveOutputDeveiceByLane(Int16 LaneNumber)
        {
            try
            {
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = LiveEventsBL.LiveOutputDeveiceByLane(LaneNumber);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in LiveOutputDeveiceByLane : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        [Route(Provider + "/Toll360-PlazaOffice/GetLiveSystemStatus")]
        [HttpGet]
        public HttpResponseMessage GetLiveSystemStatus()
        {
            try
            {
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = LiveSystemBL.GetLiveStatus();
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in GetLiveSystemStatus : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/GetLiveSystemStatusByLane")]
        [HttpGet]
        public HttpResponseMessage GetLiveSystemStatusByLane(Int16 LaneNumber)
        {
            try
            {
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = LiveSystemBL.GetLiveStatusByLane(LaneNumber);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in GetLiveSystemStatusByLane : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/GetLanePermission")]
        [HttpGet]
        public HttpResponseMessage GetLanePermission()
        {
            try
            {
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = LaneAccessPermissionBL.GetRequestPending();
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in GetLanePermission : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/OperatorAccessPermission")]
        [HttpPost]
        public HttpResponseMessage OperatorAccessPermission(LaneAccessPermissionIL events)
        {
            LaneTrsnResponce finlResponce = new LaneTrsnResponce();
            try
            {
                LaneAccessPermissionBL.Update(events);
                ResponceMessage msg0 = new ResponceMessage();
                msg0.AlertMessage = "success";
                responceMessae.Add(msg0);

                finlResponce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, finlResponce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in OperatorAccessPermission : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region System Setting
        [Route(Provider + "/Toll360-PlazaOffice/GetSystemSetting")]
        [HttpGet]
        public HttpResponseMessage GetSystemSetting()
        {
            try
            {
                SystemSettingIL systemSetting = SystemSettingBL.GetSetting();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = systemSetting;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in GetSystemSetting : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/SystemSettingSetUp")]
        [HttpPost]
        public HttpResponseMessage SystemSettingSetUp(SystemSettingIL exemptType)
        {
            try
            {
                List<ResponceIL> resp = SystemSettingBL.InsertUpdate(exemptType);
                foreach (var ResponceIL in resp)
                {
                    ResponceMessage objMessage = new ResponceMessage();
                    objMessage.AlertMessage = ResponceIL.AlertMessage;
                    responceMessae.Add(objMessage);
                }
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in SystemSettingSetUp : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-PlazaOffice/ConvertVideo")]
        [HttpPost]
        public HttpResponseMessage ConvertVideo(LaneTransactionIL lane)
        {
            try
            {
                string Input = HttpContext.Current.Server.MapPath("~/Transcation/" + lane.TransactionVideo);
                string output = HttpContext.Current.Server.MapPath("~/Transcation/" + lane.TransactionVideo.Replace(".mp4", "") + "_C.mp4");
                var ffMpeg = new NReco.VideoConverter.FFMpegConverter();
                ffMpeg.ConvertMedia(Input, output, "mp4");
                lane.TransactionVideo = Constants.VideotoBase64(output);
                FileInfo file = new FileInfo(output);
                if (file.Exists)
                {
                    file.Delete();
                }

                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = lane.TransactionVideo;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                PlazaOfficeAPILog("Exception in ConvertVideo : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion


    }
}
