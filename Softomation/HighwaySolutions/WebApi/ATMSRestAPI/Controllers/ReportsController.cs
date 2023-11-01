using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using HighwaySoluations.Softomation.ATMSSystemLibrary.BL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.IL;
using HighwaySoluations.Softomation.ATMSSystemLibrary.SystemLogger;
using HighwaySoluations.Softomation.CommonLibrary;
using Rotativa;
using Rotativa.Options;
using static HighwaySoluations.Softomation.CommonLibrary.Constants;

namespace ATMSRestAPI.Controllers
{
    public class ReportsController : Controller
    {
        // GET: Reports
        internal static void BackOfficeAPILog(string message)
        {
            LogMaster.Write(message, ErrorLogModule.BackOfficeReportAPI);
        }

        public string FullReports(short ReportId, short SystemId, string FileName)
        {
            string FilePath = string.Empty;
            try
            {
                string footer = "--footer-right \"Printed on: " + DateTime.Now.ToString("dd-MMM-yyyy HH:mm:ss") + "  Page: [page] of [toPage]\"" + " --footer-line --footer-font-size \"9\" --footer-spacing 6 --footer-font-name \"calibri light\"";

                string rootpath = Server.MapPath("/reports");
                Directory.CreateDirectory(rootpath);

                var filePath = Path.Combine(Server.MapPath("/reports"), FileName);
                FilePath = filePath;
                ReportMasterIL rpt = ReportMasterBL.GetById(ReportId);
                SystemIL system = SystemBL.GetById(SystemId);
                String CategoryName = Regex.Replace("Report_" + rpt.ReportId.ToString(), @"\s+", "");
                ActionAsPdf pdfResult;
                if (rpt.IsLandscape)
                {
                    pdfResult = new ActionAsPdf(CategoryName, new {
                        SystemName = system.SystemName,
                        SystemId = system.SystemId,
                        ReportName = rpt.ReportName,
                        FileName = FileName,
                    }) {
                        FileName = FileName,
                        PageSize = Size.A4,
                        PageOrientation = Orientation.Landscape,
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
                        SystemName = system.SystemName,
                        SystemId = system.SystemId,
                        ReportName = rpt.ReportName,
                        FileName = FileName,
                    }) {
                        FileName = FileName,
                        PageSize = Size.A4,
                        PageMargins = new Margins(12, 12, 12, 12),
                        CustomSwitches = footer,
                        SaveOnServerPath = filePath
                    };
                }
                var binary = pdfResult.BuildPdf(this.ControllerContext);
                File(binary, "application/pdf");
            }
            catch (Exception ex)
            {
                BackOfficeAPILog(string.Format("Error in FullReports ReportId:{0} ,SystemId:{1} & FileName:{2} Error is:{3}", ReportId.ToString(), SystemId.ToString(), FileName, ex.Message.ToString()));
            }
            return FilePath;
        }

        public ActionResult Report_1(string SystemName, short SystemId, string ReportName, string FileName)
        {
            DataFilterIL filter = new DataFilterIL();

            #region Read Json
            var filePath = Path.Combine(Server.MapPath("/filter"), FileName.Replace(".pdf", ".json"));
            using (StreamReader r = new StreamReader(filePath))
            {
                JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                filter = json_serializer.Deserialize<DataFilterIL>(r.ReadToEnd());
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
                BackOfficeAPILog(string.Format("Error in Report_1 json Read SystemName:{0} ,ReportName:{1} & FileName:{2} Error is:{3}", SystemName, ReportName, FileName, ex.Message.ToString()));
            }
            #endregion

            DataFilterIL masterData = DataFilterBL.GetBySystemId(SystemId);
            if (SystemName == "ATCC")
            {
                #region Data Filter
                filter.FilterQuery = "WHERE H.EventDate>= CONVERT(DATETIME,'" + filter.StartDateTime + "') AND H.EventDate<= CONVERT(DATETIME,'" + filter.EndDateTime + "')";
                if (filter.ControlRoomFilterList != "0")
                {
                    filter.FilterQuery = filter.FilterQuery + " AND CR.ControlRoomId IN (" + filter.ControlRoomFilterList + ") ";
                }
                if (filter.PackageFilterList != "0")
                {
                    filter.FilterQuery = filter.FilterQuery + " AND PD.PackageId IN (" + filter.PackageFilterList + ") ";
                }
                if (filter.ChainageFilterList != "0")
                {
                    filter.FilterQuery = filter.FilterQuery + " AND ED.ChainageNumber IN (" + filter.ChainageFilterList + ") ";
                }
                if (filter.DirectionFilterList != "0")
                {
                    filter.FilterQuery = filter.FilterQuery + " AND ED.DirectionId IN (" + filter.DirectionFilterList + ") ";
                }
                if (filter.PositionFilterList != "0")
                {
                    filter.FilterQuery = filter.FilterQuery + " AND EC.PositionId IN (" + filter.PositionFilterList + ") ";
                }
                DataSet events = ATCCEventBL.ReportSummeryGetByFilter(filter);
                #endregion

                if (filter.ChainageFilterList != "0")
                {
                    filter.ChainageFilterList = "All";
                }
                if (filter.DirectionFilterList == "0")
                {
                    filter.DirectionFilterList = "All";
                }
                else
                {
                    List<string> directionIds = filter.DirectionFilterList.Split(',').ToList();
                    foreach (var val in directionIds)
                    {
                        var filtered = Enum.GetName(typeof(DirectionType), (DirectionType)Convert.ToInt16(val));
                        filter.DirectionFilterList = filter.DirectionFilterList + ',' + filtered;
                    }
                    filter.DirectionFilterList = filter.DirectionFilterList.Remove(0, 1);
                }

                ViewBag.Filter = filter;
                return View("ATCC_Report_1", events);
            }
            else
            {
                return View();
            }


        }
    }
}