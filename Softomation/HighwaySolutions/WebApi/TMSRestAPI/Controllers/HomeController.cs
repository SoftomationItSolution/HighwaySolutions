using System.Web.Mvc;
using HighwaySoluations.Softomation.TMSSystemLibrary;
using HighwaySoluations.Softomation.TMSSystemLibrary.SystemConfigurations;

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
    }
}