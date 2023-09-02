using System;
using System.Web;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Collections.Generic;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.BL;
using HighwaySoluations.Softomation.TMSSystemLibrary.SystemLogger;
using static HighwaySoluations.Softomation.CommonLibrary.Constants;
using static HighwaySoluations.Softomation.TMSSystemLibrary.SystemConstants;


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
                        SystemUserIL user = new SystemUserIL();
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
                    SystemUserIL objlogin = new SystemUserIL();
                    objlogin.LoginId = login.LoginId;
                    SystemUserIL obj = SystemUserBL.GetByLoginId(objlogin);
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

        #region System Setting
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

        [Route(Provider + "/" + APIPath + "/SystemSettingSetup")]
        [HttpPost]
        public HttpResponseMessage SystemSettingSetup(SystemSettingIL ss)
        {
            try
            {
                response.Message = SystemSettingBL.InsertUpdate(ss);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in SystemSettingSetup : " + ex.Message.ToString());
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
                UserManagementIL users = SystemUserBL.GetById((int)user.UserId);
                if (users == null || string.IsNullOrEmpty(users.LoginPassword))
                {
                    resp.AlertMessage = "User Details not found";
                    response.Message.Add(resp);
                    return Request.CreateResponse(HttpStatusCode.OK, response);
                }
                else
                {

                    if (user.LoginPassword == SystemConstants.Decrypt(users.LoginPassword))
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
        public HttpResponseMessage UserUpdatePassword(SystemUserIL user)
        {
            try
            {
                response.Message = SystemUserBL.UpdatePassword(user);
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
        public HttpResponseMessage UserConfigurationSetUp(SystemUserIL user)
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
                    response.Message = SystemUserBL.InsertUpdate(user);
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
                response.ResponseData = SystemUserBL.GetAll();
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
                response.ResponseData = SystemUserBL.GetById(UserId);
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
                UserManagementIL users = SystemUserBL.GetById(UserId);
                users.LoginPassword = SystemConstants.Decrypt(users.LoginPassword);
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
                response.ResponseData = SystemUserBL.GetByUserType(UserTypeId);
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
                response.ResponseData = SystemUserBL.GetBySystemUserType(UserTypeId, SystemId);
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
        public HttpResponseMessage UserProfileChange(SystemUserIL user)
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
                response.Message = SystemUserBL.UserProfileChange(user);
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

        #region System Integrator
        [Route(Provider + "/" + APIPath + "/SystemIntegratorGetAll")]
        [HttpGet]
        public HttpResponseMessage SystemIntegratorGetAll()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = SystemIntegratorBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in SystemIntegratorGetAll : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/SystemIntegratorGetActive")]
        [HttpGet]
        public HttpResponseMessage SystemIntegratorGetActive()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = SystemIntegratorBL.GetActive();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in SystemIntegratorGetActive : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/SystemIntegratorGetById")]
        [HttpGet]
        public HttpResponseMessage SystemIntegratorGetById(short SystemIntegratorId)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = SystemIntegratorBL.GetById(SystemIntegratorId);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in SystemIntegratorGetById : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/SystemIntegratorInsertUpdate")]
        [HttpPost]
        public HttpResponseMessage SystemIntegratorInsertUpdate(SystemIntegratorIL siManagement)
        {
            try
            {
                response.Message = SystemIntegratorBL.InsertUpdate(siManagement);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in SystemIntegratorInsertUpdate : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region Plaza Master
        [Route(Provider + "/" + APIPath + "/PlazaGetAll")]
        [HttpGet]
        public HttpResponseMessage PlazaGetAll()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = PlazaConfigurationBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in PlazaGetAll : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/PlazaGetActive")]
        [HttpGet]
        public HttpResponseMessage PlazaGetActive()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = PlazaConfigurationBL.GetActive();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in PlazaGetActive : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/PlazaGetById")]
        [HttpGet]
        public HttpResponseMessage PlazaGetById(short PlazaId)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = PlazaConfigurationBL.GetById(PlazaId);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in PlazaGetById : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/PlazaInsertUpdate")]
        [HttpPost]
        public HttpResponseMessage PlazaInsertUpdate(PlazaConfigurationIL plaza)
        {
            try
            {
                response.Message = PlazaConfigurationBL.InsertUpdate(plaza);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in PlazaInsertUpdate : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region Lane Master
        [Route(Provider + "/" + APIPath + "/LaneGetAll")]
        [HttpGet]
        public HttpResponseMessage LaneGetAll()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = LaneConfigurationBL.GetAll();
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
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = LaneConfigurationBL.GetActive();
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

        [Route(Provider + "/" + APIPath + "/LaneGetById")]
        [HttpGet]
        public HttpResponseMessage LaneGetById(short LaneId)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = LaneConfigurationBL.GetById(LaneId);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in LaneGetById : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/LaneGetByPlazaId")]
        [HttpGet]
        public HttpResponseMessage LaneGetByPlazaId(short PlazaId)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = LaneConfigurationBL.GetByPlazaId(PlazaId);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in LaneGetByPlazaId : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/LaneInsertUpdate")]
        [HttpPost]
        public HttpResponseMessage LaneInsertUpdate(LaneConfigurationIL plaza)
        {
            try
            {
                response.Message = LaneConfigurationBL.InsertUpdate(plaza);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in LaneInsertUpdate : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region Manufacture
        [Route(Provider + "/" + APIPath + "/ManufactureGetAll")]
        [HttpGet]
        public HttpResponseMessage ManufactureGetAll()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = ManufactureBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in ManufactureGetAll : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/ManufactureGetActive")]
        [HttpGet]
        public HttpResponseMessage ManufactureGetActive()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = ManufactureBL.GetActive();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in ManufactureGetActive : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/ManufactureGetById")]
        [HttpGet]
        public HttpResponseMessage ManufactureGetById(short ManufactureId)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = ManufactureBL.GetById(ManufactureId);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in ManufactureGetById : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/ManufactureInsertUpdate")]
        [HttpPost]
        public HttpResponseMessage ManufactureInsertUpdate(ManufactureIL mf)
        {
            try
            {
                response.Message = ManufactureBL.InsertUpdate(mf);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in ManufactureInsertUpdate : " + ex.Message.ToString());
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

        #region Transaction Type
        [Route(Provider + "/" + APIPath + "/TransactionTypeGetAll")]
        [HttpGet]
        public HttpResponseMessage TransactionTypeGetAll()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = TransactionTypeBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in TransactionTypeGetAll : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/TransactionTypeGetActive")]
        [HttpGet]
        public HttpResponseMessage TransactionTypeGetActive()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = TransactionTypeBL.GetActive();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in TransactionTypeGetActive : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/TransactionTypeUpdate")]
        [HttpPost]
        public HttpResponseMessage TransactionTypeInsertUpdate(List<TransactionTypeIL> ed)
        {
            try
            {
                response.Message = TransactionTypeBL.SetUp(ed);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in TransactionTypeUpdate : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region Payment Method Type
        [Route(Provider + "/" + APIPath + "/PaymentMethodTypeGetAll")]
        [HttpGet]
        public HttpResponseMessage PaymentMethodTypeGetAll()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = PaymentMethodTypeBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in PaymentMethodTypeGetAll : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/PaymentMethodTypeGetActive")]
        [HttpGet]
        public HttpResponseMessage PaymentMethodTypeGetActive()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = PaymentMethodTypeBL.GetActive();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in PaymentMethodTypeGetActive : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/PaymentMethodTypeUpdate")]
        [HttpPost]
        public HttpResponseMessage PaymentMethodTypeUpdate(List<PaymentMethodTypeIL> ed)
        {
            try
            {
                response.Message = PaymentMethodTypeBL.SetUp(ed);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in PaymentMethodTypeUpdate : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region Exempt Method Type
        [Route(Provider + "/" + APIPath + "/ExemptTypeGetAll")]
        [HttpGet]
        public HttpResponseMessage ExemptTypeGetAll()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = ExemptTypeBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in ExemptTypeGetAll : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/ExemptTypeGetActive")]
        [HttpGet]
        public HttpResponseMessage ExemptTypeGetActive()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = ExemptTypeBL.GetActive();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in ExemptTypeGetActive : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/ExemptTypeUpdate")]
        [HttpPost]
        public HttpResponseMessage ExemptTypeUpdate(List<ExemptTypeIL> ed)
        {
            try
            {
                response.Message = ExemptTypeBL.SetUp(ed);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in ExemptTypeUpdate : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region Vehicle Class
        #region FasTag Vehicle Class
        [Route(Provider + "/" + APIPath + "/FasTagVehicleClassGetAll")]
        [HttpGet]
        public HttpResponseMessage FasTagVehicleClassGetAll()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = FasTagVehicleClassBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in FasTagVehicleClassGetAll : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/FasTagVehicleClassGetActive")]
        [HttpGet]
        public HttpResponseMessage FasTagVehicleClassGetActive()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = FasTagVehicleClassBL.GetActive();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in FasTagVehicleClassGetActive : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/FasTagVehicleClassGetById")]
        [HttpGet]
        public HttpResponseMessage FasTagVehicleClassGetById(short FasTagVehicleClassId)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = FasTagVehicleClassBL.GetById(FasTagVehicleClassId);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in FasTagVehicleClassGetById : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/FasTagVehicleClassInsertUpdate")]
        [HttpPost]
        public HttpResponseMessage FasTagVehicleClassInsertUpdate(FasTagVehicleClassIL vc)
        {
            try
            {
                response.Message = FasTagVehicleClassBL.InsertUpdate(vc);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in FasTagVehicleClassInsertUpdate : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region System Vehicle Class
        [Route(Provider + "/" + APIPath + "/SystemVehicleClassGetAll")]
        [HttpGet]
        public HttpResponseMessage SystemVehicleClassGetAll()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = SystemVehicleClassBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in SystemVehicleClassGetAll : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/SystemVehicleClassGetActive")]
        [HttpGet]
        public HttpResponseMessage SystemVehicleClassGetActive()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = SystemVehicleClassBL.GetActive();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in SystemVehicleClassGetActive : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/SystemVehicleClassGetById")]
        [HttpGet]
        public HttpResponseMessage SystemVehicleClassGetById(short SystemVehicleClassId)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = SystemVehicleClassBL.GetById(SystemVehicleClassId);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in SystemVehicleClassGetById : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/SystemVehicleClassInsertUpdate")]
        [HttpPost]
        public HttpResponseMessage SystemVehicleClassInsertUpdate(SystemVehicleClassIL vc)
        {
            try
            {
                response.Message = SystemVehicleClassBL.InsertUpdate(vc);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in SystemVehicleClassInsertUpdate : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion
        #endregion

        #region Toll Fare
        [Route(Provider + "/" + APIPath + "/TollFareGetByEffectedFrom")]
        [HttpGet]
        public HttpResponseMessage GetByEffectedFrom(string EffectedFrom)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = TollFareBL.GetByEffectedFrom(EffectedFrom);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in TollFareGetByEffectedFrom : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/TollFareSetUp")]
        [HttpPost]
        public HttpResponseMessage TollFareSetUp(TollFareIL tollFare)
        {
            try
            {
                tollFare.EffectedFrom = Convert.ToDateTime(tollFare.EffectedFromStamp);
                if (DateTime.Now > tollFare.EffectedFrom)
                {
                    resp.AlertMessage = "Effected From must be future date!";
                    response.Message.Add(resp);
                    return Request.CreateResponse(HttpStatusCode.OK, response);
                }
                else
                {
                    response.Message = TollFareBL.SetUp(tollFare);
                    return Request.CreateResponse(HttpStatusCode.OK, response);
                }
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in TollFareSetUp : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region Denomination Master
        [Route(Provider + "/" + APIPath + "/DenominationGetActive")]
        [HttpGet]
        public HttpResponseMessage DenominationGetActive()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = DenominationBL.GetActive();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in DenominationGetActive : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region Float Transactions Type Master
        [Route(Provider + "/" + APIPath + "/FloatTransactionsTypeGetActive")]
        [HttpGet]
        public HttpResponseMessage FloatTransactionsTypeGetActive()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = FloatTransactionsTypeBL.GetActive();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in FloatTransactionsTypeGetActive : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region Shift Timining 
        [Route(Provider + "/" + APIPath + "/GetShiftTimining")]
        [HttpGet]
        public HttpResponseMessage GetShiftTimining()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = ShiftTiminingBL.GetActive();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in GetShiftTimining : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region Float Process
        [Route(Provider + "/" + APIPath + "/FloatProcessGetAll")]
        [HttpGet]
        public HttpResponseMessage FloatProcessGetAll()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = FloatProcessBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in FloatProcessGetAll : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        [Route(Provider + "/" + APIPath + "/FloatProcessGetById")]
        [HttpGet]
        public HttpResponseMessage FloatProcessGetById(Int64 FloatProcessId)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = FloatProcessBL.GetById(FloatProcessId);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in FloatProcessGetById : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/FloatProcessSetUp")]
        [HttpPost]
        public HttpResponseMessage FloatProcessSetUp(FloatProcessIL floatProcess)
        {
            try
            {
                bool process = true;
                floatProcess.TransactionDate = Convert.ToDateTime(floatProcess.TransactionDateStamp);
                ShiftTiminingIL shift = ShiftTiminingBL.GetById(floatProcess.ShiftId);
                SystemSettingIL system = SystemSettingBL.Get();
                string ShiftEndDateTime = floatProcess.TransactionDateStamp + " " + shift.EndTimming;
                string ShiftStartDateTime = floatProcess.TransactionDateStamp + " " + shift.StartTimmng;
                DateTime MaxAllowedTime = DateTime.Now.AddDays(system.AllotmentDays);
                if (floatProcess.FloatTransactionTypeId == 3)
                {
                    if (DateTime.Now > Convert.ToDateTime(ShiftEndDateTime))
                    {
                        process = false;
                        resp.AlertMessage = "Float can not assign for this shift.";
                        response.Message.Add(resp);
                    }
                    else if (Convert.ToDateTime(ShiftStartDateTime) > MaxAllowedTime)
                    {
                        process = false;
                        resp.AlertMessage = "Float can not assign for this future shift.";
                        response.Message.Add(resp);
                    }
                }
                else if (floatProcess.FloatTransactionTypeId == 4)
                {
                    if (Convert.ToDateTime(ShiftStartDateTime) > DateTime.Now || Convert.ToDateTime(ShiftEndDateTime) < DateTime.Now)
                    {
                        process = false;
                        resp.AlertMessage = "Float mid-shift can not process for this shift";
                        response.Message.Add(resp);
                    }
                }
                if (process)
                {
                    response.Message = FloatProcessBL.InsertUpdate(floatProcess);
                    return Request.CreateResponse(HttpStatusCode.OK, response);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.OK, response);
                }
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in FloatProcessSetUp : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region Shift Details
        [Route(Provider + "/" + APIPath + "/ShiftStatusGetAll")]
        [HttpGet]
        public HttpResponseMessage ShiftStatusGetAll()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = ShiftStatusBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in ShiftStatusGetAll : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/ShiftStatusGetClose")]
        [HttpGet]
        public HttpResponseMessage ShiftStatusGetClose()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = ShiftStatusBL.GetClose();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in ShiftStatusGetClose : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/ShiftStatusGetOpen")]
        [HttpGet]
        public HttpResponseMessage ShiftStatusGetOpen()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = ShiftStatusBL.GetOpen();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in ShiftStatusGetOpen : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region Lane Transactions
        [Route(Provider + "/" + APIPath + "/LaneTransactionGetAll")]
        [HttpGet]
        public HttpResponseMessage LaneTransactionGetAll()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = LaneTransactionBL.GetAll();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in LaneTransactionGetAll : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/LaneTransactionGetLatest")]
        [HttpGet]
        public HttpResponseMessage LaneTransactionGetLatest()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = LaneTransactionBL.GetLatest();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in LaneTransactionGetAll : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/ReviewPendingGetLatest")]
        [HttpGet]
        public HttpResponseMessage ReviewPendingGetLatest()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = LaneTransactionBL.GetUnReviewedLatest();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in ReviewPendingGetLatest : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

        [Route(Provider + "/" + APIPath + "/LaneTransactionGetByFilter")]
        [HttpPost]
        public HttpResponseMessage LaneTransactionGetByFilter(DataFilterIL data)
        {
            try
            {
                if (data.IsReviewedRequired)
                {
                    data.FilterQuery = "WHERE L.IsReviewedRequired=1 AND L.ReviewedStatus=0 AND CONVERT(DATE,L.TransactionDateTime) >= CONVERT(DATE,'" + data.StartDateTime + "') AND CONVERT(DATE,L.TransactionDateTime) <= CONVERT(DATE,'" + data.EndDateTime + "')";
                }
                else
                {
                    data.FilterQuery = "WHERE CONVERT(DATE,L.TransactionDateTime) >= CONVERT(DATE,'" + data.StartDateTime + "') AND CONVERT(DATE,L.TransactionDateTime) <= CONVERT(DATE,'" + data.EndDateTime + "')";
                }
                if (data.ShiftFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND L.ShiftId IN (" + data.ShiftFilterList + ") ";
                }
                if (data.TCUserFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND L.UserId IN (" + data.TCUserFilterList + ") ";
                }
                if (data.AuditerFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND L.ReveiwedBy IN (" + data.AuditerFilterList + ") ";
                }
                if (data.PlazaFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND L.PlazaId IN (" + data.PlazaFilterList + ") ";
                }
                if (data.LaneFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND L.LaneId IN (" + data.LaneFilterList + ") ";
                }
                if (data.TransactionTypeFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND L.TransactionTypeId IN (" + data.TransactionTypeFilterList + ") ";
                }
                if (data.VehicleClassFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND L.VehicleClassId IN (" + data.VehicleClassFilterList + ") ";
                }
                if (data.VehicleSubClassFilterList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND L.VehicleSubClassId IN (" + data.VehicleSubClassFilterList + ") ";
                }
                if (data.TransactionId > 0)
                {
                    data.FilterQuery = data.FilterQuery + " AND (L.MasterTransactionId = " + data.TransactionId + " OR L.PlazaTransactionId = " + data.TransactionId + " OR L.LaneTransactionId = " + data.TransactionId + ")";
                }

                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = LaneTransactionBL.GetByFilter(data);
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in LaneTransactionGetByFilter : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion

        #region Data Filter Master
        [Route(Provider + "/" + APIPath + "/FilterMasterGet")]
        [HttpGet]
        public HttpResponseMessage FilterMasterGet()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = DataFilterBL.Get();
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


        [Route(Provider + "/" + APIPath + "/FilterReportGet")]
        [HttpGet]
        public HttpResponseMessage FilterReportGet()
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = DataFilterBL.GetForReport();
                return Request.CreateResponse(HttpStatusCode.OK, response);
            }
            catch (Exception ex)
            {
                BackOfficeAPILog("Exception in FilterReportGet : " + ex.Message.ToString());
                resp.AlertMessage = ex.Message.ToString();
                response.Message.Add(resp);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }
        #endregion
    }
}
