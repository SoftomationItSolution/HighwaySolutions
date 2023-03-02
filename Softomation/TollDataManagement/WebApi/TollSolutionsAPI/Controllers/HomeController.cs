using System;
using System.Web.Mvc;
using System.IO;
using Rotativa;
using Rotativa.Options;
using iTextSharp.text.pdf;
using Softomation.DMS.Libraries.CommonLibrary;
using Softomation.DMS.Libraries.CommonLibrary.BusinessLayer;
using Softomation.DMS.Libraries.CommonLibrary.InterfaceLayer;
using System.Text.RegularExpressions;
using System.Data;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Configuration;

namespace TollSolutionsAPI.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Title = "Welcome Rest API";
            ViewBag.AppVersion = Constants.Version;
            ViewBag.Provider = Constants.AppProvider;
            string mainPassword = Constants.Encrypt("Toll360@CCR");
            mainPassword = Constants.Encrypt("Etoll@123");
            mainPassword = Constants.Encrypt("soft@7890");
            mainPassword = Constants.Encrypt("sa");
            mainPassword = Constants.Decrypt("kVxO0p6c7X6Fiyqz/dN7Nw==");
            return View();
        }

        #region Cash Flow Alotment
        public string CashAlotment(long CashFlowId, int PlazaId, string FileName, int Type)
        {
            string FilePath = string.Empty;
            try
            {
                var filePath = Path.Combine(Server.MapPath("/reports"), FileName);
                FilePath = filePath;
                var pdfResult = new ActionAsPdf("CashAlotmentPrint", new {
                    CashFlowId = CashFlowId,
                    PlazaId = PlazaId,
                    Type = Type
                }) {
                    FileName = FileName,
                    PageSize = Size.A4,
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
        public ActionResult CashAlotmentPrint(long CashFlowId, int PlazaId, int Type)
        {
            PlazaManagementIL PlazaData = PlazaManagementBL.GetById(PlazaId);
            ViewBag.PlazaData = PlazaData;
            if (Type > 1)
                ViewBag.Type = "Duplicate";
            else
                ViewBag.Type = "Original";
            CashFlowConfigurationIL data = CashFlowConfigurationBL.GetById(CashFlowId);
            data.DenominationData = DenominationBL.GetCashAllotment(data.EntryId);
            return View(data);
        }
        #endregion

        #region Cash Flow Deposit
        public string CashDeposit(String ReceiptNumber, int PlazaId, string FileName, int Type)
        {
            string FilePath = string.Empty;
            try
            {
                var filePath = Path.Combine(Server.MapPath("/reports"), FileName);
                FilePath = filePath;
                var pdfResult = new ActionAsPdf("CashDepositPrint", new {
                    ReceiptNumber = ReceiptNumber,
                    PlazaId = PlazaId,
                    Type = Type
                }) {
                    FileName = FileName,
                    PageSize = Size.A4,
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
        public ActionResult CashDepositPrint(string ReceiptNumber, int PlazaId, int Type)
        {
            PlazaManagementIL PlazaData = PlazaManagementBL.GetById(PlazaId);
            ViewBag.PlazaData = PlazaData;
            CashFlowDepositIL Deositdata = CashFlowDepositBL.CashDepositGetByReceipt(ReceiptNumber);
            CashFlowConfigurationIL data = CashFlowConfigurationBL.GetById(Deositdata.CashFlowId);
            Deositdata.DepositData = DenominationBL.GetCashDeposit(Deositdata.CashFlowId, Deositdata.EntryId);
            data.ClearenceData = Deositdata;
            if (Type > 1)
                ViewBag.Type = "Duplicate";
            else
                ViewBag.Type = "Original";
            return View(data);
        }
        #endregion



        public ActionResult CashAlotmentTest(long CashFlowId, int PlazaId)
        {
            PlazaManagementIL PlazaData = PlazaManagementBL.GetById(PlazaId);
            ViewBag.PlazaData = PlazaData;
            CashFlowConfigurationIL data = CashFlowConfigurationBL.GetById(CashFlowId);
            data.DenominationData = DenominationBL.GetCashAllotment(data.EntryId);
            return View(data);
        }

        public string Reports(int Id, int PlazaId, string FileName, string SessionId)
        {
            string FilePath = string.Empty;
            try
            {
                string footer = "--footer-right \"Printed on: " + DateTime.Now.ToString("dd-MMM-yyyy HH:mm:ss") + "  Page: [page] of [toPage]\"" + " --footer-line --footer-font-size \"9\" --footer-spacing 6 --footer-font-name \"calibri light\"";

                var filePath = Path.Combine(Server.MapPath("/reports"), FileName);
                FilePath = filePath;
                ReportManagementIL rpt = ReportManagementBL.GetById(Id);
                String CategoryName = Regex.Replace("Report_" + rpt.EntryId.ToString(), @"\s+", "");
                ActionAsPdf pdfResult;
                if (rpt.EntryId == 28 || rpt.EntryId == 8 || rpt.EntryId == 11 || rpt.EntryId == 15 || rpt.EntryId == 22)
                {
                    pdfResult = new ActionAsPdf(CategoryName, new {
                        PlazaId = PlazaId,
                        SessionId = SessionId,
                        rpt = rpt.CategoryName,
                        FileName = FileName,

                    }) {
                        FileName = FileName,
                        PageSize =Size.A4,
                        PageOrientation = Rotativa.Options.Orientation.Landscape,
                        PageMargins = new Margins(12, 12, 12, 12),// it’s in millimeters
                        PageWidth = 180,
                        PageHeight = 297,
                        CustomSwitches = footer,
                        SaveOnServerPath = filePath
                    };
                }
                else
                {
                    pdfResult = new ActionAsPdf(CategoryName, new {
                        PlazaId = PlazaId,
                        SessionId = SessionId,
                        rpt = rpt.CategoryName,
                        FileName = FileName,
                    }) {
                        FileName = FileName,
                        PageSize = Size.A4,
                        //PageOrientation = Rotativa.Options.Orientation.Landscape,
                        PageMargins = new Margins(12, 12, 12, 12),// it’s in millimeters
                                                                  //PageWidth = 180,
                                                                  //PageHeight = 297,
                        CustomSwitches = footer,
                        SaveOnServerPath = filePath
                    };
                }
                var binary = pdfResult.BuildPdf(this.ControllerContext);
                File(binary, "application/pdf");

                //var beforePageNumber = String.Format("{0}.pdf", FileName.Replace(".pdf", "") + "_P");
                //var beforePagefilePath = Path.Combine(Server.MapPath("/reports"), beforePageNumber);
                //FilePath = Path.Combine(Server.MapPath("/reports"), FileName);
                //ReportManagementIL rpt = ReportManagementBL.GetById(Id);
                //String CategoryName = Regex.Replace(rpt.CategoryName, @"\s+", "");
                //var pdfResult = new ActionAsPdf(CategoryName, new {
                //    PlazaId = PlazaId,
                //    SessionId = SessionId,
                //    rpt = rpt.CategoryName,
                //    FileName = FileName
                //}) {
                //    FileName = FileName,
                //    PageSize = Rotativa.Options.Size.A4,
                //    PageOrientation = Rotativa.Options.Orientation.Landscape,
                //    PageMargins = new Margins(12, 12, 12, 12),// it’s in millimeters
                //    PageWidth = 180,
                //    PageHeight = 297,
                //    CustomSwitches = footer,
                //    SaveOnServerPath = beforePagefilePath
                //};
                //var binary = pdfResult.BuildPdf(this.ControllerContext);
                //File(binary, "application/pdf");
                //byte[] bytes = System.IO.File.ReadAllBytes(beforePagefilePath);
                //iTextSharp.text.Font blackFont = iTextSharp.text.FontFactory.GetFont("Arial", 9, iTextSharp.text.Font.NORMAL, iTextSharp.text.BaseColor.BLACK);
                //int pages = 0;
                //using (MemoryStream stream = new MemoryStream())
                //{
                //    PdfReader reader = new PdfReader(bytes);
                //    using (PdfStamper stamper = new PdfStamper(reader, stream))
                //    {
                //        pages = reader.NumberOfPages;
                //        for (int i = 1; i <= pages; i++)
                //        {

                //            ColumnText.ShowTextAligned(stamper.GetUnderContent(i), iTextSharp.text.Element.ALIGN_RIGHT, new iTextSharp.text.Phrase("Page " + i.ToString() + " of " + pages.ToString(), blackFont), 768f, 15f, 0);
                //        }
                //    }
                //    bytes = stream.ToArray();
                //}
                //System.IO.File.WriteAllBytes(FilePath, bytes);


                //File(binary, "application/pdf");

                //try
                //{
                //    if (System.IO.File.Exists(beforePagefilePath))
                //    {
                //        System.IO.File.Delete(beforePagefilePath);
                //    }
                //}
                //catch (Exception ex)
                //{


                //}
            }
            catch (Exception ex)
            {

                //throw ex;
            }
            return FilePath;
        }
        public ActionResult Report_8(int PlazaId, string SessionId, string rpt, string FileName)
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
            #region Payment Type
            if (filter.PaymentType == "0")
                filter.PaymentType = string.Empty;
            else if (filter.PaymentType == "ALL")
                filter.PaymentType = "ALL";
            else
            {
                List<PaymentTypeIL> pt = PaymentTypeBL.GetAll();
                string[] subs = filter.PaymentType.Split(',');
                filter.PaymentType = string.Empty;
                foreach (string item in subs)
                {
                    PaymentTypeIL result = pt.Find(e => e.EntryId == Convert.ToInt64(item));
                    filter.PaymentType = filter.PaymentType + "," + result.PaymentTypeName;
                }
                filter.PaymentType = filter.PaymentType.TrimStart(',');
            }
            #endregion
            #region Trans Type
            if (filter.TranType == "0")
                filter.TranType = string.Empty;
            else if (filter.TranType == "ALL")
                filter.TranType = "ALL";
            else
            {
                List<TransactionTypeIL> pt = TransactionTypeBL.GetAll();
                string[] subs = filter.TranType.Split(',');
                filter.TranType = string.Empty;
                foreach (string item in subs)
                {
                    TransactionTypeIL result = pt.Find(e => e.EntryId == Convert.ToInt64(item));
                    filter.TranType = filter.TranType + "," + result.TransactionTypeName;
                }
                filter.TranType = filter.TranType.TrimStart(',');
            }
            #endregion
            #region Exempt Type
            if (filter.ExemptType == "0")
                filter.ExemptType = string.Empty;
            else if (filter.ExemptType == "ALL")
                filter.ExemptType = "ALL";
            else
            {
                List<ExemptTypeIL> pt = ExemptTypeBL.GetAll();
                string[] subs = filter.ExemptType.Split(',');
                filter.ExemptType = string.Empty;
                foreach (string item in subs)
                {
                    ExemptTypeIL result = pt.Find(e => e.EntryId == Convert.ToInt64(item));
                    filter.ExemptType = filter.ExemptType + "," + result.ExemptTypeName;
                }
                filter.ExemptType = filter.ExemptType.TrimStart(',');
            }
            #endregion
            #region Vehicle Class
            if (filter.VehicleClass == "0")
                filter.VehicleClass = string.Empty;
            else if (filter.VehicleClass == "ALL")
                filter.VehicleClass = "ALL";
            else
            {
                List<VehicleClassIL> pt = VehicleClassBL.GetActive();
                string[] subs = filter.VehicleClass.Split(',');
                filter.VehicleClass = string.Empty;
                foreach (string item in subs)
                {
                    VehicleClassIL result = pt.Find(e => e.ClassId == Convert.ToInt64(item));
                    filter.VehicleClass = filter.VehicleClass + "," + result.ClassName;
                }
                filter.VehicleClass = filter.VehicleClass.TrimStart(',');
            }
            #endregion
            #region Operator
            if (filter.LaneUser == "0")
                filter.LaneUser = string.Empty;
            else if (filter.LaneUser == "ALL")
                filter.LaneUser = "ALL";
            else
            {
                List<UserManagementIL> pt = UserManagementBL.GetAllLaneUsers();
                string[] subs = filter.LaneUser.Split(',');
                filter.LaneUser = string.Empty;
                foreach (string item in subs)
                {
                    UserManagementIL result = pt.Find(e => e.EntryId == Convert.ToInt64(item));
                    filter.LaneUser = filter.LaneUser + "," + result.LoginId;
                }
                filter.LaneUser = filter.LaneUser.TrimStart(',');
            }
            #endregion
            #region Shift
            if (filter.Shift == "0")
                filter.Shift = string.Empty;
            else if (filter.Shift == "ALL")
                filter.Shift = "ALL";
            else
            {
                string[] subs = filter.Shift.Split(',');
                filter.Shift = string.Empty;
                foreach (string item in subs)
                {

                    filter.Shift = filter.Shift + "," + "Shift " + item;
                }
                filter.Shift = filter.Shift.TrimStart(',');
            }
            #endregion
            #region Lane
            if (filter.Lane == "0")
                filter.Lane = string.Empty;
            else if (filter.Lane == "ALL")
                filter.Lane = "ALL";
            else
            {
                string[] subs = filter.Lane.Split(',');
                filter.Lane = string.Empty;
                foreach (string item in subs)
                {
                    filter.Lane = filter.Lane + "," + item;
                }
                filter.Lane = filter.Lane.TrimStart(',');
            }
            #endregion
            #region Generated By
            if (filter.GenratedBy == 0)
            {
                ViewBag.GenratedBy = "toll360";
            }
            else
            {
                UserManagementIL user = UserManagementBL.GetById((int)filter.GenratedBy);
                ViewBag.GenratedBy = user.LoginId;
            }
            #endregion
            PlazaManagementIL PlazaData = PlazaManagementBL.GetById(PlazaId);
            ViewBag.PlazaData = PlazaData;
            ViewBag.Filter = filter;
            ViewBag.ReportName = rpt;
            DataFilterIL data = new DataFilterIL();
            data.PlazaId = (Int16)PlazaId;
            data.SessionId = SessionId.Replace("CR-", "PR-");
            data.StartDateTime = filter.StartDateTime;
            data.EndDateTime = filter.EndDateTime;
            DataTable dt = LaneTransactionBL.CancelTransactionDetailReport(data);
            //ViewData.Model = dt.AsEnumerable();
            return View(dt);
        }
        public ActionResult Report_9(int PlazaId, string SessionId, string rpt, string FileName)
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
            #region Operator
            if (filter.LaneUser == "0")
                filter.LaneUser = string.Empty;
            else if (filter.LaneUser == "ALL")
                filter.LaneUser = "ALL";
            else
            {
                List<UserManagementIL> pt = UserManagementBL.GetAllLaneUsers();
                string[] subs = filter.LaneUser.Split(',');
                filter.LaneUser = string.Empty;
                foreach (string item in subs)
                {
                    UserManagementIL result = pt.Find(e => e.EntryId == Convert.ToInt64(item));
                    filter.LaneUser = filter.LaneUser + "," + result.LoginId;
                }
                filter.LaneUser = filter.LaneUser.TrimStart(',');
            }
            #endregion
            #region Shift
            if (filter.Shift == "0")
                filter.Shift = string.Empty;
            else if (filter.Shift == "ALL")
                filter.Shift = "ALL";
            else
            {
                string[] subs = filter.Shift.Split(',');
                filter.Shift = string.Empty;
                foreach (string item in subs)
                {

                    filter.Shift = filter.Shift + "," + "Shift " + item;
                }
                filter.Shift = filter.Shift.TrimStart(',');
            }
            #endregion
            #region Lane
            if (filter.Lane == "0")
                filter.Lane = string.Empty;
            else if (filter.Lane == "ALL")
                filter.Lane = "ALL";
            else
            {
                string[] subs = filter.Lane.Split(',');
                filter.Lane = string.Empty;
                foreach (string item in subs)
                {
                    filter.Lane = filter.Lane + "," + item;
                }
                filter.Lane = filter.Lane.TrimStart(',');
            }
            #endregion
            #region Generated By
            if (filter.GenratedBy == 0)
            {
                ViewBag.GenratedBy = "toll360";
            }
            else
            {
                UserManagementIL user = UserManagementBL.GetById((int)filter.GenratedBy);
                ViewBag.GenratedBy = user.LoginId;
            }
            #endregion
            PlazaManagementIL PlazaData = PlazaManagementBL.GetById(PlazaId);
            ViewBag.PlazaData = PlazaData;
            ViewBag.Filter = filter;
            ViewBag.ReportName = rpt;
            DataFilterIL data = new DataFilterIL();
            data.PlazaId = (Int16)PlazaId;
            data.StartDateTime = filter.StartDateTime;
            data.EndDateTime = filter.EndDateTime;
            data.SessionId = SessionId.Replace("CR-", "PR-");
            DataSet ds = CashFlowConfigurationBL.CashUPReport(data);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                ViewBag.AmountAlloted = Convert.ToDecimal(dt.Rows[0]["AmountAlloted"]);
                ViewBag.AmountCollection = Convert.ToDecimal(dt.Rows[0]["AmountCollection"]);
                ViewBag.DepositedAmount = Convert.ToDecimal(dt.Rows[0]["DepositedAmount"]);
                ViewBag.PendingAmount = Convert.ToDecimal(dt.Rows[0]["PendingAmount"]);
            }
            else
            {
                ViewBag.AmountAlloted = 0;
                ViewBag.AmountCollection = 0;
                ViewBag.DepositedAmount = 0;
                ViewBag.PendingAmount = 0;
            }
            //DataTable dtSumery = ds.Tables[1];
            //DataTable dtAlootment = ds.Tables[2];
            //DataTable dtDepost = ds.Tables[3];
            return View(ds);
        }
        public ActionResult Report_11(int PlazaId, string SessionId, string rpt, string FileName)
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

            #region Trans Type
            if (filter.TranType == "0")
                filter.TranType = string.Empty;
            else if (filter.TranType == "ALL")
                filter.TranType = "ALL";
            else
            {
                List<TransactionTypeIL> pt = TransactionTypeBL.GetAll();
                string[] subs = filter.TranType.Split(',');
                filter.TranType = string.Empty;
                foreach (string item in subs)
                {
                    TransactionTypeIL result = pt.Find(e => e.EntryId == Convert.ToInt64(item));
                    filter.TranType = filter.TranType + "," + result.TransactionTypeName;
                }
                filter.TranType = filter.TranType.TrimStart(',');
            }
            #endregion
            #region Lane
            if (filter.Lane == "0")
                filter.Lane = string.Empty;
            else if (filter.Lane == "ALL")
                filter.Lane = "ALL";
            else
            {
                string[] subs = filter.Lane.Split(',');
                filter.Lane = string.Empty;
                foreach (string item in subs)
                {
                    filter.Lane = filter.Lane + "," + item;
                }
                filter.Lane = filter.Lane.TrimStart(',');
            }
            #endregion
            #region Vehicle Class
            string VehicleClass = filter.VehicleClass;
            if (filter.VehicleClass == "0")
                filter.VehicleClass = string.Empty;
            else if (filter.VehicleClass == "ALL")
                filter.VehicleClass = "ALL";
            else
            {
                List<VehicleClassIL> pt = VehicleClassBL.GetActive();
                string[] subs = filter.VehicleClass.Split(',');
                filter.VehicleClass = string.Empty;
                foreach (string item in subs)
                {
                    VehicleClassIL result = pt.Find(e => e.ClassId == Convert.ToInt64(item));
                    filter.VehicleClass = filter.VehicleClass + "," + result.ClassName;
                }
                filter.VehicleClass = filter.VehicleClass.TrimStart(',');
            }
            #endregion
            #region Operator
            if (filter.LaneUser == "0")
                filter.LaneUser = string.Empty;
            else if (filter.LaneUser == "ALL")
                filter.LaneUser = "ALL";
            else
            {
                List<UserManagementIL> pt = UserManagementBL.GetAllLaneUsers();
                string[] subs = filter.LaneUser.Split(',');
                filter.LaneUser = string.Empty;
                foreach (string item in subs)
                {
                    UserManagementIL result = pt.Find(e => e.EntryId == Convert.ToInt64(item));
                    if (result != null)
                        filter.LaneUser = filter.LaneUser + "," + result.LoginId;
                }
                filter.LaneUser = filter.LaneUser.TrimStart(',');
            }
            #endregion
            #region Shift
            if (filter.Shift == "0")
                filter.Shift = string.Empty;
            else if (filter.Shift == "ALL")
                filter.Shift = "ALL";
            else
            {
                string[] subs = filter.Shift.Split(',');
                filter.Shift = string.Empty;
                foreach (string item in subs)
                {

                    filter.Shift = filter.Shift + "," + "Shift " + item;
                }
                filter.Shift = filter.Shift.TrimStart(',');
            }
            #endregion
            #region Generated By
            if (filter.GenratedBy == 0)
            {
                ViewBag.GenratedBy = "toll360";
            }
            else
            {
                UserManagementIL user = UserManagementBL.GetById((int)filter.GenratedBy);
                ViewBag.GenratedBy = user.LoginId;
            }
            #endregion
            PlazaManagementIL PlazaData = PlazaManagementBL.GetById(PlazaId);
            ViewBag.PlazaData = PlazaData;
            ViewBag.Filter = filter;
            ViewBag.ReportName = rpt;
            DataFilterIL data = new DataFilterIL();
            data.PlazaId = (Int16)PlazaId;
            data.VehicleClass = VehicleClass;
            data.SessionId = SessionId.Replace("CR-", "PR-");
            data.StartDateTime = filter.StartDateTime;
            data.EndDateTime = filter.EndDateTime;
            DataTable dt = LaneTransactionBL.TrafficRevenueConsolidatedReport(data);
            return View(dt);
        }
        public ActionResult Report_15(int PlazaId, string SessionId, string rpt, string FileName)
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

            #region Trans Type
            if (filter.TranType == "0")
                filter.TranType = string.Empty;
            else if (filter.TranType == "ALL")
                filter.TranType = "ALL";
            else
            {
                List<TransactionTypeIL> pt = TransactionTypeBL.GetAll();
                string[] subs = filter.TranType.Split(',');
                filter.TranType = string.Empty;
                foreach (string item in subs)
                {
                    TransactionTypeIL result = pt.Find(e => e.EntryId == Convert.ToInt64(item));
                    filter.TranType = filter.TranType + "," + result.TransactionTypeName;
                }
                filter.TranType = filter.TranType.TrimStart(',');
            }
            #endregion
            #region Lane
            if (filter.Lane == "0")
                filter.Lane = string.Empty;
            else if (filter.Lane == "ALL")
                filter.Lane = "ALL";
            else
            {
                string[] subs = filter.Lane.Split(',');
                filter.Lane = string.Empty;
                foreach (string item in subs)
                {
                    filter.Lane = filter.Lane + "," + item;
                }
                filter.Lane = filter.Lane.TrimStart(',');
            }
            #endregion
            #region Vehicle Class
            string VehicleClass = filter.VehicleClass;
            if (filter.VehicleClass == "0")
                filter.VehicleClass = string.Empty;
            else if (filter.VehicleClass == "ALL")
                filter.VehicleClass = "ALL";
            else
            {
                List<VehicleClassIL> pt = VehicleClassBL.GetActive();
                string[] subs = filter.VehicleClass.Split(',');
                filter.VehicleClass = string.Empty;
                foreach (string item in subs)
                {
                    VehicleClassIL result = pt.Find(e => e.ClassId == Convert.ToInt64(item));
                    filter.VehicleClass = filter.VehicleClass + "," + result.ClassName;
                }
                filter.VehicleClass = filter.VehicleClass.TrimStart(',');
            }
            #endregion
            #region Operator
            if (filter.LaneUser == "0")
                filter.LaneUser = string.Empty;
            else if (filter.LaneUser == "ALL")
                filter.LaneUser = "ALL";
            else
            {
                List<UserManagementIL> pt = UserManagementBL.GetAllLaneUsers();
                string[] subs = filter.LaneUser.Split(',');
                filter.LaneUser = string.Empty;
                foreach (string item in subs)
                {
                    UserManagementIL result = pt.Find(e => e.EntryId == Convert.ToInt64(item));
                    if (result != null)
                        filter.LaneUser = filter.LaneUser + "," + result.LoginId;
                }
                filter.LaneUser = filter.LaneUser.TrimStart(',');
            }
            #endregion
            #region Shift
            if (filter.Shift == "0")
                filter.Shift = string.Empty;
            else if (filter.Shift == "ALL")
                filter.Shift = "ALL";
            else
            {
                string[] subs = filter.Shift.Split(',');
                filter.Shift = string.Empty;
                foreach (string item in subs)
                {

                    filter.Shift = filter.Shift + "," + "Shift " + item;
                }
                filter.Shift = filter.Shift.TrimStart(',');
            }
            #endregion
            #region Generated By
            if (filter.GenratedBy == 0)
            {
                ViewBag.GenratedBy = "toll360";
            }
            else
            {
                UserManagementIL user = UserManagementBL.GetById((int)filter.GenratedBy);
                ViewBag.GenratedBy = user.LoginId;
            }
            #endregion

            PlazaManagementIL PlazaData = PlazaManagementBL.GetById(PlazaId);
            ViewBag.PlazaData = PlazaData;
            ViewBag.Filter = filter;
            ViewBag.ReportName = rpt;
            DataFilterIL data = new DataFilterIL();
            data.PlazaId = (Int16)PlazaId;
            data.VehicleClass = VehicleClass;
            data.StartDateTime = filter.StartDateTime;
            data.EndDateTime = filter.EndDateTime;
            data.SessionId = SessionId.Replace("CR-", "PR-");
            DataTable dt = LaneTransactionBL.TrafficRevenueSummaryReport(data);
            return View(dt);
        }
        public ActionResult Report_18(int PlazaId, string SessionId, string rpt, string FileName)
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
            #region Operator
            if (filter.LaneUser == "0")
                filter.LaneUser = string.Empty;
            else if (filter.LaneUser == "ALL")
                filter.LaneUser = "ALL";
            else
            {
                List<UserManagementIL> pt = UserManagementBL.GetAllLaneUsers();
                string[] subs = filter.LaneUser.Split(',');
                filter.LaneUser = string.Empty;
                foreach (string item in subs)
                {
                    UserManagementIL result = pt.Find(e => e.EntryId == Convert.ToInt64(item));
                    filter.LaneUser = filter.LaneUser + "," + result.LoginId;
                }
                filter.LaneUser = filter.LaneUser.TrimStart(',');
            }
            #endregion
            #region Shift
            if (filter.Shift == "0")
                filter.Shift = string.Empty;
            else if (filter.Shift == "ALL")
                filter.Shift = "ALL";
            else
            {
                string[] subs = filter.Shift.Split(',');
                filter.Shift = string.Empty;
                foreach (string item in subs)
                {

                    filter.Shift = filter.Shift + "," + "Shift " + item;
                }
                filter.Shift = filter.Shift.TrimStart(',');
            }
            #endregion
            #region Lane
            if (filter.Lane == "0")
                filter.Lane = string.Empty;
            else if (filter.Lane == "ALL")
                filter.Lane = "ALL";
            else
            {
                string[] subs = filter.Lane.Split(',');
                filter.Lane = string.Empty;
                foreach (string item in subs)
                {
                    filter.Lane = filter.Lane + "," + item;
                }
                filter.Lane = filter.Lane.TrimStart(',');
            }
            #endregion
            #region Generated By
            if (filter.GenratedBy == 0)
            {
                ViewBag.GenratedBy = "toll360";
            }
            else
            {
                UserManagementIL user = UserManagementBL.GetById((int)filter.GenratedBy);
                ViewBag.GenratedBy = user.LoginId;
            }
            #endregion
            PlazaManagementIL PlazaData = PlazaManagementBL.GetById(PlazaId);
            ViewBag.PlazaData = PlazaData;
            ViewBag.Filter = filter;
            ViewBag.ReportName = rpt;
            DataFilterIL data = new DataFilterIL();
            data.PlazaId = (Int16)PlazaId;
            data.StartDateTime = filter.StartDateTime;
            data.EndDateTime = filter.EndDateTime;
            data.SessionId = SessionId.Replace("CR-", "PR-");
            DataTable dt = CashFlowConfigurationBL.UserClearanceDetailReport(data);
            return View(dt);
        }
        public ActionResult Report_22(int PlazaId, string SessionId, string rpt, string FileName)
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
            #region Operator
            if (filter.LaneUser == "0")
                filter.LaneUser = string.Empty;
            else if (filter.LaneUser == "ALL")
                filter.LaneUser = "ALL";
            else
            {
                List<UserManagementIL> pt = UserManagementBL.GetAllLaneUsers();
                string[] subs = filter.LaneUser.Split(',');
                filter.LaneUser = string.Empty;
                foreach (string item in subs)
                {
                    UserManagementIL result = pt.Find(e => e.EntryId == Convert.ToInt64(item));
                    filter.LaneUser = filter.LaneUser + "," + result.LoginId;
                }
                filter.LaneUser = filter.LaneUser.TrimStart(',');
            }
            #endregion
            #region Shift
            if (filter.Shift == "0")
                filter.Shift = string.Empty;
            else if (filter.Shift == "ALL")
                filter.Shift = "ALL";
            else
            {
                string[] subs = filter.Shift.Split(',');
                filter.Shift = string.Empty;
                foreach (string item in subs)
                {

                    filter.Shift = filter.Shift + "," + "Shift " + item;
                }
                filter.Shift = filter.Shift.TrimStart(',');
            }
            #endregion
            #region Lane
            if (filter.Lane == "0")
                filter.Lane = string.Empty;
            else if (filter.Lane == "ALL")
                filter.Lane = "ALL";
            else
            {
                string[] subs = filter.Lane.Split(',');
                filter.Lane = string.Empty;
                foreach (string item in subs)
                {
                    filter.Lane = filter.Lane + "," + item;
                }
                filter.Lane = filter.Lane.TrimStart(',');
            }
            #endregion
            #region Vehicle Class
            string VehicleClass = filter.VehicleClass;
            if (filter.VehicleClass == "0")
                filter.VehicleClass = string.Empty;
            else if (filter.VehicleClass == "ALL")
                filter.VehicleClass = "ALL";
            else
            {
                List<VehicleClassIL> pt = VehicleClassBL.GetActive();
                string[] subs = filter.VehicleClass.Split(',');
                filter.VehicleClass = string.Empty;
                foreach (string item in subs)
                {
                    VehicleClassIL result = pt.Find(e => e.ClassId == Convert.ToInt64(item));
                    filter.VehicleClass = filter.VehicleClass + "," + result.ClassName;
                }
                filter.VehicleClass = filter.VehicleClass.TrimStart(',');
            }
            #endregion
            #region Exempt Type
            if (filter.ExemptType == "0")
                filter.ExemptType = string.Empty;
            else if (filter.ExemptType == "ALL")
                filter.ExemptType = "ALL";
            else
            {
                List<ExemptTypeIL> pt = ExemptTypeBL.GetAll();
                string[] subs = filter.ExemptType.Split(',');
                filter.ExemptType = string.Empty;
                foreach (string item in subs)
                {
                    ExemptTypeIL result = pt.Find(e => e.EntryId == Convert.ToInt64(item));
                    filter.ExemptType = filter.ExemptType + "," + result.ExemptTypeName;
                }
                filter.ExemptType = filter.ExemptType.TrimStart(',');
            }
            #endregion
            #region Generated By
            if (filter.GenratedBy == 0)
            {
                ViewBag.GenratedBy = "toll360";
            }
            else
            {
                UserManagementIL user = UserManagementBL.GetById((int)filter.GenratedBy);
                ViewBag.GenratedBy = user.LoginId;
            }
            #endregion
            PlazaManagementIL PlazaData = PlazaManagementBL.GetById(PlazaId);
            ViewBag.PlazaData = PlazaData;
            ViewBag.Filter = filter;
            ViewBag.ReportName = rpt;
            DataFilterIL data = new DataFilterIL();
            data.PlazaId = (Int16)PlazaId;
            data.StartDateTime = filter.StartDateTime;
            data.EndDateTime = filter.EndDateTime;
            data.VehicleClass = VehicleClass;
            data.SessionId = SessionId.Replace("CR-", "PR-");
            DataSet ds = LaneTransactionBL.ExemptVehicleDetailReport(data);
            return View(ds);
        }
        public ActionResult Report_28(int PlazaId, string SessionId, string rpt, string FileName)
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
            #region Payment Type
            if (filter.PaymentType == "0")
                filter.PaymentType = string.Empty;
            else if (filter.PaymentType == "ALL")
                filter.PaymentType = "ALL";
            else
            {
                List<PaymentTypeIL> pt = PaymentTypeBL.GetAll();
                string[] subs = filter.PaymentType.Split(',');
                filter.PaymentType = string.Empty;
                foreach (string item in subs)
                {
                    PaymentTypeIL result = pt.Find(e => e.EntryId == Convert.ToInt64(item));
                    filter.PaymentType = filter.PaymentType + "," + result.PaymentTypeName;
                }
                filter.PaymentType = filter.PaymentType.TrimStart(',');
            }
            #endregion
            #region Trans Type
            if (filter.TranType == "0")
                filter.TranType = string.Empty;
            else if (filter.TranType == "ALL")
                filter.TranType = "ALL";
            else
            {
                List<TransactionTypeIL> pt = TransactionTypeBL.GetAll();
                string[] subs = filter.TranType.Split(',');
                filter.TranType = string.Empty;
                foreach (string item in subs)
                {
                    TransactionTypeIL result = pt.Find(e => e.EntryId == Convert.ToInt64(item));
                    filter.TranType = filter.TranType + "," + result.TransactionTypeName;
                }
                filter.TranType = filter.TranType.TrimStart(',');
            }
            #endregion
            #region Exempt Type
            if (filter.ExemptType == "0")
                filter.ExemptType = string.Empty;
            else if (filter.ExemptType == "ALL")
                filter.ExemptType = "ALL";
            else
            {
                List<ExemptTypeIL> pt = ExemptTypeBL.GetAll();
                string[] subs = filter.ExemptType.Split(',');
                filter.ExemptType = string.Empty;
                foreach (string item in subs)
                {
                    ExemptTypeIL result = pt.Find(e => e.EntryId == Convert.ToInt64(item));
                    filter.ExemptType = filter.ExemptType + "," + result.ExemptTypeName;
                }
                filter.ExemptType = filter.ExemptType.TrimStart(',');
            }
            #endregion
            #region Vehicle Class
            if (filter.VehicleClass == "0")
                filter.VehicleClass = string.Empty;
            else if (filter.VehicleClass == "ALL")
                filter.VehicleClass = "ALL";
            else
            {
                List<VehicleClassIL> pt = VehicleClassBL.GetActive();
                string[] subs = filter.VehicleClass.Split(',');
                filter.VehicleClass = string.Empty;
                foreach (string item in subs)
                {
                    VehicleClassIL result = pt.Find(e => e.ClassId == Convert.ToInt64(item));
                    filter.VehicleClass = filter.VehicleClass + "," + result.ClassName;
                }
                filter.VehicleClass = filter.VehicleClass.TrimStart(',');
            }
            #endregion
            #region Operator
            if (filter.LaneUser == "0")
                filter.LaneUser = string.Empty;
            else if (filter.LaneUser == "ALL")
                filter.LaneUser = "ALL";
            else
            {
                List<UserManagementIL> pt = UserManagementBL.GetAllLaneUsers();
                string[] subs = filter.LaneUser.Split(',');
                filter.LaneUser = string.Empty;
                foreach (string item in subs)
                {
                    UserManagementIL result = pt.Find(e => e.EntryId == Convert.ToInt64(item));
                    filter.LaneUser = filter.LaneUser + "," + result.LoginId;
                }
                filter.LaneUser = filter.LaneUser.TrimStart(',');
            }
            #endregion
            #region Shift
            if (filter.Shift == "0")
                filter.Shift = string.Empty;
            else if (filter.Shift == "ALL")
                filter.Shift = "ALL";
            else
            {
                string[] subs = filter.Shift.Split(',');
                filter.Shift = string.Empty;
                foreach (string item in subs)
                {

                    filter.Shift = filter.Shift + "," + "Shift " + item;
                }
                filter.Shift = filter.Shift.TrimStart(',');
            }
            #endregion
            #region Lane
            if (filter.Lane == "0")
                filter.Lane = string.Empty;
            else if (filter.Lane == "ALL")
                filter.Lane = "ALL";
            else
            {
                string[] subs = filter.Lane.Split(',');
                filter.Lane = string.Empty;
                foreach (string item in subs)
                {
                    filter.Lane = filter.Lane + "," + item;
                }
                filter.Lane = filter.Lane.TrimStart(',');
            }
            #endregion
            #region Generated By
            if (filter.GenratedBy == 0)
            {
                ViewBag.GenratedBy = "toll360";
            }
            else
            {
                UserManagementIL user = UserManagementBL.GetById((int)filter.GenratedBy);
                ViewBag.GenratedBy = user.LoginId;
            }
            #endregion
            PlazaManagementIL PlazaData = PlazaManagementBL.GetById(PlazaId);
            ViewBag.PlazaData = PlazaData;
            ViewBag.Filter = filter;
            ViewBag.ReportName = rpt;
            DataFilterIL data = new DataFilterIL();
            data.PlazaId = (Int16)PlazaId;
            data.SessionId = SessionId.Replace("CR-", "PR-");
            data.StartDateTime = filter.StartDateTime;
            data.EndDateTime = filter.EndDateTime;
            DataTable dt = LaneTransactionBL.TransactionDetailReport(data);
            //ViewData.Model = dt.AsEnumerable();
            return View(dt);
        }
    }
}
