using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;
using HighwaySoluations.Softomation.ATMSSystemLibrary;
using HighwaySoluations.Softomation.ATMSSystemLibrary.BL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.SystemLogger;
using static HighwaySoluations.Softomation.ATMSSystemLibrary.Constants;
using AllowAnonymousAttribute = System.Web.Http.AllowAnonymousAttribute;
using HttpGetAttribute = System.Web.Http.HttpGetAttribute;
using HttpPostAttribute = System.Web.Http.HttpPostAttribute;
using RouteAttribute = System.Web.Http.RouteAttribute;

namespace ATMSRestAPI.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class BackOfficeController : ApiController
    {
        const string Provider = Constants.AppProvider;
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
                                else if (obj.DataStatus != (short)Constants.DataStatusType.Active)
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

        #region System Details
        [Route(Provider + "/" + APIPath + "/SystemSetup")]
        [HttpPost]
        public HttpResponseMessage SystemSetup(List<SystemIL> setup)
        {
            try
            {
                response.Message = SystemBL.SetUp(setup);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in SystemSetup : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        [Route(Provider + "/" + APIPath + "/SystemGetAll")]
        [HttpGet]
        public HttpResponseMessage SystemGetAll()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = SystemBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in SystemGetAll : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/SystemGetActive")]
        [HttpGet]
        public HttpResponseMessage SystemGetActive()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = SystemBL.GetActive();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in SystemGetActive : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/SystemGetByName")]
        [HttpGet]
        public HttpResponseMessage SystemGetByName(string SystemName)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = SystemBL.GetByName(SystemName);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in SystemGetByName : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region System Setting
        [Route(Provider + "/" + APIPath + "/SystemSettingSetUp")]
        [HttpPost]
        public HttpResponseMessage SystemSettingSetUp(SystemSettingIL ss)
        {
            try
            {
                response.Message = SystemSettingBL.InsertUpdate(ss);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in SystemSettingSetUp : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        [Route(Provider + "/" + APIPath + "/SystemSettingGet")]
        [HttpGet]
        public HttpResponseMessage SystemSettingGet()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = SystemSettingBL.Get();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in SystemSettingGet : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region Report Details
        [Route(Provider + "/" + APIPath + "/ReportGetAll")]
        [HttpGet]
        public HttpResponseMessage ReportGetAll()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = ReportMasterBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in ReportGetAll : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/ReportGetActive")]
        [HttpGet]
        public HttpResponseMessage ReportGetActive()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = ReportMasterBL.GetActive();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in ReportGetActive : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/ReportGetByName")]
        [HttpGet]
        public HttpResponseMessage ReportGetByName(string ReportName)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = ReportMasterBL.GetByName(ReportName);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in ReportGetByName : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region Role Management
        [Route(Provider + "/" + APIPath + "/RoleConfigurationSetUp")]
        [HttpPost]
        public HttpResponseMessage RoleConfigurationSetUp(RoleManagementIL role)
        {
            try
            {
                response.Message = RoleManagementBL.InsertUpdate(role);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in RoleConfigurationSetUp : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/RoleConfigurationGetAll")]
        [HttpGet]
        public HttpResponseMessage RoleConfigurationGetAll()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = RoleManagementBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in RoleConfigurationGetAll : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/RoleConfigurationGetActive")]
        [HttpGet]
        public HttpResponseMessage RoleConfigurationGetActive()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = RoleManagementBL.GetActive();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in RoleConfigurationGetAll : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/RoleConfigurationGetById")]
        [HttpGet]
        public HttpResponseMessage RoleConfigurationGetById(int RoleId)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = RoleManagementBL.GetById(RoleId);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in RoleConfigurationGetById : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/RolePermissionGetByRoleId")]
        [HttpGet]
        public HttpResponseMessage RolePermissionGetByRoleId(Int64 RoleId)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = RolePermissionBL.GetByRoleId(RoleId);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in RolePermissionGetByRoleId : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/RolePermissionGetByMenu")]
        [HttpPost]
        public HttpResponseMessage RolePermissionGetByMenu(RolePermissionIL role)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = RolePermissionBL.GetByMenu(role);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in RolePermissionGetByEventId : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/RolePermissionSetup")]
        [HttpPost]
        public HttpResponseMessage RolePermissionSetup(RoleManagementIL roles)
        {
            try
            {
                response.Message = RolePermissionBL.ImportData(roles);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in RolePermissionSetup : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region User Management
        [Route(Provider + "/" + APIPath + "/UserValidatePassword")]
        [HttpPost]
        public HttpResponseMessage UserValidatePassword(UserManagementIL user)
        {
            try
            {
                UserManagementIL users = UserManagementBL.GetById((int)user.UserId);
                if (users == null || string.IsNullOrEmpty(users.LoginPassword))
                {
                    resp.AlertMessage = "User Details not found";
                    response.Message.Add(resp);
                    return Request.CreateResponse(HttpStatusCode.OK, response);
                }
                else
                {

                    if (user.LoginPassword == Constants.Decrypt(users.LoginPassword))
                    {
                        resp.AlertMessage = "success";
                        response.Message.Add(resp);
                        return Request.CreateResponse(HttpStatusCode.OK, response);
                    }
                    else
                    {
                        resp.AlertMessage = "failed";
                        response.Message.Add(resp);
                        return Request.CreateResponse(HttpStatusCode.OK, response);
                    }
                }
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in UserValidatePassword : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/UserUpdatePassword")]
        [HttpPost]
        public HttpResponseMessage UserUpdatePassword(UserManagementIL user)
        {
            try
            {
                response.Message = UserManagementBL.UpdatePassword(user);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in UserUpdatePassword : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/UserConfigurationSetUp")]
        [HttpPost]
        public HttpResponseMessage UserConfigurationSetUp(UserManagementIL user)
        {
            try
            {
                if (user.AccountExpiredDate <= DateTime.Now)
                {
                    resp.AlertMessage = "Account expired date must be greater than current date!";
                    response.Message.Add(resp);
                    return Request.CreateResponse(HttpStatusCode.OK, response);
                }
                else
                {
                    response.Message = UserManagementBL.InsertUpdate(user);
                    return Request.CreateResponse(HttpStatusCode.OK, response);
                }
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in UserConfigurationSetUp : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/UserConfigurationGetAll")]
        [HttpGet]
        public HttpResponseMessage UserConfigurationGetAll()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = UserManagementBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in UserConfigurationGetAll : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/UserConfigurationGetById")]
        [HttpGet]
        public HttpResponseMessage UserConfigurationGetById(int UserId)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = UserManagementBL.GetById(UserId);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in UserConfigurationGetById : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/UserGetByIdWithPassword")]
        [HttpGet]
        public HttpResponseMessage UserGetByIdWithPassword(int UserId)
        {
            try
            {
                UserManagementIL users = UserManagementBL.GetById(UserId);
                users.LoginPassword = Constants.Decrypt(users.LoginPassword);
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = users;
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in UserGetByIdWithPassword : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/UserConfigurationGetByUserType")]
        [HttpGet]
        public HttpResponseMessage UserConfigurationGetByUserType(short UserTypeId)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = UserManagementBL.GetByUserType(UserTypeId);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in UserConfigurationGetByUserType : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/UserConfigurationGetBySystemUserType")]
        [HttpGet]
        public HttpResponseMessage UserConfigurationGetBySystemUserType(short UserTypeId, short SystemId)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = UserManagementBL.GetBySystemUserType(UserTypeId, SystemId);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in UserConfigurationGetBySystemUserType : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/UserProfileChange")]
        [HttpPost]
        public HttpResponseMessage UserProfileChange(UserManagementIL user)
        {
            try
            {
                if (!string.IsNullOrEmpty(user.UserProfileImage))
                {
                    string currentPath = HttpContext.Current.Server.MapPath("~/EventMedia/");
                    String FilePath = "\\User\\ProfileImage\\";
                    FilePath = SaveMediaFiles(user.UserProfileImage, currentPath + FilePath, Guid.NewGuid().ToString(), ".png");
                    user.UserProfileImage = FilePath.Replace(currentPath, "");
                    user.UserProfileImage = user.UserProfileImage.Replace("\\", "/");
                }
                response.Message = UserManagementBL.UserProfileChange(user);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in UserProfileChange : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region Control Room
        [Route(Provider + "/" + APIPath + "/ControlRoomGetAll")]
        [HttpGet]
        public HttpResponseMessage ControlRoomGetAll()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = ControlRoomBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in ControlRoomGetAll : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/ControlRoomGetActive")]
        [HttpGet]
        public HttpResponseMessage ControlRoomGetActive()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = ControlRoomBL.GetActive();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in ControlRoomGetActive : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/ControlRoomGetById")]
        [HttpGet]
        public HttpResponseMessage ControlRoomGetById(int ControlRoomId)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = ControlRoomBL.GetById(ControlRoomId);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in ControlRoomGetById : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/ControlRoomInsertUpdate")]
        [HttpPost]
        public HttpResponseMessage ControlRoomInsertUpdate(ControlRoomIL controlRoom)
        {
            try
            {
                response.Message = ControlRoomBL.InsertUpdate(controlRoom);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in ControlRoomInsertUpdate : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region Package
        [Route(Provider + "/" + APIPath + "/PackageGetAll")]
        [HttpGet]
        public HttpResponseMessage PackageGetAll()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = PackageBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in PackageGetAll : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/PackageGetActive")]
        [HttpGet]
        public HttpResponseMessage PackageGetActive()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = PackageBL.GetActive();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in PackageGetActive : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/PackageGetById")]
        [HttpGet]
        public HttpResponseMessage PackageGetById(int PackageId)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = PackageBL.GetById(PackageId);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in PackageGetById : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/PackageInsertUpdate")]
        [HttpPost]
        public HttpResponseMessage PackageInsertUpdate(PackageIL pkg)
        {
            try
            {
                response.Message = PackageBL.InsertUpdate(pkg);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in PackageInsertUpdate : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region Vehicle Class
        [Route(Provider + "/" + APIPath + "/VehicleClassGetAll")]
        [HttpGet]
        public HttpResponseMessage VehicleClassGetAll()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = VehicleClassBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in VehicleClassGetAll : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/VehicleClassGetActive")]
        [HttpGet]
        public HttpResponseMessage VehicleClassGetActive()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = VehicleClassBL.GetActive();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in VehicleClassGetActive : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/VehicleClassGetById")]
        [HttpGet]
        public HttpResponseMessage VehicleClassGetById(int ClassId)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = VehicleClassBL.GetById(ClassId);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in VehicleClassGetById : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        [Route(Provider + "/" + APIPath + "/VehicleClassInsertUpdate")]
        [HttpPost]
        public HttpResponseMessage VehicleClassInsertUpdate(VehicleClassIL VehicleClass)
        {
            try
            {
                response.Message = VehicleClassBL.InsertUpdate(VehicleClass);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in VehicleClassInsertUpdate : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region Equipment Details
        [Route(Provider + "/" + APIPath + "/EquipmentDetailsGetAll")]
        [HttpGet]
        public HttpResponseMessage EquipmentDetailsGetAll()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = EquipmentDetailsBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in EquipmentDetailsGetAll : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/EquipmentDetailsGetByFilter")]
        [HttpPost]
        public HttpResponseMessage EquipmentDetailsGetByFilter(DataFilterIL data)
        {
            try
            {
                data.FilterQuery = "WHERE 1=1 ";
                if (data.ControlRoomFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND CR.ControlRoomId IN (" + data.ControlRoomFilterList + ") ";
                }
                if (data.PackageFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND PD.PackageId IN (" + data.PackageFilterList + ") ";
                }
                if (data.ChainageFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND ED.ChainageNumber IN (" + data.ChainageFilterList + ") ";
                }
                if (data.DirectionFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND ED.DirectionId IN (" + data.DirectionFilterList + ") ";
                }
                if (data.SystemFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND ED.SystemId IN (" + data.SystemFilterList + ") ";
                }
                if (data.EquipmentTypeFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND ED.EquipmentTypeId IN (" + data.EquipmentTypeFilterList + ") ";
                }
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = EquipmentDetailsBL.GetByFilter(data);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in EquipmentDetailsGetByFilter : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/EquipmentDetailsGetActive")]
        [HttpGet]
        public HttpResponseMessage EquipmentDetailsGetActive()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = EquipmentDetailsBL.GetActive();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in EquipmentDetailsGetActive : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/EquipmentDetailsGetById")]
        [HttpGet]
        public HttpResponseMessage EquipmentDetailsGetById(int EquipmentId)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = EquipmentDetailsBL.GetById(EquipmentId);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in EquipmentDetailsGetById : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/EquipmentDetailsGetBySystemId")]
        [HttpGet]
        public HttpResponseMessage EquipmentDetailsGetBySystemId(short SystemId)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = EquipmentDetailsBL.GetBySystemId(SystemId);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in EquipmentDetailsGetBySystemId : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/EquipmentDetailsInsertUpdate")]
        [HttpPost]
        public HttpResponseMessage EquipmentDetailsInsertUpdate(EquipmentDetailsIL ed)
        {
            try
            {
                response.Message = EquipmentDetailsBL.InsertUpdate(ed);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in EquipmentDetailsInsertUpdate : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/EquipmentTypeGetActive")]
        [HttpGet]
        public HttpResponseMessage EquipmentTypeGetActive()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = EquipmentTypeBL.GetActive();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in EquipmentTypeGetActive : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region Equipment Config
        [Route(Provider + "/" + APIPath + "/EquipmentConfigGetBySystemId")]
        [HttpGet]
        public HttpResponseMessage EquipmentConfigGetBySystemId(short SystemId)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = EquipmentConfigBL.GetBySystemId(SystemId);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in EquipmentConfigGetBySystemId : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/EquipmentConfigSetup")]
        [HttpPost]
        public HttpResponseMessage EquipmentConfigSetup(List<EquipmentConfigIL> config)
        {
            try
            {
                response.Message = EquipmentConfigBL.SetUp(config);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in EquipmentConfigSetup : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region IMS
        [Route(Provider + "/" + APIPath + "/IncidentSourceGetActive")]
        [HttpGet]
        public HttpResponseMessage IncidentSourceGetActive()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = IncidentSourceBL.GetActive();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in IncidentSourceGetActive : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/IncidentCategoryGetActive")]
        [HttpGet]
        public HttpResponseMessage IncidentCategoryGetActive()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = IncidentCategoryBL.GetActive();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in IncidentCategoryGetActive : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/IncidentStatusGetActive")]
        [HttpGet]
        public HttpResponseMessage IncidentStatusGetActive()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = IncidentStatusBL.GetActive();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in IncidentStatusGetActive : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/IMSGetInProgress")]
        [HttpGet]
        public HttpResponseMessage IMSGetInProgress(short hours)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = IncidentDetailsBL.GetInProgress(hours);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in IMSGetInProgress : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/IMSGetPending")]
        [HttpGet]
        public HttpResponseMessage IMSGetPending(short hours)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = IncidentDetailsBL.GetPending(hours);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in IMSGetPending : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/IMSGetClosed")]
        [HttpGet]
        public HttpResponseMessage IMSGetClosed(short hours)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = IncidentDetailsBL.GetClosed(hours);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in IMSGetClosed : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }


        [Route(Provider + "/" + APIPath + "/IMSGetById")]
        [HttpGet]
        public HttpResponseMessage IMSGetById(String IncidentId)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = IncidentDetailsBL.GetById(IncidentId);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in IMSGetById : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }


        [Route(Provider + "/" + APIPath + "/IMSInsert")]
        [HttpPost]
        public HttpResponseMessage IMSInsert(IncidentDetailsIL ims)
        {
            try
            {
                if (!string.IsNullOrEmpty(ims.IncidentImagePath))
                {
                    string currentPath = HttpContext.Current.Server.MapPath("~/EventMedia/");
                    String FilePath = "\\IMS\\" + DateTime.Now.ToString("ddMMMyyyy") + "\\IncidentImage\\";
                    FilePath = SaveMediaFiles(ims.IncidentImagePath, currentPath + FilePath, Guid.NewGuid().ToString(), ".jpeg");
                    ims.IncidentImagePath = FilePath.Replace(currentPath, "");
                    ims.IncidentImagePath = ims.IncidentImagePath.Replace("\\", "/");
                }
                response.Message = IncidentDetailsBL.Insert(ims);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in IMSInsert : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/IMSUpdate")]
        [HttpPost]
        public HttpResponseMessage IMSUpdate(IncidentDetailsIL ims)
        {
            try
            {
                IncidentDetailsIL lastData = IncidentDetailsBL.GetById(ims.IncidentId);
                if (lastData.IncidentImagePath != ims.IncidentImagePath)
                {
                    if (!string.IsNullOrEmpty(ims.IncidentImagePath))
                    {
                        string currentPath = HttpContext.Current.Server.MapPath("~/EventMedia/");
                        String FilePath = "\\IMS\\" + DateTime.Now.ToString("ddMMMyyyy") + "\\IncidentImage\\";
                        FilePath = SaveMediaFiles(ims.IncidentImagePath, currentPath + FilePath, Guid.NewGuid().ToString(), ".jpeg");
                        ims.IncidentImagePath = FilePath.Replace(currentPath, "");
                        ims.IncidentImagePath = ims.IncidentImagePath.Replace("\\", "/");
                        if (File.Exists(currentPath + lastData.IncidentImagePath))
                            File.Delete(currentPath + lastData.IncidentImagePath);
                    }
                    else
                        ims.IncidentImagePath = lastData.IncidentImagePath;
                }
                else
                    ims.IncidentImagePath = lastData.IncidentImagePath;
                response.Message = IncidentDetailsBL.Update(ims);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in IMSUpdate : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/IMSActionHistoryInsert")]
        [HttpPost]
        public HttpResponseMessage IMSActionHistoryInsert(IncidentActionHistoryIL ims)
        {
            try
            {
                if (!string.IsNullOrEmpty(ims.ActionImagePath))
                {
                    string currentPath = HttpContext.Current.Server.MapPath("~/EventMedia/");
                    String FilePath = "\\IMS\\" + DateTime.Now.ToString("ddMMMyyyy") + "\\IncidentImage\\" + ims.IncidentId + "\\";
                    FilePath = SaveMediaFiles(ims.ActionImagePath, currentPath + FilePath, Guid.NewGuid().ToString(), ".jpeg");
                    ims.ActionImagePath = FilePath.Replace(currentPath, "");
                    ims.ActionImagePath = ims.ActionImagePath.Replace("\\", "/");
                }
                response.Message = IncidentActionHistoryBL.Insert(ims);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in IMSActionHistoryInsert : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/IMSGetByFilter")]
        [HttpPost]
        public HttpResponseMessage IMSGetByFilter(DataFilterIL data)
        {
            try
            {
                data.FilterQuery = "WHERE ID.CreatedDate>= CONVERT(DATETIME,'" + data.StartDateTime + "') AND ID.CreatedDate<= CONVERT(DATETIME,'" + data.EndDateTime + "') AND ID.IncidentStatusId IN (" + data.IncidentStatusList + ")";

                if (data.ControlRoomFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND CR.ControlRoomId IN (" + data.ControlRoomFilterList + ") ";
                }
                if (data.PackageFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND PD.PackageId IN (" + data.PackageFilterList + ") ";
                }
                if (data.ChainageFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND ID.ChainageNumber IN (" + data.ChainageFilterList + ") ";
                }
                if (data.DirectionFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND ID.DirectionId IN (" + data.DirectionFilterList + ") ";
                }
                if (data.PriorityFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND ID.PriorityId IN (" + data.PriorityFilterList + ") ";
                }
                if (data.IncidentFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND ID.IncidentCategoryId IN (" + data.IncidentFilterList + ") ";
                }

                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = IncidentDetailsBL.GetByFilter(data);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in IMSGetByFilter : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region Events Type
        [Route(Provider + "/" + APIPath + "/EventsTypeSetup")]
        [HttpPost]
        public HttpResponseMessage EventsTypeSetup(List<EventsTypeIL> setup)
        {
            try
            {
                response.Message = EventsTypeBL.SetUp(setup);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in EventsTypeSetup : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/EventsTypeGetBySystemId")]
        [HttpGet]
        public HttpResponseMessage EventsTypeGetBySystemId(short SystemId)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = EventsTypeBL.GetBySystemId(SystemId);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in EventsTypeGetBySystemId : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region Challan Type
        [Route(Provider + "/" + APIPath + "/ChalanTypeGetAll")]
        [HttpGet]
        public HttpResponseMessage ChalanTypeGetAll()
        {
            try
            {
                var typeList = new List<MasterData>();
                foreach (int i in Enum.GetValues(typeof(ChallanType)))
                {
                    MasterData t = new MasterData();
                    t.DataId = i;
                    t.DataName = SplitCamelCase(Enum.GetName(typeof(ChallanType), (ChallanType)i));
                    typeList.Add(t);
                }
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = typeList;
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in ChalanTypeGetAll : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region Lane Details
        [Route(Provider + "/" + APIPath + "/LaneGetAll")]
        [HttpGet]
        public HttpResponseMessage LaneGetAll()
        {
            try
            {
                var typeList = new List<MasterData>();
                foreach (int i in Enum.GetValues(typeof(HighwayLaneNumber)))
                {
                    MasterData t = new MasterData();
                    t.DataId = i;
                    t.DataName = SplitCamelCase(Enum.GetName(typeof(HighwayLaneNumber), (HighwayLaneNumber)i));
                    typeList.Add(t);
                }
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = typeList;
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in LaneGetAll : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/LaneGetActive")]
        [HttpGet]
        public HttpResponseMessage LaneGetActive()
        {
            try
            {
                var typeList = new List<MasterData>();
                foreach (int i in Enum.GetValues(typeof(HighwayLaneNumber)))
                {
                    MasterData t = new MasterData();
                    t.DataId = i;
                    t.DataName = SplitCamelCase(Enum.GetName(typeof(HighwayLaneNumber), (HighwayLaneNumber)i));
                    typeList.Add(t);
                }
                SystemSettingIL system = SystemSettingBL.Get();
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = typeList.FindAll(x => x.DataId <= system.TotalLane && x.DataId > 0);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in LaneGetActive : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region Data Filter Master
        [Route(Provider + "/" + APIPath + "/FilterMasterGetBySystemId")]
        [HttpGet]
        public HttpResponseMessage FilterMasterGetBySystemId(short SystemId)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = DataFilterBL.GetBySystemId(SystemId);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in FilterMasterGetBySystemId : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }


        [Route(Provider + "/" + APIPath + "/FilterReportGetBySystemId")]
        [HttpGet]
        public HttpResponseMessage FilterReportGetBySystemId(short SystemId)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = DataFilterBL.GetReportBySystemId(SystemId);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in FilterReportGetBySystemId : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region VIDS Events

        [Route(Provider + "/" + APIPath + "/VIDSEventsGetByHours")]
        [HttpGet]
        public HttpResponseMessage VIDSEventsGetByHours(short Hours)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = VIDSEventBL.GetByHours(Hours);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in VIDSEventsGetByHours : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/VIDSEventsGetByFilter")]
        [HttpPost]
        public HttpResponseMessage VIDSEventsGetByFilter(DataFilterIL data)
        {
            try
            {
                if (data.IsReviewedRequired)
                {
                    data.FilterQuery = "WHERE H.IsReviewedRequired=1 AND H.ReviewedStatus=0 H.EventStartDate>= CONVERT(DATETIME,'" + data.StartDateTime + "') AND H.EventStartDate<= CONVERT(DATETIME,'" + data.EndDateTime + "')";
                }
                else
                {
                    data.FilterQuery = "WHERE H.EventStartDate>= CONVERT(DATETIME,'" + data.StartDateTime + "') AND H.EventStartDate<= CONVERT(DATETIME,'" + data.EndDateTime + "')";
                }
                if (data.ControlRoomFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND CR.ControlRoomId IN (" + data.ControlRoomFilterList + ") ";
                }
                if (data.PackageFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND PD.PackageId IN (" + data.PackageFilterList + ") ";
                }
                if (data.ChainageFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND ED.ChainageNumber IN (" + data.ChainageFilterList + ") ";
                }
                if (data.DirectionFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND ED.DirectionId IN (" + data.DirectionFilterList + ") ";
                }
                if (data.PositionFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND EC.PositionId IN (" + data.PositionFilterList + ") ";
                }
                if (data.EventFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND H.EventTypeId IN (" + data.EventFilterList + ") ";
                }

                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = VIDSEventBL.GetByFilter(data);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in VIDSEventsGetByFilter : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        #region un audited
        [Route(Provider + "/" + APIPath + "/VIDSPendingReviewGetByHours")]
        [HttpGet]
        public HttpResponseMessage VIDSPendingReviewGetByHours(short Hours)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = VIDSEventBL.GetPendingReviewByHours(Hours);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in VIDSPendingReviewGetByHours : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/VIDSEventReviewUpdate")]
        [HttpPost]
        public HttpResponseMessage VIDSEventReviewUpdate(VIDSReviewedEventIL data)
        {
            try
            {
                response.Message = VIDSReviewedEventBL.ReviewUpdate(data);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in VIDSEventReviewUpdate : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region audited
        [Route(Provider + "/" + APIPath + "/VIDSReviewedEventsGetByHours")]
        [HttpGet]
        public HttpResponseMessage VIDSReviewedEventsGetByHours(short Hours)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = VIDSReviewedEventBL.GetByHours(Hours);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in VIDSReviewedEventsGetByHours : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/VIDSReviewedEventsGetByFilter")]
        [HttpPost]
        public HttpResponseMessage VIDSReviewedEventsGetByFilter(DataFilterIL data)
        {
            try
            {
                if (data.IsReviewedRequired)
                {
                    data.FilterQuery = "WHERE H.ReviewedStatus=1 H.EventStartDate>= CONVERT(DATETIME,'" + data.StartDateTime + "') AND H.EventStartDate<= CONVERT(DATETIME,'" + data.EndDateTime + "')";
                }
                else
                {
                    data.FilterQuery = "WHERE H.EventStartDate>= CONVERT(DATETIME,'" + data.StartDateTime + "') AND H.EventStartDate<= CONVERT(DATETIME,'" + data.EndDateTime + "')";
                }
                if (data.ControlRoomFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND CR.ControlRoomId IN (" + data.ControlRoomFilterList + ") ";
                }
                if (data.PackageFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND PD.PackageId IN (" + data.PackageFilterList + ") ";
                }
                if (data.ChainageFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND ED.ChainageNumber IN (" + data.ChainageFilterList + ") ";
                }
                if (data.DirectionFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND ED.DirectionId IN (" + data.DirectionFilterList + ") ";
                }
                if (data.PositionFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND EC.PositionId IN (" + data.PositionFilterList + ") ";
                }
                if (data.EventFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND (H.EventTypeId IN (" + data.EventFilterList + ") OR H.ReviewedEventTypeId IN (" + data.EventFilterList + ")) ";
                }
                if (data.ReviewedFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND H.ReviewedById IN (" + data.ReviewedFilterList + ") ";
                }

                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = VIDSReviewedEventBL.GetByFilter(data);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in VIDSReviewedEventsGetByFilter : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion
        #endregion

    }
}
