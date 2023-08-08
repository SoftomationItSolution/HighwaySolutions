using System.Web.Mvc;
using Softomation.ATMSSystemLibrary.SystemConfigurations;

namespace ATMSRestAPI.Controllers
{
    public class SystemController : Controller
    {
        // GET: System
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult DataBase()
        {
            DataBaseConfig dataBase = DataBaseConfig.Deserialize();
            return View(dataBase);
        }

        [HttpPost]  
        public ActionResult DataBase(DataBaseConfig dataBase)
        {
            DataBaseConfig.Serialize(dataBase);
            return View(dataBase);
        }
    }
}