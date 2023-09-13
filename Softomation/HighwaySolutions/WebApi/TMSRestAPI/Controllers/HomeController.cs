using System.Collections.Generic;
using System.Data;
using System.Drawing.Printing;
using System.IO;
using System.Text.RegularExpressions;
using System;
using System.Web.Mvc;
using HighwaySoluations.Softomation.CommonLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary;
using HighwaySoluations.Softomation.TMSSystemLibrary.BL;
using HighwaySoluations.Softomation.TMSSystemLibrary.IL;
using HighwaySoluations.Softomation.TMSSystemLibrary.SystemConfigurations;
using Rotativa;
using Newtonsoft.Json;

namespace TMSRestAPI.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.AppVersion = SystemConstants.Version;
            ViewBag.Provider = HighwaySoluations.Softomation.CommonLibrary.Constants.AppProvider;
            ViewBag.Title = "Web API|Home";
            return View();
        }

        public ActionResult DataBase()
        {
            ViewBag.Title = "Web API|Config";
            ViewBag.Status = "Load";
            ViewBag.AppVersion = SystemConstants.Version;
            ViewBag.Provider = SystemConstants.AppProvider;
            DataBaseConfig dataBase = DataBaseConfig.Deserialize();
            return View(dataBase);
        }

        [HttpPost]
        public ActionResult DataBase(DataBaseConfig dataBase)
        {
            ViewBag.Title = "Web API|Config";
            ViewBag.AppVersion = SystemConstants.Version;
            ViewBag.Provider = SystemConstants.AppProvider;
            ViewBag.Status = "failed";
            if (ModelState.IsValid)
            {
                DataBaseConfig.Serialize(dataBase);
                ViewBag.Status = "success";
            }
            return View(dataBase);
        }

        public string FullReports(int Id, int PlazaId, string FileName, string SessionId)
        {
            string FilePath = string.Empty;
            try
            {
                string footer = "--footer-right \"Printed on: " + DateTime.Now.ToString("dd-MMM-yyyy HH:mm:ss") + "  Page: [page] of [toPage]\"" + " --footer-line --footer-font-size \"9\" --footer-spacing 6 --footer-font-name \"calibri light\"";

                var filePath = Path.Combine(Server.MapPath("/filter"), FileName);
                FilePath = filePath;
                //ReportManagementIL rpt = ReportManagementBL.GetById(Id);
                String CategoryName = Regex.Replace("Report_" + Id.ToString(), @"\s+", "");
                ActionAsPdf pdfResult;
                pdfResult = new ActionAsPdf(CategoryName, new {
                    PlazaId = PlazaId,
                    SessionId = SessionId,
                    rpt = CategoryName,
                    FileName = FileName,
                }) {
                    FileName = FileName,
                    PageSize = Rotativa.Options.Size.A4,
                    //PageOrientation = Rotativa.Options.Orientation.Landscape,
                    //PageMargins = new Margins(12, 12, 12, 12),// it’s in millimeters//PageWidth = 180, //PageHeight = 297,
                    CustomSwitches = footer,
                    SaveOnServerPath = filePath
                };
                var binary = pdfResult.BuildPdf(this.ControllerContext);
                File(binary, "application/pdf");
            }
            catch (Exception ex)
            {
                //throw ex;
            }
            return FilePath;
        }
        public ActionResult Report_6(int PlazaId, string SessionId, string rpt, string FileName)
        {
            DataFilterIL filter = new DataFilterIL();
            #region Read Json
            var filePath = Path.Combine(Server.MapPath("/filter"), FileName.Replace(".pdf", ".json"));
            using (StreamReader r = new StreamReader(filePath))
            {
                string json = r.ReadToEnd();
                filter = JsonConvert.DeserializeObject<DataFilterIL>(json);
            }
            try
            {
                if (System.IO.File.Exists(filePath))
                {
                    System.IO.File.Delete(filePath);
                }
            }
            catch (Exception ex)
            {

            }
            #endregion
            //#region Payment Type
            //if (filter.PaymentType == "0")
            //    filter.PaymentType = string.Empty;
            //else if (filter.PaymentType == "ALL")
            //    filter.PaymentType = "ALL";
            //else
            //{
            //    List<PaymentTypeIL> pt = PaymentTypeBL.GetAll();
            //    string[] subs = filter.PaymentType.Split(',');
            //    filter.PaymentType = string.Empty;
            //    foreach (string item in subs)
            //    {
            //        PaymentTypeIL result = pt.Find(e => e.EntryId == Convert.ToInt64(item));
            //        filter.PaymentType = filter.PaymentType + "," + result.PaymentTypeName;
            //    }
            //    filter.PaymentType = filter.PaymentType.TrimStart(',');
            //}
            //#endregion
            //#region Trans Type
            //if (filter.TranType == "0")
            //    filter.TranType = string.Empty;
            //else if (filter.TranType == "ALL")
            //    filter.TranType = "ALL";
            //else
            //{
            //    List<TransactionTypeIL> pt = TransactionTypeBL.GetAll();
            //    string[] subs = filter.TranType.Split(',');
            //    filter.TranType = string.Empty;
            //    foreach (string item in subs)
            //    {
            //        TransactionTypeIL result = pt.Find(e => e.EntryId == Convert.ToInt64(item));
            //        filter.TranType = filter.TranType + "," + result.TransactionTypeName;
            //    }
            //    filter.TranType = filter.TranType.TrimStart(',');
            //}
            //#endregion
            //#region Exempt Type
            //if (filter.ExemptType == "0")
            //    filter.ExemptType = string.Empty;
            //else if (filter.ExemptType == "ALL")
            //    filter.ExemptType = "ALL";
            //else
            //{
            //    List<ExemptTypeIL> pt = ExemptTypeBL.GetAll();
            //    string[] subs = filter.ExemptType.Split(',');
            //    filter.ExemptType = string.Empty;
            //    foreach (string item in subs)
            //    {
            //        ExemptTypeIL result = pt.Find(e => e.EntryId == Convert.ToInt64(item));
            //        filter.ExemptType = filter.ExemptType + "," + result.ExemptTypeName;
            //    }
            //    filter.ExemptType = filter.ExemptType.TrimStart(',');
            //}
            //#endregion
            //#region Vehicle Class
            //if (filter.VehicleClass == "0")
            //    filter.VehicleClass = string.Empty;
            //else if (filter.VehicleClass == "ALL")
            //    filter.VehicleClass = "ALL";
            //else
            //{
            //    List<VehicleClassIL> pt = VehicleClassBL.GetActive();
            //    string[] subs = filter.VehicleClass.Split(',');
            //    filter.VehicleClass = string.Empty;
            //    foreach (string item in subs)
            //    {
            //        VehicleClassIL result = pt.Find(e => e.ClassId == Convert.ToInt64(item));
            //        filter.VehicleClass = filter.VehicleClass + "," + result.ClassName;
            //    }
            //    filter.VehicleClass = filter.VehicleClass.TrimStart(',');
            //}
            //#endregion
            //#region Operator
            //if (filter.LaneUser == "0")
            //    filter.LaneUser = string.Empty;
            //else if (filter.LaneUser == "ALL")
            //    filter.LaneUser = "ALL";
            //else
            //{
            //    //List<UserManagementIL> pt = UserManagementBL.GetAllLaneUsers();
            //    List<UserManagementIL> pt = UserManagementBL.GetByLaneUsers(PlazaId);
            //    string[] subs = filter.LaneUser.Split(',');
            //    filter.LaneUser = string.Empty;
            //    foreach (string item in subs)
            //    {
            //        UserManagementIL result = pt.Find(e => e.EntryId == Convert.ToInt64(item));
            //        filter.LaneUser = filter.LaneUser + "," + result.LoginId;
            //    }
            //    filter.LaneUser = filter.LaneUser.TrimStart(',');
            //}
            //#endregion
            //#region Shift
            //if (filter.Shift == "0")
            //    filter.Shift = string.Empty;
            //else if (filter.Shift == "ALL")
            //    filter.Shift = "ALL";
            //else
            //{
            //    string[] subs = filter.Shift.Split(',');
            //    filter.Shift = string.Empty;
            //    foreach (string item in subs)
            //    {

            //        filter.Shift = filter.Shift + "," + "Shift " + item;
            //    }
            //    filter.Shift = filter.Shift.TrimStart(',');
            //}
            //#endregion
            //#region Lane
            //if (filter.Lane == "0")
            //    filter.Lane = string.Empty;
            //else if (filter.Lane == "ALL")
            //    filter.Lane = "ALL";
            //else
            //{
            //    string[] subs = filter.Lane.Split(',');
            //    filter.Lane = string.Empty;
            //    foreach (string item in subs)
            //    {
            //        filter.Lane = filter.Lane + "," + item;
            //    }
            //    filter.Lane = filter.Lane.TrimStart(',');
            //}
            //#endregion
            //#region Generated By
            //if (filter.GenratedBy == 0)
            //{
            //    ViewBag.GenratedBy = "toll360";
            //}
            //else
            //{
            //    UserManagementIL user = UserManagementBL.GetById((int)filter.GenratedBy);
            //    ViewBag.GenratedBy = user.LoginId;
            //}
            //#endregion
            ////PlazaManagementIL PlazaData = PlazaManagementBL.GetById(PlazaId);
            //PlazaConfigurationIL PlazaData = PlazaConfigurationBL.GetById(PlazaId);
            //ViewBag.PlazaData = PlazaData;
            //ViewBag.Filter = filter;
            //ViewBag.ReportName = rpt;
            //DataFilterIL data = new DataFilterIL();
            //data.PlazaId = (Int16)PlazaId;
            //data.VehicleClass = filter.VehicleClass;
            //data.QueryFilter = filter.QueryFilter;
            //data.SessionId = SessionId.Replace("CR-", "PR-");
            //data.StartDateTime = filter.StartDateTime;
            //data.EndDateTime = filter.EndDateTime;
            DataTable dt = new DataTable();//LaneTransactionBL.AVCAccuracyReviewed(data);
           // ViewData.Model = dt.AsEnumerable();
            return View(dt);
        }
    }
}