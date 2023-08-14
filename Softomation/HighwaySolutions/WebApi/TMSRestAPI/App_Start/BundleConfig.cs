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
                     "~/Scripts/bootstrap/js/bootstrap.bundle.min.js",
                     "~/Scripts/main.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Scripts/bootstrap/css/bootstrap.min.css",
                      "~/Scripts/bootstrap-icons/bootstrap-icons.css",
                      "~/Content/style.css"));
        }
    }
}
