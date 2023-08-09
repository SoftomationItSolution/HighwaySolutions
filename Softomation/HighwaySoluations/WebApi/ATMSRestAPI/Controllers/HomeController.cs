using System.Web.Mvc;
using HighwaySoluations.Softomation.ATMSSystemLibrary;
using HighwaySoluations.Softomation.ATMSSystemLibrary.SystemConfigurations;

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
            if (ModelState.IsValid)
            {
                DataBaseConfig.Serialize(dataBase);
            }
            return View(dataBase);
        }
    }
}