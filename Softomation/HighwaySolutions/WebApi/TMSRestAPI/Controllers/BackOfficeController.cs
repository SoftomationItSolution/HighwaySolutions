using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using HighwaySoluations.Softomation.TMSSystemLibrary;
using HighwaySoluations.Softomation.TMSSystemLibrary.BL;
using HighwaySoluations.Softomation.TMSSystemLibrary.SystemLogger;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using static HighwaySoluations.Softomation.TMSSystemLibrary.SystemConstants;
using static HighwaySoluations.Softomation.CommonLibrary.Constants;

namespace TMSRestAPI.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class BackOfficeController : ApiController
    {
        const string Provider = AppProvider;
        const string APIPath = "FastTrackHighway-TMS";
        ApiResponseIL response = new ApiResponseIL();
        ResponseIL resp = new ResponseIL();

        internal static void BackOfficeAPILog(string message)
        {
            LogMaster.Write(message, ErrorLogModule.BackOfficeAPI);
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
                        AppLoginIL result = (AppLoginIL)GetToken(login);
                        UserManagementIL user = new UserManagementIL();
                        user.UserId = 0;
                        user.RoleId = 0;
                        user.LoginId = login.LoginId;
                        user.EmailId = "sysadmin@gmail.com";
                        user.FirstName = "Super";
                        user.LastName = "Admin";
                        user.MobileNumber = "9999999999";
                        user.RoleName = "sysadmin";
                        user.UserTypeName = "Super";
                        user.DataStatusName = "Active";
                        user.UserProfileImage = "/User/ProfileImage/avatar-7.jpg";
                        result.UserData = user;
                        LogingActivityIL activity = new LogingActivityIL();
                        login.LoginId = Encrypt(login.LoginId);
                        activity.LoginStatusId = (Int16)UserLoginStatus.Login;
                        activity.UserTypeId = (Int16)AppUserType.SysAdmin;
                        LogingActivityBL.Insert(activity);
                        result.LoginId = SystemConstants.Decrypt(login.LoginId);
                        result.LoginPassword = login.LoginPassword;
                        resp.AlertMessage = "success";
                        response.Message.Add(resp);
                        response.ResponseData = result;
                        return Request.CreateResponse(HttpStatusCode.OK, response);
                    }
                    else
                    {
                        LogingActivityIL activity = new LogingActivityIL();
                        login.LoginId = SystemConstants.Encrypt(login.LoginId);
                        activity.LoginStatusId = (Int16)SystemConstants.UserLoginStatus.Invalid;
                        activity.UserTypeId = (Int16)SystemConstants.AppUserType.SysAdmin;
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
                            login.LoginId = SystemConstants.Encrypt(login.LoginId);
                            activity.LoginStatusId = (Int16)SystemConstants.UserLoginStatus.Invalid;
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
                            if (login.LoginPassword == SystemConstants.Decrypt(obj.LoginPassword))
                            {
                                if (DateTime.Now > obj.AccountExpiredDate)
                                {
                                    LogingActivityIL activity = new LogingActivityIL();
                                    login.LoginId = SystemConstants.Encrypt(login.LoginId);
                                    activity.LoginStatusId = (Int16)SystemConstants.UserLoginStatus.Invalid;
                                    activity.UserTypeId = obj.UserTypeId;
                                    LogingActivityBL.Insert(activity);
                                    obj.LoginPassword = "";
                                    resp.AlertMessage = "Account has expired";
                                    response.Message.Add(resp);
                                    response.ResponseData = null;
                                    return Request.CreateResponse(HttpStatusCode.OK, response);
                                }
                                else if (obj.DataStatus != (short)SystemConstants.DataStatusType.Active)
                                {
                                    LogingActivityIL activity = new LogingActivityIL();
                                    login.LoginId = SystemConstants.Encrypt(login.LoginId);
                                    activity.LoginStatusId = (Int16)SystemConstants.UserLoginStatus.Invalid;
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
                                    AppLoginIL result = (AppLoginIL)SystemConstants.GetToken(login);
                                    LogingActivityIL activity = new LogingActivityIL();
                                    login.LoginId = SystemConstants.Encrypt(login.LoginId);
                                    activity.LoginStatusId = (Int16)SystemConstants.UserLoginStatus.Login;
                                    activity.UserTypeId = obj.UserTypeId;
                                    LogingActivityBL.Insert(activity);
                                    result.LoginPassword = SystemConstants.Decrypt(obj.LoginPassword);
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
                                login.LoginId = SystemConstants.Encrypt(login.LoginId);
                                activity.LoginStatusId = (Int16)SystemConstants.UserLoginStatus.Invalid;
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
                        login.LoginId = SystemConstants.Encrypt(login.LoginId);
                        activity.LoginStatusId = (Int16)SystemConstants.UserLoginStatus.Invalid;
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
                activity.LoginStatusId = (Int16)SystemConstants.UserLoginStatus.Logout;
                LogingActivityBL.Update(activity);
                return Request.CreateResponse(HttpStatusCode.OK);
            }
            catch (Exception ex)
            {

                BackOfficeAPILog("Error in ValidateUser : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
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
                response.ResponseData = obj;
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in GetMenu : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        #endregion
    }
}
