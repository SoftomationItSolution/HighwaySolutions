using System.Web.Optimization;

namespace TMSRestAPI
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            //bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
            //            "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/js/bootstrap.bundle.min.js",
                      "~/assets/js/main.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/assets/vendor/bootstrap/bootstrap.min.css",
                      "~/assets/vendor/bootstrap-icons/bootstrap-icons.css",
                      "~/assets/css/style.css"));
        }
    }
}
