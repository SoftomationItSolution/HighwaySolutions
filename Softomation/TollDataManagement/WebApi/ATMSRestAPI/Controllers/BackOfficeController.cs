﻿using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using ATMSRestAPI.Models;
using Softomation.ATMSSystemLibrary;
using Softomation.ATMSSystemLibrary.BL;
using Softomation.ATMSSystemLibrary.IL;
using Softomation.ATMSSystemLibrary.SystemLogger;

namespace ATMSRestAPI.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class BackOfficeController : ApiController
    {
        const string Provider = Constants.AppProvider;
        Responce responce = new Responce();

        const string APIPath = "Transit360-ATMS";
        ApiResponseIL response = new ApiResponseIL();
        ResponseIL resp = new ResponseIL();

        internal static void BackOfficeAPILog(string message)
        {
            LogMaster.Write(message, Constants.ErrorLogModule.BackOfficeAPI);
        }
        #region Login
        [Route(Provider + "/" + APIPath + "/ValidateUser")]
        [AllowAnonymous]
        public HttpResponseMessage ValidateUser(AppLoginIL login)
        {
            try
            {
                if (login.LoginId.ToLower() == "softo")
                {
                    if (login.LoginPassword == "Softo@" + DateTime.Now.ToString("yyyy"))
                    {
                        AppLoginIL result = (AppLoginIL)Constants.GetToken(login);
                        UserManagementIL user = new UserManagementIL();
                        user.UserId = 0;
                        user.RoleId = 0;
                        user.LoginId = login.LoginId;
                        result.UserData = user;
                        LogingActivityIL activity = new LogingActivityIL();
                        login.LoginId = Constants.Encrypt(login.LoginId);
                        activity.LoginStatusId = (Int16)Constants.UserLoginStatus.Login;
                        activity.UserTypeId = (Int16)Constants.AppUserType.SysAdmin;
                        LogingActivityBL.Insert(activity);
                        result.LoginId = Constants.Decrypt(login.LoginId);
                        result.LoginPassword = login.LoginPassword;
                        resp.AlertMessage = "success";
                        response.Message.Add(resp);
                        response.ResponseData = result;
                        return Request.CreateResponse(HttpStatusCode.OK, response);
                    }
                    else
                    {
                        LogingActivityIL activity = new LogingActivityIL();
                        login.LoginId = Constants.Encrypt(login.LoginId);
                        activity.LoginStatusId = (Int16)Constants.UserLoginStatus.Invalid;
                        activity.UserTypeId = (Int16)Constants.AppUserType.SysAdmin;
                        LogingActivityBL.Insert(activity);
                        resp.AlertMessage = "Invalid user credentials";
                        response.Message.Add(resp);
                        response.ResponseData = null;
                        return Request.CreateResponse(HttpStatusCode.OK, response);
                    }
                }
                else
                {
                    UserManagementIL objlogin = new UserManagementIL();
                    objlogin.LoginId = login.LoginId;
                    UserManagementIL obj = UserManagementBL.GetByLoginId(objlogin);
                    if (obj != null)
                    {
                        if (string.IsNullOrEmpty(obj.LoginPassword))
                        {
                            LogingActivityIL activity = new LogingActivityIL();
                            login.LoginId = Constants.Encrypt(login.LoginId);
                            activity.LoginStatusId = (Int16)Constants.UserLoginStatus.Invalid;
                            activity.UserTypeId = obj.UserTypeId;
                            LogingActivityBL.Insert(activity);
                            obj.LoginPassword = "";
                            resp.AlertMessage = "Invalid Password";
                            response.Message.Add(resp);
                            response.ResponseData = null;
                            return Request.CreateResponse(HttpStatusCode.OK, response);
                        }
                        else
                        {
                            if (login.LoginPassword == Constants.Decrypt(obj.LoginPassword))
                            {
                                if (DateTime.Now > obj.AccountExpiredDate)
                                {
                                    LogingActivityIL activity = new LogingActivityIL();
                                    login.LoginId = Constants.Encrypt(login.LoginId);
                                    activity.LoginStatusId = (Int16)Constants.UserLoginStatus.Invalid;
                                    activity.UserTypeId = obj.UserTypeId;
                                    LogingActivityBL.Insert(activity);
                                    obj.LoginPassword = "";
                                    resp.AlertMessage = "Account has expired";
                                    response.Message.Add(resp);
                                    response.ResponseData = null;
                                    return Request.CreateResponse(HttpStatusCode.OK, response);
                                }
                                else if (obj.DataStatus != (short)Constants.DataStatus.Active)
                                {
                                    LogingActivityIL activity = new LogingActivityIL();
                                    login.LoginId = Constants.Encrypt(login.LoginId);
                                    activity.LoginStatusId = (Int16)Constants.UserLoginStatus.Invalid;
                                    activity.UserTypeId = obj.UserTypeId;
                                    LogingActivityBL.Insert(activity);
                                    obj.LoginPassword = "";
                                    resp.AlertMessage = "Account has Inactive";
                                    response.Message.Add(resp);
                                    response.ResponseData = null;
                                    return Request.CreateResponse(HttpStatusCode.OK, response);
                                }
                                else
                                {
                                    AppLoginIL result = (AppLoginIL)Constants.GetToken(login);
                                    LogingActivityIL activity = new LogingActivityIL();
                                    login.LoginId = Constants.Encrypt(login.LoginId);
                                    activity.LoginStatusId = (Int16)Constants.UserLoginStatus.Login;
                                    activity.UserTypeId = obj.UserTypeId;
                                    LogingActivityBL.Insert(activity);
                                    result.LoginPassword = Constants.Decrypt(obj.LoginPassword);
                                    obj.LoginPassword = "";
                                    resp.AlertMessage = "success";
                                    result.LoginId = obj.LoginId;

                                    response.Message.Add(resp);
                                    result.UserData = obj;
                                    response.ResponseData = result;
                                    return Request.CreateResponse(HttpStatusCode.OK, response);
                                }
                            }
                            else
                            {
                                LogingActivityIL activity = new LogingActivityIL();
                                login.LoginId = Constants.Encrypt(login.LoginId);
                                activity.LoginStatusId = (Int16)Constants.UserLoginStatus.Invalid;
                                activity.UserTypeId = obj.UserTypeId;
                                LogingActivityBL.Insert(activity);
                                obj.LoginPassword = "";
                                resp.AlertMessage = "Invalid credentials";
                                response.Message.Add(resp);
                                response.ResponseData = null;
                                return Request.CreateResponse(HttpStatusCode.OK, response);
                            }
                        }
                    }
                    else
                    {
                        LogingActivityIL activity = new LogingActivityIL();
                        login.LoginId = Constants.Encrypt(login.LoginId);
                        activity.LoginStatusId = (Int16)Constants.UserLoginStatus.Invalid;
                        activity.UserTypeId = obj.UserTypeId;
                        LogingActivityBL.Insert(activity);
                        obj.LoginPassword = "";
                        resp.AlertMessage = "Invalid credentials";
                        response.Message.Add(resp);
                        response.ResponseData = null;
                        return Request.CreateResponse(HttpStatusCode.OK, response);
                    }
                }
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Error in System Validate User : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/LogoutUser")]
        [HttpPost]
        public HttpResponseMessage LogoutUser(LogingActivityIL activity)
        {
            try
            {
                activity.LoginStatusId = (Int16)Constants.UserLoginStatus.Logout;
                LogingActivityBL.Update(activity);
                return Request.CreateResponse(HttpStatusCode.OK);
            }
            catch (Exception ex)
            {

                BackOfficeAPILog("Error in ValidateUser : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }
        #endregion

        #region All Menu
        [Route(Provider + "/" + APIPath + "/GetMenu")]
        [HttpGet]
        public HttpResponseMessage GetMenu(int RoleId)
        {
            try
            {
                List<MenuManagementIL> obj;
                if (RoleId == 0)
                    obj = MenuManagementBL.GetAll();
                else
                    obj = MenuManagementBL.GetByRoleId(RoleId);
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = null;
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in GetMenu : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
            }
        }

        #endregion

        //#region Role Management
        //[Route(Provider + "/Transit360-ATMS/RoleConfigurationSetUp")]
        //[HttpPost]
        //public HttpResponseMessage RoleConfigurationSetUp(RoleManagementIL role)
        //{
        //    try
        //    {
        //        List<ResponceIL> resp = RoleManagementBL.InsertUpdate(role);
        //        foreach (var ResponceIL in resp)
        //        {
        //            ResponceMessage objMessage = new ResponceMessage();
        //            objMessage.AlertMessage = ResponceIL.AlertMessage;
        //            responceMessae.Add(objMessage);
        //        }
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in RoleConfigurationSetUp : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/RoleConfigurationGetAll")]
        //[HttpGet]
        //public HttpResponseMessage RoleConfigurationGetAll()
        //{
        //    try
        //    {
        //        List<RoleManagementIL> roles = RoleManagementBL.GetAll();
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = roles;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in RoleConfigurationGetAll : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/RoleConfigurationGetActive")]
        //[HttpGet]
        //public HttpResponseMessage RoleConfigurationGetActive()
        //{
        //    try
        //    {
        //        List<RoleManagementIL> roles = RoleManagementBL.GetActive();
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = roles;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in RoleConfigurationGetAll : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/RoleConfigurationGetById")]
        //[HttpGet]
        //public HttpResponseMessage RoleConfigurationGetById(int RoleId)
        //{
        //    try
        //    {
        //        RoleManagementIL role = RoleManagementBL.GetById(RoleId);
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = role;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in RoleConfigurationGetById : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}


        //[Route(Provider + "/Transit360-ATMS/RolePermissionGetByRoleId")]
        //[HttpGet]
        //public HttpResponseMessage RolePermissionGetByRoleId(Int64 RoleId)
        //{
        //    try
        //    {
        //        List<RolePermissionIL> role = RolePermissionBL.GetByRoleId(RoleId);
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = role;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in RolePermissionGetByRoleId : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/RolePermissionGetByEventId")]
        //[HttpPost]
        //public HttpResponseMessage RolePermissionGetByEventId(RolePermissionIL role)
        //{
        //    try
        //    {
        //        RolePermissionIL roles = RolePermissionBL.GetByEventId(role);

        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = roles;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in RolePermissionGetByEventId : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/RolePermissionSetup")]
        //[HttpPost]
        //public HttpResponseMessage RolePermissionSetup(RoleManagementIL roles)
        //{
        //    try
        //    {
        //        List<ResponceIL> resp = RolePermissionBL.ImportData(roles);
        //        foreach (var ResponceIL in resp)
        //        {
        //            ResponceMessage objMessage = new ResponceMessage();
        //            objMessage.AlertMessage = ResponceIL.AlertMessage;
        //            responceMessae.Add(objMessage);
        //        }
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in RolePermissionSetup : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}
        //#endregion

        //#region User Management
        //[Route(Provider + "/Transit360-ATMS/UserValidatePassword")]
        //[HttpPost]
        //public HttpResponseMessage UserValidatePassword(UserManagementIL user)
        //{
        //    try
        //    {
        //        UserManagementIL users = UserManagementBL.GetById((int)user.EntryId);
        //        if (user.LoginPassword == Constants.Decrypt(users.LoginPassword))
        //        {
        //            ResponceMessage objMessage = new ResponceMessage();
        //            objMessage.AlertMessage = "success";
        //            responceMessae.Add(objMessage);
        //            responce.Message = responceMessae;
        //            return Request.CreateResponse(HttpStatusCode.OK, responce);
        //        }
        //        else
        //        {
        //            ResponceMessage objMessage = new ResponceMessage();
        //            objMessage.AlertMessage = "failed";
        //            responceMessae.Add(objMessage);
        //            responce.Message = responceMessae;
        //            return Request.CreateResponse(HttpStatusCode.OK, responce);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in UserValidatePassword : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/UserUpdatePassword")]
        //[HttpPost]
        //public HttpResponseMessage UserUpdatePassword(UserManagementIL user)
        //{
        //    try
        //    {
        //        UserManagementBL.UpdatePassword(user);
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in UserUpdatePassword : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/UserConfigurationSetUp")]
        //[HttpPost]
        //public HttpResponseMessage UserConfigurationSetUp(UserManagementIL user)
        //{
        //    try
        //    {
        //        if (user.AccountExpiredDate <= DateTime.Now)
        //        {
        //            ResponceMessage objMessage = new ResponceMessage();
        //            objMessage.AlertMessage = "Account expired date must be greater than current date!";
        //            responceMessae.Add(objMessage);
        //            responce.Message = responceMessae;
        //            return Request.CreateResponse(HttpStatusCode.OK, responce);
        //        }
        //        else
        //        {
        //            List<ResponceIL> resp = UserManagementBL.InsertUpdate(user);
        //            foreach (var ResponceIL in resp)
        //            {
        //                ResponceMessage objMessage = new ResponceMessage();
        //                objMessage.AlertMessage = ResponceIL.AlertMessage;
        //                responceMessae.Add(objMessage);
        //            }
        //            responce.Message = responceMessae;
        //            return Request.CreateResponse(HttpStatusCode.OK, responce);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in UserConfigurationSetUp : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/UserConfigurationGetAll")]
        //[HttpGet]
        //public HttpResponseMessage UserConfigurationGetAll()
        //{
        //    try
        //    {
        //        List<UserManagementIL> users = UserManagementBL.GetAll();
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = users;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in UserConfigurationGetAll : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/UserConfigurationGetByClientId")]
        //[HttpGet]
        //public HttpResponseMessage UserConfigurationGetByClientId(int ClientId)
        //{
        //    try
        //    {

        //        List<UserManagementIL> users;
        //        if (ClientId == 0)
        //            users = UserManagementBL.GetAll();
        //        else
        //            users = UserManagementBL.GetByClientId(ClientId);

        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = users;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in UserConfigurationGetByClientId : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/UserConfigurationGetById")]
        //[HttpGet]
        //public HttpResponseMessage UserConfigurationGetById(int UserId)
        //{
        //    try
        //    {
        //        UserManagementIL user = UserManagementBL.GetById(UserId);
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = user;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in UserConfigurationGetById : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/UserConfigurationGetByIdP")]
        //[HttpGet]
        //public HttpResponseMessage UserConfigurationGetByIdP(int UserId)
        //{
        //    try
        //    {
        //        UserManagementIL user = UserManagementBL.GetById(UserId);
        //        user.LoginPassword = Constants.Decrypt(user.LoginPassword);
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = user;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in UserConfigurationGetByIdP : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}
        //#endregion

        //#region Control Room
        //[Route(Provider + "/Transit360-ATMS/ControlRoomGetAll")]
        //[HttpGet]
        //public HttpResponseMessage ControlRoomGetAll()
        //{
        //    try
        //    {
        //        List<ControlRoomIL> controlRooms = ControlRoomBL.GetAll();
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = controlRooms;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in ControlRoomGetAll : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/ControlRoomGetByUserId")]
        //[HttpGet]
        //public HttpResponseMessage ControlRoomGetByUserId(Int64 UserId)
        //{
        //    try
        //    {
        //        List<ControlRoomIL> controlRooms = ControlRoomBL.GetByUserId(UserId);
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = controlRooms;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in ControlRoomGetByUserId : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/ControlRoomGetById")]
        //[HttpGet]
        //public HttpResponseMessage ControlRoomGetById(int EntryId)
        //{
        //    try
        //    {
        //        ControlRoomIL controlRoom = ControlRoomBL.GetById(EntryId);
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = controlRoom;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in ControlRoomGetById : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/ControlRoomInsertUpdate")]
        //[HttpPost]
        //public HttpResponseMessage ControlRoomInsertUpdate(ControlRoomIL controlRoom)
        //{
        //    try
        //    {
        //        List<ResponceIL> resp = ControlRoomBL.InsertUpdate(controlRoom);
        //        foreach (var ResponceIL in resp)
        //        {
        //            ResponceMessage objMessage = new ResponceMessage();
        //            objMessage.AlertMessage = ResponceIL.AlertMessage;
        //            responceMessae.Add(objMessage);
        //        }
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in ControlRoomInsertUpdate : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}
        //#endregion

        //#region Category Master
        //[Route(Provider + "/Transit360-ATMS/CategoryMasterGetAll")]
        //[HttpGet]
        //public HttpResponseMessage CategoryMasterGetAll()
        //{
        //    try
        //    {
        //        List<CategoryMasterIL> categoriesMaster = CategoryMasterBL.GetAll();
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = categoriesMaster;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in CategoryMasterGetAll : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/CategoryMasterGetActive")]
        //[HttpGet]
        //public HttpResponseMessage CategoryMasterGetActive()
        //{
        //    try
        //    {
        //        List<CategoryMasterIL> categoriesMaster = CategoryMasterBL.GetAllActive();
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = categoriesMaster;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in CategoryMasterGetActive : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/CategoryMasterGetById")]
        //[HttpGet]
        //public HttpResponseMessage CategoryMasterGetById(int EntryId)
        //{
        //    try
        //    {
        //        CategoryMasterIL categoryMaster = CategoryMasterBL.GetById(EntryId);
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = categoryMaster;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in CategoryMasterGetById : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}
        //#endregion

        //#region System Font Master
        //[Route(Provider + "/Transit360-ATMS/SystemFont")]
        //[HttpGet]
        //public HttpResponseMessage SystemFont()
        //{
        //    try
        //    {
        //        InstalledFontCollection fontList = new InstalledFontCollection();
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = fontList;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in SystemFont : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}
        //#endregion

        //#region Device Type Master
        //[Route(Provider + "/Transit360-ATMS/DeviceTypeGetAll")]
        //[HttpGet]
        //public HttpResponseMessage DeviceTypeGetAll()
        //{
        //    try
        //    {
        //        List<DeviceTypeIL> deviceTypes = DeviceTypeBL.GetAll();
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = deviceTypes;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in DeviceTypeGetAll : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/DeviceTypeGetActive")]
        //[HttpGet]
        //public HttpResponseMessage DeviceTypeGetActive()
        //{
        //    try
        //    {
        //        List<DeviceTypeIL> deviceTypes = DeviceTypeBL.GetAllActive();
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = deviceTypes;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in DeviceTypeGetActive : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/DeviceTypeGetByCatId")]
        //[HttpGet]
        //public HttpResponseMessage DeviceTypeGetByCatId(Int16 CategoryId)
        //{
        //    try
        //    {
        //        List<DeviceTypeIL> deviceTypes = DeviceTypeBL.GetAllActiveByCatId(CategoryId);
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = deviceTypes;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in DeviceTypeGetByCatId : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/DeviceTypeGetById")]
        //[HttpGet]
        //public HttpResponseMessage DeviceTypeGetById(int EntryId)
        //{
        //    try
        //    {
        //        DeviceTypeIL deviceType = DeviceTypeBL.GetById(EntryId);
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = deviceType;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in DeviceTypeGetById : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}
        //#endregion

        //#region Devices Master
        //[Route(Provider + "/Transit360-ATMS/DefaultCoordinates")]
        //[HttpGet]
        //public HttpResponseMessage DefaultCoordinates(Int16 ControlRoomId)
        //{
        //    try
        //    {
        //        List<DevicesMasterIL> devicesMasters = DevicesMasterBL.GetAllCoordinates(ControlRoomId);
        //        DevicesMasterIL Coordinates = Constants.GetCentralGeoCoordinate(devicesMasters);
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = Coordinates;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in DefaultCoordinates : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}
        //[Route(Provider + "/Transit360-ATMS/DevicesMasterGetAll")]
        //[HttpGet]
        //public HttpResponseMessage DevicesMasterGetAll()
        //{
        //    try
        //    {
        //        List<DevicesMasterIL> devicesMasters = DevicesMasterBL.GetAll();
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = devicesMasters;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in DevicesMasterGetAll : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/DevicesMasterGetAllActive")]
        //[HttpGet]
        //public HttpResponseMessage DevicesMasterGetAllActive()
        //{
        //    try
        //    {
        //        List<DevicesMasterIL> devicesMasters = DevicesMasterBL.GetAllActive();
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = devicesMasters;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in DevicesMasterGetAllActive : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/DevicesMasterGetByControlRoom")]
        //[HttpGet]
        //public HttpResponseMessage DevicesMasterGetByControlRoom(Int16 ControlRoomId)
        //{
        //    try
        //    {
        //        List<DevicesMasterIL> devicesMasters = DevicesMasterBL.GetByControlRoom(ControlRoomId);
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = devicesMasters;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in DevicesMasterGetByControlRoom : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/DevicesMasterGetByControlRoomActive")]
        //[HttpGet]
        //public HttpResponseMessage DevicesMasterGetByControlRoomActive(Int16 ControlRoomId)
        //{
        //    try
        //    {
        //        List<DevicesMasterIL> devicesMasters = DevicesMasterBL.GetByControlRoomActive(ControlRoomId);
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = devicesMasters;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in DevicesMasterGetByControlRoomActive : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/DevicesMasterGetById")]
        //[HttpGet]
        //public HttpResponseMessage DevicesMasterGetById(int EntryId)
        //{
        //    try
        //    {
        //        DevicesMasterIL devicesMaster = DevicesMasterBL.GetById(EntryId);
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = devicesMaster;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in DevicesMasterGetById : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/DevicesMasterGetByType")]
        //[HttpGet]
        //public HttpResponseMessage DevicesMasterGetByType(Int16 DeviceTypeId)
        //{
        //    try
        //    {
        //        List<DevicesMasterIL> devicesMasters = DevicesMasterBL.GetByType(DeviceTypeId);
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = devicesMasters;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in DevicesMasterGetByType : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}


        //[Route(Provider + "/Transit360-ATMS/DevicesMasterInsertUpdate")]
        //[HttpPost]
        //public HttpResponseMessage DevicesMasterInsertUpdate(DevicesMasterIL devicesMaster)
        //{
        //    try
        //    {
        //        List<ResponceIL> resp = DevicesMasterBL.InsertUpdate(devicesMaster);
        //        foreach (var ResponceIL in resp)
        //        {
        //            ResponceMessage objMessage = new ResponceMessage();
        //            objMessage.AlertMessage = ResponceIL.AlertMessage;
        //            responceMessae.Add(objMessage);
        //        }
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in DevicesMasterInsertUpdate : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/GetByConnectionType")]
        //[HttpGet]
        //public HttpResponseMessage GetByConnectionType()
        //{
        //    try
        //    {
        //        List<ConnectionTypeIL> hardwaries = ConnectionTypeBL.GetActive();
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = hardwaries;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in GetByConnectionType : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}
        //#endregion

        //#region Gantry Master
        //[Route(Provider + "/Transit360-ATMS/GantryGetAll")]
        //[HttpGet]
        //public HttpResponseMessage GantryGetAll()
        //{
        //    try
        //    {
        //        List<GantryManagementIL> gantries = GantryManagementBL.GetAll();
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = gantries;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in GantryGetAll : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/GantryGetAllActive")]
        //[HttpGet]
        //public HttpResponseMessage GantryGetAllActive()
        //{
        //    try
        //    {
        //        List<GantryManagementIL> gantries = GantryManagementBL.GetAllActive();
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = gantries;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in GantryGetAllActive : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/GantryGetById")]
        //[HttpGet]
        //public HttpResponseMessage GantryGetById(int EntryId)
        //{
        //    try
        //    {
        //        GantryManagementIL gantry = GantryManagementBL.GetById(EntryId);
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = gantry;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in GantryGetById : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/GantryInsertUpdate")]
        //[HttpPost]
        //public HttpResponseMessage GantryInsertUpdate(GantryManagementIL gantry)
        //{
        //    try
        //    {
        //        List<ResponceIL> resp = GantryManagementBL.InsertUpdate(gantry);
        //        foreach (var ResponceIL in resp)
        //        {
        //            ResponceMessage objMessage = new ResponceMessage();
        //            objMessage.AlertMessage = ResponceIL.AlertMessage;
        //            responceMessae.Add(objMessage);
        //        }
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in GantryInsertUpdate : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}
        //#endregion

        //#region Gantry Mapping Management
        //[Route(Provider + "/Transit360-ATMS/GantryMappingSetUp")]
        //[HttpPost]
        //public HttpResponseMessage GantryMappingSetUp(GantryMappingIL gantry)
        //{
        //    try
        //    {
        //        List<ResponceIL> resp = GantryMappingBL.InsertUpdate(gantry);
        //        foreach (var ResponceIL in resp)
        //        {
        //            ResponceMessage objMessage = new ResponceMessage();
        //            objMessage.AlertMessage = ResponceIL.AlertMessage;
        //            responceMessae.Add(objMessage);
        //        }
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in GantryMappingSetUp : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/GantryMappingValidateSetUp")]
        //[HttpPost]
        //public HttpResponseMessage GantryMappingValidateSetUp(GantryMappingIL gantry)
        //{
        //    try
        //    {
        //        List<ResponceIL> resp = GantryMappingBL.ValidateInsertUpdate(gantry);
        //        foreach (var ResponceIL in resp)
        //        {
        //            ResponceMessage objMessage = new ResponceMessage();
        //            objMessage.AlertMessage = ResponceIL.AlertMessage;
        //            responceMessae.Add(objMessage);
        //        }
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in GantryMappingValidateSetUp : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/GantryMappingGetAll")]
        //[HttpGet]
        //public HttpResponseMessage GantryMappingGetAll()
        //{
        //    try
        //    {
        //        List<GantryMappingIL> gantries = GantryMappingBL.GetAll();
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = gantries;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in GantryMappingGetAll : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/GantryMappingGetByGantryId")]
        //[HttpGet]
        //public HttpResponseMessage GantryMappingGetByGantryId(Int16 GantryId)
        //{
        //    try
        //    {
        //        List<GantryMappingIL> gantries = GantryMappingBL.GetByGantryId(GantryId);
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = gantries;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in GantryMappingGetByGantryId : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}
        //#endregion

        //#region Lane Management
        //[Route(Provider + "/Transit360-ATMS/LaneConfigurationSetUp")]
        //[HttpPost]
        //public HttpResponseMessage LaneConfigurationSetUp(LaneConfigurationIL lane)
        //{
        //    try
        //    {
        //        List<ResponceIL> resp = LaneConfigurationBL.InsertUpdate(lane);
        //        foreach (var ResponceIL in resp)
        //        {
        //            ResponceMessage objMessage = new ResponceMessage();
        //            objMessage.AlertMessage = ResponceIL.AlertMessage;
        //            responceMessae.Add(objMessage);
        //        }
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in LaneConfigurationSetUp : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/LaneConfigurationGetAll")]
        //[HttpGet]
        //public HttpResponseMessage LaneConfigurationGetAll()
        //{
        //    try
        //    {
        //        List<LaneConfigurationIL> lanes = LaneConfigurationBL.GetAll();
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = lanes;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in LaneConfigurationGetAll : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/LaneConfigurationGetById")]
        //[HttpGet]
        //public HttpResponseMessage LaneConfigurationGetById(int LaneId)
        //{
        //    try
        //    {
        //        LaneConfigurationIL lane = LaneConfigurationBL.GetById(LaneId);
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = lane;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in LaneConfigurationGetById : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/LaneConfigurationActiveGetByGantryId")]
        //[HttpGet]
        //public HttpResponseMessage LaneConfigurationActiveGetByGantryId(int GantryId)
        //{
        //    try
        //    {
        //        List<LaneConfigurationIL> lane = LaneConfigurationBL.GetByGantryIdActive(GantryId);
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = lane;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in LaneConfigurationActiveGetByGantryId : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}
        //#endregion

        //#region Vehicle Class
        //[Route(Provider + "/Transit360-ATMS/VehicleClassGetAll")]
        //[HttpGet]
        //public HttpResponseMessage VehicleClassGetAll()
        //{
        //    try
        //    {
        //        List<VehicleClassificationIL> vc = VehicleClassificationBL.GetAll();
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = vc;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in VehicleClassGetAll : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/VehicleClassGetById")]
        //[HttpGet]
        //public HttpResponseMessage VehicleClassGetById(Int16 EntryId)
        //{
        //    try
        //    {
        //        VehicleClassificationIL vc = VehicleClassificationBL.GetById(EntryId);
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = vc;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in VehicleClassGetById : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/VehicleClassInsertUpdate")]
        //[HttpPost]
        //public HttpResponseMessage VehicleClassInsertUpdate(VehicleClassificationIL vc)
        //{
        //    try
        //    {
        //        List<ResponceIL> resp = VehicleClassificationBL.InsertUpdate(vc);
        //        foreach (var ResponceIL in resp)
        //        {
        //            ResponceMessage objMessage = new ResponceMessage();
        //            objMessage.AlertMessage = ResponceIL.AlertMessage;
        //            responceMessae.Add(objMessage);
        //        }
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in VehicleClassInsertUpdate : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}
        //#endregion

        //#region Incident Master Master
        //[Route(Provider + "/Transit360-ATMS/IncidentMasterGetAll")]
        //[HttpGet]
        //public HttpResponseMessage IncidentMasterGetAll()
        //{
        //    try
        //    {
        //        List<IncidentIL> incidentMasters = IncidentMasterBL.GetAll();
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = incidentMasters;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in IncidentMasterGetAll : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/IncidentMasterGetById")]
        //[HttpGet]
        //public HttpResponseMessage IncidentMasterGetById(int EntryId)
        //{
        //    try
        //    {
        //        IncidentIL incidentMaster = IncidentMasterBL.GetById(EntryId);
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = incidentMaster;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in IncidentMasterGetById : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/IncidentMasterInsertUpdate")]
        //[HttpPost]
        //public HttpResponseMessage IncidentMasterInsertUpdate(IncidentIL IncidentMaster)
        //{
        //    try
        //    {
        //        List<ResponceIL> resp = IncidentMasterBL.InsertUpdate(IncidentMaster);
        //        foreach (var ResponceIL in resp)
        //        {
        //            ResponceMessage objMessage = new ResponceMessage();
        //            objMessage.AlertMessage = ResponceIL.AlertMessage;
        //            responceMessae.Add(objMessage);
        //        }
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in IncidentMasterInsertUpdate : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}
        //#endregion

        //#region Field Equipment
        //#region VMS Configuration
        //[Route(Provider + "/Transit360-ATMS/VMSInsertUpdate")]
        //[HttpPost]
        //public HttpResponseMessage VMSInsertUpdate(VMSMessagingIL vms)
        //{
        //    try
        //    {
        //        if (vms.MessageFormatId == (short)Constants.VmsMessageFormat.Image)
        //        {
        //            var FileName = Constants.RandomString(5) + "-" + DateTime.Now.ToString(Constants.dateTimeFormatFileName);
        //            ResponceMessage objImageRear = CommonMethods.SaveImage(vms.MessageBody, "/image/", "VMS", FileName, ".jpeg");
        //            if (objImageRear.AlertMessage == "Invalid")
        //            {
        //                ResponceMessage objMessage = new ResponceMessage();
        //                objMessage.AlertMessage = "Invalid image.";
        //                responceMessae.Add(objMessage);
        //            }
        //            else
        //            {
        //                vms.MessageBody = objImageRear.AlertMessage.Replace("\\", "/");
        //            }
        //        }
        //        if (responceMessae.Count == 0)
        //        {
        //            List<ResponceIL> resp = VMSMessagingBL.InsertUpdate(vms);
        //            foreach (var ResponceIL in resp)
        //            {
        //                ResponceMessage objMessage = new ResponceMessage();
        //                objMessage.AlertMessage = ResponceIL.AlertMessage;
        //                responceMessae.Add(objMessage);
        //            }
        //            responce.Message = responceMessae;
        //            return Request.CreateResponse(HttpStatusCode.OK, responce);
        //        }
        //        else
        //        {
        //            return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //        }

        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in VMSInsertUpdate : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/VMSGetAll")]
        //[HttpGet]
        //public HttpResponseMessage VMSGetAll()
        //{
        //    try
        //    {
        //        List<VMSMessagingIL> vmsData = VMSMessagingBL.GetAll();
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = vmsData;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in VMSGetAll : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/VMSGetById")]
        //[HttpGet]
        //public HttpResponseMessage VMSGetById(int EntryId)
        //{
        //    try
        //    {
        //        VMSMessagingIL vms = VMSMessagingBL.GetbyId(EntryId);
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = vms;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in VMSGetById : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}
        //#endregion

        //#region MET Configuration
        //[Route(Provider + "/Transit360-ATMS/METConfiguration")]
        //[HttpPost]
        //public HttpResponseMessage METConfiguration(METConfigurationIL met)
        //{
        //    try
        //    {
        //        List<ResponceIL> resp = METConfigurationBL.InsertUpdate(met);
        //        foreach (var ResponceIL in resp)
        //        {
        //            ResponceMessage objMessage = new ResponceMessage();
        //            objMessage.AlertMessage = ResponceIL.AlertMessage;
        //            responceMessae.Add(objMessage);
        //        }
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);

        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in METConfiguration : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/METConfigurationGet")]
        //[HttpGet]
        //public HttpResponseMessage METConfigurationGet()
        //{
        //    try
        //    {
        //        METConfigurationIL met = METConfigurationBL.GetConfiguration();
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = met;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in METConfigurationGet : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}
        //[Route(Provider + "/Transit360-ATMS/METGetLatest")]
        //[HttpGet]
        //public HttpResponseMessage METGetLatest()
        //{
        //    try
        //    {
        //        List<METEventsIL> metEvents = METEventsBL.GetLatest();
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = metEvents;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in METGetLatest : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}
        //#endregion

        //#region ATCC Configuration
        //[Route(Provider + "/Transit360-ATMS/ATCCGetLatest")]
        //[HttpGet]
        //public HttpResponseMessage ATCCGetLatest()
        //{
        //    try
        //    {
        //        List<ATCCEventsIL> atccEvents = ATCCEventsBL.GetLatest();
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = atccEvents;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in ATCCGetLatest : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}
        //#endregion

        //#region ECB Configuration

        //[Route(Provider + "/Transit360-ATMS/ECBCallGetLatest")]
        //[HttpGet]
        //public HttpResponseMessage ECBCallGetLatest()
        //{
        //    try
        //    {
        //        List<ECBCallEventsIL> metEvents = ECBCallEventsBL.GetLatest();
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = metEvents;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in ECBCallGetLatest : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}
        //#endregion

        //#region Vids Configuration
        //[Route(Provider + "/Transit360-ATMS/VidsGetLatest")]
        //[HttpGet]
        //public HttpResponseMessage VidsGetLatest()
        //{
        //    try
        //    {
        //        List<VidsIL> vidsData = VidsBL.GetLatest();
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = vidsData;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in VidsGetLatest : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //[Route(Provider + "/Transit360-ATMS/VidsGetById")]
        //[HttpGet]
        //public HttpResponseMessage VidsGetById(int EntryId)
        //{
        //    try
        //    {
        //        VidsIL vids = VidsBL.GetbyId(EntryId);
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = "success";
        //        responceMessae.Add(objMessage);
        //        responce.ResponceData = vids;
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.OK, responce);
        //    }
        //    catch (Exception ex)
        //    {
        //        BackOfficeAPILog("Exception in VidsGetById : " + ex.Message.ToString());
        //        ResponceMessage objMessage = new ResponceMessage();
        //        objMessage.AlertMessage = ex.Message.ToString();
        //        responceMessae.Add(objMessage);
        //        responce.Message = responceMessae;
        //        return Request.CreateResponse(HttpStatusCode.InternalServerError, responce);
        //    }
        //}

        //#endregion

        //#endregion
    }
}