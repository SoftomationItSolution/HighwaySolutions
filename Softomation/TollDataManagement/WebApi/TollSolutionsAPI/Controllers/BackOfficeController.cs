using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;
using Softomation.DMS.Libraries.CommonLibrary;
using Softomation.DMS.Libraries.CommonLibrary.BusinessLayer;
using Softomation.DMS.Libraries.CommonLibrary.DBA;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;
using TollSolutionsAPI.Models;
using static TollSolutionsAPI.Models.CommonMethods;

namespace TollSolutionsAPI.Controllers
{

    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class BackOfficeController : ApiController
    {
        const string Provider = Constants.AppProvider;
        List<ResponceMessage> responceMessae = new List<ResponceMessage>();
        Responce responce = new Responce();

        #region Master Config
        [Route(Provider + "/Toll360-BackOffice/MasterConfigGet")]
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
                BackOfficeAPILog("Exception in MasterConfigGet : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Login
        [Route(Provider + "/Toll360-BackOffice/ValidateUser")]
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
                    if (login.LoginPassword == Constants.Decrypt(ConfigurationManager.AppSettings["tollPassword"].ToString()))
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
                                if (obj.UserType == 1)
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

                                        ClientManagementIL client = ClientManagementBL.GetById(obj.ClientId);
                                        if (client.DataStatus == 1)
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
                                        else
                                        {
                                            LogingActivityIL activity = new LogingActivityIL();
                                            activity.LoginId = login.LoginId.ToLower();
                                            activity.LoginStatus = (Int16)Constants.UserLoginStatus.Invalid;
                                            LogingActivityBL.InsertUpdate(activity);

                                            obj.LoginPassword = "";
                                            ResponceMessage objMessage = new ResponceMessage();
                                            objMessage.AlertMessage = "Unauthorized user has access due o client is inactive";
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

                BackOfficeAPILog("Error in ValidateUser : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/LogoutUser")]
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
        [Route(Provider + "/Toll360-BackOffice/AllMenu")]
        [HttpGet]
        public HttpResponseMessage GetAllMenuList(int RoleId)
        {
            try
            {
                List<MenuManagementIL> obj;
                if (RoleId == 0)
                    obj = MenuManagementBL.GetByCCMenu();
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
                BackOfficeAPILog("Exception in GetAllMenuList : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Client Management
        [Route(Provider + "/Toll360-BackOffice/ClientConfigurationSetUp")]
        [HttpPost]
        public HttpResponseMessage ClientConfigurationSetUp(ClientManagementIL clientManagement)
        {
            try
            {
                List<ResponceIL> resp = ClientManagementBL.InsertUpdate(clientManagement);
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
                BackOfficeAPILog("Exception in ClientConfigurationCreate : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/ClientConfigurationGetAll")]
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
                BackOfficeAPILog("Exception in ClientConfigurationGetAll : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/ClientConfigurationGetActive")]
        [HttpGet]
        public HttpResponseMessage ClientConfigurationGetActive()
        {
            try
            {
                List<ClientManagementIL> clients = ClientManagementBL.GetActive();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = clients;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in ClientConfigurationGetActive : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/ClientConfigurationGetById")]
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
                BackOfficeAPILog("Exception in ClientConfigurationGetById : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Role Management
        [Route(Provider + "/Toll360-BackOffice/RoleConfigurationSetUp")]
        [HttpPost]
        public HttpResponseMessage RoleConfigurationSetUp(RoleManagementIL role)
        {
            try
            {
                List<ResponceIL> resp = RoleManagementBL.InsertUpdate(role);
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
                BackOfficeAPILog("Exception in RoleConfigurationSetUp : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/RoleConfigurationGetAll")]
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
                BackOfficeAPILog("Exception in RoleConfigurationGetAll : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/RoleConfigurationGetActive")]
        [HttpGet]
        public HttpResponseMessage RoleConfigurationGetActive()
        {
            try
            {
                List<RoleManagementIL> roles = RoleManagementBL.GetActive();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = roles;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in RoleConfigurationGetAll : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/RoleConfigurationGetById")]
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
                BackOfficeAPILog("Exception in RoleConfigurationGetById : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }


        [Route(Provider + "/Toll360-BackOffice/RolePermissionGetByRoleId")]
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
                BackOfficeAPILog("Exception in RolePermissionGetByRoleId : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/RolePermissionGetByEventId")]
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
                BackOfficeAPILog("Exception in RolePermissionGetByEventId : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/RolePermissionSetup")]
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
                BackOfficeAPILog("Exception in RolePermissionSetup : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region User Management
        [Route(Provider + "/Toll360-BackOffice/UserValidatePassword")]
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
                BackOfficeAPILog("Exception in UserValidatePassword : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/UserUpdatePassword")]
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
                BackOfficeAPILog("Exception in UserUpdatePassword : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/UserConfigurationSetUp")]
        [HttpPost]
        public HttpResponseMessage UserConfigurationSetUp(UserManagementIL user)
        {
            try
            {
                if (user.AccountExpiredDate <= DateTime.Now)
                {
                    ResponceMessage objMessage = new ResponceMessage();
                    objMessage.AlertMessage = "Account expired date must be greater than current date!";
                    responceMessae.Add(objMessage);
                    responce.Message = responceMessae;
                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                }
                else
                {
                    List<ResponceIL> resp = UserManagementBL.InsertUpdate(user);
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
                BackOfficeAPILog("Exception in UserConfigurationSetUp : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/UserConfigurationGetAll")]
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
                BackOfficeAPILog("Exception in UserConfigurationGetAll : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/UserConfigurationGetByClientId")]
        [HttpGet]
        public HttpResponseMessage UserConfigurationGetByClientId(int ClientId)
        {
            try
            {

                List<UserManagementIL> users;
                if (ClientId == 0)
                    users = UserManagementBL.GetAll();
                else
                    users = UserManagementBL.GetByClientId(ClientId);

                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = users;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in UserConfigurationGetByClientId : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/UserConfigurationGetById")]
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
                BackOfficeAPILog("Exception in UserConfigurationGetById : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/UserConfigurationGetByIdP")]
        [HttpGet]
        public HttpResponseMessage UserConfigurationGetByIdP(int UserId)
        {
            try
            {
                UserManagementIL user = UserManagementBL.GetById(UserId);
                user.LoginPassword = Constants.Decrypt(user.LoginPassword);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = user;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in UserConfigurationGetByIdP : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Exempt Type Management
        [Route(Provider + "/Toll360-BackOffice/ExemptTypeConfigurationSetUp")]
        [HttpPost]
        public HttpResponseMessage ExemptTypeConfigurationSetUp(ExemptTypeIL exemptType)
        {
            try
            {
                List<ResponceIL> resp = ExemptTypeBL.InsertUpdate(exemptType);
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
                BackOfficeAPILog("Exception in ExemptTypeConfigurationSetUp : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/ExemptTypeConfigurationGetAll")]
        [HttpGet]
        public HttpResponseMessage ExemptTypeConfigurationGetAll()
        {
            try
            {
                List<ExemptTypeIL> exemptTypes = ExemptTypeBL.GetAll();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = exemptTypes;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in ExemptTypeConfigurationGetAll : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/ExemptTypeConfigurationGetActive")]
        [HttpGet]
        public HttpResponseMessage ExemptTypeConfigurationGetActive()
        {
            try
            {
                List<ExemptTypeIL> exemptTypes = ExemptTypeBL.GetActive();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = exemptTypes;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in ExemptTypeConfigurationGetActive : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/ExemptTypeConfigurationGetById")]
        [HttpGet]
        public HttpResponseMessage ExemptTypeConfigurationGetById(int ExemptTypeId)
        {
            try
            {
                ExemptTypeIL exemptType = ExemptTypeBL.GetById(ExemptTypeId);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = exemptType;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in ExemptTypeConfigurationGetById : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Transaction Type Management
        [Route(Provider + "/Toll360-BackOffice/TransactionTypeConfigurationSetUp")]
        [HttpPost]
        public HttpResponseMessage TransactionTypeConfigurationSetUp(TransactionTypeIL transactionType)
        {
            try
            {
                List<ResponceIL> resp = TransactionTypeBL.InsertUpdate(transactionType);
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
                BackOfficeAPILog("Exception in TransactionTypeConfigurationSetUp : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/TransactionTypeConfigurationGetAll")]
        [HttpGet]
        public HttpResponseMessage TransactionTypeConfigurationGetAll()
        {
            try
            {
                List<TransactionTypeIL> transactionTypes = TransactionTypeBL.GetAll();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = transactionTypes;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in TransactionTypeConfigurationGetAll : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/TransactionTypeConfigurationGetById")]
        [HttpGet]
        public HttpResponseMessage TransactionTypeConfigurationGetById(int TransactionTypeId)
        {
            try
            {
                TransactionTypeIL transactionType = TransactionTypeBL.GetById(TransactionTypeId);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = transactionType;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in TransactionTypeConfigurationGetById : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Plaza Management
        [Route(Provider + "/Toll360-BackOffice/PlazaConfigurationSetUp")]
        [HttpPost]
        public HttpResponseMessage PlazaConfigurationSetUp(PlazaManagementIL plaza)
        {
            try
            {
                List<ResponceIL> resp = PlazaManagementBL.InsertUpdate(plaza);
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
                BackOfficeAPILog("Exception in PlazaConfigurationSetUp : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/PlazaConfigurationGetAll")]
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
                BackOfficeAPILog("Exception in PlazaConfigurationGetAll : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/PlazaConfigurationGetById")]
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
                BackOfficeAPILog("Exception in PlazaConfigurationGetById : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        [Route(Provider + "/Toll360-BackOffice/PlazaConfigurationGetByClientId")]
        [HttpGet]
        public HttpResponseMessage PlazaConfigurationGetByClientId(int ClientId)
        {
            try
            {
                List<PlazaManagementIL> plazas;
                if (ClientId == 0)
                    plazas = PlazaManagementBL.GetActive();
                else
                    plazas = PlazaManagementBL.GetByClientId(ClientId);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = plazas;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in PlazaConfigurationGetByClientId : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Plaza Mapping Management
        [Route(Provider + "/Toll360-BackOffice/PlazaMappingSetUp")]
        [HttpPost]
        public HttpResponseMessage PlazaMappingSetUp(PlazaMappingIL plaza)
        {
            try
            {
                List<ResponceIL> resp = PlazaMappingBL.InsertUpdate(plaza);
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
                BackOfficeAPILog("Exception in PlazaMappingSetUp : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/PlazaMappingValidateSetUp")]
        [HttpPost]
        public HttpResponseMessage PlazaMappingValidateSetUp(PlazaMappingIL plaza)
        {
            try
            {
                List<ResponceIL> resp = PlazaMappingBL.ValidateInsertUpdate(plaza);
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
                BackOfficeAPILog("Exception in PlazaMappingValidateSetUp : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/PlazaMappingGetAll")]
        [HttpGet]
        public HttpResponseMessage PlazaMappingGetAll()
        {
            try
            {
                List<PlazaMappingIL> plazas = PlazaMappingBL.GetAll();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = plazas;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in PlazaMappingGetAll : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/PlazaMappingGetByPlazaId")]
        [HttpGet]
        public HttpResponseMessage PlazaMappingGetByPlazaId(int PlazId)
        {
            try
            {
                List<PlazaMappingIL> plazas = PlazaMappingBL.GetByPlazaId(PlazId);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = plazas;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in PlazaMappingGetByPlazaId : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Lane Management
        [Route(Provider + "/Toll360-BackOffice/LaneConfigurationSetUp")]
        [HttpPost]
        public HttpResponseMessage LaneConfigurationSetUp(LaneManagementIL lane)
        {
            try
            {
                List<ResponceIL> resp = LaneManagementBL.InsertUpdate(lane);
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
                BackOfficeAPILog("Exception in LaneConfigurationSetUp : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/LaneConfigurationGetAll")]
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
                BackOfficeAPILog("Exception in LaneConfigurationGetAll : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/LaneConfigurationGetById")]
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
                BackOfficeAPILog("Exception in LaneConfigurationGetById : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/LaneConfigurationGetByPlazaId")]
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
                BackOfficeAPILog("Exception in LaneConfigurationGetByPlazaId : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/LaneConfigurationGetByClientId")]
        [HttpGet]
        public HttpResponseMessage LaneConfigurationGetByClientId(int ClientId)
        {
            try
            {
                List<LaneManagementIL> lanes;
                if (ClientId == 0)
                    lanes = LaneManagementBL.GetAll();
                else
                    lanes = LaneManagementBL.GetByClientId(ClientId);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = lanes;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in LaneConfigurationGetByClientId : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Hardware Management
        [Route(Provider + "/Toll360-BackOffice/HardwareConfigurationSetUp")]
        [HttpPost]
        public HttpResponseMessage HardwareConfigurationSetUp(HardwareManagementIL hardware)
        {
            try
            {
                List<ResponceIL> resp = HardwareManagementBL.InsertUpdate(hardware);
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
                BackOfficeAPILog("Exception in HardwareConfigurationSetUp : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/HardwareConfigurationGetAll")]
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
                BackOfficeAPILog("Exception in HardwareConfigurationGetAll : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/HardwareConfigurationGetById")]
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
                BackOfficeAPILog("Exception in HardwareConfigurationGetById : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/HardwareConfigurationGetByClientId")]
        [HttpGet]
        public HttpResponseMessage HardwareConfigurationGetByClientId(int ClientId)
        {
            try
            {
                List<HardwareManagementIL> hardwaries;
                if (ClientId == 0)
                    hardwaries = HardwareManagementBL.GetAll();
                else
                    hardwaries = HardwareManagementBL.GetByClientId(ClientId);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = hardwaries;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in HardwareConfigurationGetByClientId : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/GetByConnectionType")]
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
                BackOfficeAPILog("Exception in GetByConnectionType : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/GetByHardwareType")]
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
                BackOfficeAPILog("Exception in GetByHardwareType : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/GetByHardwareProvider")]
        [HttpGet]
        public HttpResponseMessage GetByHardwareProvider()
        {
            try
            {
                List<HardwareProviderIL> haredwaresProvider = HardwareProviderBL.GetActive();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = haredwaresProvider;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in GetByHardwareProvider : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Class File Upload
        [Route(Provider + "/Toll360-BackOffice/ClassFileUpload")]
        [HttpPost]
        public HttpResponseMessage ClassFileUpload()
        {
            try
            {
                var filefor = HttpContext.Current.Request.Params["filefor"];
                var UserId = HttpContext.Current.Request.Params["UserId"];
                var ClientId = HttpContext.Current.Request.Params["ClientId"];
                HttpFileCollection files = HttpContext.Current.Request.Files;
                if (files.Count > 0)
                {
                    HttpPostedFile file = files[0];
                    string fileExt = Path.GetExtension(file.FileName);
                    string filename = Path.GetFileName(file.FileName);
                    CommonIL c = new CommonIL();
                    c.DataStatus = 1;
                    c.CreatedBy = Convert.ToInt32(UserId);

                    if (fileExt == ".csv")
                    {
                        string SessionId = Constants.RandomString(10);
                        string tempFile = filefor + "_" + DateTime.Now.ToString(Constants.dateTimeFormatFileName) + "_" + SessionId;
                        if (filefor == "AVC")
                        {
                            try
                            {
                                c.ClientId = Convert.ToInt16(ClientId);
                                string FilePath = HttpContext.Current.Server.MapPath("/ImportFiles/");
                                string FileName = "IMP_AcvClass.csv";
                                file.SaveAs(FilePath + FileName);
                                DatabaseUtilityOledb dutole = new DatabaseUtilityOledb();
                                System.Data.DataSet ds = dutole.GetDataset("SELECT * FROM [IMP_AcvClass.csv]", "IMP_AcvClass", FilePath);
                                List<ResponceIL> resp = AVCVehicleClassBL.ImportData(c, ds.Tables["IMP_AcvClass"], SessionId, tempFile);
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
                                BackOfficeAPILog("Exception in ClassFileUpload saveing : " + ex.Message.ToString());
                                ResponceMessage objMessage = new ResponceMessage();
                                objMessage.AlertMessage = "Upload valid file!";
                                responceMessae.Add(objMessage);
                                responce.Message = responceMessae;
                                return Request.CreateResponse(HttpStatusCode.OK, responce);
                            }

                        }
                        else if (filefor == "IHMCL")
                        {
                            try
                            {
                                string FilePath = HttpContext.Current.Server.MapPath("/ImportFiles/");
                                string FileName = "IMP_IHMCLClass.csv";
                                file.SaveAs(FilePath + FileName);
                                DatabaseUtilityOledb dutole = new DatabaseUtilityOledb();
                                System.Data.DataSet ds = dutole.GetDataset("SELECT * FROM [IMP_IHMCLClass.csv]", "IMP_IHMCLClass", FilePath);
                                List<ResponceIL> resp = IHMCLVehicleClassBL.ImportData(c, ds.Tables["IMP_IHMCLClass"], SessionId, tempFile);
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
                                BackOfficeAPILog("Exception in ClassFileUpload saveing : " + ex.Message.ToString());

                                ResponceMessage objMessage = new ResponceMessage();
                                objMessage.AlertMessage = "Upload valid file!";
                                responceMessae.Add(objMessage);
                                responce.Message = responceMessae;
                                return Request.CreateResponse(HttpStatusCode.OK, responce);
                            }
                        }
                        else
                        {
                            ResponceMessage objMessage = new ResponceMessage();
                            objMessage.AlertMessage = "Not a valid option!";
                            responceMessae.Add(objMessage);
                            responce.Message = responceMessae;
                            return Request.CreateResponse(HttpStatusCode.OK, responce);
                        }
                    }
                    else
                    {
                        ResponceMessage objMessage = new ResponceMessage();
                        objMessage.AlertMessage = "Only CSV formated file allowed!";
                        responceMessae.Add(objMessage);
                        responce.Message = responceMessae;
                        return Request.CreateResponse(HttpStatusCode.OK, responce);
                    }
                }
                else
                {
                    ResponceMessage objMessage = new ResponceMessage();
                    objMessage.AlertMessage = "No file found to upload!";
                    responceMessae.Add(objMessage);
                    responce.Message = responceMessae;
                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                }
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in ClassFileUpload : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region AVC Class Management
        [Route(Provider + "/Toll360-BackOffice/AVCClassGetAll")]
        [HttpGet]
        public HttpResponseMessage AVCClassGetAll()
        {
            try
            {
                List<AVCVehicleClassIL> avcClasses = AVCVehicleClassBL.GetAll();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = avcClasses;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in AVCClassGetAll : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/AVCClassGetByClassId")]
        [HttpGet]
        public HttpResponseMessage AVCClassGetByClassId(int ClassId)
        {
            try
            {
                AVCVehicleClassIL avcClass = AVCVehicleClassBL.GetByClassId(ClassId);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = avcClass;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in AVCClassGetByClassId : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/AVCClassGetByClientId")]
        [HttpGet]
        public HttpResponseMessage AVCClassGetByClientId(int ClientId)
        {
            try
            {
                List<AVCVehicleClassIL> avcClass = AVCVehicleClassBL.GetByClientId(ClientId);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = avcClass;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in AVCClassGetByClientId : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region IHMCL Class Management
        [Route(Provider + "/Toll360-BackOffice/IHMCLClassGetAll")]
        [HttpGet]
        public HttpResponseMessage IHMCLClassGetAll()
        {
            try
            {
                List<IHMCLVehicleClassIL> IHMCLClasses = IHMCLVehicleClassBL.GetAll();
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = IHMCLClasses;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in IHMCLClassGetAll : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/IHMCLClassGetByClassId")]
        [HttpGet]
        public HttpResponseMessage IHMCLClassGetByClassId(int ClassId)
        {
            try
            {
                IHMCLVehicleClassIL ihmcl = IHMCLVehicleClassBL.GetByClassId(ClassId);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = ihmcl;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in IHMCLClassGetByClassId : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/IHMCLClassUpdate")]
        [HttpGet]
        public HttpResponseMessage IHMCLClassUpdate(IHMCLVehicleClassIL vc)
        {
            try
            {
                List<ResponceIL> resp = IHMCLVehicleClassBL.Update(vc);
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
                BackOfficeAPILog("Exception in IHMCLClassUpdate : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Class Mapping
        [Route(Provider + "/Toll360-BackOffice/ClassMappingSetUp")]
        [HttpPost]
        public HttpResponseMessage ClassMappingSetUp(VehicleClassIL vc)
        {
            try
            {
                List<ResponceIL> resp = VehicleClassBL.InsertUpdate(vc);
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
                BackOfficeAPILog("Exception in ClassMappingSetUp : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/ClassMappingUpdate")]
        [HttpPost]
        public HttpResponseMessage ClassMappingUpdate(VehicleClassIL vc)
        {
            try
            {
                List<ResponceIL> resp = VehicleClassBL.Update(vc);
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
                BackOfficeAPILog("Exception in ClassMappingUpdate : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/ClassMappingGetAll")]
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
                BackOfficeAPILog("Exception in ClassMappingGetAll : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/ClassMappingGetByClassId")]
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
                BackOfficeAPILog("Exception in ClassMappingGetByClassId : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/ClassMappingGetByClientId")]
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
                BackOfficeAPILog("Exception in ClassMappingGetByClientId : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region Fare Mapping
        [Route(Provider + "/Toll360-BackOffice/FareMappingSetUp")]
        [HttpPost]
        public HttpResponseMessage FareMappingSetUp(FareManagementIL fare)
        {
            try
            {
                if (fare.EffectiveDate <= DateTime.Now)
                {
                    ResponceMessage objMessage = new ResponceMessage();
                    objMessage.AlertMessage = "Effective date must be greater than current date!";
                    responceMessae.Add(objMessage);
                    responce.Message = responceMessae;
                    return Request.CreateResponse(HttpStatusCode.OK, responce);
                }
                else
                {
                    List<ResponceIL> resp = FareManagementBL.InsertUpdate(fare);
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
                BackOfficeAPILog("Exception in FareMappingSetUp : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/FareGetAllByClientId")]
        [HttpPost]
        public HttpResponseMessage FareGetAllByClientId(FareManagementIL fare)
        {
            try
            {
                FareManagementIL fareData = FareManagementBL.GetAllByClientId(fare);
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = "success";
                responceMessae.Add(objMessage);
                responce.ResponceData = fareData;
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.OK, responce);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in FareGetAllByClientId : " + ex.Message.ToString());
                ResponceMessage objMessage = new ResponceMessage();
                objMessage.AlertMessage = ex.Message.ToString();
                responceMessae.Add(objMessage);
                responce.Message = responceMessae;
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        [Route(Provider + "/Toll360-BackOffice/FareGetAllByDate")]
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
                BackOfficeAPILog("Exception in FareGetAllByDate : " + ex.Message.ToString());
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
