using System.Web.Optimization;

namespace ATMSRestAPI
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));
         
            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/js/bootstrap.bundle.min.js",
                      "~/Scripts/main.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/assets/vendor/bootstrap/css/bootstrap.min.css",
                      "~/assets/vendor/bootstrap-icons/bootstrap-icons.css",
                      "~/Content/style.css"));
        }
    }
}