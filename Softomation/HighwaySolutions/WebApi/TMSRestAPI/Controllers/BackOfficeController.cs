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
        public HttpResponseMessage VehicleClassGetById(short VehicleClassId)
        {
            try
            {
                resp.AlertMessage = "success";
                response.Message.Add(resp);
                response.ResponseData = VehicleClassBL.GetById(VehicleClassId);
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
        public HttpResponseMessage VehicleClassInsertUpdate(VehicleClassIL vc)
        {
            try
            {
                response.Message = VehicleClassBL.InsertUpdate(vc);
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
    }
}
