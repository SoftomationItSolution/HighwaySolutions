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

        /// <summary>
        /// Summery Report
        /// </summary>
        /// <param name="SystemName"></param>
        /// <param name="SystemId"></param>
        /// <param name="FileName"></param>
        /// <returns></returns>
        public ActionResult Report_1(string SystemName, short SystemId, string FileName)
        {
            DataFilterIL filter = GetFiltersFromFile(FileName);
            DataFilterIL masterData = DataFilterBL.GetBySystemId(SystemId);
            if (SystemName == "ATCC")
            {
                filter = GetATCCFilterQuery(filter);
                DataSet events = ATCCEventBL.ReportSummeryGetByFilter(filter);
                ViewBag.Filter = filter;
                return View("ATCC_Report_1", events);
            }
            else if (SystemName == "VIDS")
            {
                filter = GetVIDSFilterQuery(filter);
                DataSet events = VIDSEventBL.ReportSummeryGetByFilter(filter);
                ViewBag.Filter = filter;
                return View("VIDS_Report_1", events);
            }
            else if (SystemName == "ECB")
            {
                filter = GetECBFilterQuery(filter);
                DataSet events = ECBCallEventBL.ReportSummeryGetByFilter(filter);
                ViewBag.Filter = filter;
                return View("ECB_Report_1", events);
            }
            else
            {
                return View("Report_1");
            }
        }

        /// <summary>
        /// Location wise Report
        /// </summary>
        /// <param name="SystemName"></param>
        /// <param name="SystemId"></param>
        /// <param name="FileName"></param>
        /// <returns></returns>
        public ActionResult Report_4(string SystemName, short SystemId, string FileName)
        {
            DataFilterIL filter = GetFiltersFromFile(FileName);
            DataFilterIL masterData = DataFilterBL.GetBySystemId(SystemId);
            if (SystemName == "ATCC")
            {
                filter = GetATCCFilterQuery(filter);
                DataSet events = ATCCEventBL.ReportLocationGetByFilter(filter);
                ViewBag.Filter = filter;
                return View("ATCC_Report_4", events);
            }
            else if (SystemName == "VIDS")
            {
                filter = GetVIDSFilterQuery(filter);
                DataSet events = VIDSEventBL.ReportLocationGetByFilter(filter);
                ViewBag.Filter = filter;
                return View("VIDS_Report_4", events);
            }
            else if (SystemName == "ECB")
            {
                filter = GetECBFilterQuery(filter);
                DataSet events = ECBCallEventBL.ReportLocationGetByFilter(filter);
                ViewBag.Filter = filter;
                return View("ECB_Report_4", events);
            }
            else
            {
                return View("Report_1");
            }
        }

        /// <summary>
        /// Class wise Report
        /// </summary>
        /// <param name="SystemName"></param>
        /// <param name="SystemId"></param>
        /// <param name="FileName"></param>
        /// <returns></returns>
        public ActionResult Report_5(string SystemName, short SystemId, string FileName)
        {
            DataFilterIL filter = GetFiltersFromFile(FileName);
            DataFilterIL masterData = DataFilterBL.GetBySystemId(SystemId);
            if (SystemName == "ATCC")
            {
                filter = GetATCCFilterQuery(filter);
                DataSet events = ATCCEventBL.ReportClassGetByFilter(filter);
                ViewBag.Filter = filter;
                return View("ATCC_Report_5", events);
            }
            else
            {
                return View("Report_1");
            }
        }

        /// <summary>
        /// Position wise Report
        /// </summary>
        /// <param name="SystemName"></param>
        /// <param name="SystemId"></param>
        /// <param name="FileName"></param>
        /// <returns></returns>
        public ActionResult Report_6(string SystemName, short SystemId, string FileName)
        {
            DataFilterIL filter = GetFiltersFromFile(FileName);
            DataFilterIL masterData = DataFilterBL.GetBySystemId(SystemId);
            if (SystemName == "ATCC")
            {
                filter = GetATCCFilterQuery(filter);
                DataSet events = ATCCEventBL.ReportPositionGetByFilter(filter);
                ViewBag.Filter = filter;
                return View("ATCC_Report_6", events);
            }
            else if (SystemName == "VIDS")
            {
                filter = GetVIDSFilterQuery(filter);
                DataSet events = VIDSEventBL.ReportPositionGetByFilter(filter);
                ViewBag.Filter = filter;
                return View("VIDS_Report_6", events);
            }
            else
            {
                return View("Report_1");
            }
        }

        /// <summary>
        /// Event wise Report
        /// </summary>
        /// <param name="SystemName"></param>
        /// <param name="SystemId"></param>
        /// <param name="FileName"></param>
        /// <returns></returns>
        public ActionResult Report_7(string SystemName, short SystemId, string FileName)
        {
            DataFilterIL filter = GetFiltersFromFile(FileName);
            DataFilterIL masterData = DataFilterBL.GetBySystemId(SystemId);
            if (SystemName == "ECB")
            {
                filter = GetECBFilterQuery(filter);
                DataSet events = ECBCallEventBL.ReportEventGetByFilter(filter);
                ViewBag.Filter = filter;
                return View("ECB_Report_7", events);
            }
            else if (SystemName == "VIDS")
            {
                filter = GetVIDSFilterQuery(filter);
                DataSet events = VIDSEventBL.ReportEventGetByFilter(filter);
                ViewBag.Filter = filter;
                return View("VIDS_Report_7", events);
            }
            else
            {
                return View("Report_1");
            }
        }

        private DataFilterIL GetFiltersFromFile(string FileName)
        {
            DataFilterIL filter;
            try
            {
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
                    BackOfficeAPILog(string.Format("Error in json Read FileName:{0} Error is:{1}", FileName, ex.Message.ToString()));
                }
                #endregion
            }
            catch (Exception)
            {

                filter = new DataFilterIL();
            }
            return filter;
        }
        private DataFilterIL GetATCCFilterQuery(DataFilterIL filter)
        {
            #region Data Filter
            filter.FilterQuery = "WHERE H.EventDate>= CONVERT(DATETIME,'" + filter.StartDateTime + "') AND H.EventDate<= CONVERT(DATETIME,'" + filter.EndDateTime + "')";
            if (filter.ControlRoomFilterList != "0")
            {
                filter.FilterQuery = filter.FilterQuery + " AND CR.ControlRoomId IN (" + filter.ControlRoomFilterList + ") ";

            }
            else
                filter.ControlRoomFilterList = "All";
            if (filter.PackageFilterList != "0")
            {
                filter.FilterQuery = filter.FilterQuery + " AND PD.PackageId IN (" + filter.PackageFilterList + ") ";

            }
            else
                filter.PackageFilterList = "All";
            if (filter.ChainageFilterList != "0")
            {
                filter.FilterQuery = filter.FilterQuery + " AND ED.ChainageNumber IN (" + filter.ChainageFilterList + ") ";

            }
            else
                filter.ChainageFilterList = "All";
            if (filter.DirectionFilterList != "0")
            {
                filter.FilterQuery = filter.FilterQuery + " AND ED.DirectionId IN (" + filter.DirectionFilterList + ") ";
                List<string> directionIds = filter.DirectionFilterList.Split(',').ToList();
                foreach (var val in directionIds)
                {
                    var filtered = Enum.GetName(typeof(DirectionType), (DirectionType)Convert.ToInt16(val));
                    filter.DirectionFilterList = filter.DirectionFilterList + ',' + filtered;
                }
                filter.DirectionFilterList = filter.DirectionFilterList.Remove(0, 1);
            }
            else
            {
                filter.DirectionFilterList = "All";

            }
            if (filter.PositionFilterList != "0")
            {
                filter.FilterQuery = filter.FilterQuery + " AND EC.PositionId IN (" + filter.PositionFilterList + ") ";

            }
            else
                filter.PositionFilterList = "All";
            #endregion
            return filter;
        }
        private DataFilterIL GetECBFilterQuery(DataFilterIL filter)
        {
            #region Data Filter
            filter.FilterQuery = "WHERE H.StartDateTime>= CONVERT(DATETIME,'" + filter.StartDateTime + "') AND H.StartDateTime<= CONVERT(DATETIME,'" + filter.EndDateTime + "')";
            if (filter.ControlRoomFilterList != "0")
            {
                filter.FilterQuery = filter.FilterQuery + " AND (CallerED.ControlRoomId IN (" + filter.DirectionFilterList + ") OR CalleeED.ControlRoomId IN (" + filter.DirectionFilterList + ")) ";

            }
            else
                filter.ControlRoomFilterList = "All";
            if (filter.PackageFilterList != "0")
            {
                filter.FilterQuery = filter.FilterQuery + " AND (CallerED.PackageId IN (" + filter.PackageFilterList + ") OR CalleeED.PackageId IN (" + filter.PackageFilterList + ")) ";

            }
            else
                filter.PackageFilterList = "All";
            if (filter.ChainageFilterList != "0")
            {
                filter.FilterQuery = filter.FilterQuery + " AND (CallerED.ChainageNumber IN (" + filter.ChainageFilterList + ") OR CalleeED.ChainageNumber IN (" + filter.ChainageFilterList + ")) ";

            }
            else
                filter.ChainageFilterList = "All";
            if (filter.EventFilterList != "0")
            {
                filter.FilterQuery = filter.FilterQuery + " AND H.CallTypeId IN (" + filter.EventFilterList + ") ";

            }
            else
                filter.EventFilterList = "All";
            if (filter.DirectionFilterList != "0")
            {
                filter.FilterQuery = filter.FilterQuery + " AND (CallerED.DirectionId IN (" + filter.DirectionFilterList + ") OR CalleeED.DirectionId IN (" + filter.DirectionFilterList + ")) ";
                List<string> directionIds = filter.DirectionFilterList.Split(',').ToList();
                foreach (var val in directionIds)
                {
                    var filtered = Enum.GetName(typeof(DirectionType), (DirectionType)Convert.ToInt16(val));
                    filter.DirectionFilterList = filter.DirectionFilterList + ',' + filtered;
                }
                filter.DirectionFilterList = filter.DirectionFilterList.Remove(0, 1);
            }
            else
                filter.DirectionFilterList = "All";
            #endregion
            return filter;
        }
        private DataFilterIL GetVIDSFilterQuery(DataFilterIL data)
        {
            #region Data Filter
            data.FilterQuery = "WHERE H.EventStartDate>= CONVERT(DATETIME,'" + data.StartDateTime + "') AND H.EventStartDate<= CONVERT(DATETIME,'" + data.EndDateTime + "')";
            if (data.ControlRoomFilterList != "0")
            {
                data.FilterQuery = data.FilterQuery + " AND CR.ControlRoomId IN (" + data.ControlRoomFilterList + ") ";
            }
            else
                data.ControlRoomFilterList = "All";
            if (data.PackageFilterList != "0")
            {
                data.FilterQuery = data.FilterQuery + " AND PD.PackageId IN (" + data.PackageFilterList + ") ";
            }
            else
                data.PackageFilterList = "All";
            if (data.ChainageFilterList != "0")
            {
                data.FilterQuery = data.FilterQuery + " AND ED.ChainageNumber IN (" + data.ChainageFilterList + ") ";
            }
            else
                data.ChainageFilterList = "All";
            if (data.DirectionFilterList != "0")
            {
                data.FilterQuery = data.FilterQuery + " AND ED.DirectionId IN (" + data.DirectionFilterList + ") ";
                List<string> directionIds = data.DirectionFilterList.Split(',').ToList();
                foreach (var val in directionIds)
                {
                    var filtered = Enum.GetName(typeof(DirectionType), (DirectionType)Convert.ToInt16(val));
                    data.DirectionFilterList = data.DirectionFilterList + ',' + filtered;
                }
                data.DirectionFilterList = data.DirectionFilterList.Remove(0, 1);
            }
            else
                data.DirectionFilterList = "All";
            if (data.PositionFilterList != "0")
            {
                data.FilterQuery = data.FilterQuery + " AND EC.PositionId IN (" + data.PositionFilterList + ") ";
            }
            else
                data.PositionFilterList = "All";
            if (data.EventFilterList != "0")
            {
                data.FilterQuery = data.FilterQuery + " AND H.EventTypeId IN (" + data.EventFilterList + ") ";
            }
            else
                data.EventFilterList = "All";
            #endregion
            return data;
        }
    }
}