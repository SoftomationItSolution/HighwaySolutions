using System.Web.Mvc;
using Softomation.ATMSSystemLibrary;
using Softomation.ATMSSystemLibrary.SystemConfigurations;

namespace ATMSRestAPI.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            ViewBag.AppVersion = Constants.Version;
            ViewBag.Provider = Constants.AppProvider;
            ViewBag.Title = "Web API|Home";
            return View();
        }

        public ActionResult DataBase()
        {
            ViewBag.Title = "Web API|Config";
            ViewBag.AppVersion = Constants.Version;
            ViewBag.Provider = Constants.AppProvider;
            DataBaseConfig dataBase = DataBaseConfig.Deserialize();
            return View(dataBase);
        }

        [HttpPost]
        public ActionResult DataBase(DataBaseConfig dataBase)
        {
            ViewBag.Title = "Web API|Config";
            ViewBag.AppVersion = Constants.Version;
            ViewBag.Provider = Constants.AppProvider;
            if (ModelState.IsValid)
            {
                DataBaseConfig.Serialize(dataBase);
            }
            return View(dataBase);
        }
    }
}