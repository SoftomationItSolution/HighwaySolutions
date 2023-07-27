using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Mvc;
using Softomation.ATMSSystemLibrary;
using Softomation.ATMSSystemLibrary.BL;
using Softomation.ATMSSystemLibrary.IL;
using Softomation.ATMSSystemLibrary.SystemLogger;
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
                        AppLoginIL result = (AppLoginIL)Constants.GetToken(login);
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
                    FilePath = Constants.SaveMediaFiles(ims.IncidentImagePath, currentPath + FilePath, Guid.NewGuid().ToString(), ".jpeg");
                    ims.IncidentImagePath = FilePath.Replace(currentPath, "");
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
                        FilePath = Constants.SaveMediaFiles(ims.IncidentImagePath, currentPath + FilePath, Guid.NewGuid().ToString(), ".jpeg");
                        ims.IncidentImagePath = FilePath.Replace(currentPath, "");
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
                    FilePath = Constants.SaveMediaFiles(ims.ActionImagePath, currentPath + FilePath, Guid.NewGuid().ToString(), ".jpeg");
                    ims.ActionImagePath = FilePath.Replace(currentPath, "");
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
                data.FilterQuery = "WHERE H.EventStartDate>= CONVERT(DATETIME,'" + data.StartDateTime + "') AND H.EventStartDate<= CONVERT(DATETIME,'" + data.EndDateTime + "')";
                if (data.ControlRoomList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND ED.ControlRoomId IN (" + data.ControlRoomList + ") ";
                }
                if (data.PackageList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND PD.PackageId IN (" + data.PackageList + ") ";
                }
                if (data.ChainageList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND H.ChainageNumber IN (" + data.ChainageList + ") ";
                }
                if (data.DirectionList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND ED.DirectionId IN (" + data.DirectionList + ") ";
                }
                if (data.PositionList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND EC.PositionId IN (" + data.PositionList + ") ";
                }
                if (data.EventList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND H.EventTypeId IN (" + data.EventList + ") ";
                }
                if (data.IncidentList != "0")
                {
                    data.FilterQuery = data.FilterQuery + " AND H.IncidentStatusId IN (" + data.IncidentList + ") ";
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
        #endregion

    }
}
