using System.Web.Mvc;
using HighwaySoluations.Softomation.ATMSSystemLibrary;
using HighwaySoluations.Softomation.ATMSSystemLibrary.SystemConfigurations;
using HighwaySoluations.Softomation.CommonLibrary.IL;

namespace ATMSRestAPI.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            ViewBag.AppVersion = SystemConstants.Version;
            ViewBag.Provider = SystemConstants.AppProvider;
            ViewBag.Title = "Web API|Home";
            return View();
        }

        public ActionResult DataBase()
        {
            ViewBag.Title = "Web API|Config";
            ViewBag.Status = "Load";
            ViewBag.AppVersion = SystemConstants.Version;
            ViewBag.Provider = HighwaySoluations.Softomation.CommonLibrary.Constants.AppProvider;
            DataBaseIL dataBase = DataBaseConfig.Deserialize();
            return View(dataBase);
        }

        [HttpPost]
        public ActionResult DataBase(DataBaseIL dataBase)
        {
            ViewBag.Title = "Web API|Config";
            ViewBag.AppVersion = SystemConstants.Version;
            ViewBag.Provider = HighwaySoluations.Softomation.CommonLibrary.Constants.AppProvider;
            ViewBag.Status = "failed";
            if (ModelState.IsValid)
            {
                DataBaseConfig.Serialize(dataBase);
                ViewBag.Status = "success";
            }
            return View(dataBase);
        }

        public ActionResult Moniter()
        {
            ViewBag.Title = "Web API|Config";
            ViewBag.Status = "Load";
            ViewBag.AppVersion = SystemConstants.Version;
            ViewBag.Provider = HighwaySoluations.Softomation.CommonLibrary.Constants.AppProvider;
            ServiceMonitorIL dataBase = ServiceMonitorConfig.Deserialize();
            return View(dataBase);
        }

        [HttpPost]
        public ActionResult Moniter(ServiceMonitorIL dataBase)
        {
            if (string.IsNullOrEmpty(dataBase.DatabaseService))
                dataBase.DatabaseService = string.Empty;
            ViewBag.Title = "Web API|Config";
            ViewBag.AppVersion = SystemConstants.Version;
            ViewBag.Provider = HighwaySoluations.Softomation.CommonLibrary.Constants.AppProvider;
            ViewBag.Status = "failed";
            if (ModelState.IsValid)
            {
                ServiceMonitorConfig.Serialize(dataBase);
                ViewBag.Status = "success";
            }
            return View(dataBase);
        }
    }
}